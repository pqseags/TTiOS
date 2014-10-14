//
//  FilterView.h
//  TalentTrail
//
//  Created by Parker Seagren on 8/3/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterView : UIView <UITableViewDataSource, UITableViewDelegate>

//header
@property (weak, nonatomic) IBOutlet UIView *header;
@property (weak, nonatomic) IBOutlet UIButton *filterButton;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UILabel *filterLabel;

//rest of controller
@property (weak, nonatomic) IBOutlet UIView *controlView;
@property (weak, nonatomic) IBOutlet UIButton *allButton;
@property (weak, nonatomic) IBOutlet UIButton *recommendedButton;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UILabel *allLabel;
@property (weak, nonatomic) IBOutlet UILabel *recommendedLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteLabel;

@property NSArray * filterChoiceButtons;
@property NSArray * filterChoiceLabels;

@property (weak, nonatomic) IBOutlet UITableView *resultsTableView;



//References
@property (strong, nonatomic) UIViewController * parentController;

//data
@property NSMutableArray * recentFields;
@property NSMutableArray * searchResultFields;
@property NSMutableArray * allFields;


@property NSUInteger  toSearchFilter;
@property NSString * toSearchField;

@property NSUInteger  currentFilter;
@property NSString * currentField;

//Toggles
@property BOOL searchEnabled;


@end
