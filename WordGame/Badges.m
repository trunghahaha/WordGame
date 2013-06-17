//
//  Badges.m
//  WordGame
//
//  Created by doductrung on 6/11/13.
//  Copyright (c) 2013 doductrung. All rights reserved.
//

#import "Badges.h"
#import "Config.h"
#import "Item.h"
#import "Photo.h"
#import <QuartzCore/QuartzCore.h>
@interface Badges ()
{   updateMoney _updateMoney;
}
@property (nonatomic, strong) NSMutableArray *itemInfo;
@end

@implementation Badges

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Badge";
        self.items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
    andPlayerInfoView: (UIView *) playerInfo
              andData: (NSMutableArray *) data
            andUpdate: (updateMoney) updateMoney;
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Badge";
        self.items = [[NSMutableArray alloc] init];
        self.itemInfo = data;
        self.playerInfo = playerInfo;
        [self.view addSubview:self.playerInfo];
        _updateMoney = updateMoney;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib
    [super viewWillLayoutSubviews];
    //[self loadItem];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,screenWidth, tableHight) style:UITableViewStylePlain];
    self.tableView.center = CGPointMake(screenWidth/2, playerInfoHeight + self.tableView.frame.size.height/2);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = YES;
    self.tableView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) loadView {
    [super loadView];
    [self loadItem];
}
- (void) loadItem {
    NSArray * imgArray = bagdeImages;
    NSLog(@"%d", _itemInfo.count);
    int count  =0;
    for(int i = 0; i<_itemInfo.count; i++){
        NSDictionary *dic = (NSDictionary *) [_itemInfo objectAtIndex:i];
        NSString *type = [dic objectForKey:@"Type"];
        if([type isEqualToString:@"Badge"]){
            UIImage *img = [UIImage imageNamed:imgArray[count]];
            NSInteger ID = [[dic objectForKey:@"ID"] integerValue];
            NSString *Name = [dic objectForKey:@"Name"];
            NSString *Description = [dic objectForKey:@"Description"];
            NSInteger Cost = [[dic objectForKey:@"Cost"] integerValue];
            NSInteger Discount = [[dic objectForKey:@"Discount"] integerValue];
            NSInteger Diamond = [[dic objectForKey:@"Diamond"] integerValue];
            Item *item = [[Item alloc] initWithId:ID andName:Name andCost:Cost andDiscount:Discount andDescription:Description andImage:img andType:Badge andDiamond:Diamond];
            [self.items addObject:item];
            count++;
        }
    }
    NSLog(@"%d", self.items.count);
}
#pragma mark UITableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat result = 20;
    if([tableView isEqual:self.tableView]){
        result = rowHight;
    }
    return result;
}
#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger result = 0;
    if([tableView isEqual:self.tableView]){
        result = 1;
    }
    return result;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger result = 0;
    if([tableView isEqual:self.tableView]){
        if(section == 0){
            result = self.items.count;
        }
    }
    return result;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *result = nil;
    if([tableView isEqual:self.tableView]){
        NSString * id = @"my cell";
        [tableView dequeueReusableCellWithIdentifier:id];
        result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:id];
        UIImage * img = [UIImage imageNamed:@"badgesBG.png"];
        UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
        imgView.frame = CGRectMake(0,0, screenWidth,rowHight);
        result.backgroundView = imgView;
        
        // add item
        Item * item = (Item*) [self.items objectAtIndex:indexPath.row];
        
        result.imageView.image = item.itemImage;
        result.imageView.backgroundColor = [UIColor colorWithRed:0.25f green:0.236f blue:0.108f alpha:1];
        [result.imageView.layer setMasksToBounds:NO];
        [result.imageView.layer setBorderWidth:0.0f];
        [result.imageView.layer setBorderColor:[[UIColor whiteColor] CGColor]];
        // set shadow
        result.imageView.layer.shadowRadius = 5.0;
        result.imageView.layer.shadowOffset = CGSizeMake(1.0f,2.0f);
        result.imageView.layer.shadowOpacity = 0.8;
        result.imageView.layer.shadowColor = [[UIColor blackColor] CGColor];
        [result.imageView.layer setShouldRasterize:YES];// lam min anh
        [result.imageView.layer setMasksToBounds:NO];
        
        // title label
        result.textLabel.text = item.name;
        result.textLabel.backgroundColor = [UIColor clearColor];
        // description label
        result.detailTextLabel.text = item.description;
        result.detailTextLabel.textColor = [UIColor blackColor];
        result.detailTextLabel.numberOfLines = 2;
        result.detailTextLabel.backgroundColor = [UIColor clearColor];
        // buy button
        UIImageView *buttonImgView = [[UIImageView alloc] init];
        buttonImgView.frame = CGRectMake(0,0,15* pix,15* pix);
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        if(item.price > 0){
        [button setTitle:[NSString stringWithFormat:@"%d", item.price] forState:UIControlStateNormal];
            buttonImgView.image = [UIImage imageNamed:@"coin.png"];
        }else if(item.diamond > 0){
            [button setTitle:[NSString stringWithFormat:@"%d", item.diamond] forState:UIControlStateNormal];
            buttonImgView.image = [UIImage imageNamed:@"diamond.png"];
        }
        button.frame = CGRectMake(0,0,80* pix,30* pix);
        button.titleLabel.font = [UIFont fontWithName:@"Arial" size:10];
        button.center = CGPointMake(screenWidth - button.bounds.size.width/2, rowHight - button.bounds.size.height/2);
        buttonImgView.center = CGPointMake(button.bounds.size.width- buttonImgView.bounds.size.width/2 - 5, button.bounds.size.height/2);
        [button addTarget:self action:@selector(buy:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = indexPath.row;
        [button addSubview:buttonImgView];
        [result addSubview:button];
        // disable selection
        result.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return result;
}
#pragma mark back to Main
- (IBAction)buy: (id) sender {
    UILabel *coinLb = (UILabel *)[self.playerInfo viewWithTag:1];
    UILabel *diamondLb =  (UILabel *)[self.playerInfo viewWithTag:2];
    int coin = [coinLb.text intValue];
    int diamond = [diamondLb.text intValue];
    UIButton *b = sender;
    Item *item = (Item*)[self.items objectAtIndex:b.tag];
    if(coin >= item.price && diamond >= item.diamond){
    coin -= item.price;
    diamond -= item.diamond;
    coinLb.text = [NSString stringWithFormat:@"%d", coin];
    diamondLb.text = [NSString stringWithFormat:@"%d", diamond];
    _updateMoney (self.playerInfo);
    }
}
@end
