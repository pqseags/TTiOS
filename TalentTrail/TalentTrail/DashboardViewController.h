//
//  DashboardViewController.h
//  TalentTrail
//
//  Created by Parker Seagren on 7/1/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashboardViewController : UIViewController <UICollectionViewDelegate , UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *gridView;

@property (strong, nonatomic) NSMutableArray *dataArray;

@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@end
