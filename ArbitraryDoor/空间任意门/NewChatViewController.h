//
//  NewChatViewController.h
//  ArbitraryDoor
//
//  Created by 吕泓钊 on 2020/9/17.
//  Copyright © 2020 Chutiiing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewChatViewController : UIViewController

@property UITextView *textView;
@property UITableView *tableView;
@property (nonatomic) NSNumber *rowHeight;
@property NSMutableArray *rowHeightArr;
@property (nonatomic) UIButton *b1;
@property (nonatomic) UIButton *b2;
@property (nonatomic) UIButton *b3;
@property (nonatomic) UIView *background;

@property NSMutableArray *messageArr;
@property NSMutableArray *left_messageArr;
@property NSMutableArray *right_messageArr;

-(void)recieveleft_Message:(NSString*)leftmessage;
@end

NS_ASSUME_NONNULL_END
