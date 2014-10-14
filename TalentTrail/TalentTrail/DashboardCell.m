//
//  DashboardCell.m
//  TT
//
//  Created by Parker Seagren on 7/18/14.
//  Copyright (c) 2014 TT. All rights reserved.
//

#import "DashboardCell.h"
#import "HexColor.h"

@implementation DashboardCell

@synthesize cellType; //NewMatches, ApplicationComplete, ApplicationTime, NewCompanies
@synthesize titleLabel;
@synthesize iconImage;


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"DashboardCell" owner:self options:nil];
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        self = [arrayOfViews objectAtIndex:0];
        
        
        
        
        
        
    }
    
    return self;
    
}

-(void)designateCellType:(NSString*)type
{
    if ([type isEqualToString:@"ApplicationComplete"])
    {
        self.backgroundColor = [HexColor talentTrailRed];
        self.titleLabel.text = @"Application Status";
        return;
    }
    
    if ([type isEqualToString:@"ApplicationTime"])
    {
        self.backgroundColor = [HexColor talentTrailGreen];
        self.titleLabel.text = @"Time until Submission";
        return;
    }
    
    if ([type isEqualToString:@"NewMatches"])
    {
        self.backgroundColor = [HexColor talentTrailPurple];
        self.titleLabel.text = @"New Matches";
        return;
    }
    
    if ([type isEqualToString:@"NewCompanies"])
    {
        self.backgroundColor = [HexColor talentTrailBlue];
        self.titleLabel.text = @"New Companies";
        return;
    }
    
    
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
