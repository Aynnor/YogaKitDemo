//
//  JumpViewController.m
//  YogaKitDemo
//
//  Created by liuzhibin on 2020/4/5.
//  Copyright © 2020 liuzhibin. All rights reserved.
//

#import "JumpViewController.h"
//Container Porperty
#import "FlexDirectionVC.h"
#import "JustifyContentVC.h"
#import "AlignItemsVC.h"
#import "AlignContentVC.h"
#import "PositionVC.h"

@interface JumpViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation JumpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.yellowColor;
    self.title = @"Main";
    [self.navigationController.navigationBar setHidden:YES];
    
    
    [self createUI];
}



-(void)createUI {
    
    NSArray *dataArray = @[@[@"FlexDirection",@"JustifyContent"],];
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    tableView.tableFooterView = [UIView new];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"CellID"];
    
    [self.view addSubview:tableView];
}


#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@" %zd", indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = nil;
    
    if (indexPath.section == 0) { //Container属性
        switch (indexPath.row) {
            case 0:{
                vc = [FlexDirectionVC new];
            }   break;
            case 1:{
                vc = [JustifyContentVC new];
            }   break;
            case 2:{
                vc = [AlignItemsVC new];
            }   break;
            case 3:{
                vc = [AlignContentVC new];
            }   break;
            case 4:{
                vc = [PositionVC new];
            }
            default:
                break;
        }
    }else{ //item 属性
        
        
    }
    
    
    
    [self.navigationController pushViewController:vc animated:YES];
}


@end
