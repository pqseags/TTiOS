//
//  LoginViewController.h
//  TalentTrail
//
//  Created by Parker Seagren on 9/26/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TalentTrailCommunicator.h"

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIImageView *talentTrailPicture;
@property (weak, nonatomic) IBOutlet UIButton *signInButton;

@property NSString * email;
@property NSString * password;

-(void)signInToUser;



@end