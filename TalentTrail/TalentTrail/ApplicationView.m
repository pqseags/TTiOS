//
//  ApplicationView.m
//  TalentTrail
//
//  Created by Parker Seagren on 8/9/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import "ApplicationView.h"
#import "HexColor.h"

@implementation ApplicationView

@synthesize headerView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        //HEADER VIEW
        [self.headerView setBackgroundColor: [[HexColor talentTrailOrange] colorWithAlphaComponent: 0.7]];
        
        //Question Table View
        self.questionTable.delegate = self;
        self.questionTable.dataSource = self;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    //return Names.count;
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //default
    UITableViewCell * cell =[[UITableViewCell alloc] init];
    cell.textLabel.text = @"What is your question? ";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
    
    
    
    // Configure the cell...
    //    cell.Name.text = [Names objectAtIndex:indexPath.row];
    //    cell.Position.text = [Positions objectAtIndex:indexPath.row];
    //    cell.Job.text = [Jobs objectAtIndex:indexPath.row];
    //    cell.Picture.image = [UIImage imageNamed:[Pictures objectAtIndex:indexPath.row]];
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


@end
