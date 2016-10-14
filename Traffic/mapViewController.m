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
    BOOL loadFromAPI ;
}
@end

@implementation mapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    i = 0;

    
    NSError *error;
    NSString *url_string = [NSString stringWithFormat: @"http://210.65.139.94/api/getTravelTime.php"];
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
    NSMutableArray *jsonArr = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    _myArr_N = jsonArr;
    
    NSString *url_string2 = [NSString stringWithFormat: @"http://210.65.139.94/api/getTravelTime2.php"];
    NSData *data2 = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string2]];
    NSMutableArray *jsonArr2 = [NSJSONSerialization JSONObjectWithData:data2 options:kNilOptions error:&error];
    _myArr_S = jsonArr2;

    loadFromAPI = YES;
    [self updateColor:YES];

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


- (IBAction)btn_back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btn_goSouth:(id)sender
{
    [self updateColor:NO];

}

- (IBAction)btn_goNorth:(id)sender
{
    [self updateColor:YES];

}

- (void) updateColor : (BOOL) goNorth
{

    if(loadFromAPI)
    {
        NSLog(@"loadFromAPI");
        if(goNorth)
        {
            for (NSMutableDictionary *tempArr in _myArr_N)
            {
                int roadNum = [[tempArr objectForKey:@"RoadNo"]intValue ];
                int speed = [[tempArr objectForKey:@"Speed"] intValue];
                UIImageView *tmpImage = (UIImageView *)[self.UIView_forMap viewWithTag:300 +roadNum];
                
                int flag=0;
                if(speed<40)    flag =3;
                else if (speed <60) flag =2;
                else if (speed <80) flag =1;
                else flag =0;
                
                switch (flag)
                {
                    case 0:
                        [tmpImage setImage:[UIImage imageNamed:[NSString stringWithFormat: @"%d-G.png",roadNum]]];
                        break;
                    case 1:
                        [tmpImage setImage:[UIImage imageNamed:[NSString stringWithFormat: @"%d-O.png",roadNum]]];
                        break;
                        
                    case 2:
                        [tmpImage setImage:[UIImage imageNamed:[NSString stringWithFormat: @"%d-Y.png",roadNum]]];
                        break;
                        
                    case 3:
                        [tmpImage setImage:[UIImage imageNamed:[NSString stringWithFormat: @"%d-R.png",roadNum]]];
                        break;
                        
                        
                    default:
                        break;
                }
            }
                

        }
        else
        {

            for (NSMutableDictionary *tempArr in _myArr_S)
            {

                int roadNum = [[tempArr objectForKey:@"RoadNo"]intValue ];
                int speed = [[tempArr objectForKey:@"Speed"] intValue];
                UIImageView *tmpImage = (UIImageView *)[self.UIView_forMap viewWithTag:300 +roadNum];
                
                
                int flag=0;
                if(speed<40)    flag =3;
                else if (speed <60) flag =2;
                else if (speed <80) flag =1;
                else flag =0;
                
                switch (flag)
                {
                    case 0:
                        [tmpImage setImage:[UIImage imageNamed:[NSString stringWithFormat: @"%d-G.png",roadNum]]];
                        break;
                    case 1:
                        [tmpImage setImage:[UIImage imageNamed:[NSString stringWithFormat: @"%d-O.png",roadNum]]];
                        break;
                        
                    case 2:
                        [tmpImage setImage:[UIImage imageNamed:[NSString stringWithFormat: @"%d-Y.png",roadNum]]];
                        break;
                        
                    case 3:
                        [tmpImage setImage:[UIImage imageNamed:[NSString stringWithFormat: @"%d-R.png",roadNum]]];
                        break;
                        
                        
                    default:
                        break;
                }
            }
                
        }

    }
    else
    {
        int j;
        for (j=1; j<30 ; j++)
        {
            UIImageView *tmpImage = (UIImageView *)[self.UIView_forMap viewWithTag:300 +j];
            switch ((int)arc4random()%4)
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
        
    }
}
@end
