//
//  ServerResponseHandler.h
//  TalentTrail
//
//  Created by Parker Seagren on 9/26/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LoginViewController;

@interface ServerResponseHandler : NSObject

@property (nonatomic, weak) LoginViewController * loginViewController;

- (void)receivedAuthenticationJSON:(NSData *)objectNotation;
- (void)fetchingAuthenticationFailedWithError:(NSError *)error;

- (void)receivedStudentJSON:(NSData *)objectNotation;
- (void)fetchingStudentFailedWithError:(NSError *)error andJSON:(NSData*)objectNotation;


@end
