//
//  Item.h
//  StoreDemo
//
//  Created by doductrung on 6/11/13.
//  Copyright (c) 2013 doductrung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemDelegate.h"
typedef enum {
    Badge,
    Hint,
    Decorate
}ItemEnum;
@interface Item : NSObject
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * description;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) NSInteger cost;
@property (nonatomic, assign) NSInteger discount;
@property (nonatomic, strong) UIImage * itemImage;
@property (nonatomic, assign) NSInteger price;
@property (nonatomic, assign) ItemEnum type;
@property (nonatomic, assign) NSInteger diamond;
- (id) initWithId: (NSInteger) Id
          andName: (NSString *) name
          andCost: (NSInteger) cost
      andDiscount: (NSInteger) discount
   andDescription: (NSString *) description
         andImage: (UIImage *) itemImage
          andType: (ItemEnum) type
       andDiamond: (NSInteger) diamond;

- (NSString *) typeToString: (ItemEnum) type;
@end
