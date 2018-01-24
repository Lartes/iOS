//
//  ViewController.m
//  uitable
//
//  Created by Artem Lomov on 10/01/2018.
//  Copyright © 2018 Artem Lomov. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "CounterModel.h"

static const float INDENT = 15.;

@interface ViewController () <UITableViewDataSource>

@property (nonatomic, strong) UIButton *deleteButton;
@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSArray* data;
@property (nonatomic, strong) CounterModel *model;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = @[@{@"name":@"One", @"discription":@"Если все subview уже добавлены на ячейку и максимум, что нужно, изменить их видимость, то этого достаточно. Не понадобится даже reloadRowsAtIndexPaths.", @"date":@"09.01.2018"},
                  @{@"name":@"Two", @"discription":@"Попробуйте сделать так, чтобы текст в ячейке соответствовал текущему значению ее высоты.", @"date":@"09.01.2018"},
                  @{@"name":@"Three", @"discription":@"Попытка поместить код в heightForRowAtIndexPath или cellForRowAtIndexPath ни к чему не приведет.", @"date":@"10.01.2018"},
                  @{@"name":@"Four", @"discription":@"У вас не будет актуального значения. Зато с задачей справится willDisplayCell.", @"date":@"11.01.2018"}];
    
    self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(INDENT, INDENT, (CGRectGetWidth(self.view.frame)-INDENT*3)/2., 44.)];
    [self.deleteButton setTitle:@"Delete" forState:UIControlStateNormal];
    self.deleteButton.backgroundColor = UIColor.lightGrayColor;
    [self.deleteButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.deleteButton setTitleColor:UIColor.grayColor forState:UIControlStateDisabled];
    [self.deleteButton addTarget:self action:@selector(deleteTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.deleteButton];
    
    self.addButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.deleteButton.frame)+INDENT, INDENT,
                                                                (CGRectGetWidth(self.view.frame)-INDENT*3)/2., 44.)];
    [self.addButton setTitle:@"Add" forState:UIControlStateNormal];
    self.addButton.backgroundColor = UIColor.lightGrayColor;
    [self.addButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.addButton addTarget:self action:@selector(addTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addButton];
    
    self.model = [[CounterModel alloc] initWithDataSize:self.data.count];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0., CGRectGetMaxY(self.deleteButton.frame)+INDENT/2.,
                                                                   CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-CGRectGetMaxY(self.deleteButton.frame)-INDENT)
                                                  style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.rowHeight = self.view.frame.size.width/3.+INDENT;
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"MyTableViewCell"];
    [self.view addSubview:self.tableView];
    
    [self updateView];
}

- (void)deleteTapped:(id)sender
{
    [self.model setCounter:@(self.model.counter.integerValue - 1)];
    [self updateView];
}

- (void)addTapped:(id)sender
{
    [self.model setCounter:@(self.model.counter.integerValue + 1)];
    [self updateView];
}

- (void)updateView
{
    self.deleteButton.enabled = self.model.counter.integerValue > 0;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.model.counter.integerValue;
    //return self.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"MyTableViewCell" forIndexPath:indexPath];
    cell.label1.text = [self.data[indexPath.row] objectForKey:@"name"];
    cell.label2.text = [self.data[indexPath.row] objectForKey:@"date"];
    cell.label3.text = [self.data[indexPath.row] objectForKey:@"discription"];
    [cell.label3 sizeToFit];
    return cell;
}

@end
