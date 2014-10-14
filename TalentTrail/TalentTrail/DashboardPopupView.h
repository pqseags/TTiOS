//
//  DashboardPopupView.h
//  TalentTrail
//
//  Created by Parker Seagren on 8/7/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTTabBarController.h"
@class TTTabBarController;

@interface DashboardPopupView : UIView <UICollectionViewDataSource, UICollectionViewDelegate>


//views
@property (weak, nonatomic) IBOutlet UICollectionView *gridView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

//Controls
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

//Information
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;



//other
@property (strong, nonatomic) NSMutableArray *gridTypes;
@property (strong, nonatomic) TTTabBarController * tabBarReference;

@end
