//
//  OneViewController.m
//  OneProject
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 苹果IOS. All rights reserved.
//

#import "OneViewController.h"
#import "Model.h"
#import "MainTableViewCell.h"
@interface OneViewController ()
@property(nonatomic,retain) UITableView *tableView;
@property(nonatomic,retain) NSMutableArray *nameArray;
@property(nonatomic,retain) NSMutableArray *urlArray;

@end
@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.separatorColor = [UIColor blackColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 80;
    [self.view addSubview:self.tableView];
    [self path];
}
- (void)path{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Property List" ofType:@".plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSDictionary *dit = dic[@"root"];
    NSArray *array = dit[@"list"];
    self.nameArray = [NSMutableArray new];
    self.urlArray = [NSMutableArray new];
    for (NSDictionary *dic1 in array) {
        Model *modal = [[Model alloc] initWithDictionary:dic1];
        [self.urlArray addObject:dic1[@"url"]];
        [self.nameArray addObject:modal];
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellone = @"cell";
    
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellone];
    if (cell == nil) {
        cell = [[MainTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellone];
    }
    cell.model = self.nameArray[indexPath.row];
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.nameArray.count;
}
<<<<<<< HEAD
=======
<<<<<<< HEAD



=======
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Model *model = self.nameArray[indexPath.row];
    CGFloat cellHeight = [MainTableViewCell getCellHeightWithModel:model];
    return cellHeight;
}
>>>>>>> 18d3c09294489acddd897d99d95be1873d254df5
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
      if ( [[UIApplication sharedApplication]openURL:[NSURL URLWithString:self.urlArray[indexPath.row]]]) {
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:self.urlArray[indexPath.row]]];
    }
    else{
        NSLog(@"jkdfgh");
    }
}
>>>>>>> 05e6117de6fe73e3bd90b35ab543500c9788f6b4
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
