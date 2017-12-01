//
//  ViewController.m
//  GMT
//
//  Created by Saltedfish on 2017/11/27.
//  Copyright © 2017年 物联利浪. All rights reserved.
//

#import "ViewController.h"
#import "NSString+time.h"
#import "NSString+ext.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    NSString *str=@"2017-11-23 06:05:18";//时间
    
    NSString *time = [str ll_getNowDateFromatAnDateWithFormat:@"yyyy-MM-dd HH:mm:ss"];

    NSLog(@"==========%@",time);
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
