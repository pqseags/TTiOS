//
//  HexColor.h
//  TalentTrail
//
//  Created by Parker Seagren on 4/12/14.
//  Copyright (c) 2014 TalentTrail. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HexColor : NSObject {}
+(UIColor*)colorWithHexString:(NSString*)hex;
+ (UIColor *)colorWithHexString:(NSString*)hex Alpha:(float)alpha;
+(UIColor *) talentTrailOrange;
+(UIColor *) talentTrailBlue;
+(UIColor *) talentTrailGreen;
+(UIColor *) talentTrailRed;
+(UIColor *) talentTrailPurple;

@end
