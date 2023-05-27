//
//  ViewController.m
//  EETipView
//
//  Created by forthonliu(刘赋山) on 2020/5/26.
//  Copyright © 2020 forthonliu(刘赋山). All rights reserved.
//

#import "ViewController.h"
#import "EETipView.h"
#import "EETipArrowView.h"




@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    EETipArrowView *arrowView = [[EETipArrowView alloc] initWithColor:UIColor.orangeColor type:EETipArrowTypeUp];
    arrowView.backgroundColor = [UIColor redColor];
    arrowView.frame = CGRectMake(100, 100, 50, 50);
    
    [self.view addSubview:arrowView];

}


@end
