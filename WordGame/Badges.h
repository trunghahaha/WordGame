//
//  Badges.h
//  WordGame
//
//  Created by doductrung on 6/11/13.
//  Copyright (c) 2013 doductrung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
typedef void (^updateMoney) (UIView*);
@interface Badges : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) UIView *playerInfo;
- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
    andPlayerInfoView: (UIView *) playerInfo
              andData: (NSMutableArray *) data
            andUpdate: (updateMoney) updateMoney;
@end
