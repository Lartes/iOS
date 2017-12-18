//
//  ViewController.m
//  CollectionViewControllerTest
//
//  Created by Alexey Levanov on 18.12.17.
//  Copyright © 2017 Alexey Levanov. All rights reserved.
//

#import "CollectionViewController.h"
#import "SBCollectionViewCell.h"


static NSString *cellIdentifier = @"CellId";

@interface CollectionViewController ()

//Наша модель данных
@property (nonatomic, strong) NSMutableArray *datesArray;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@end


@implementation CollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    [self addNavbar];
    
    self.collectionView.contentInset = UIEdgeInsetsMake(44, 0, 0, 0);
    
    // Инициализируем нашу модель
    self.datesArray = [NSMutableArray new];
    [self.datesArray addObject:[NSDate date]];
    self.dateFormatter = [[NSDateFormatter alloc] init];
    self.dateFormatter.dateFormat = [NSDateFormatter dateFormatFromTemplate:@"h:mm:ss a" options:0 locale:[NSLocale currentLocale]];
    
    //Конфигурируем collection view layout
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 10.0f;
    flowLayout.minimumLineSpacing = 10.0f;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    flowLayout.itemSize = CGSizeMake(50, 50);
    self.collectionView.collectionViewLayout = flowLayout;
    
    
    //Регистрируем collection view
    [self.collectionView registerClass:[SBCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    self.collectionView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
}

- (void)addNavbar
{
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 44)];
    navBar.backgroundColor = [UIColor whiteColor];
    
    UINavigationItem *navItem = [[UINavigationItem alloc] init];
    navItem.title = @"Collection View";
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Добавить" style:UIBarButtonItemStylePlain target:self action:@selector(addNewDate)];
    navItem.rightBarButtonItem = rightButton;
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Удалить" style:UIBarButtonItemStylePlain target:self action:@selector(deleteDate)];
    navItem.leftBarButtonItem = leftButton;
    
    navBar.items = @[ navItem ];
    [self.view addSubview:navBar];
}

#pragma mark - UICollectionViewDataSource Methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.datesArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SBCollectionViewCell *cell = (SBCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.text = [self.dateFormatter stringFromDate:self.datesArray[indexPath.row]];
    
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.datesArray removeObjectAtIndex:indexPath.item];
    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
}

#pragma mark - Actions

-(void)addNewDate
{
    [self.collectionView performBatchUpdates:^{
        // Создаем новый объект Date и обновляем нашу модель
        NSDate *newDate = [NSDate date];
        [self.datesArray insertObject:newDate atIndex:0];
        
        // Обновляем collectionView
        [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:0]]];
    } completion:nil];
}

-(void)deleteDate
{
    [self.collectionView performBatchUpdates:^{
        // Удаляем последний объект Date и обновляем нашу модель
        if(self.datesArray.count > 0)
        {
            [self.datesArray removeObjectAtIndex:0];
            [self.collectionView deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:0]]];
        }
    } completion:nil];
}



@end
