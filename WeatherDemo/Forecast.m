//
//  Forecast.m
//  WeatherDemo
//
//  Created by 吴畏 on 2017/1/15.
//  Copyright © 2017年 吴畏. All rights reserved.
//

#import "Forecast.h"

@interface Forecast()

@property(nonatomic,strong) NSArray *array;

@end

@implementation Forecast

-(NSMutableArray *)forecastArrs{
    if (!_forecastArrs) {
        _forecastArrs = [NSMutableArray array];
    }
    return _forecastArrs;
}

-(instancetype)initWithArray:(NSArray *)array{
    self = [super init];
    if (self) {
        self.array = array;
        [self setAllValue];
    }
    return self;
}

+(instancetype)initWithArray:(NSArray *)array{
    return [[self alloc]initWithArray:array];
}

-(void)setAllValue{
//最近几天的天气
    for (int i=0; i<6; i++) {
        NSMutableArray *arr = [NSMutableArray array];
        [arr addObject:[self.array objectAtIndex:i][@"date"]];
        [arr addObject:[self.array objectAtIndex:i][@"week"]];
        [arr addObject:[self.array objectAtIndex:i][@"hightemp"]];
        [arr addObject:[self.array objectAtIndex:i][@"lowtemp"]];
        [arr addObject:[self.array objectAtIndex:i][@"type"]];
        [self.forecastArrs addObject:arr];
    }

}

@end
