//
//  DashboardCell.h
//  TT
//
//  Created by Parker Seagren on 7/18/14.
//  Copyright (c) 2014 TT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashboardCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) NSString * cellType;


-(void)designateCellType:(NSString*)type;


@end
