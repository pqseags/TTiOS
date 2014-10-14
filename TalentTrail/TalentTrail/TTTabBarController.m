//
//  TTTabBarController.m
//  TalentTrail
//
//  Created by Parker Seagren on 7/15/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import "TTTabBarController.h"
#import "HexColor.h"

@interface TTTabBarController ()

@end

@implementation TTTabBarController

@synthesize centerButton;

typedef enum {closed, opening, opened, closing } DashboardState;

DashboardState dashboardState = closed;
//DashboardState dashboardPreviousState = closed;

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
    
    [self customizeAppearance];
    
    
    //Enable dragging of the TT Center Button
    [centerButton addTarget:self action:@selector(draggedOut:withEvent:)
         forControlEvents:UIControlEventTouchDragOutside |
     UIControlEventTouchDragInside];

    
   
}



-(void)customizeAppearance
{
    self.tabBar.barTintColor = [HexColor talentTrailOrange];
    self.tabBar.tintColor = [UIColor whiteColor];
    
//    NSLog(@"%lu",(unsigned long)[self.tabBar.items count]);
//    UITabBarItem * tab0 = [self.tabBar.items objectAtIndex:0];
//    tab0.image = [[UIImage imageNamed:@"application.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    tab0.selectedImage = [[UIImage imageNamed:@"application-hover.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    for (UITabBarItem *item in self.tabBar.items)
    {
        //set tab images
        switch(item.tag)
        {
            case 0:
                item.image = [[UIImage imageNamed:@"application.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                item.selectedImage = [[UIImage imageNamed:@"application-hover.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                break;
            case 1:
                item.image = [[UIImage imageNamed:@"analytics.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                item.selectedImage = [[UIImage imageNamed:@"analytics-hover.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                break;
            case 2:
                //Nothing - there will be a custom button on top of this to handle dashboard controll
                break;
            case 3:
                item.image = [[UIImage imageNamed:@"companies.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                item.selectedImage = [[UIImage imageNamed:@"companies-hover.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                break;
            case 4:
                item.image = [[UIImage imageNamed:@"matches.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                item.selectedImage = [[UIImage imageNamed:@"matches-hover.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                break;
        
        }
        //make tab titles white
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
        
    }
    
    [self addCenterButton];
    [self addDashboardView];

    

}

-(void)addCenterButton
{
    centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage * buttonImage = [UIImage imageNamed:@"dashboard-60.png"];
    centerButton.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [centerButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    CGPoint center = self.tabBar.center;
    center.y = center.y - heightDifference/2.0;
    centerButton.center = center;
    
    [self.view addSubview:centerButton];
    
    [centerButton addTarget:self action:@selector(openDashboard:) forControlEvents:UIControlEventTouchUpInside];

}
-(void)addDashboardView
{
    

    
    //self.dashboardView.parentController = self;
    //[self.view insertSubview:self.filterControl belowSubview:statusBar];
}


-(void)openDashboard:(id)sender
{
    
    
//    NSLog(@"Loading Dashboard");
//    //[self performSegueWithIdentifier:@"openDashboard" sender:self];
//    
//    
//    NSArray * nibContents = [[NSBundle mainBundle] loadNibNamed:@"DashboardPopupView" owner:self options:nil];
//    self.dashboardView = [[nibContents lastObject] initWithFrame:CGRectMake(0, 0, 320, 560)];
//    self.dashboardView.frame = CGRectMake(0,0,320 ,560);  //TODO change these numbers
//    self.dashboardView.tabBarReference = self;
//    
//    //Create Dashboard View
//    NSLog(@"Adding Dashboard View to View Controller #%d", self.selectedIndex);
//    [((UIViewController *)[self.viewControllers objectAtIndex:self.selectedIndex]).view addSubview:self.dashboardView];
//    //[((UIViewController *)[self.viewControllers objectAtIndex:self.selectedIndex]).view bringSubviewToFront:self.dashboardView];
//    self.tabBar.hidden = YES;
//    self.centerButton.hidden=YES;
    
    
}

- (void) draggedOut: (UIControl *) c withEvent: (UIEvent *) ev {
    
    
    if (dashboardState == opening || dashboardState == closing){
        
    

        CGPoint point = [[[ev allTouches] anyObject] locationInView:self.view];
        if(point.y < self.selectedViewController.view.frame.size.height - self.tabBar.frame.size.height/2)
        {
            c.center = CGPointMake(c.center.x, point.y);
            self.dashboardView.frame = CGRectMake(0, c.center.y, 320, 560);
        }
    
    }
    
    if (dashboardState == closed )
    
    {
        NSLog(@"Loading Dashboard");
    
        NSArray * nibContents = [[NSBundle mainBundle] loadNibNamed:@"DashboardPopupView" owner:self options:nil];
        self.dashboardView = [[nibContents lastObject] initWithFrame:CGRectMake(0, self.view.frame.size.height -self.tabBar.frame.size.height, 320, 560)];
        self.dashboardView.frame = CGRectMake(0, self.view.frame.size.height -self.tabBar.frame.size.height, 320, 560);  //TODO change these numbers
        self.dashboardView.tabBarReference = self;
    
        //Create Dashboard View
        NSLog(@"Adding Dashboard View to View Controller #%d", self.selectedIndex);
        [((UIViewController *)[self.viewControllers objectAtIndex:self.selectedIndex]).view addSubview:self.dashboardView];
        //[((UIViewController *)[self.viewControllers objectAtIndex:self.selectedIndex]).view bringSubviewToFront:self.dashboardView];
        self.tabBar.hidden = YES;
    //    self.centerButton.hidden=YES;
        
        dashboardState = opening;
    }
    
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
