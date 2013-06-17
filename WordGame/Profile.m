//
//  Profile.m
//  StoreDemo
//
//  Created by doductrung on 6/8/13.
//  Copyright (c) 2013 doductrung. All rights reserved.
//

#import "Profile.h"

@implementation Profile
- (id) initWithName: (NSString *) name
            andCoin: (NSInteger) coin
         andDiamond: (NSInteger) diamond
            andRank: (NSInteger) rank
       andHighScore: (NSInteger) highScore
          andGender: (Gender) gender
{
    if(self == [super init]){
        self.name = name;
        self.coin = coin;
        self.diamond = diamond;
        self.rank = rank;
        self.highScore = highScore;
        self.gender = gender;
    }
    return self;
}

- (void) updateProfileWithValue:(NSString *)value ForKey:(NSString *)key
{
    if ([key isEqualToString:NAME]) {
        self.name = value;
    } else if ([key isEqualToString:COIN]) {
        self.coin = [value integerValue];
    } else if ([key isEqualToString:DIAMOND]) {
        self.diamond = [value integerValue];
    } else if ([key isEqualToString:RANK]) {
        self.rank = [value integerValue];
    } else if ([key isEqualToString:HIGHSCORE]) {
        self.highScore = [value integerValue];
    }
}

- (void) updateProfileWithAvatar: (Avatar *) avatar
{
    self.avatar = avatar;
}
@end
