//
//  ViewController.m
//  CoreData
//
//  Created by max on 19.01.18.
//  Copyright © 2018 Maksim Bakharev. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Person+CoreDataClass.h"
#import "AddingNewDataViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, strong) NSArray *personsArray;
@property (nonatomic, strong) UITableView *personTableView;
@property (nonatomic, strong) NSManagedObjectContext *coreDataContext;
@property (nonatomic, strong) UIButton *addNewPersonButton;
@property (nonatomic, strong) UISearchBar *addSearchBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self createUI];
//    [self coreDataSaveTest];
    [self loadModel];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadModel];
    [self.personTableView reloadData];
}


-(void) createUI
{
    self.personTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)- 160) style:UITableViewStylePlain];
    self.personTableView.delegate = self;
    self.personTableView.dataSource = self;
    
    [self.view addSubview:self.personTableView];
    
    self.addNewPersonButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 60, CGRectGetWidth(self.view.frame)-40*2, 40)];
    [self.addNewPersonButton addTarget:self action:@selector(addNewPerson) forControlEvents:UIControlEventTouchUpInside];
    [self.addNewPersonButton setTitle:@"Add person" forState:UIControlStateNormal];
    self.addNewPersonButton.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.addNewPersonButton];
    
    self.addSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 20, CGRectGetWidth(self.view.frame), 40)];
    self.addSearchBar.delegate = self;
    
    [self.view addSubview:self.addSearchBar];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name CONTAINS %@ OR surname CONTAINS %@", self.addSearchBar.text, self.addSearchBar.text];
    fetchRequest.predicate = predicate;
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO];
    fetchRequest.sortDescriptors = @[sortDescriptor];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.coreDataContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects.count < 1)
    {
        [self loadModel];
    }
    else
    {
        self.personsArray = fetchedObjects;
    }
    
    [self.personTableView reloadData];
}

-(void) addNewPerson
{
    AddingNewDataViewController *newController = [AddingNewDataViewController new];
    newController.coreDataContext = self.coreDataContext;
    [self presentViewController:newController animated:YES completion:nil];
}

-(void)loadModel
{
    self.personsArray = nil;
    self.personsArray = [self.coreDataContext executeFetchRequest:[Person fetchRequest] error:nil];
}

- (NSManagedObjectContext *) coreDataContext
{
    if (_coreDataContext)
    {
        return _coreDataContext;
    }
    UIApplication *application = [UIApplication sharedApplication];
    NSPersistentContainer *container = ((AppDelegate *) (application.delegate)).persistentContainer;
    NSManagedObjectContext *context = container.viewContext;
    return context;
}

//- (void)coreDataSaveTest
//{
//    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:self.coreDataContext];
//    person.name = @"Иван";
//    person.surname = @"Иванов";
//
//    NSError *error = nil;
//    if (![person.managedObjectContext save:&error])
//    {
//        NSLog(@"не удалось сохранить объект");
//        NSLog(@"%@, %@", error, error.localizedDescription);
//    }
//
//    error = nil;
//    NSArray *result = [self.coreDataContext executeFetchRequest:[Person fetchRequest] error:&error];
//    for (Person *person in result)
//    {
//        NSLog(@"personName - %@ personSurname - %@", person.name, person.surname);
//    }
//    NSLog(@"Results - %@", result);
//}


# pragma mark - TableViewDelegatee/DataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.personsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"personInfo"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"personInfo"];
    }
    Person *person = self.personsArray[indexPath.row];
    
    if(person)
    {
    cell.textLabel.text = person.name;
    cell.detailTextLabel.text = person.surname;
    }

return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    Person *person = self.personsArray[indexPath.row];
    [self.coreDataContext deleteObject:person];
    if (person.isDeleted)
    {
        [self.coreDataContext save:nil];
        [self loadModel];
        [self.personTableView reloadData];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}




@end
