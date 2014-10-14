//
//  DashboardViewController.m
//  TalentTrail
//
//  Created by Parker Seagren on 7/1/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

//=============================================================
//- - - - - - - - - - - NOT BEING USED - - - - - - - - - - - -//
//=============================================================


#import "DashboardViewController.h"
#import "DashboardCell.h"

@interface DashboardViewController ()

@end

@implementation DashboardViewController

@synthesize dataArray;
@synthesize gridView;

const float kGridPadding = 10;

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    //DATA
    //dataArray = [[NSMutableArray alloc] initWithObjects:row1, row2, nil];
    
    
    //LAYOUT
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    //make two cells per row, with kGridPadding spacing in between and on all sides
    float cellSize = (self.view.frame.size.width  - (3* kGridPadding)) /2;
    [flowLayout setItemSize:CGSizeMake(cellSize, cellSize)];
    

    
    [self.gridView setCollectionViewLayout:flowLayout];
    
    //CELLS
    [self.gridView registerClass:[DashboardCell class] forCellWithReuseIdentifier:@"DashboardCell"];
    
}


//- (IBAction)dismissDashboard:(id)sender {
//     [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//    NSLog(@"DOOT");
//
//}



-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;//[self.dataArray count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 2;//[[self.dataArray objectAtIndex:section] count];
    
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
    
    DashboardCell *cell = (DashboardCell *)[gridView dequeueReusableCellWithReuseIdentifier:@"DashboardCell" forIndexPath:indexPath];
    return cell;
    
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(kGridPadding, kGridPadding, 0, kGridPadding);
}


- (IBAction)pressedDoneButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
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
