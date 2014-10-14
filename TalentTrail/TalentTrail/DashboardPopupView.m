//
//  DashboardPopupView.m
//  TalentTrail
//
//  Created by Parker Seagren on 8/7/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import "DashboardPopupView.h"
#import "DashboardCell.h"
#import "HexColor.h"


@implementation DashboardPopupView

float cellSize;


const float kDashGridPadding = 10;

@synthesize gridView;
@synthesize doneButton;
@synthesize gridTypes;
@synthesize topView;
@synthesize bottomView;
@synthesize nameLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self.gridView setDataSource:self];
        [self.gridView setDelegate:self];
        [self.gridView registerClass:[DashboardCell class] forCellWithReuseIdentifier:@"DashboardCell"];
        
        
        //VIEWS
        self.topView.backgroundColor = [HexColor talentTrailOrange];
        self.bottomView.backgroundColor = [HexColor talentTrailOrange];
        
        //PERSONAL DATA
        NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
        nameLabel.text = (NSString*)[standardUserDefaults stringForKey:@"username"];
        
        //GRIDVIEW
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        //make two cells per row, with kDashGridPadding spacing in between and on all sides
        //cellSize = (self.frame.size.width  - (3* kDashGridPadding)) /2;
        cellSize = self.gridView.frame.size.width/2;
        NSLog(@"Dashboard cellSize = %f", cellSize);
        [flowLayout setItemSize:CGSizeMake(cellSize, cellSize)];
        flowLayout.minimumInteritemSpacing=0;
        flowLayout.minimumLineSpacing = 0;
    
        [self.gridView setCollectionViewLayout:flowLayout];
        
        //CELLS
        [self.gridView registerClass:[DashboardCell class] forCellWithReuseIdentifier:@"DashboardCell"];
        self.gridTypes = [[NSMutableArray alloc] initWithObjects:@"ApplicationComplete", @"ApplicationTime", @"NewMatches", @"NewCompanies", nil];

        
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder*)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        // Initialization code
        NSLog(@"initWithCoder");
    
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
#pragma mark - UICollectionView datasource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    //rows
    
    //return [self.dataArray count];
    return 2;
}


-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
        DashboardCell *cell = (DashboardCell *)[gridView dequeueReusableCellWithReuseIdentifier:@"DashboardCell" forIndexPath:indexPath];
    
        if (indexPath.section == 0){
            if (indexPath.row == 0){
                [cell designateCellType:[gridTypes objectAtIndex:0]];
            }
    
        else{ // (indexPath.row ==1)
                [cell designateCellType:[gridTypes objectAtIndex:1]];
            }
        }
    
        else // (indexPath.section==1)
            if (indexPath.row == 0){
                [cell designateCellType:[gridTypes objectAtIndex:2]];
            }
    
            else{ // (indexPath.row ==1)
                [cell designateCellType:[gridTypes objectAtIndex:3]];
            }
    

    return cell;
    
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    float verticalPadding = (self.gridView.frame.size.height - (2*cellSize)) /3;
    return UIEdgeInsetsMake(0, 0, 0, 0);
    //(k,k,0,k)
}

- (IBAction)pressedDoneButton:(id)sender {
    [self removeFromSuperview];
    self.tabBarReference.tabBar.hidden = NO;
    self.tabBarReference.centerButton.hidden = NO;
}


@end
