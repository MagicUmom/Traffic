//
//  RoutingPlanViewController.h
//  Traffic
//
//  Created by MCLAB on 2016/10/13.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "routingTableViewCell.h"

@interface RoutingPlanViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
- (IBAction)btn_goBack:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *routingTableView;
- (IBAction)btn_routing_goN:(id)sender;
- (IBAction)btn_routing_goS:(id)sender;

@property (strong, nonatomic) NSMutableArray *myArr_N;
@property (strong, nonatomic) NSMutableArray *myArr_S;

@end
