//
//  Item.m
//  StoreDemo
//
//  Created by doductrung on 6/11/13.
//  Copyright (c) 2013 doductrung. All rights reserved.
//

#import "Item.h"

@implementation Item
- (id) initWithId: (NSInteger) Id
          andName: (NSString *) name
          andCost: (NSInteger) cost
      andDiscount: (NSInteger) discount
   andDescription: (NSString *) description
         andImage: (UIImage *) itemImage
          andType: (ItemEnum) type
       andDiamond: (NSInteger) diamond
{
    if(self == [super init]){
        self.ID = Id;
        self.name = name;
        self.cost = cost;
        self.discount = discount;
        self.description = description;
        self.itemImage = itemImage;
        self.type = type;
        self.price = self.cost - self.cost * self.discount / 100;
        self.diamond = diamond;
    }
    return self;
}

- (NSString *) typeToString: (ItemEnum) type
{  switch (type){
    case Badge: return @"Badge";
    case Hint: return @"Hint";
    case Decorate: return @"Decorate";
    default : return @"";
   }
}
@end
