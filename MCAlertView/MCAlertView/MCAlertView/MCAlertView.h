//
//  MCAlertView.h
//  MCAlertView
//
//  Created by mac on 2018/11/20.
//  Copyright © 2018 MCDev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MCAlertView : UIView

@property (nonatomic, strong) NSString *text;

@property (nonatomic, strong) UIColor *backColor;

+ (instancetype)initAlertViewithText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
