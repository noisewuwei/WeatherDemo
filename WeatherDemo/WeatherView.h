//
//  WeatherView.h
//  WeatherDemo
//
//  Created by 吴畏 on 2017/1/15.
//  Copyright © 2017年 吴畏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherView : UIView

@property (nonatomic,strong) UILabel *dateLabel;
@property (nonatomic,strong) UIImageView *WeatherPic;
@property (nonatomic,strong) UILabel *tmpLabel;

@property (nonatomic,strong) NSArray *forecastArr;

-(instancetype)initWithFrame:(CGRect)frame;

@end
