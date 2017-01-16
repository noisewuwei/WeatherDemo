//
//  WeatherData.m
//  WeatherDemo
//
//  Created by 吴畏 on 2017/1/15.
//  Copyright © 2017年 吴畏. All rights reserved.
//

#import "WeatherData.h"

@implementation WeatherData

-(instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.cityName = dic[@"city"];
        self.today = [TodayData initWithDic:dic[@"today"]];
        NSMutableArray *hArray = [[NSMutableArray alloc]initWithArray:dic[@"history"]];
        NSMutableArray *array = [NSMutableArray arrayWithArray:hArray];
        [array addObjectsFromArray:dic[@"forecast"]];
        self.forecast = [Forecast initWithArray:array];
    }
    return self;
}


@end
