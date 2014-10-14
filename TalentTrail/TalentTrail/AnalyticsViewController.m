//
//  AnalyticsViewController.m
//  TalentTrail
//
//  Created by Parker Seagren on 7/1/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import "AnalyticsViewController.h"
#import "HexColor.h"

@interface AnalyticsViewController ()

@end

@implementation AnalyticsViewController

@synthesize dashboardView;

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
