//
//  Forecast.h
//  WeatherDemo
//
//  Created by 吴畏 on 2017/1/15.
//  Copyright © 2017年 吴畏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Forecast : NSObject

@property (nonatomic,strong) NSMutableArray *forecastArrs;

-(instancetype)initWithArray:(NSArray *)array;
+(instancetype)initWithArray:(NSArray *)array;

@end
