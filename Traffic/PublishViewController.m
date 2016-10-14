//
//  PublishViewController.m
//  Traffic
//
//  Created by MCLAB on 2016/10/14.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import "PublishViewController.h"

@interface PublishViewController ()
{
    bool N_S ;
    NSString *Hour;
    NSString *Min;
}

@end

@implementation PublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.publishTable registerNib:[UINib nibWithNibName:@"publishCell" bundle:nil] forCellReuseIdentifier:@"MyCellIdentifier"];
    [_publishTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _publishTable.allowsSelection = NO;
    _publishTable.delegate = self;
    _publishTable.dataSource = self ;
    
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH"];
    Hour = [formatter stringFromDate:date];
    NSLog(@"Hour: %@",Hour);
    [formatter setDateFormat:@"mm"];
    Min = [formatter stringFromDate:date];
    NSLog(@"Hour: %@",Min);

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
#pragma mark - btn delegate

- (IBAction)btn_goBack:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)btn_TPE_LAN:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    if(N_S)
    {
        [btn.imageView setImage:[UIImage imageNamed:@"lan_tpi"]];
    }
    else
    {
        [btn.imageView setImage:[UIImage imageNamed:@"tpi_lan"]];
    }
    NSLog(@"clicked");
    N_S=!N_S;
}


#pragma mark - tableview delegate
/*
 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
 {
 // Return the number of sections.
 return 2;
 }
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 6;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return [tableView fd_heightForCellWithIdentifier:@"MyCellIdentifier" configuration:^(id cell){}];
    return 74; // 可在 XIB 檔案，點選 My Talbe View Cell 從 Size inspector 得知
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    publishCell *cell = (publishCell *)[tableView dequeueReusableCellWithIdentifier:@"MyCellIdentifier"];
    if(indexPath.row <3)
    {
        cell.label_depart.text = [NSString stringWithFormat:@"%@ : %02d",Hour,(unsigned)arc4random()%30];
        cell.label_arrive.text = [NSString stringWithFormat:@"%d : %02d",[Hour intValue]+1,(unsigned)arc4random()%30+29];
    }
    else
    {
        cell.label_depart.text = [NSString stringWithFormat:@"%d : %02d",[Hour intValue]+1,(unsigned)arc4random()%30];
        cell.label_arrive.text = [NSString stringWithFormat:@"%d : %02d",[Hour intValue]+2,(unsigned)arc4random()%30+29];
    }
    return cell;
}

@end
