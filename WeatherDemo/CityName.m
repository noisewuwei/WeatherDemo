//
//  CityName.m
//  WeatherDemo
//
//  Created by 吴畏 on 2017/1/15.
//  Copyright © 2017年 吴畏. All rights reserved.
//

#import "CityName.h"

@implementation CityName

+(NSDictionary *)citiesWithDic{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"citydict.plist" ofType:nil];
    NSDictionary *cityDic = [NSDictionary dictionaryWithContentsOfFile:path];
    return cityDic;
}


@end
