//
//  Photo.m
//  Buoi 10 - BVN - BookingDishs
//
//  Created by doductrung on 6/9/13.
//  Copyright (c) 2013 doductrung. All rights reserved.
//

#import "Photo.h"
#import <QuartzCore/QuartzCore.h>
@implementation Photo

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void) configShadow {
    [self.layer setMasksToBounds:NO];
    [self.layer setBorderWidth:5.0f];
    [self.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    // set shadow
    self.layer.shadowRadius = 5.0;
    self.layer.shadowOffset = CGSizeMake(1.0f,2.0f);
    self.layer.shadowOpacity = 0.8;
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    [self.layer setShouldRasterize:YES];// lam min anh
    [self.layer setMasksToBounds:NO];
}
@end
