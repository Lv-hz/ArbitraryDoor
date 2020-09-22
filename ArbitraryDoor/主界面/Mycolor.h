//
//  Mycolor.h
//  RenYiMen
//
//  Created by 吕泓钊 on 2020/5/7.
//  Copyright © 2020 吕泓钊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mycolor : NSObject
@property (nonatomic) NSNumber *redcolor;
@property (nonatomic) NSNumber *greecolor;
@property (nonatomic) NSNumber *bluecolor;
@property(nonatomic) NSInteger k;
@property (nonatomic,strong) NSString *name;

+(instancetype)newcolor;
+(instancetype)gengxincolor:(NSInteger)k;
-(instancetype)initwithred:(NSNumber*)red green:(NSNumber*)green blue:(NSNumber*)blue name:(NSString*)name k:(NSInteger)k;
@end
