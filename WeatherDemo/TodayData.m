//
//  TodayData.m
//  WeatherDemo
//
//  Created by 吴畏 on 2017/1/15.
//  Copyright © 2017年 吴畏. All rights reserved.
//

#import "TodayData.h"

@implementation TodayData

-(instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        NSString *str = [dic[@"curTemp"] substringWithRange:NSMakeRange(0, [dic[@"curTemp"] length] - 1)];
        str = [str stringByAppendingString:@"°"];
        self.curTemp = str;
        self.date = dic[@"date"];
        self.fengli = dic[@"fengli"];
        self.fengxiang = dic[@"fengxiang"];
        self.highTemp = dic[@"hightemp"];
        self.lowTemp = dic[@"lowtemp"];
        self.pm = dic[@"aqi"];
        self.week = dic[@"week"];
        self.type = dic[@"type"];
        self.time = [self getCurrentTime];

    }
    return self;
}

+(instancetype)initWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

-(NSString *)getCurrentTime{
    NSDate *  senddate=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"MM/dd HH:mm"];
    
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    
    NSLog(@"locationString:%@",locationString);
    
    return locationString;
}



@end
