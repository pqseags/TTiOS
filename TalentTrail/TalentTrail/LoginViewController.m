//
//  LoginViewController.m
//  TalentTrail
//
//  Created by Parker Seagren on 9/26/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import "LoginViewController.h"
#import "HexColor.h"
#import "TTTabBarController.h"
#import "TalentTrailCommunicator.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize emailField;
@synthesize passwordField;
@synthesize signInButton;

@synthesize email;
@synthesize password;


TalentTrailCommunicator * serverCommunicator;



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
    
    //Set up Notification Center
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveSigninSuccessNotification:)
                                                 name:@"SigninSuccessNotification"
                                               object:nil];
    
    //colors
    self.signInButton.tintColor = [HexColor talentTrailOrange];
    self.emailField.tintColor = [HexColor talentTrailOrange];
    self.passwordField.tintColor = [HexColor talentTrailOrange];
    
    emailField.layer.cornerRadius=8.0f;
    emailField.layer.masksToBounds=YES;
    emailField.layer.borderColor=[[HexColor talentTrailOrange] CGColor];
    emailField.layer.borderWidth= 1.0f;
    
    emailField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: [HexColor talentTrailOrange]}];
    
    passwordField.layer.cornerRadius=8.0f;
    passwordField.layer.masksToBounds=YES;
    passwordField.layer.borderColor=[[HexColor talentTrailOrange] CGColor];
    passwordField.layer.borderWidth= 1.0f;
    passwordField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: [HexColor talentTrailOrange]}];
    
    
    //set delegate of Text Fields to this view controller
    emailField.delegate = self;
    passwordField.delegate = self;
    
    //change the return key to "Done" on keyboard
    emailField.returnKeyType = UIReturnKeyDone;
    passwordField.returnKeyType = UIReturnKeyDone;
    
    //secure text entry for password field
    passwordField.secureTextEntry = YES;
    
    
    //TODO Set Up Server Classes -> I will do this in every view controller and it will be inefficient memory-wise (only slightly). Better to make a singleton
   
    
    NSLog(@"Setting login view controller");
    serverCommunicator = [[TalentTrailCommunicator alloc] init];
    [serverCommunicator setLoginViewControllers: self];
    
    
    //listen to notificationCenter for when keyboard appears/disappears
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)clickedSignInButton:(id)sender {
    email = emailField.text;
    password = passwordField.text;
    NSLog(@"Signed in with (Email: %@, Password: %@)", email, password);
    
    
    
    //CHECK IF VALID SIGNIN
    [serverCommunicator loginWithUsername:email password:password];
    NSLog(@"Sent the Authentication Request (From LoginViewController)");
    
    
    
    //SAVE DATA TO NSUSERDEFAULTS
    
    
    
    
    

    
    //[self performSegueWithIdentifier:@"SignIn" sender:self];
    
    
}

-(void) receiveSigninSuccessNotification: (NSNotification *) notification
{
    if ([[notification name] isEqualToString:@"SigninSuccessNotification"])
    {
        NSLog(@"LoginViewController received Successful Signin Notification");
        
        //Make the Transition
        // I will probably have to move this to a new method that gets called when the serverResponseHandler figures out if signin was legit or not
        //^Tried that, caused threading issues. Instead, gotta sign up for the notification center. UGH.
        
        TTTabBarController * tabController = [self.storyboard instantiateViewControllerWithIdentifier:@"TabBar"];
        [self presentViewController:tabController animated:YES completion:nil];
        tabController.selectedIndex = 0;
        
        [tabController openDashboard: self];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
