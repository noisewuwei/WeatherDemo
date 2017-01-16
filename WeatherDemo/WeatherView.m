//
//  WeatherView.m
//  WeatherDemo
//
//  Created by 吴畏 on 2017/1/15.
//  Copyright © 2017年 吴畏. All rights reserved.
//

#import "WeatherView.h"
#import "Define.h"

@interface WeatherView()

@end

@implementation WeatherView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self setUI];
    return self;
}

-(void)setUI{
    //日期Label
    _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 25)];
    _dateLabel.font = [UIFont systemFontOfSize:15];
    _dateLabel.textAlignment = NSTextAlignmentCenter;
    _dateLabel.textColor = [UIColor blackColor];
    _dateLabel.text = @"明天";
    [self addSubview:_dateLabel];
    
    
    //天气icon
    _WeatherPic = [[UIImageView alloc]initWithFrame:CGRectMake(0, 25, self.bounds.size.width, self.bounds.size.width)];
    //图片自适应
    _WeatherPic.contentMode = UIViewContentModeScaleAspectFit;
    _WeatherPic.image = [UIImage imageNamed:@"sun1"];
    [self addSubview:_WeatherPic];
    
    //温度Label
    _tmpLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 25+self.bounds.size.width, self.bounds.size.width, 25)];
    _tmpLabel.textAlignment = NSTextAlignmentCenter;
    _tmpLabel.font = [UIFont systemFontOfSize:15];
    _tmpLabel.textColor = [UIColor blackColor];
    _tmpLabel.text = @"25";
    [self addSubview:_tmpLabel];
}

-(void)setForecastArr:(NSArray *)forecastArr{
    if (forecastArr != _forecastArr) {
        _forecastArr = forecastArr;
    }
    //给子控件赋值
    self.dateLabel.text = [forecastArr objectAtIndex:1];
    NSString *low = [forecastArr objectAtIndex:3];
    NSString *high = [forecastArr objectAtIndex:2];
    self.tmpLabel.text = [NSString stringWithFormat:@"%@~%@",low,high];
    [self getWeatherTypeWith:[forecastArr objectAtIndex:4]];
}

-(void)getWeatherTypeWith:(NSString *)type{
    if ([type isEqualToString:@"晴"]) {
        self.WeatherPic.image = [UIImage imageNamed:@"sun1"];
    }else if ([type isEqualToString:@"多云"]){
        self.WeatherPic.image = [UIImage imageNamed:@"cloud1"];
    }else if ([type rangeOfString:@"雨"].length > 0){
        if ([type isEqualToString:@"小雨"]) {
            self.WeatherPic.image = [UIImage imageNamed:@"rain1"];
        }else{
            self.WeatherPic.image = [UIImage imageNamed:@"heavyrain1"];
        }
    }else if ([type rangeOfString:@"雪"].length > 0){
        self.WeatherPic.image = [UIImage imageNamed:@"snow1"];
    }
}


@end

