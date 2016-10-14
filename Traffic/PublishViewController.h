//
//  PublishViewController.h
//  Traffic
//
//  Created by MCLAB on 2016/10/14.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "publishCell.h"
@interface PublishViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

- (IBAction)btn_goBack:(id)sender;
- (IBAction)btn_TPE_LAN:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *publishTable;
@property (weak, nonatomic) IBOutlet UIButton *image_1;

@end
