//
//  publishCell.h
//  Traffic
//
//  Created by MCLAB on 2016/10/14.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface publishCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *label_depart;
@property (strong, nonatomic) IBOutlet UILabel *label_arrive;
@property (strong, nonatomic) IBOutlet UIImageView *image_arrow;

@end
