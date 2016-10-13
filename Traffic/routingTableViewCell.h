//
//  routingTableViewCell.h
//  Traffic
//
//  Created by WeiKang on 2016/10/13.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface routingTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *routingImage;
@property (strong, nonatomic) IBOutlet UILabel *routingTime;
@property (strong, nonatomic) IBOutlet UILabel *routingNum;

@end
