//
//  TwoViewController.m
//  OneProject
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 苹果IOS. All rights reserved.
//

#import "TwoViewController.h"
#import "TwoTableViewCell.h"
#import "Model.h"
@interface TwoViewController ()

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *allArray;
@property (nonatomic, retain) NSMutableArray *urlArray;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView.separatorColor = [UIColor blackColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 88.0;
    
    [self.view addSubview:self.tableView];
    [self configTableData];
}
- (void)configTableData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Property List" ofType:@".plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSDictionary *dic1 = dic[@"root"];
    NSArray *array = dic1[@"list"];
    self.allArray = [NSMutableArray new];
    self.urlArray = [NSMutableArray new];
    for (NSDictionary *dic1 in array) {
        Model *modal = [[Model alloc] initWithDictionary:dic1];
        [self.urlArray addObject:dic1[@"url"]];
        [self.allArray addObject:modal];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.allArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifier = @"cell";
    TwoTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[TwoTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIndentifier];
    }
    Model *model = self.allArray[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.model = model;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ( [[UIApplication sharedApplication]openURL:[NSURL URLWithString:self.urlArray[indexPath.row]]]) {
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:self.urlArray[indexPath.row]]];
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
