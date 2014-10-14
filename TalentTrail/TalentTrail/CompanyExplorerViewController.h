//
//  CompanyExplorerViewController.h
//  TalentTrail
//
//  Created by Parker Seagren on 7/30/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterView.h"

@interface CompanyExplorerViewController : UIViewController <UICollectionViewDelegate , UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *companyCollectionView;

@property (strong, nonatomic) FilterView * filterControl;


-(void) prepareForFilterControl;
-(void) prepareForFilterControlDismissal;



@end
