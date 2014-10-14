//
//  ProfileViewController.h
//  TalentTrail
//
//  Created by Parker Seagren on 7/1/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileView.h"
#import "ApplicationView.h"

@interface ProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *profileButton;
@property (weak, nonatomic) IBOutlet UIButton *applicationButton;

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) ProfileView  * profileView;
@property (strong, nonatomic) ApplicationView * applicationView;

@end
