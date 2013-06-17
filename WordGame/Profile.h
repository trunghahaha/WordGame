//
//  Profile.h
//  StoreDemo
//
//  Created by doductrung on 6/8/13.
//  Copyright (c) 2013 doductrung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Avatar.h"
#import "Config.h"

typedef enum{
    male,
    female
}Gender;
@interface Profile : NSObject
@property (strong, nonatomic) NSString *deviceId;
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) Gender gender;
@property (assign, nonatomic) NSInteger coin;
@property (assign, nonatomic) NSInteger diamond;
@property (assign, nonatomic) NSInteger rank;
@property (assign, nonatomic) NSInteger highScore;
@property (strong, nonatomic) Avatar *avatar;

- (id) initWithName: (NSString *) name
            andCoin: (NSInteger) coin
         andDiamond: (NSInteger) diamond
            andRank: (NSInteger) rank
       andHighScore: (NSInteger) highScore
          andGender: (Gender) gender;

- (void) updateProfileWithValue: (NSString *) value
                         ForKey: (NSString *) key;

- (void) updateProfileWithAvatar: (Avatar *) avatar;
@end
