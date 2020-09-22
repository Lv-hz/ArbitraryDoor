//
//  YunYinContent.m
//  ArbitraryDoor
//
//  Created by 吕泓钊 on 2020/9/17.
//  Copyright © 2020 Chutiiing. All rights reserved.
//

#import "YunYinContent.h"

@implementation YunYinContent


+(instancetype)shareYuYinContent
{
    static YunYinContent *sharecontent=nil;
    if (!sharecontent){
        sharecontent=[[self alloc]init];
        sharecontent.issuccess =1;
        
    }
    return sharecontent;
}



@end
