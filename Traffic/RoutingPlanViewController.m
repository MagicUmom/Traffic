//
//  RoutingPlanViewController.m
//  Traffic
//
//  Created by MCLAB on 2016/10/13.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import "RoutingPlanViewController.h"

@interface RoutingPlanViewController ()
{
    bool is_N ;
}

@end

@implementation RoutingPlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    is_N = YES;

    [self.routingTableView registerNib:[UINib nibWithNibName:@"routingTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyCellIdentifier"];
    [_routingTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _routingTableView.allowsSelection=NO;
    _routingTableView.delegate=self;
    _routingTableView.dataSource=self;

    
    NSError *error;
    NSString *url_string = [NSString stringWithFormat: @"http://210.65.139.94/api/getTravelTime.php"];
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
    NSMutableArray *jsonArr = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    _myArr_N = jsonArr;
    
    NSString *url_string2 = [NSString stringWithFormat: @"http://210.65.139.94/api/getTravelTime2.php"];
    NSData *data2 = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string2]];
    NSMutableArray *jsonArr2 = [NSJSONSerialization JSONObjectWithData:data2 options:kNilOptions error:&error];
    _myArr_S = jsonArr2;
    
    _tempArr = [[NSMutableArray alloc ]initWithObjects:@"47",@"50",@"51",@"60",@"63",@"68",@"69",@"73",@"80",@"88", nil];
    
    
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


- (IBAction)btn_routing_goN:(id)sender
{
    is_N = YES;
    [_routingTableView reloadData];
}

- (IBAction)btn_routing_goS:(id)sender
{
    is_N = NO;
    [_routingTableView reloadData];
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
    if(is_N)
        return 10;
    else
        return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return [tableView fd_heightForCellWithIdentifier:@"MyCellIdentifier" configuration:^(id cell){}];
    return 100; // 可在 XIB 檔案，點選 My Talbe View Cell 從 Size inspector 得知
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    routingTableViewCell *cell = (routingTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"MyCellIdentifier"];
    cell.routingNum.text = [NSString stringWithFormat:@"%d",(int)indexPath.row+1];
    cell.routingTime.text = [NSString stringWithFormat:@"旅行時間:%@分鐘",[_tempArr objectAtIndex:(int)indexPath.row]] ;
    if(is_N)
    {
        [cell.routingImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d_N",(int)indexPath.row+1]]];
    }
    else
    {
        if ((int)indexPath.row == 1) {
            [cell.routingImage setImage:[UIImage imageNamed:@"1_S"]];
        }else
            [cell.routingImage setImage:[UIImage imageNamed:@"5_S"]];
    }
    return cell;
}


@end
