//
//  SelectBallController.m
//  BallGame
//
//  Created by 武淅 段 on 16/5/25.
//  Copyright © 2016年 武淅 段. All rights reserved.
//

#import "SelectBallController.h"

@interface SelectBallController ()


@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *redBalls;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *blueBalls;

@end

@implementation SelectBallController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for(int i = 0; i< _redBalls.count;i++){
        UIButton *button = _redBalls[i];
        button.tag = i+1;
        [button setTitle:[NSString stringWithFormat:@"%.2d", i+1] forState:UIControlStateNormal];
    }
    
    for(int i = 0; i< _blueBalls.count;i++){
        UIButton *button = _blueBalls[i];
        button.tag = i+100;
        [button setTitle:[NSString stringWithFormat:@"%.2d", i+1] forState:UIControlStateNormal];
    }
}


- (IBAction)tapDone:(id)sender {
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
