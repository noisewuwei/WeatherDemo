//
//  CityViewController.m
//  WeatherDemo
//
//  Created by noise on 2017/1/16.
//  Copyright © 2017年 吴畏. All rights reserved.
//

#import "CityViewController.h"
#import "Define.h"
#import "CityName.h"
#import "ViewController.h"

@interface CityViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSDictionary *citiesDic;
@property (nonatomic,strong) NSMutableArray *keys;

@end

@implementation CityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取城市信息
    [self getCitiesData];
    //Tableview
    [self setUI];
    
    // Do any additional setup after loading the view.
}

- (void)setUI{
    
    self.title = @"选择城市";
    
    [self createBarLeftWithImage:@"nav_return"];
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, zScreenWidth, zScreenHeight)];
    tableview.delegate = self;
    tableview.dataSource = self;

    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableview.backgroundColor = [UIColor whiteColor];
    //索引字体颜色
    tableview.sectionIndexColor = [UIColor blackColor];
    tableview.sectionIndexBackgroundColor = [UIColor grayColor];
    [self.view addSubview:tableview];
}

#pragma mark - 获取城市信息

-(void)getCitiesData{
    //初始化
    _keys = [NSMutableArray array];
    _citiesDic = [CityName citiesWithDic];
    //获取排序后字典里的keys
    NSArray *tmparray = [[_citiesDic allKeys]sortedArrayUsingSelector:@selector(compare:)];
    [_keys addObjectsFromArray:tmparray];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _citiesDic.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *key = [_keys objectAtIndex:section];
    NSArray *citySection = [_citiesDic objectForKey:key];
    return citySection.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [_keys objectAtIndex:section];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return _keys;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuseId = @"reuseId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    cell.backgroundColor = TxtColor;
    cell.textLabel.textColor = MainColor;
    //获取城市数据
    NSArray *citySection = [_citiesDic objectForKey:[_keys objectAtIndex:indexPath.section]];
    NSString *cityName = [citySection objectAtIndex:indexPath.row];
    cell.textLabel.text = cityName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *citySection = [_citiesDic objectForKey:[_keys objectAtIndex:indexPath.section]];
    NSString *cityName = [citySection objectAtIndex:indexPath.row];
    
    ViewController *VC = [[ViewController alloc]init];
    VC.cityName = cityName;
    [self.navigationController pushViewController:VC animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
