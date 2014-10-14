//
//  FilterView.m
//  TalentTrail
//
//  Created by Parker Seagren on 8/3/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import "FilterView.h"
#import "HexColor.h"
#import "CompanyExplorerViewController.h"

@implementation FilterView



@synthesize header;
@synthesize filterButton;
@synthesize filterLabel;
@synthesize searchButton;

@synthesize controlView;
@synthesize allButton;
@synthesize allLabel;
@synthesize recommendedButton;
@synthesize recommendedLabel;
@synthesize favoriteButton;
@synthesize favoriteLabel;

@synthesize searchEnabled;

@synthesize parentController;

@synthesize recentFields;
@synthesize searchResultFields;
@synthesize allFields;




- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //TOGGLES
        
        searchEnabled = YES;
        
        // FILTER_CONTROL
        self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.0];
        
        //Header
        self.header.backgroundColor = [HexColor talentTrailOrange];
        
        self.filterLabel.textColor = [UIColor whiteColor];
        self.filterLabel.text = @"All Companies";
        
        [self.filterButton setImage:[UIImage imageNamed:@"Building-white-32.png"] forState:UIControlStateNormal];
        [self.filterButton setImage:[UIImage imageNamed:@"Close-32.png"] forState:UIControlStateSelected];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler:)];
        [header addGestureRecognizer:tap];
        
        
        //Body
        self.controlView.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.95];
        [self insertSubview:self.controlView belowSubview:self.header];
        
        
        
        //Filters
        [self.allButton setImage:[UIImage imageNamed:@"Building-white-32.png"] forState:UIControlStateNormal];
        [self.allButton setImage:[UIImage imageNamed:@"Building-orange-32.png"] forState:UIControlStateSelected];
        
        [self.recommendedButton setImage:[UIImage imageNamed:@"Star-white-32.png"] forState:UIControlStateNormal];
        [self.recommendedButton setImage:[UIImage imageNamed:@"Star-orange-32.png"] forState:UIControlStateSelected];
        
        [self.favoriteButton setImage:[UIImage imageNamed:@"Heart-white-32.png"] forState:UIControlStateNormal];
        [self.favoriteButton setImage:[UIImage imageNamed:@"Heart-orange-32.png"] forState:UIControlStateSelected];
        
        self.filterChoiceButtons = [[NSArray alloc] initWithObjects:allButton, recommendedButton, favoriteButton, nil];
        self.filterChoiceLabels = [[NSArray alloc] initWithObjects:allLabel, recommendedLabel, favoriteLabel, nil];
        
        
        //hack setting it as all companies as default
        [self.allButton setSelected:YES];
        self.allLabel.textColor = [HexColor talentTrailOrange];
        
        //SearchBar/Results
        self.resultsTableView.dataSource = self;
        self.resultsTableView.delegate = self;
        self.resultsTableView.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.0];
        self.resultsTableView.backgroundView.alpha = 0.0;
        
        
        //Hide the Control
        self.controlView.hidden = YES;
        
        
        //Data
        self.recentFields = [[NSMutableArray alloc] init];
        self.allFields = [NSMutableArray arrayWithObjects:@"Accounting", @"Banking", @"Computer Science", @"Engineering", @"Finance", @"Marketing", nil];
        
        //CurrentFilters
        self.currentFilter = 0;
        self.currentField = @"All Fields";
        self.toSearchField = @"All Fields";
        
        
    }
    return self;
}




- (IBAction)tapHandler:(UITapGestureRecognizer *)recognizer
{
    if (controlView.hidden == NO)
    {
        return;
    }
    NSLog(@"pressed the header!!");
    [self displayFilterControl];

}

-(void)displayFilterControl
{
    [(CompanyExplorerViewController*)self.parentController prepareForFilterControl];
    
    CGRect  frame = self.controlView.frame;
    frame.origin.y = -frame.size.height;
    self.controlView.frame = frame;
    self.controlView.hidden = NO;
    
    self.filterButton.selected = YES;
    
    [UIView animateWithDuration:0.5 delay:0.0
                        options: nil
                     animations:^
     {
         
         CGRect  newFrame = self.controlView.frame;
         newFrame.origin.y = 50;
         self.controlView.frame = newFrame;
     }
                     completion:^(BOOL finished)
     {
         NSLog(@"Completed opening Company Filter Control");
         
     }];
}

-(void) dismissFilterControl
{
    
    
    
    self.filterButton.selected = NO;
    [UIView animateWithDuration:0.5 delay:0.0
                        options: nil
                     animations:^
     {
         
         CGRect  newFrame = self.controlView.frame;
         newFrame.origin.y = - newFrame.size.height;
         self.controlView.frame = newFrame;
     }
                     completion:^(BOOL finished)
     {
         NSLog(@"Completed closing Company Filter Control");
         self.controlView.hidden = YES;
         [(CompanyExplorerViewController*)self.parentController prepareForFilterControlDismissal];
     }];

}

