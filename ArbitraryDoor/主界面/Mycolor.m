//
//  Mycolor.m
//  RenYiMen
//
//  Created by 吕泓钊 on 2020/5/7.
//  Copyright © 2020 吕泓钊. All rights reserved.
//

#import "Mycolor.h"

@implementation Mycolor

+(instancetype)newcolor
{
    float r1=61/255.0;
    float r2=121/255.0;
    float r3=232/255.0;
    float r4=143/255.0;
    
    float g1=191/255.0;
    float g2=180/255.0;
    float g3=196/255.0;
    float g4=222/255.0;
    
    float b1=150/255.0;
    float b2=240/255.0;
    float b3=100/255.0;
    float b4=248/255.0;
    
    NSNumber *rr1 =[NSNumber numberWithFloat:r1];
    NSNumber *rr2 =[NSNumber numberWithFloat:r2];
    NSNumber *rr3 =[NSNumber numberWithFloat:r3];
    NSNumber *rr4 =[NSNumber numberWithFloat:r4];
    
    NSNumber *gg1 =[NSNumber numberWithFloat:g1];
    NSNumber *gg2 =[NSNumber numberWithFloat:g2];
    NSNumber *gg3 =[NSNumber numberWithFloat:g3];
    NSNumber *gg4 =[NSNumber numberWithFloat:g4];
    
    NSNumber *bb1 =[NSNumber numberWithFloat:b1];
    NSNumber *bb2 =[NSNumber numberWithFloat:b2];
    NSNumber *bb3 =[NSNumber numberWithFloat:b3];
    NSNumber *bb4 =[NSNumber numberWithFloat:b4];
    
    NSMutableArray *redcolor =[[NSMutableArray alloc]initWithObjects:rr1,rr2,rr3,rr4,nil];
    NSMutableArray *greencolor =[[NSMutableArray alloc]initWithObjects:gg1,gg2,gg3,gg4,nil];
    NSMutableArray *bluecolor =[[NSMutableArray alloc]initWithObjects:bb1,bb2,bb3,bb4, nil];
    
    NSArray * names =@[@"森林小院",@"空间任意门",@"时间任意门",@"北极熊冷静岛"];
    NSInteger k = 1;
    Mycolor * mycolor =[[Mycolor alloc]initwithred:redcolor[k] green:greencolor[k] blue:bluecolor[k]  name:names[k] k:k];
    return mycolor;
}

+(instancetype)gengxincolor:(NSInteger)k{

    float r1=61/255.0;
    float r2=121/255.0;
    float r3=232/255.0;
    float r4=143/255.0;
    
    float g1=191/255.0;
    float g2=180/255.0;
    float g3=196/255.0;
    float g4=222/255.0;
    

    float b1=150/255.0;
    float b2=240/255.0;
    float b3=100/255.0;
    float b4=248/255.0;
    
    NSNumber *rr1 =[NSNumber numberWithFloat:r1];
    NSNumber *rr2 =[NSNumber numberWithFloat:r2];
    NSNumber *rr3 =[NSNumber numberWithFloat:r3];
    NSNumber *rr4 =[NSNumber numberWithFloat:r4];
    
    NSNumber *gg1 =[NSNumber numberWithFloat:g1];
    NSNumber *gg2 =[NSNumber numberWithFloat:g2];
    NSNumber *gg3 =[NSNumber numberWithFloat:g3];
    NSNumber *gg4 =[NSNumber numberWithFloat:g4];
    
    NSNumber *bb1 =[NSNumber numberWithFloat:b1];
    NSNumber *bb2 =[NSNumber numberWithFloat:b2];
    NSNumber *bb3 =[NSNumber numberWithFloat:b3];
    NSNumber *bb4 =[NSNumber numberWithFloat:b4];
    
    NSMutableArray *redcolor =[[NSMutableArray alloc]initWithObjects:rr1,rr2,rr3,rr4,nil];
    NSMutableArray *greencolor =[[NSMutableArray alloc]initWithObjects:gg1,gg2,gg3,gg4,nil];
    NSMutableArray *bluecolor =[[NSMutableArray alloc]initWithObjects:bb1,bb2,bb3,bb4, nil];
    
    NSArray * names =@[@"森林小院",@"空间任意门",@"时间任意门",@"北极熊冷静岛"];
    Mycolor * mycolor =[[Mycolor alloc]initwithred:redcolor[k] green:greencolor[k] blue:bluecolor[k]  name:names[k] k:k];
    return mycolor;
}

-(instancetype)initwithred:(NSNumber*)red green:(NSNumber*)green blue:(NSNumber*)blue name:(NSString *)name k:(NSInteger)k{
    if(self)
    {
        _redcolor=red;
        _greecolor=green;
        _bluecolor=blue;
        _name=name;
        _k=k;
    }
    return self;
}
@end
