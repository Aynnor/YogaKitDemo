//
//  JumpViewController.m
//  YogaKitDemo
//
//  Created by liuzhibin on 2020/4/5.
//  Copyright © 2020 liuzhibin. All rights reserved.
//

#import "JumpViewController.h"
//Container Property
#import "FlexDirectionVC.h"
#import "JustifyContentVC.h"
#import "AlignItemsVC.h"
#import "AlignContentVC.h"
#import "PositionVC.h"

//Item Property
#import "GrowVC.h"
#import "ShrinkVC.h"


@interface JumpViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray <NSArray *>*dataArray;///<data

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
    
    _dataArray = @[@[@"FlexDirection",@"JustifyContent",@"AlignItems",@"AlignContent",@"Position"],@[]];
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStyleGrouped)];
    tableView.tableFooterView = [UIView new];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.01, UIApplication.sharedApplication.statusBarFrame.size.height)];
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.01, 0.01)];
    NSLog(@"电池栏高度 -- height = %lf", UIApplication.sharedApplication.statusBarFrame.size.height);
    
    
     //取消ScrollView的在有导航栏的情况下的内缩一小段距离的问题
     if (@available(iOS 11.0, *)) {
         tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
         //按需求调节tableView的contentInset
         tableView.contentInset = UIEdgeInsetsZero;
         //此句为调节右侧的滚动条的
         tableView.scrollIndicatorInsets = tableView.contentInset;
     } else {
         self.automaticallyAdjustsScrollViewInsets = NO;
     }
    //注册cell
    [tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"CellID"];
    
    [self.view addSubview:tableView];
}


#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0 ? _dataArray.firstObject.count : 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    cell.textLabel.textColor = UIColor.blueColor;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@" %zd. --> %@", indexPath.row, _dataArray[0][indexPath.row]];
    }else{
        cell.textLabel.text = [NSString stringWithFormat:@" %zd", indexPath.row];
    }
    
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
        switch (indexPath.row) {
            case 0:{
                vc = [GrowVC new];
            }   break;
            case 1:{
                vc = [ShrinkVC new];
            }   break;
            default:
                break;
        }
    }
    
    
    
    [self.navigationController pushViewController:vc animated:YES];
}


//TableView section HeaderView
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *label = [UILabel new];
    label.textColor = UIColor.blackColor;
    label.font = [UIFont systemFontOfSize:18];
    label.text = section == 0 ? @"  Container Property" : @"  Item Property";
    return label;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 55;
}

//TableView section FooterView
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}



@end
