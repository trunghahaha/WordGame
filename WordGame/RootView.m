//
//  RootView.m
//  WordGame
//
//  Created by doductrung on 6/11/13.
//  Copyright (c) 2013 doductrung. All rights reserved.
//

#import "RootView.h"
#import "AllItem.h"
#import "AvatarView.h"
#import "Badges.h"
#import "Config.h"
#import "Avatar.h"
@interface RootView ()

@end

@implementation RootView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIImage *img = [UIImage imageNamed:@"playerInfo.png"];
        self.playerInfo = [[UIView alloc] initWithFrame:CGRectMake(0,0, screenWidth, playerInfoHeight)];
        self.playerInfo.backgroundColor = [UIColor colorWithPatternImage:img];
        [self createNewProfile];
    }
    return self;
}
- (void) loadView {
    [super loadView];
    [self loadItem];
}
- (void) loadItem
{
    NSString *itemFilePath = [[NSBundle mainBundle] pathForResource:@"Items" ofType:@"plist"];
    self.listItem = [NSMutableArray arrayWithContentsOfFile:itemFilePath];
}
- (void) createNewProfile {
    NSString *savePath = [[NSBundle mainBundle] pathForResource:@"GameSave" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:savePath];
    NSString *name = [dic objectForKey:@"Name"];
    bool g = [[dic objectForKey:@"Gender"] boolValue];
    Gender gender ;
    if(g == YES)
        gender = male;
    else
        gender = female;
    NSInteger coin= [[dic objectForKey:@"Coin"] integerValue];
    NSInteger diamond= [[dic objectForKey:@"Diamond"] integerValue];
    NSInteger rank= [[dic objectForKey:@"Rank"] integerValue];
    NSInteger highScore= [[dic objectForKey:@"HighScore"] integerValue];
    self.playerProfile = [[Profile alloc] initWithName:name andCoin:coin andDiamond:diamond andRank:rank andHighScore:highScore andGender:gender];
    UIImage *head = [UIImage imageNamed:@"head1.png"];
    UIImage *body = [UIImage imageNamed:@"body1.png"];
    UIImage *underBody = [UIImage imageNamed:@"underbody1.png"];
    CGRect f = CGRectMake(0, 0, 70* pix, 70* pix);
    // create Avatar
    Avatar *ava = [[Avatar alloc] initWithFrame:f andHead:head andBody:body andUnderBody:underBody];
    [self.playerInfo addSubview:ava];
    NSLog(@"Profile loaded done");
    //name Label
    UILabel *lb = [[UILabel alloc] init];
    lb.frame = CGRectMake(screenWidth/2, 0, 2 * (screenWidth - ava.frame.size.width)/3, playerInfoHeight/2);
    lb.text = self.playerProfile.name;
    lb.textAlignment = NSTextAlignmentLeft;
    lb.backgroundColor = [UIColor clearColor];
    lb.textColor = [UIColor whiteColor];
    [self.playerInfo addSubview:lb];
    // coin img
    UIImageView *img1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"coin.png"]];
    img1.frame = CGRectMake(0, 0, 15* pix, 15* pix);
    img1.center = CGPointMake(screenWidth/2 + 10* pix, playerInfoHeight/2 + 10* pix);
    [self.playerInfo addSubview:img1];
    // coin lb
    UILabel *lb1 = [[UILabel alloc] init];
    lb1.frame = CGRectMake(0, 0, 50* pix, playerInfoHeight/2);
    lb1.center = CGPointMake(screenWidth/2 + 45* pix, playerInfoHeight/2 + 10* pix);
    lb1.text = [NSString stringWithFormat:@"%d", self.playerProfile.coin];
    lb1.backgroundColor = [UIColor clearColor];
    lb1.font = [UIFont fontWithName:@"Arial" size:12];
    lb1.textColor = [UIColor whiteColor];
    lb1.tag = 1;
    [self.playerInfo addSubview:lb1];
    
    // diamond img
    UIImageView *img2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"diamond.png"]];
    img2.frame = CGRectMake(0, 0, 15* pix, 15* pix);
    img2.center = CGPointMake(screenWidth/2 + 10* pix + lb1.frame.size.width+ 10* pix, playerInfoHeight/2 + 10* pix);
    [self.playerInfo addSubview:img2];
    // coin lb
    UILabel *lb2 = [[UILabel alloc] init];
    lb2.frame = CGRectMake(0, 0, 50* pix, playerInfoHeight/2);
    lb2.center = CGPointMake(screenWidth/2 + + lb1.frame.size.width+ 55* pix, playerInfoHeight/2 + 10* pix);
    lb2.text = [NSString stringWithFormat:@"%d", self.playerProfile.diamond];
    lb2.backgroundColor = [UIColor clearColor];
    lb2.font = [UIFont fontWithName:@"Arial" size:12];
    lb2.textColor = [UIColor whiteColor];
    lb2.tag = 2;
    [self.playerInfo addSubview:lb2];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    AllItem *allItemView = [[AllItem alloc] initWithNibName:@"AllItem" bundle:NULL];
    AvatarView *avaView = [[AvatarView alloc]initWithNibName:@"AvatarView" bundle:NULL];
    /*Badges *badgeView = [[Badges alloc] initWithNibName:@"Badges" bundle:NULL];*/
    Badges *badgeView = [[Badges alloc] initWithNibName:@"Badges" bundle:NULL andPlayerInfoView:self.playerInfo andData:self.listItem andUpdate:^(UIView * view) {
        self.playerInfo = view;
    }];
    UITabBarController *tabBarView = [[UITabBarController alloc] init];
    tabBarView.viewControllers = [NSArray arrayWithObjects:allItemView,
                                  avaView, badgeView, nil];
    [self.navigationController pushViewController:tabBarView animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
