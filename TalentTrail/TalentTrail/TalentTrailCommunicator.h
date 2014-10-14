//
//  TalentTrailCommunicator.h
//  TalentTrail
//
//  Created by Parker Seagren on 9/26/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerResponseHandler.h"

@class LoginViewController;



@interface TalentTrailCommunicator : NSObject

//@property (weak, nonatomic) id<TalentTrailCommunicatorDelegate> delegate;
@property ( nonatomic) ServerResponseHandler * responseHandler;
@property ( nonatomic) LoginViewController * loginViewController;


//setter
-(void)setLoginViewControllers:(LoginViewController *) viewController;


//communication methods
- (void)loginWithUsername:(NSString*) username password: (NSString*)password;
-(void)fetchProfileData;


@end
