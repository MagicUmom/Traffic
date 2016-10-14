//
//  orderViewController.m
//  Traffic
//
//  Created by MCLAB on 2016/10/14.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import "orderViewController.h"

@interface orderViewController ()

@end

@implementation orderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _myWebView.scalesPageToFit = YES;
    NSURL *url = [NSURL URLWithString:@"http://125.227.64.113:8084/tmp/1.html"];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_myWebView loadRequest:requestObj];

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

- (IBAction)btn_goBack:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
