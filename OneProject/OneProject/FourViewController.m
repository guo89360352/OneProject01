//
//  FourViewController.m
//  OneProject
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 苹果IOS. All rights reserved.
//

#import "FourViewController.h"
#import "MainTableViewCell.h"
#import "Model.h"
@interface FourViewController ()
@property(nonatomic,retain)UITableView *tableView;
@property(nonatomic,retain)NSMutableArray *titleArray;
@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.separatorColor = [UIColor brownColor];
    self.tableView.backgroundColor = [UIColor cyanColor];
    self.tableView.rowHeight = 80;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    [self configTableData];

    
}
//解析plist文件中的数据
- (void)configTableData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Property List" ofType:@".plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSDictionary *di = dic[@"root"];
    NSArray *array = di[@"list"];
    self.titleArray = [NSMutableArray new];
    for (NSDictionary *dic in array) {
        Model *model = [[Model alloc]initWithDictionary:dic];
    [self.titleArray addObject:model];
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cy";
    MainTableViewCell *cell= [self.tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MainTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.model = self.titleArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://api.milltary.app887.com/article.html?id=133835269"]]) {
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://api.milltary.app887.com/article.html?id=133835269"]];
    }
    else{
        NSLog(@"jkdfgh");
    }
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
