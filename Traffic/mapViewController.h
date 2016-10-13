//
//  mapViewController.h
//  Traffic
//
//  Created by MCLAB on 2016/10/12.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mapViewController : UIViewController
- (IBAction)btn_action_change:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *UIView_forMap;
- (IBAction)btn_back:(id)sender;
- (IBAction)btn_goSouth:(id)sender;

- (IBAction)btn_goNorth:(id)sender;
-(void) updateColor;
@end
