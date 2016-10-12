//
//  mapViewController.m
//  Traffic
//
//  Created by MCLAB on 2016/10/12.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import "mapViewController.h"

@interface mapViewController ()
{
    NSUInteger i;
}
@end

@implementation mapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    i = 0;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btn_action_change:(id)sender
{
    i++;
    int j;
    for (j=1; j<30 ; j++)
    {
        UIImageView *tmpImage = (UIImageView *)[self.UIView_forMap viewWithTag:300 +j];
        
        switch (i%4)
        {
            case 0:
                [tmpImage setImage:[UIImage imageNamed:[NSString stringWithFormat: @"%d-G.png",j]]];
                break;
            case 1:
                [tmpImage setImage:[UIImage imageNamed:[NSString stringWithFormat: @"%d-O.png",j]]];
                break;

            case 2:
                [tmpImage setImage:[UIImage imageNamed:[NSString stringWithFormat: @"%d-Y.png",j]]];
                break;

            case 3:
                [tmpImage setImage:[UIImage imageNamed:[NSString stringWithFormat: @"%d-R.png",j]]];
                break;

            
            default:
                break;
        }
       // NSLog(@"%@",[NSString stringWithFormat: @"%d-G.png",j]);
    }
    
    
    NSLog(@"btn clicked");
}
@end
