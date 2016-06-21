//
//  DetailViewController.m
//  FlickerNumber
//
//  Created by DeJohn Dong on 15-2-1.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import "DetailViewController.h"
#import "UILabel+FlickerNumber.h"

@interface DetailViewController (){
}


@property (nonatomic, weak) IBOutlet UILabel *lblFlicker;
@property (nonatomic, weak) IBOutlet UISwitch *switchOn;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self valueChanged:self.switchOn];
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

- (IBAction)valueChanged:(id)sender{
    if([(UISwitch *)sender isOn]){
        if([self.title isEqualToString:@"Flicker An Integer Number"]){
            [self.lblFlicker fn_setNumber:@(1.00) formatter:nil];
        }else if([self.title isEqualToString:@"Flicker A Float Number"]){
            [self.lblFlicker fn_setNumber:@(123456789.123456) formatter:nil];
        }else if([self.title isEqualToString:@"Flicker A Format Number"]){
            [self.lblFlicker fn_setNumber:@(9123.1234) format:@"￥%@" formatter:nil];
        }else if([self.title isEqualToString:@"Flicker An Attribute Number"]){
            id attributes = [NSDictionary fn_dictionaryWithAttribute:@{NSForegroundColorAttributeName:[UIColor redColor]}
                                                            range:NSMakeRange(0, 1)];
            [self.lblFlicker fn_setNumber:@(1888.88) formatter:nil attributes:attributes];
        }else if([self.title isEqualToString:@"Test Bug 1, fixed"]){
            [self.lblFlicker fn_setNumber:@(25000) format:@"￥%@"];
        }else if([self.title isEqualToString:@"Test Bug 2, fixed"]){
            [self.lblFlicker fn_setNumber:@(25000) format:@"%.3f" attributes:nil];
        }else {
            id attributes = @[[NSDictionary fn_dictionaryWithAttribute:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}
                                                              range:NSMakeRange(0, 1)],
                              [NSDictionary fn_dictionaryWithAttribute:@{NSForegroundColorAttributeName:[UIColor redColor]}
                                                              range:NSMakeRange(1, 3)]];
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            formatter.formatterBehavior = NSNumberFormatterBehavior10_4;
            formatter.numberStyle = NSNumberFormatterDecimalStyle;
            [self.lblFlicker fn_setNumber:@(1234.567) duration:1.0f format:@"￥%@" numberFormatter:formatter attributes:attributes];
        }
    }else{
        if([self.title isEqualToString:@"Flicker An Integer Number"]){
            [self.lblFlicker fn_setNumber:@(1)];
        }else if([self.title isEqualToString:@"Flicker A Float Number"]){
            [self.lblFlicker fn_setNumber:@(987654321.987654)];
        }else if([self.title isEqualToString:@"Flicker A Format Number"]){
            [self.lblFlicker fn_setNumber:@(12345.7231) format:@"￥%d"];
        }else if([self.title isEqualToString:@"Flicker An Attribute Number"]){
            id attributes = [NSDictionary fn_dictionaryWithAttribute:@{NSForegroundColorAttributeName:[UIColor redColor]}
                                                            range:NSMakeRange(0, 1)];
            [self.lblFlicker fn_setNumber:@(1888.88) attributes:attributes];
        }else{
            id attributes = @[[NSDictionary fn_dictionaryWithAttribute:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}
                                                              range:NSMakeRange(0, 1)],
                              [NSDictionary fn_dictionaryWithAttribute:@{NSForegroundColorAttributeName:[UIColor redColor]}
                                                              range:NSMakeRange(1, 3)]];
            [self.lblFlicker fn_setNumber:@(1234.567) duration:-0.1f format:@"￥%.2f" attributes:attributes];
        }
    }
}

@end
