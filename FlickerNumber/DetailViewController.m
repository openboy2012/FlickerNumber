//
//  DetailViewController.m
//  FlickerNumber
//
//  Created by Diaoshu on 15-2-1.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import "DetailViewController.h"
#import "UILabel+FlickerNumber.h"

@interface DetailViewController ()

@property (nonatomic, weak) IBOutlet UILabel *lblFlicker;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if([self.title isEqualToString:@"Flicker A Integer Number"]){
        [self.lblFlicker dd_setNumber:@(7654321)];
    }else if([self.title isEqualToString:@"Flicker A Float Number"]){
        [self.lblFlicker dd_setNumber:@(123.982)];
    }else if([self.title isEqualToString:@"Flicker A Format Number"]){
        [self.lblFlicker dd_setNumber:@(75.212) format:@"￥%.2f"];
    }else if([self.title isEqualToString:@"Flicker A Attribute Number"]){
        id attributes = [NSDictionary dictionaryWithAttribute:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}
                                                     andRange:NSMakeRange(0, 1)];
        [self.lblFlicker dd_setNumber:@(123.45) attributes:attributes];
    }else{
        id attributes = @[[NSDictionary dictionaryWithAttribute:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}
                                                       andRange:NSMakeRange(0, 1)],
                          [NSDictionary dictionaryWithAttribute:@{NSForegroundColorAttributeName:[UIColor redColor]}
                                                       andRange:NSMakeRange(1, 3)]];
        [self.lblFlicker dd_setNumber:@(123.45) duration:1.0f format:@"￥%.2f" attributes:attributes];
    }
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
