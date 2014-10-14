//
//  MatchesViewController.m
//  TalentTrail
//
//  Created by Parker Seagren on 7/1/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import "MatchesViewController.h"
#import "MatchCell.h"
#import "HexColor.h"

@interface MatchesViewController ()

@end

@implementation MatchesViewController

@synthesize tableView;
@synthesize recentButton;
@synthesize connectedButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //Status bar
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20.0)];
    view.backgroundColor = [HexColor talentTrailOrange];
    [self.view addSubview:view];
    
    //Buttons
    self.recentButton.backgroundColor = [HexColor talentTrailOrange];
    [self.recentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.recentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    self.connectedButton.backgroundColor = [UIColor whiteColor];
    [self.connectedButton setTitleColor:[HexColor talentTrailOrange] forState:UIControlStateNormal];
    [self.connectedButton setTitleColor:[HexColor talentTrailOrange] forState:UIControlStateHighlighted];

    self.recentButton.layer.borderWidth = 1.0;
    self.recentButton.layer.borderColor = [[HexColor talentTrailOrange] CGColor];
    self.connectedButton.layer.borderWidth = 1.0;
    self.connectedButton.layer.borderColor = [[HexColor talentTrailOrange] CGColor];
    
}



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

    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MatchCell" owner:self options:nil];
    MatchCell *cell = [nib objectAtIndex:0];
    
    // Configure the cell...
//    cell.Name.text = [Names objectAtIndex:indexPath.row];
//    cell.Position.text = [Positions objectAtIndex:indexPath.row];
//    cell.Job.text = [Jobs objectAtIndex:indexPath.row];
//    cell.Picture.image = [UIImage imageNamed:[Pictures objectAtIndex:indexPath.row]];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   return 80;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"ConnectionDetail" sender:self];
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"Segue Identifier: %@", segue.identifier);
    
//    if ([segue.identifier isEqualToString:@"ConnectionDetail"]) {
//        ConnectionDetailViewController *destViewController = segue.destinationViewController;
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        destViewController.firstName = (NSString*)[Names objectAtIndex:indexPath.row];
//        destViewController.position =(NSString*)[Positions objectAtIndex:indexPath.row];
//        destViewController.company =(NSString*)[Jobs objectAtIndex:indexPath.row];
//        destViewController.picture =(UIImage*)[UIImage imageNamed:[Pictures objectAtIndex:indexPath.row]];
//        [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
//        
//    }
    
}




#pragma mark - Filter Buttons

- (IBAction)pressedRecentButton:(id)sender {
    //graphical
    self.recentButton.backgroundColor = [HexColor talentTrailOrange];
    [self.recentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.recentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    self.connectedButton.backgroundColor = [UIColor whiteColor];
    [self.connectedButton setTitleColor:[HexColor talentTrailOrange] forState:UIControlStateNormal];
    [self.connectedButton setTitleColor:[HexColor talentTrailOrange] forState:UIControlStateHighlighted];
    
    //reload table for recents
    //self.tableView
    
}

- (IBAction)pressedConnectedButton:(id)sender {
    //graphical
    self.recentButton.backgroundColor = [UIColor whiteColor];
    [self.recentButton setTitleColor:[HexColor talentTrailOrange] forState:UIControlStateNormal];
    [self.recentButton setTitleColor:[HexColor talentTrailOrange] forState:UIControlStateHighlighted];
    self.connectedButton.backgroundColor = [HexColor talentTrailOrange];
    [self.connectedButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.connectedButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
