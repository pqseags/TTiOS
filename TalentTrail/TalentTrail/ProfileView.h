//
//  ProfileView.h
//  TalentTrail
//
//  Created by Parker Seagren on 8/9/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TalentTrailCommunicator.h"

@interface ProfileView : UIView <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *headerBackgroundView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property TalentTrailCommunicator * serverCommunicator;

@end
