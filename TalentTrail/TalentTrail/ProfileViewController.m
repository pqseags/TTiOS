//
//  ProfileViewController.m
//  TalentTrail
//
//  Created by Parker Seagren on 7/1/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import "ProfileViewController.h"
#import "HexColor.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

@synthesize profileButton;
@synthesize applicationButton;
@synthesize contentView;
@synthesize profileView;
@synthesize applicationView;

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
    
    //STATUS BAR
    UIView * statusBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    statusBar.backgroundColor = [HexColor talentTrailOrange];
    [self.view addSubview:statusBar];
    
    //Buttons
    self.profileButton.backgroundColor = [HexColor talentTrailOrange];
    [self.profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    self.applicationButton.backgroundColor = [UIColor whiteColor];
    [self.applicationButton setTitleColor:[HexColor talentTrailOrange] forState:UIControlStateNormal];
    [self.applicationButton setTitleColor:[HexColor talentTrailOrange] forState:UIControlStateHighlighted];
    
    self.profileButton.layer.borderWidth = 1.0;
    self.profileButton.layer.borderColor = [[HexColor talentTrailOrange] CGColor];
    self.applicationButton.layer.borderWidth = 1.0;
    self.applicationButton.layer.borderColor = [[HexColor talentTrailOrange] CGColor];
    
    
    //Load Content Views - display Profile
    NSArray * nibContents = [[NSBundle mainBundle] loadNibNamed:@"ProfileView" owner:self options:nil];
    self.profileView = [[nibContents lastObject] init];
    self.profileView.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
    
    NSArray * nibContents2 = [[NSBundle mainBundle] loadNibNamed:@"ApplicationView" owner:self options:nil];
    self.applicationView = [[nibContents2 lastObject] init];
    self.applicationView.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);

    [self.contentView addSubview: self.applicationView];
    [self.contentView addSubview:self.profileView];

}


- (IBAction)pressedProfileButton:(id)sender {
    
    //graphical
    self.profileButton.backgroundColor = [HexColor talentTrailOrange];
    [self.profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    self.applicationButton.backgroundColor = [UIColor whiteColor];
    [self.applicationButton setTitleColor:[HexColor talentTrailOrange] forState:UIControlStateNormal];
    [self.applicationButton setTitleColor:[HexColor talentTrailOrange] forState:UIControlStateHighlighted];
    
    //switch content controllers
    [self.contentView bringSubviewToFront:self.profileView];
}


- (IBAction)pressedApplicationButton:(id)sender {
    
    //graphical
    self.profileButton.backgroundColor = [UIColor whiteColor];
    [self.profileButton setTitleColor:[HexColor talentTrailOrange] forState:UIControlStateNormal];
    [self.profileButton setTitleColor:[HexColor talentTrailOrange] forState:UIControlStateHighlighted];
    self.applicationButton.backgroundColor = [HexColor talentTrailOrange];
    [self.applicationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.applicationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    //switch content controllers
    [self.contentView bringSubviewToFront:self.applicationView];
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
