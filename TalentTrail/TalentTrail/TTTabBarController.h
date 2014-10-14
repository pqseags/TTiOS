//
//  TTTabBarController.h
//  TalentTrail
//
//  Created by Parker Seagren on 7/15/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DashboardPopupView.h"
@class DashboardPopupView;

@interface TTTabBarController : UITabBarController


@property DashboardPopupView * dashboardView;
@property (strong, nonatomic) UIButton * centerButton;

-(void)openDashboard:(id)sender;

@end
