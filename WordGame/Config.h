//
//  Config.h
//  StoreDemo
//
//  Created by doductrung on 6/8/13.
//  Copyright (c) 2013 doductrung. All rights reserved.
//

#ifndef StoreDemo_Config_h
#define StoreDemo_Config_h

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height
#define pix screenWidth / 320
#define NAME @"name"
#define COIN @"coin"
#define DIAMOND @"diamond"
#define RANK @"rank"
#define HIGHSCORE @"highscore"
#define AVATAR @"avatar"
#define IMGWIDTH 100 * pix
#define IMGHEIGHT 240 * pix
// table
#define rowHight 70 *pix
#define tableHight 360 * pix
//------------------
#define bagdeImages @[@"Lv1badge1.png",  @"Lv1badge2.png", @"Lv1badge3.png", @"Lv2badge1.png"];
#define avatarItem @[@"head1.png", @"body1.png",@"underbody1.png"];
#define playerInfoHeight 100 * pix
#endif
