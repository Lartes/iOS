//
//  AddingNewDataViewController.m
//  CoreData
//
//  Created by max on 19.01.18.
//  Copyright © 2018 Maksim Bakharev. All rights reserved.
//

#import "AddingNewDataViewController.h"
#import "AppDelegate.h"
#import "Person+CoreDataClass.h"

@interface AddingNewDataViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UIButton *saveButton;
@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *surnameTextField;


@end

@implementation AddingNewDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];
    
}

- (void)prepareUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.saveButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 40, CGRectGetWidth(self.view.frame)-40*2, 40)];
    [self.saveButton addTarget:self action:@selector(saveNewData) forControlEvents:UIControlEventTouchUpInside];
    self.saveButton.backgroundColor = [UIColor blueColor];
    [self.saveButton setTitle:@"Save person" forState:UIControlStateNormal];
    [self.view addSubview:self.saveButton];
    
    self.nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 150, CGRectGetWidth(self.view.frame)-40*2, 40)];
    self.nameTextField.backgroundColor = [UIColor lightGrayColor];
    self.nameTextField.text = @"name";
    self.nameTextField.delegate = self;
    [self.view addSubview:self.nameTextField];
    
    self.surnameTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 200, CGRectGetWidth(self.view.frame)-40*2, 40)];
    self.surnameTextField.backgroundColor = [UIColor lightGrayColor];
    self.surnameTextField.text = @"surname";
    self.surnameTextField.delegate = self;
    [self.view addSubview:self.surnameTextField];
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if([textField.text isEqualToString:@"name"])
    {
        textField.text = @"";
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField.text.length < 1)
    {
        textField.text = @"name";
    }
}

- (void)saveNewData
{
    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:self.coreDataContext];
    person.name = self.nameTextField.text;
    person.surname = self.surnameTextField.text;

    NSError *error = nil;
    if (![person.managedObjectContext save:&error])
    {
        NSLog(@"не удалось сохранить объект");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
