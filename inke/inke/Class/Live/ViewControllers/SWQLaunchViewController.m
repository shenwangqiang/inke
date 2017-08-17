//
//  SWQLaunchViewController.m
//  inke
//
//  Created by 沈王强 on 2017/8/16.
//  Copyright © 2017年 沈王强. All rights reserved.
//

#import "SWQLaunchViewController.h"

@interface SWQLaunchViewController ()

@end

@implementation SWQLaunchViewController
- (IBAction)close:(id)sender {
     [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

@end
