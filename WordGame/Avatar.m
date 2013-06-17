//
//  Avatar.m
//  StoreDemo
//
//  Created by doductrung on 6/8/13.
//  Copyright (c) 2013 doductrung. All rights reserved.
//

#import "Avatar.h"
#import <QuartzCore/QuartzCore.h>
@implementation Avatar
- (id) initWithFrame: (CGRect) frame
             andHead: (UIImage *) head
             andBody: (UIImage *) body
        andUnderBody: (UIImage *) underBody
{
    if(self == [super init]){
        self.frame = frame;
        float border = 2;
        self.layer.borderWidth = border;
        float superWidth = self.frame.size.width - 2 *border;
        float superHeight = self.frame.size.height - 2 * border;
        self.headImage = [[UIImageView alloc] initWithImage:head];
        self.bodyImage = [[UIImageView alloc] initWithImage:body];
        self.underBodyImage = [[UIImageView alloc] initWithImage:underBody];
        self.headImage.frame = CGRectMake(border,border, superWidth, superHeight/5);
        self.bodyImage.frame = CGRectMake(border, superHeight/5 + border, superWidth, 2 *superHeight/5);
        self.underBodyImage.frame = CGRectMake(border, 3 * superHeight/5 + border, superWidth, 2 * superHeight/5);
        [self addSubview:self.headImage];
        [self addSubview:self.bodyImage];
        [self addSubview:self.underBodyImage];
        self.layer.borderColor = [[UIColor whiteColor] CGColor];
        self.layer.shadowRadius = 5.0;
        self.layer.shadowOffset = CGSizeMake(1.0f,2.0f);
        self.layer.shadowOpacity = 0.8;
        self.layer.shadowColor = [[UIColor blackColor] CGColor];
        [self.layer setShouldRasterize:YES];// lam min anh
        [self.layer setMasksToBounds:NO];
        CALayer *l = [self layer];
        [l setMasksToBounds:YES];
        [l setCornerRadius:30];
    }
    return self;
}
- (void) placeToPosition: (CGPoint) p
{
    self.center = p;
}
- (void) resizeWithWidth: (float) width
               andHeight: (float) height
{   CGPoint p = CGPointMake(self.headImage.frame.origin.x, self.headImage.frame.origin.y);
    self.headImage.frame = CGRectMake(p.x, p.y, width, height / 3);
    self.bodyImage.frame = CGRectMake(p.x, p.y + height / 3, width, height / 3);
    self.underBodyImage.frame = CGRectMake(p.x, p.y + 2 * height / 3, width, height / 3);
}
- (void) changeHead: (UIImage *) img
{
    [self.headImage setImage:img];
}
- (void) changeBody: (UIImage *) img
{
    [self.bodyImage setImage:img];
}
- (void) changeUnderBody: (UIImage *) img
{
    [self.underBodyImage setImage:img];
}
- (void) addToView: (UIView *) view
{
    [view addSubview:self.headImage];
    [view addSubview:self.bodyImage];
    [view addSubview:self.underBodyImage];
}
@end
