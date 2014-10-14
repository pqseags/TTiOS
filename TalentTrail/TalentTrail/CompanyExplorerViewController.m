//
//  CompanyExplorerViewController.m
//  TalentTrail
//
//  Created by Parker Seagren on 7/30/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import "CompanyExplorerViewController.h"
#import "CompanyCell.h"
#import "HexColor.h"
#import "FilterView.h"

@interface CompanyExplorerViewController ()

@end

@implementation CompanyExplorerViewController

@synthesize companyCollectionView;
@synthesize filterControl;


const float kCompanyGridPadding = 10;

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
    
    //LAYOUT
    [self.view bringSubviewToFront:self.companyCollectionView];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    float cellSize = (self.view.frame.size.width  - (3* kCompanyGridPadding)) /2;
    [flowLayout setItemSize:CGSizeMake(cellSize, cellSize)];
    //    [flowLayout setMinimumLineSpacing: 4];
    //    [flowLayout setMinimumInteritemSpacing:4];
    
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [self.companyCollectionView setCollectionViewLayout:flowLayout];
    
    //CELLS
    [self.companyCollectionView registerClass:[CompanyCell class] forCellWithReuseIdentifier:@"CompanyCell"];
    
    //STYLING
    self.companyCollectionView.backgroundColor = [UIColor whiteColor];
    
    //Filter Control
    NSArray * nibContents = [[NSBundle mainBundle] loadNibNamed:@"FilterView" owner:self options:nil];
    
    self.filterControl = [[nibContents lastObject] initWithFrame:(CGRect){5000,5000,5000,5000}];
    self.filterControl.frame = CGRectMake(0,20,self.view.frame.size.width,self.filterControl.frame.size.height);

    self.filterControl.parentController = self;
    [self.view insertSubview:self.filterControl belowSubview:statusBar];
    
    

}

    

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    //rows
    
    //return [self.dataArray count];
    return 6;}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //columns
    
    //return [[self.dataArray objectAtIndex:section] count];
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //    if (indexPath.section == 0){
    //        if (indexPath.row == 0){
    //            return [dataArray objectAtIndex:0];
    //        }
    //
    //        else{ // (indexPath.row ==1)
    //            return [dataArray objectAtIndex:1];
    //        }
    //    }
    //
    //    else // (indexPath.section==1)
    //        if (indexPath.row == 0){
    //            return [dataArray objectAtIndex:2];
    //        }
    //
    //        else{ // (indexPath.row ==1)
    //            return [dataArray objectAtIndex:3];
    //        }
    
    CompanyCell *cell = (CompanyCell *)[companyCollectionView dequeueReusableCellWithReuseIdentifier:@"CompanyCell" forIndexPath:indexPath];
    return cell;
    
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(kCompanyGridPadding, kCompanyGridPadding, 0, kCompanyGridPadding);
}


-(void) prepareForFilterControl
{
    [self.view sendSubviewToBack:self.companyCollectionView];
//    NSLog(@"Sending collection view to back");
}

-(void) prepareForFilterControlDismissal
{
    [self.view bringSubviewToFront:self.companyCollectionView];
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
