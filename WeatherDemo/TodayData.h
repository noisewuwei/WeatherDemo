//
//  TodayData.h
//  WeatherDemo
//
//  Created by 吴畏 on 2017/1/15.
//  Copyright © 2017年 吴畏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodayData : NSObject

@property (nonatomic,copy) NSString *curTemp;
@property (nonatomic,copy) NSString *date;
@property (nonatomic,copy) NSString *fengli;
@property (nonatomic,copy) NSString *fengxiang;
@property (nonatomic,copy) NSString *highTemp;
@property (nonatomic,copy) NSString *lowTemp;
@property (nonatomic,copy) NSString *api;
@property (nonatomic,copy) NSString *pm;
@property (nonatomic,copy) NSString *week;
@property (nonatomic,copy) NSString *type;
@property (nonatomic,copy) NSString *time;

-(instancetype)initWithDic:(NSDictionary *)dic;
+(instancetype)initWithDic:(NSDictionary *)dic;
@end
