//
//  MCAlertView.m
//  MCAlertView
//
//  Created by mac on 2018/11/20.
//  Copyright © 2018 MCDev. All rights reserved.
//

#import "MCAlertView.h"

#define delayInseconds 4.0f

@interface MCAlertView ()

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UIView *backGroundView;

@end

@implementation MCAlertView

+ (instancetype)initAlertViewithText:(NSString *)text{
    MCAlertView *alertView = [[MCAlertView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) WithText:text];
    
    alertView.backColor = [UIColor lightGrayColor];
    
    [[UIApplication sharedApplication].keyWindow addSubview:alertView];
    
    NSLog(@"%@",[UIApplication sharedApplication].keyWindow);
    
    return alertView;
    
}


- (instancetype)initWithFrame:(CGRect)frame WithText:(NSString *)text{
    if (self = [super initWithFrame:frame]) {
        [self loadSetSubViewWithText:text];
    }
    return self;
}


- (void)loadSetSubViewWithText:(NSString *)text{
    
    [self titleLabel];
    
    [self backGroundView];
    
    CGRect nameRect = [self getSizeWithStr:text];
    
    self.titleLabel.text = text;
    
    _backGroundView.frame = CGRectMake(0, 0, CGRectGetWidth(nameRect) + 20, CGRectGetHeight(nameRect) + 20);
    
    _backGroundView.center = CGPointMake(UIScreen.mainScreen.bounds.size.width / 2, UIScreen.mainScreen.bounds.size.height / 2);
    
    [self addSubview:_backGroundView];
    
    _titleLabel.frame = CGRectMake(0, 0, _backGroundView.bounds.size.width, _backGroundView.bounds.size.height);
    
    [_backGroundView addSubview:_titleLabel];

    _backGroundView.layer.cornerRadius = 5;
    
    [self showBackgrouldsubLayer];
    
    
    //GCD
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInseconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       // [MCAlertView hideWithView];
    });
    
    
}

- (void)setText:(NSString *)text{
    _text = text;
  //  _titleLabel.text = text;
}

- (void)setBackColor:(UIColor *)backColor{
    _backColor = backColor;
    
    _backGroundView.backgroundColor = backColor;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"我没有看到字体的颜色";
        _titleLabel.font = [UIFont systemFontOfSize:14.0f];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
       // _titleLabel.textColor = [UIColor color];
    }
    return _titleLabel;
}

- (UIView *)backGroundView{
    if (!_backGroundView) {
        _backGroundView = [UIView new];
        _backGroundView.backgroundColor = [UIColor redColor];
    }
    return _backGroundView;
}

-(CGRect )getSizeWithStr:(NSString *)str
{
    UIFont *font = [UIFont boldSystemFontOfSize:14.0];
    return [str boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil] context:nil];
}

- (void)showBackgrouldsubLayer
{
    CALayer *addSubLayer = [CALayer layer];
    
    addSubLayer.frame = self.backGroundView.frame;
    
    addSubLayer.cornerRadius = 5;
    
    addSubLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    
    addSubLayer.masksToBounds = false;
    
    addSubLayer.name = @"backgrouldsubLayer";
   
    addSubLayer.shadowColor = [UIColor lightGrayColor].CGColor;
    
    addSubLayer.shadowOffset = CGSizeMake(0.5,1);
    
    addSubLayer.shadowOpacity = 0.6;
    
    addSubLayer.shadowRadius = 3;
    
    [self.layer insertSublayer:addSubLayer below:self.backGroundView.layer];
}


+ (void)hideWithView{
    NSArray *subViews = [UIApplication sharedApplication].keyWindow.subviews;
    for (UIView *subView in subViews) {
        if ([subView isKindOfClass:[MCAlertView class]]) {
            [subView removeFromSuperview];
        }
    }
}

@end
