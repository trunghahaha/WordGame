//
//  Avatar.h
//  StoreDemo
//
//  Created by doductrung on 6/8/13.
//  Copyright (c) 2013 doductrung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Avatar : UIImageView
@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) UIImageView *bodyImage;
@property (nonatomic, strong) UIImageView *underBodyImage;

- (id) initWithFrame: (CGRect) frame
                andHead: (UIImage *) head
                andBody: (UIImage *) body
           andUnderBody: (UIImage *) underBody;
- (void) placeToPosition: (CGPoint) p;
- (void) resizeWithWidth: (float) width
               andHeight: (float) height;
- (void) changeHead: (UIImage *) img;
- (void) changeBody: (UIImage *) img;
- (void) changeUnderBody: (UIImage *) img;
- (void) addToView: (UIView *) view;
@end
