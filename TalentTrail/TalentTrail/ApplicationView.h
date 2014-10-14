//
//  ApplicationView.h
//  TalentTrail
//
//  Created by Parker Seagren on 8/9/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApplicationView : UIView <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UITableView *questionTable;

@end
