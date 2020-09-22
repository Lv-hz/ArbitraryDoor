//
//  Myposition.m
//  RenYiMen
//
//  Created by 吕泓钊 on 2020/5/8.
//  Copyright © 2020 吕泓钊. All rights reserved.
//

#import "Myposition.h"

@implementation Myposition


+(instancetype)new{
    CGRect sen1=CGRectMake(40, 320, 310, 310);
    CGRect sen2=CGRectMake(230, 260, 150, 150);
    CGRect sen3=CGRectMake(120, 160, 150, 150);
    CGRect sen4=CGRectMake(0, 260, 150, 150);
    
    
    CGRect kong2=CGRectMake(40, 320, 310, 310);
    CGRect kong3=CGRectMake(230, 260, 150, 150);
    CGRect kong4=CGRectMake(120, 160, 150, 150);
    CGRect kong1=CGRectMake(0, 260, 150, 150);
    
    CGRect bei4=CGRectMake(40, 320, 310, 310);
    CGRect bei1=CGRectMake(230, 260, 150, 150);
    CGRect bei2=CGRectMake(120, 160, 150, 150);
    CGRect bei3=CGRectMake(0, 260, 150, 150);
    
    CGRect shi3 =CGRectMake(40, 320, 310, 310);
    CGRect shi4 =CGRectMake(230, 260, 150, 150);
    CGRect shi1 =CGRectMake(120, 160, 150, 150);
    CGRect shi2 =CGRectMake(0, 260, 150, 150);
    
    NSValue *sen11=[NSValue valueWithCGRect:sen1];
    NSValue *sen22=[NSValue valueWithCGRect:sen2];
    NSValue *sen33=[NSValue valueWithCGRect:sen3];
    NSValue *sen44=[NSValue valueWithCGRect:sen4];
    
    NSValue *kong11=[NSValue valueWithCGRect:kong1];
    NSValue *kong22=[NSValue valueWithCGRect:kong2];
    NSValue *kong33=[NSValue valueWithCGRect:kong3];
    NSValue *kong44=[NSValue valueWithCGRect:kong4];
    
    NSValue *shi11=[NSValue valueWithCGRect:shi1];
    NSValue *shi22=[NSValue valueWithCGRect:shi2];
    NSValue *shi33=[NSValue valueWithCGRect:shi3];
    NSValue *shi44=[NSValue valueWithCGRect:shi4];
    
    NSValue *bei11=[NSValue valueWithCGRect:bei1];
    NSValue *bei22=[NSValue valueWithCGRect:bei2];
    NSValue *bei33=[NSValue valueWithCGRect:bei3];
    NSValue *bei44=[NSValue valueWithCGRect:bei4];
    
    NSMutableArray *sen=[[NSMutableArray alloc]initWithObjects:sen11,sen22,sen33,sen44,nil];
    NSMutableArray *shi=[[NSMutableArray alloc]initWithObjects:shi11,shi22,shi33,shi44,nil];
    NSMutableArray *kong=[[NSMutableArray alloc]initWithObjects:kong11,kong22,kong33,kong44,nil];
    NSMutableArray *bei=[[NSMutableArray alloc]initWithObjects:bei11,bei22,bei33,bei44, nil];
    
    Myposition *myp=[[Myposition alloc]init];
    myp.kongjian =kong;
    myp.shijian =shi;
    myp.beijixiong =bei;
    myp.senlin =sen;
    
    return myp;
    
}
@end