-(void)displayFilterIconForNewSearch:(NSInteger*)filter
{
    switch((int)filter)
    {
        case 0:
            [self.filterButton setImage:[UIImage imageNamed:@"Building-white-32.png"] forState:UIControlStateNormal];
            break;
        case 1:
            [self.filterButton setImage:[UIImage imageNamed:@"Star-white-32.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [self.filterButton setImage:[UIImage imageNamed:@"Heart-white-32.png"] forState:UIControlStateNormal];
            break;
        default:
            return;
            
        
    }
}

#pragma mark - Buttons

- (IBAction)pressedFilterButton:(id)sender {
    //want to change filter and display control
    if (self.controlView.hidden == YES)
    {
        [self displayFilterControl];
    }
    
    //Pressed the 'X' to close filter
    else{
        [self dismissFilterControl];
        self.toSearchField = self.currentField;
        self.toSearchFilter = self.currentFilter;
        self.filterLabel.text = self.currentField;
        
        for (UIButton * filter in self.filterChoiceButtons)
        {
            filter.selected = NO;
            
        }
        for (UILabel * label in self.filterChoiceLabels)
        {
            label.textColor = [UIColor whiteColor];
        }
        ((UIButton*)[self.filterChoiceButtons objectAtIndex:self.currentFilter]).selected = YES;
        ((UILabel*)[self.filterChoiceLabels objectAtIndex:self.currentFilter]).textColor =[HexColor talentTrailOrange];
        
    }
}

- (IBAction)pressedSearchButton:(id)sender {
    if (self.controlView.hidden == YES)
    {
        [self displayFilterControl];
    }
    else{
        [self dismissFilterControl];
        //perform search
        
        
        //update UI for search
        self.currentField = self.toSearchField;
        self.currentFilter = self.toSearchFilter;
        [self displayFilterIconForNewSearch: self.toSearchFilter];
    }
}



- (IBAction)pressedAll:(id)sender {
    [self.allButton setSelected:YES];
    self.allLabel.textColor = [HexColor talentTrailOrange];
    
    [self.recommendedButton setSelected:NO];
    self.recommendedLabel.textColor = [UIColor whiteColor];
    
    [self.favoriteButton setSelected:NO];
    self.favoriteLabel.textColor = [UIColor whiteColor];
    
    self.toSearchFilter = 0;
    
}

- (IBAction)pressedRecommended:(id)sender {
    [self.allButton setSelected:NO];
    self.allLabel.textColor =[UIColor whiteColor];
    
    [self.recommendedButton setSelected:YES];
    self.recommendedLabel.textColor = [HexColor talentTrailOrange];
    
    [self.favoriteButton setSelected:NO];
    self.favoriteLabel.textColor = [UIColor whiteColor];
    
    self.toSearchFilter = 1;
}

- (IBAction)pressedFavorites:(id)sender {
    [self.allButton setSelected:NO];
    self.allLabel.textColor = [UIColor whiteColor];
    
    [self.recommendedButton setSelected:NO];
    self.recommendedLabel.textColor = [UIColor whiteColor];
    
    [self.favoriteButton setSelected:YES];
    self.favoriteLabel.textColor = [HexColor talentTrailOrange];
    
    self.toSearchFilter = 2;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    switch(section){
        case 0:
            NSLog(@"Recent count = %lu", (unsigned long)[recentFields count]);
            return [recentFields count];
            break;
        case 1:
            return [allFields count];
            break;
        default:
            NSLog(@"BUG: FilterView: tableViewnumberOfRowsInSection");
            return 0;
            break;
    }
    

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] init];
    switch (indexPath.section){
        case 0:
            cell.textLabel.text = @"Recent";
            break;
        case 1:
            cell.textLabel.text = [allFields objectAtIndex:indexPath.item];
            break;
        default:
            NSLog(@"Bug FilterView: cellForRowAtIndexPath");
        
    }
    
    //formatting
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.0];
    cell.textLabel.textColor = [UIColor whiteColor];

    return cell;

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch(section)
    {
        case 0:
            if ([self.recentFields count] > 0 )
            {
                return @"Recents";
            }
            else return nil;
            break;
        case 1:
            if ([self.recentFields count] > 0 )
            {
                return @"Fields";
            }
            else return nil;
            break;
        default:
            return@"BUG!!";
    }
}

#pragma mark - UITableView delegate

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    // Set the text color of our header/footer text.
    UITableViewHeaderFooterView *tableHeader = (UITableViewHeaderFooterView *)view;
    [tableHeader.textLabel setTextColor:[UIColor whiteColor]];
    
    // Set the background color of our header/footer.
   // tableHeader.contentView.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.0];
    
    // You can also do this to set the background color of our header/footer,
    //    but the gradients/other effects will be retained.
    view.tintColor = [[HexColor talentTrailOrange]colorWithAlphaComponent:1];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if ([[self.resultsTableView cellForRowAtIndexPath:indexPath].textLabel.text isEqualToString:self.toSearchField])
    {
        self.filterLabel.text = @"All Fields";
        self.toSearchField = @"All Fields";
        [self.resultsTableView cellForRowAtIndexPath:indexPath].textLabel.textColor = [UIColor whiteColor];
        return;
    }
    
    for (UITableViewCell* cell in [self.resultsTableView visibleCells])
    {
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    
    [self.resultsTableView cellForRowAtIndexPath:indexPath].textLabel.textColor = [HexColor talentTrailOrange];
    
    self.toSearchField = [self.resultsTableView cellForRowAtIndexPath:indexPath].textLabel.text;
    self.filterLabel.text = self.toSearchField;
    
    
    
    //do something with the new data
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
