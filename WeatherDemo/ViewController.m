//
//  ViewController.m
//  WeatherDemo
//
//  Created by 吴畏 on 2017/1/15.
//  Copyright © 2017年 吴畏. All rights reserved.
//

#import "ViewController.h"
#import "GetCityWeather.h"
#import "WeatherData.h"
#import "Define.h"
#import "WeatherView.h"
#import "CityViewController.h"

@interface ViewController ()<GetCityWeatherDelegate>

@property(nonatomic,strong) UIView *firstView;
@property(nonatomic,strong) UIView *secondView;
@property(nonatomic,strong) UILabel *temLabel;
@property(nonatomic,strong) UILabel *rangeLabel;
@property(nonatomic,strong) UIImageView *bigImg;
@property(nonatomic,strong) UILabel *cityLabel;
@property(nonatomic,strong) UILabel *dateLabel;
@property(nonatomic,strong) UIView *ScorllContentView;
@property(nonatomic,strong) UIScrollView *ScrollView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    if (_cityName) {
        GetCityWeather *weather = [[GetCityWeather alloc]initWithCityName:self.cityName];
        weather.delegate = self;
    }else{
        [self setAlertView];
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)setUI{
    
    [self createRightTitle:@"城市" titleColor:TxtColor];
    
    self.title = @"Weather";
    
    _firstView = [[UIView alloc]initWithFrame:CGRectMake(0, zNavigationHeight, zScreenWidth, (zScreenHeight-zNavigationHeight)*0.5)];
    _firstView.backgroundColor = MainColor;
    [self.view addSubview:_firstView];
    
    _secondView = [[UIView alloc]initWithFrame:CGRectMake(0, (zScreenHeight-zNavigationHeight)*0.5+zNavigationHeight, zScreenWidth, (zScreenHeight-zNavigationHeight)*0.5)];
    _secondView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_secondView];
    
    _temLabel = [[UILabel alloc]initWithFrame:CGRectMake(zScreenWidth/2-50, 20, 100, 50)];
    _temLabel.textColor = TxtColor;
    _temLabel.font = [UIFont systemFontOfSize:35];
    _temLabel.textAlignment = NSTextAlignmentCenter;
    [_firstView addSubview:_temLabel];
    _temLabel.text = @"温度";
    
    _rangeLabel = [[UILabel alloc]initWithFrame:CGRectMake(zScreenWidth/2-50, 50+20, 100, 25)];
    _rangeLabel.textColor = TxtColor;
    _rangeLabel.font = [UIFont systemFontOfSize:15];
    _rangeLabel.textAlignment = NSTextAlignmentCenter;
    [_firstView addSubview:_rangeLabel];
    _rangeLabel.text = @"温度范围";
    
    _bigImg = [[UIImageView alloc]initWithFrame:CGRectMake(zScreenWidth/2-60, _firstView.bounds.size.height-140, 120, 120)];
    _bigImg.contentMode = UIViewContentModeScaleAspectFit;
    [_firstView addSubview:_bigImg];
    
    _cityLabel = [[UILabel alloc]initWithFrame:CGRectMake(zScreenWidth/2-50, 20, 100, 25)];
    _cityLabel.textColor = [UIColor blackColor];
    _cityLabel.font = [UIFont systemFontOfSize:20];
    _cityLabel.textAlignment = NSTextAlignmentCenter;
    [_secondView addSubview:_cityLabel];
    _cityLabel.text = @"城市";
    
    _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(zScreenWidth/2-100, 20+25, 200, 25)];
    _dateLabel.textColor = [UIColor blackColor];
    _dateLabel.font = [UIFont systemFontOfSize:15];
    _dateLabel.textAlignment = NSTextAlignmentCenter;
    [_secondView addSubview:_dateLabel];
     _dateLabel.text = @"日期";
    
    
    
    _ScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, _secondView.bounds.size.height-150, zScreenWidth*2-30, 150)];
    _ScrollView.contentSize = CGSizeMake(zScreenWidth*3-50, 150);
    _ScrollView.scrollEnabled = YES;
    [_secondView addSubview:_ScrollView];
    
    _ScorllContentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, zScreenWidth*2, 150)];
    [_ScrollView addSubview:_ScorllContentView];
}

- (void)setAlertView{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提醒" message:@"请先选择城市" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        CityViewController *cityVC = [[CityViewController alloc]init];
        [self.navigationController pushViewController:cityVC animated:YES];
    }]];
    
    [self presentViewController:alertVC animated:YES completion:nil];
    
}

//给子控件赋值
-(void)setSubviewsUIwithWeatherData:(WeatherData *)weatherData{
    //调用主线程更新UI
    dispatch_async(dispatch_get_main_queue(), ^{
        _cityLabel.text = weatherData.cityName;
        _temLabel.text = weatherData.today.curTemp;
        _rangeLabel.text = [NSString stringWithFormat:@"%@ ~ %@",weatherData.today.lowTemp,weatherData.today.highTemp];
        self.dateLabel.text = [NSString stringWithFormat:@"%@ %@",weatherData.today.time,weatherData.today.week];

        [self getWeatherTypeWithWeatherType:weatherData.today.type];
        
        //创建scrollView的子控件
        for (int i = 0; i < 6; i++) {
            CGFloat margin = 30;
            CGFloat W = (zScreenWidth - 4 * margin) / 3;
            CGFloat H = 150;
            CGFloat X = margin * (i + 1) + W * i;
            CGFloat Y = 0;
            CGRect frames = CGRectMake(X, Y, W, H);
            //创建scrollView里的自定义view
            WeatherView *subview = [[WeatherView alloc]initWithFrame:frames];
            //获取数据模型
            subview.forecastArr = [weatherData.forecast.forecastArrs objectAtIndex:i];
            [_ScorllContentView addSubview:subview];
            
        }
        
        
    });
}


-(void)getWeatherTypeWithWeatherType:(NSString *)type{
    NSLog(@"type - %@",type);
    if ([type isEqualToString:@"晴"]) {
        self.bigImg.image = [UIImage imageNamed:@"sun1"];
    }else if ([type isEqualToString:@"多云"]){
        self.bigImg.image = [UIImage imageNamed:@"cloud1"];
    }else if ([type rangeOfString:@"雨"].length > 0){
        if ([type isEqualToString:@"小雨"]) {
            self.bigImg.image = [UIImage imageNamed:@"rain1"];
        }else{
            self.bigImg.image = [UIImage imageNamed:@"heavyrain1"];
        }
    }else if ([type rangeOfString:@"雪"].length > 0){
        self.bigImg.image = [UIImage imageNamed:@"snow1"];
    }
}
#pragma mark - GetCityWeather的代理方法

//获取数据成功后调用
-(void)setDataWithWeatherData:(WeatherData *)weatherData{
    //给子控件赋值
    [self setSubviewsUIwithWeatherData:weatherData];
    
}

//获取数据失败调用
-(void)getCityWeatherError{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"获取数据失败" message:@"请稍后再试" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [self presentViewController:alertVC animated:YES completion:nil];

}

//导航栏按钮
-(void)showRight:(UIButton *)sender{
    CityViewController *cityVC = [[CityViewController alloc]init];
    [self.navigationController pushViewController:cityVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
