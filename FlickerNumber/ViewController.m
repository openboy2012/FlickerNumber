//
//  ViewController.m
//  FlickerNumber
//
//  Created by Diaoshu on 15-2-1.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSMutableArray *dataList;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if(!dataList)
        dataList = [[NSMutableArray alloc] init];
    [dataList addObject:@"Flicker A Integer Number"];
    [dataList addObject:@"Flicker A Float Number"];
    [dataList addObject:@"Flicker A Format Number"];
    [dataList addObject:@"Flicker A Attribute Number"];
    [dataList addObject:@"Flicker Number All"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [[segue destinationViewController] setTitle:sender];
}

#pragma mark - UITableView DataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FlickerNumberCell"];
    cell.textLabel.text = dataList[indexPath.row];
    return cell;
}

#pragma mark - UITableView Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"DetailSegue" sender:dataList[indexPath.row]];
}

@end
