//
//  Myposition.h
//  RenYiMen
//
//  Created by 吕泓钊 on 2020/5/8.
//  Copyright © 2020 吕泓钊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Myposition : NSObject

@property(nonatomic)NSMutableArray *senlin;
@property(nonatomic)NSMutableArray *shijian;
@property(nonatomic)NSMutableArray *beijixiong;
@property(nonatomic)NSMutableArray *kongjian;

+(instancetype)new;
@end
