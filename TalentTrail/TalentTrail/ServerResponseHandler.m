//
//  ServerResponseHandler.m
//  TalentTrail
//
//  Created by Parker Seagren on 9/26/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import "ServerResponseHandler.h"
#import "LoginViewController.h"

@implementation ServerResponseHandler

- (void)receivedAuthenticationJSON:(NSData *)objectNotation
{
    NSLog(@"we got some Authentication data. time to parse it. :)");
    
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:nil];
    NSString * receivedUsername = [parsedObject objectForKey:@"username"];
    NSString * receivedToken = [parsedObject objectForKey:@"token"];
    
    NSLog(@"Received Username = %@", receivedUsername);
    NSLog(@"Received Token = %@", receivedToken);
    
    //Save this data to NSUserDefaults
    NSUserDefaults * standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setObject: receivedUsername forKey:@"username"];
    [standardUserDefaults setObject: receivedToken forKey:@"userToken"];
    
    
    //Notify Login View Controller to visually log the person in
    dispatch_async(dispatch_get_main_queue(),^{
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"SigninSuccessNotification"
         object:self];
    });
    
    //http://stackoverflow.com/questions/1973106/nsoperation-and-nsnotificationcenter-on-the-main-thread Answer #2
    //this link describes how to do this by waiting or not waiting.....but it works as is for now
    
 
    
}
- (void)fetchingAuthenticationFailedWithError:(NSError *)error
{
    NSLog(error.localizedDescription);

}

- (void)receivedStudentJSON:(NSData *)objectNotation
{
    
}
- (void)fetchingStudentFailedWithError:(NSError *)error andJSON:(NSData*)objectNotation
{

    NSLog(error.localizedDescription);
    NSLog(@"Well, the get student request failed, but now we can look at what it should be!");
    
    
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:nil];
    NSString * receivedHash = [parsedObject objectForKey:@"hash"];
    NSString * receivedHashString = [parsedObject objectForKey:@"hash_string"];
    
    NSLog(@"=========================== HASH BACK FROM SERVER ===========================");
    NSLog(@"Received Hash = %@", receivedHash);
    NSLog(@"Received Hash_String = %@", receivedHashString);

    
}

@end
