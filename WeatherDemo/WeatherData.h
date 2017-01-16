//
//  WeatherData.h
//  WeatherDemo
//
//  Created by 吴畏 on 2017/1/15.
//  Copyright © 2017年 吴畏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TodayData.h"
#import "Forecast.h"

@interface WeatherData : NSObject

@property (nonatomic,copy) NSString *cityName;
@property (nonatomic,strong) TodayData *today;
@property (nonatomic,strong) Forecast *forecast;

-(instancetype)initWithDic:(NSDictionary *)dic;

@end
