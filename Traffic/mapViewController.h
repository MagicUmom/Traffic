//
//  mapViewController.h
//  Traffic
//
//  Created by MCLAB on 2016/10/12.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mapViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *UIView_forMap;
- (IBAction)btn_back:(id)sender;
- (IBAction)btn_goSouth:(id)sender;

@property (strong, nonatomic) NSMutableArray *myArr_N;
@property (strong, nonatomic) NSMutableArray *myArr_S;
@property (strong, nonatomic) NSMutableDictionary *myDic_N;
@property (strong, nonatomic) NSMutableDictionary *myDic_S;


- (IBAction)btn_goNorth:(id)sender;
-(void) updateColor:(BOOL) goNorth;

@end
