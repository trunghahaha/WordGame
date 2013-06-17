//
//  ItemDelegate.h
//  WordGame
//
//  Created by doductrung on 6/11/13.
//  Copyright (c) 2013 doductrung. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ItemDelegate <NSObject>
- (void) substractCash : (NSInteger) money;
@end
