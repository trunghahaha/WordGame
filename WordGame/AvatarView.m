//
//  AvatarView.m
//  WordGame
//
//  Created by doductrung on 6/11/13.
//  Copyright (c) 2013 doductrung. All rights reserved.
//

#import "AvatarView.h"

@interface AvatarView ()

@end

@implementation AvatarView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Avatar's item";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
