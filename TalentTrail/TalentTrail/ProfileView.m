//
//  ProfileView.m
//  TalentTrail
//
//  Created by Parker Seagren on 8/9/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import "ProfileView.h"
#import "EducationCard.h"
#import "ExperienceCard.h"
#import "SkillsCard.h"
#import "ProjectsCard.h"
#import "HexColor.h"

@implementation ProfileView

@synthesize profilePicture;
@synthesize tableView;
@synthesize headerBackgroundView;
@synthesize nameLabel;
@synthesize serverCommunicator;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //PROFILE HEADER
        [self.headerBackgroundView setBackgroundColor: [[HexColor talentTrailOrange] colorWithAlphaComponent: 0.7]];
//        UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"orange-gradient1.png"]];
//        self.headerBackgroundView.backgroundColor = background;
        
        self.profilePicture.layer.cornerRadius = self.profilePicture.frame.size.width / 2;
        self.profilePicture.clipsToBounds = YES;
        self.profilePicture.layer.borderWidth = 3.0f;
        self.profilePicture.layer.borderColor = [UIColor whiteColor].CGColor;

        
        
        //Card Table View
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        //NETWORK CALL
        self.serverCommunicator = [[TalentTrailCommunicator alloc] init];
        [self.serverCommunicator fetchProfileData];
        
        //DATA
        NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
        nameLabel.text = (NSString*)[standardUserDefaults stringForKey:@"username"];

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


//-(void)

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

    if (indexPath.item ==0)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"EducationCard" owner:self options:nil];
        EducationCard *cell = [nib objectAtIndex:0];
        return cell;

    }
    
    else if (indexPath.item ==1 ){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ExperienceCard" owner:self options:nil];
        ExperienceCard *cell = [nib objectAtIndex:0];
        return cell;
    }
    
    else if (indexPath.item ==2 ){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ProjectsCard" owner:self options:nil];
        ProjectsCard *cell = [nib objectAtIndex:0];
        return cell;
    }
    
    else if (indexPath.item ==3 ){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SkillsCard" owner:self options:nil];
        SkillsCard *cell = [nib objectAtIndex:0];
        return cell;
    }
    
    
    else //default
    {
        return [[UITableViewCell alloc] init];
    }
    


    
    // Configure the cell...
    //    cell.Name.text = [Names objectAtIndex:indexPath.row];
    //    cell.Position.text = [Positions objectAtIndex:indexPath.row];
    //    cell.Job.text = [Jobs objectAtIndex:indexPath.row];
    //    cell.Picture.image = [UIImage imageNamed:[Pictures objectAtIndex:indexPath.row]];
    
    

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

@end
