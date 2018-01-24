//
//  ViewController.m
//  uitable
//
//  Created by Artem Lomov on 10/01/2018.
//  Copyright © 2018 Artem Lomov. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"

static const float INDENT = 15.;

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIButton *deleteButton;
@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSMutableArray* data;
@property (nonatomic, strong) NSArray* dataAll;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = [@[@{@"name":@"One", @"discription":@"Если все subview уже добавлены на ячейку и максимум, что нужно, изменить их видимость, то этого достаточно. Не понадобится даже reloadRowsAtIndexPaths.", @"date":@"09.01.2018"}] mutableCopy];
    self.dataAll = @[@{@"name":@"One", @"discription":@"Если все subview уже добавлены на ячейку и максимум, что нужно, изменить их видимость, то этого достаточно. Не понадобится даже reloadRowsAtIndexPaths.", @"date":@"09.01.2018"},
                  @{@"name":@"Two", @"discription":@"Попробуйте сделать так, чтобы текст в ячейке соответствовал текущему значению ее высоты.", @"date":@"09.01.2018"},
                  @{@"name":@"Three", @"discription":@"Попытка поместить код в heightForRowAtIndexPath.", @"date":@"10.01.2018"},
                  @{@"name":@"Four", @"discription":@"У вас не будет актуального значения. Зато с задачей справится willDisplayCell.", @"date":@"11.01.2018"}];
    self.deleteButton = [[UIButton alloc] init];
    self.deleteButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.deleteButton setTitle:@"Delete" forState:UIControlStateNormal];
    self.deleteButton.backgroundColor = UIColor.lightGrayColor;
    [self.deleteButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.deleteButton setTitleColor:UIColor.grayColor forState:UIControlStateDisabled];
    [self.deleteButton addTarget:self action:@selector(deleteTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.deleteButton];
    
    self.addButton = [[UIButton alloc] init];
    self.addButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.addButton setTitle:@"Add" forState:UIControlStateNormal];
    self.addButton.backgroundColor = UIColor.lightGrayColor;
    [self.addButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.addButton addTarget:self action:@selector(addTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addButton];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0., 0., 0., 0.) style:UITableViewStylePlain];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = self.view.frame.size.width/3.+INDENT;
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"MyTableViewCell"];
    [self.view addSubview:self.tableView];
    
    UILayoutGuide *margin = self.view.layoutMarginsGuide;
    
    [self.deleteButton.widthAnchor constraintGreaterThanOrEqualToConstant:self.deleteButton.intrinsicContentSize.width];
    [self.addButton.widthAnchor constraintGreaterThanOrEqualToConstant:self.addButton.intrinsicContentSize.width];
    
    [self.deleteButton.leadingAnchor constraintEqualToAnchor:margin.leadingAnchor constant:INDENT].active = YES;
    [self.addButton.leadingAnchor constraintEqualToAnchor:self.deleteButton.trailingAnchor constant:INDENT].active = YES;
    [self.addButton.trailingAnchor constraintEqualToAnchor:margin.trailingAnchor constant:-INDENT].active = YES;
    [self.deleteButton.topAnchor constraintEqualToAnchor:margin.topAnchor constant:INDENT].active = YES;
    [self.addButton.topAnchor constraintEqualToAnchor:self.deleteButton.topAnchor].active = YES;
    [self.addButton.widthAnchor constraintEqualToAnchor:self.deleteButton.widthAnchor].active = YES;
    
    [self.tableView.leadingAnchor constraintEqualToAnchor:self.deleteButton.leadingAnchor].active = YES;
    [self.tableView.trailingAnchor constraintEqualToAnchor:self.addButton.trailingAnchor].active = YES;
    [self.tableView.topAnchor constraintEqualToAnchor:self.deleteButton.bottomAnchor constant:INDENT].active = YES;
    [self.tableView.bottomAnchor constraintEqualToAnchor:margin.bottomAnchor constant:-INDENT].active = YES;
}

- (void)deleteTapped:(id)sender
{
    if(self.data.count >= 1)
    {
        [self.data removeLastObject];
        [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.data.count inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

- (void)addTapped:(id)sender
{
    if(self.data.count < self.dataAll.count)
    {
        [self.data addObject:self.dataAll[self.data.count]];
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.data.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationRight];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
    //return self.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"MyTableViewCell" forIndexPath:indexPath];
    cell.label1.text = [self.data[indexPath.row] objectForKey:@"name"];
    cell.label2.text = [self.data[indexPath.row] objectForKey:@"date"];
    cell.label3.text = [self.data[indexPath.row] objectForKey:@"discription"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.view.frame.size.width/3.+INDENT-20.+((NSString*)[self.data[indexPath.row] objectForKey:@"discription"]).length+30.;
    //return self.view.frame.size.width/3.+INDENT-20.+((MyTableViewCell*)[self.tableView cellForRowAtIndexPath:indexPath]).label3.frame.size.height;
}

@end
