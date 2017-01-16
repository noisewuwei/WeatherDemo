//
//  GetCityWeather.h
//  WeatherDemo
//
//  Created by 吴畏 on 2017/1/15.
//  Copyright © 2017年 吴畏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherData.h"

@protocol GetCityWeatherDelegate <NSObject>

-(void)setDataWithWeatherData:(WeatherData *)weatherData;
-(void)getCityWeatherError;

@end

@interface GetCityWeather : NSObject

@property (nonatomic,weak) id <GetCityWeatherDelegate> delegate;

-(instancetype)initWithCityName:(NSString *)cityName;

@end
