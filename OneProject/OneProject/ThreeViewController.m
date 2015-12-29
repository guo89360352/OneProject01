//
//  ThreeViewController.m
//  OneProject
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 苹果IOS. All rights reserved.
//

#import "ThreeViewController.h"
#import "Model.h"
#import "MainTableViewCell.h"

@interface ThreeViewController ()
@property(nonatomic,retain) UITableView *tableView;
@property(nonatomic,retain) NSMutableArray *allArray;

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor orangeColor];
    self.tableView.separatorColor = [UIColor blackColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    [self configTableData];
    
}
-(void)configTableData{

    NSString *path = [[NSBundle mainBundle] pathForResource:@"Property List" ofType:@".plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSDictionary *dic1 = dic[@"root"];
    NSArray *array = dic1[@"list"];
    self.allArray = [NSMutableArray new];
    for (NSDictionary *dic2 in array) {
        Model *model = [[Model alloc] initWithDictionary:dic2];
        [self.allArray addObject:model];
    }



}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.allArray.count;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellIdent = @"uuu";
    MainTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdent];
    if (cell==nil) {
        cell = [[MainTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdent];
    }
    Model *model = self.allArray[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.model = model;
    return cell;


}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //取得对应行显示所得的model
    
    Model *mangomodel = self.allArray[indexPath.row];
    //通过每一行cell显示model的数据来获取cell高度
    CGFloat cellHeight = [MainTableViewCell getCellHeightWithModel:mangomodel];
    //获取cell高度后返回给tableview
    return cellHeight;
    
    
    
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
