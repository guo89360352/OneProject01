//
//  OneViewController.m
//  OneProject
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 苹果IOS. All rights reserved.
//

#import "OneViewController.h"
#import "Model.h"
@interface OneViewController ()
@property(nonatomic,retain) UITableView *tableView;
@property(nonatomic,retain) NSMutableArray *nameArray;
@property(nonatomic,retain) NSArray *array;
@property(nonatomic,retain) NSDictionary *dit;
@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor magentaColor];
    self.tableView.rowHeight  = 80;
    self.tableView.separatorColor = [UIColor blackColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    [self path];
    
    
}

- (void)path{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Property List" ofType:@".plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSDictionary *dit = dic[@"root"];
    NSArray *array = dit[@"list"];
    
    
    
    
    
    
        }
    
    
    



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellone = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellone];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellone];
    }
    cell.backgroundColor = [UIColor cyanColor];
    return cell;
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
