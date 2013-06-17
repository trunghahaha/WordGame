//
//  RootView.h
//  WordGame
//
//  Created by doductrung on 6/11/13.
//  Copyright (c) 2013 doductrung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profile.h"

@interface RootView : UIViewController
@property (nonatomic, strong) NSMutableArray *listItem;
@property (nonatomic, strong) Profile *playerProfile;
@property (nonatomic, strong) UIView *playerInfo;
@end
