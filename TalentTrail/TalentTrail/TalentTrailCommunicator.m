//
//  TalentTrailCommunicator.m
//  TalentTrail
//
//  Created by Parker Seagren on 9/26/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import "TalentTrailCommunicator.h"
#import "LoginViewController.h"
#import <Security/Security.h>
#include <CommonCrypto/CommonDigest.h>



@implementation TalentTrailCommunicator

@synthesize responseHandler;
@synthesize loginViewController;

//URLS
static NSString * TTURL = @"http://www.talenttrail.co";
static NSString * ClientSecret = @"1Eaz02mexPZdAsX8AI7YY2A3N5HPmKNjTk9tHAPKF1ETDtW4Nr";

static NSString * TTAuthenticateURL = @"http://testapi.talenttrail.co/student/authenticate";
static NSString * TTGetStudentURL = @"http://testapi.talenttrail.co/student/me";


-(id)init
{
    self.responseHandler = [[ServerResponseHandler alloc] init];

    return self;
}

- (void)loginWithUsername:(NSString*) username password: (NSString*)password
{
    NSURL *url = [[NSURL alloc] initWithString:TTAuthenticateURL];
    NSLog(@"Sending request to %@", TTAuthenticateURL);
    
    //-----DATA-----
    NSString * post = [NSString stringWithFormat:@" {\"password\":\"asdfasdf\",\"username\":\"treyenelson@gmail.com\"}"];
    NSData * postData = [post dataUsingEncoding: NSASCIIStringEncoding allowLossyConversion:YES];
   // NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    //-----REQUEST-----
     NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60];
    [request setHTTPMethod:@"POST"];
    //[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:TTURL forHTTPHeaderField:@"Origin"];
    [request setHTTPBody:postData];
    

    //TALENTTRAIL NSURLCONNECTION, WORKS ON DEVICE BUT NOT THE FUCKING SIMULATOR
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            [self.responseHandler fetchingAuthenticationFailedWithError:error];
            NSLog(@"There was an error with the LoginRequest");
        } else {
            [self.responseHandler receivedAuthenticationJSON:data];
            NSLog(@"The LoginRequest was successful!");
        }
    }];

    
}

-(void)fetchProfileData
{
    //Set up URL
    NSURL *url = [[NSURL alloc] initWithString:TTGetStudentURL];
    NSLog(@"Fetching Profile Data -- Sending request to %@", TTGetStudentURL);
    
    //First, get the token and username!
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    NSString * username = (NSString*)[standardUserDefaults stringForKey:@"username"];
    NSString * token = (NSString*)[standardUserDefaults stringForKey:@"userToken"];
    
    //Now generate the authentication
    NSMutableString * authorization = [[NSMutableString alloc] initWithString:@""];
    [authorization appendString:token];
    
    //Encode and Add the URL
    NSString * encodedURL = TTGetStudentURL; //[url absoluteString];
    encodedURL = [encodedURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"================= Encoded URL: %@  ===============", encodedURL);
    //[authorization appendString:encodedURL];
    //-v- hacked the url encoding
    [authorization appendString:@"http%3A%2F%2Ftestapi.talenttrail.co%2Fstudent%2Fme"];
    
    //Add Client Secret
    [authorization appendString:ClientSecret];
    
    //Add Timestamp to authorization
    double unixTime = ([[NSDate date] timeIntervalSince1970] / 600);
    int final = 600*(ceil(unixTime));
    NSString * timestamp = [NSString stringWithFormat:@"%d", final];
    [authorization appendString:timestamp];

    //Now the authorization is concatenated, I gotta Hash it!
    NSLog(@"AUTHORIZATION SO FAR ===  %@ === Time to HASH", authorization);
    //authorization = (NSMutableString*)[self sha256HashFor:authorization];
    //authorization = (NSMutableString * )[self sha256:authorization];
    //authorization = (NSMutableString*)[self encodeBase64: authorization];
    authorization = (NSMutableString*)[self sha256HashAndBase64EncodeFor: authorization];
    //authorization = (NSMutableString*)[[authorization dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:0];


    NSLog(@"=======HERE IS THE FINAL HASHED AUTHORIZATION======= ");
    NSLog( authorization);
    
    //HACK IT
   // authorization =@"yDJKUqmGMmnRzWGoqAlA";
    
    
    
    //-----REQUEST-----
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60];
    [request setHTTPMethod:@"GET"];
    [request setValue:TTURL forHTTPHeaderField:@"Origin"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:username forHTTPHeaderField:@"username"];
    [request setValue:@"StudentWebApp" forHTTPHeaderField:@"client"];
    [request setValue:authorization forHTTPHeaderField:@"authorization"];


    
    
    //TALENTTRAIL NSURLCONNECTION, WORKS ON DEVICE BUT NOT THE FUCKING SIMULATOR
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            [self.responseHandler fetchingStudentFailedWithError:error andJSON:data];
            NSLog(@"ERROR: There was an error with Fetching the Profile Data");
        } else {
            [self.responseHandler receivedStudentJSON:data];
            NSLog(@"The Profile Data Fetch Request was successful!");
        }
    }];
}



-(NSString*) sha256HashAndBase64EncodeFor: (NSString*)input
{
    const char *s=[input cStringUsingEncoding:NSASCIIStringEncoding];
    NSData *keyData=[NSData dataWithBytes:s length:strlen(s)];
    
    uint8_t digest[CC_SHA256_DIGEST_LENGTH]={0};
    CC_SHA256(keyData.bytes, keyData.length, digest);
    NSData *out=[NSData dataWithBytes:digest length:CC_SHA256_DIGEST_LENGTH];
    // The method below is added in the NSData+Base64 category from the download
    NSString *base64 =[out base64EncodedStringWithOptions:0];
    
    return base64;
}

-(NSString*)encodeBase64: (NSString*) input
{
   // return [[NSString alloc] init];
    
    NSData *nsdata = [input
                      dataUsingEncoding:NSUTF8StringEncoding];
    
    // Get NSString from NSData object in Base64
    NSString *base64Encoded = [nsdata base64EncodedStringWithOptions:0];
    return base64Encoded;
}

-(NSString*)sha256HashFor:(NSString*)input
{
    const char* str = [input UTF8String];
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(str, strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_SHA256_DIGEST_LENGTH; i++)
    {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

-(NSString*) sha256:(NSString *)clear{
    const char *s=[clear cStringUsingEncoding:NSASCIIStringEncoding];
    NSData *keyData=[NSData dataWithBytes:s length:strlen(s)];
    
    uint8_t digest[CC_SHA256_DIGEST_LENGTH]={0};
    CC_SHA256(keyData.bytes, keyData.length, digest);
    NSData *out=[NSData dataWithBytes:digest length:CC_SHA256_DIGEST_LENGTH];
    NSString *hash=[out description];
    hash = [hash stringByReplacingOccurrencesOfString:@" " withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@"<" withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@">" withString:@""];
    return hash;
}

-(void)setLoginViewControllers:(LoginViewController *) viewController
{
    NSLog(@"Setting LoginView controller for self (serverCommunicator) and the serverResponseHandler");
    self.loginViewController = viewController;
    self.responseHandler.loginViewController = viewController;
}

@end
