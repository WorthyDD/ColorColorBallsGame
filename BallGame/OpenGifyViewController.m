//
//  OpenGifyViewController.m
//  BallGame
//
//  Created by 武淅 段 on 16/5/25.
//  Copyright © 2016年 武淅 段. All rights reserved.
//

#import "OpenGifyViewController.h"
#import "ConstantManager.h"

@interface OpenGifyViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *redBalls;
@property (weak, nonatomic) IBOutlet UIButton *blueBallButton;

@property (nonatomic) NSMutableArray *finalRedNumbers;
@property (nonatomic, assign) NSInteger finalBlueNumber;
@property (weak, nonatomic) IBOutlet UILabel *myNumberLabel;
@property (nonatomic, assign) NSInteger f;
@end

@implementation OpenGifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableString *str = [NSMutableString stringWithFormat:@""];
    for(NSNumber *num in [ConstantManager shareManager].redBalls){
        
        [str appendString:[NSString stringWithFormat:@"%.2ld  ,", num.integerValue]];
    }
    [str appendString:[NSString stringWithFormat:@"    %.2ld", [ConstantManager shareManager].blueBall]];
    [self.myNumberLabel setText:str];
    
    [self generateNumbers];
    [self showBalls];
}

- (void) generateNumbers
{
    _finalRedNumbers = [NSMutableArray new];
    while (_finalRedNumbers.count<6) {
        NSInteger num = arc4random()%33+1;
        if(![_finalRedNumbers containsObject:@(num)]){
            [_finalRedNumbers addObject:@(num)];
        }
    }
    //sort
    [_finalRedNumbers sortUsingComparator:^NSComparisonResult(NSNumber  *obj1, NSNumber  *obj2) {
        return obj1.integerValue>obj2.integerValue;
    }];
    NSInteger blueNum = arc4random()%16+1;
    _finalBlueNumber = blueNum;
}

- (void) showBalls
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(numChanges:) userInfo:nil repeats:YES];
    [timer fire];
}

- (void) numChanges : (NSTimer *)timer
{
    _f++;
    if(_f>999){
        [timer invalidate];
        timer = nil;
        _f = 0;
    }
    for(UIButton *button in _redBalls){
        NSInteger randN = arc4random()%33+1;
        [button setTitle:[NSString stringWithFormat:@"%.2d", randN] forState:UIControlStateNormal];
    }
    NSInteger randB = arc4random()%33+1;
    [_blueBallButton setTitle: [NSString stringWithFormat:@"%.2d", randB] forState:UIControlStateNormal];
}



@end
