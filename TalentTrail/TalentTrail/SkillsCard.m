//
//  SkillsCard.m
//  TalentTrail
//
//  Created by Parker Seagren on 8/10/14.
//  Copyright (c) 2014 pqseags. All rights reserved.
//

#import "SkillsCard.h"
#import "HexColor.h"

@implementation SkillsCard

@synthesize skill1;
@synthesize skill2;
@synthesize skill3;
@synthesize skill4;

- (void)awakeFromNib
{
    // Initialization code
    
    self.skill1.backgroundColor = [HexColor talentTrailBlue];
    self.skill2.backgroundColor = [HexColor talentTrailBlue];
    self.skill3.backgroundColor = [HexColor talentTrailBlue];
    self.skill4.backgroundColor = [HexColor talentTrailBlue];

    self.skill1.layer.cornerRadius = 10.0f;
    self.skill2.layer.cornerRadius = 10.0f;
    self.skill3.layer.cornerRadius = 10.0f;
    self.skill4.layer.cornerRadius = 10.0f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
