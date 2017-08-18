//
//  SWQHotViewController.m
//  inke
//
//  Created by 沈王强 on 2017/8/14.
//  Copyright © 2017年 沈王强. All rights reserved.
//

#import "SWQHotViewController.h"
#import "SWQLiveHandler.h"
#import "SWQLiveCell.h"

static NSString * identifier = @"SWQLiveCell";

@interface SWQHotViewController ()

@property (nonatomic ,strong) NSMutableArray * datalist;

@end

@implementation SWQHotViewController

- (NSMutableArray *) datalist{
    if(!_datalist){
        _datalist = [NSMutableArray array];
    }
    return _datalist;
}

-  (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datalist.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SWQLiveCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.live = self.datalist[indexPath.row];
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [self initUI];
    
    [self loadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70+SCREEN_WIDTH;
}

-(void) initUI{
    [self.tableView registerNib:[UINib nibWithNibName:@"SWQLiveCell" bundle:nil] forCellReuseIdentifier:identifier];

}

-(void) loadData{
    [SWQLiveHandler executeGetHotLiveTaskWithPage:0 success:^(id obj) {
        [self.datalist addObjectsFromArray:obj];
        [self.tableView reloadData];
    } failed:^(id obj) {
        NSLog(@"%@",obj);
    }];

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
