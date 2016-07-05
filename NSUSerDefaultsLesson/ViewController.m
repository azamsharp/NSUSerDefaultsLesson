//
//  ViewController.m
//  NSUSerDefaultsLesson
//
//  Created by Mohammad Azam on 7/5/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,weak) IBOutlet UITextField *nameTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(IBAction) saveButtonPressed {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //[userDefaults setValue:self.nameTextField.text forKey:@"Name"];
    
    Person *person = [[Person alloc] init];
    person.firstName = @"John";
    person.lastName = @"Doe";

    NSData *personData = [NSKeyedArchiver archivedDataWithRootObject:person];
    
    [userDefaults setObject:personData forKey:@"Person"];
    
    NSMutableArray *people = [NSMutableArray array];
    [people addObject:person];
    
    NSData *peopleData = [NSKeyedArchiver archivedDataWithRootObject:people];
    
    [userDefaults setObject:peopleData forKey:@"PeopleData"];
    
    //[userDefaults setInteger:25 forKey:@"Age"];
    
    [userDefaults synchronize];
}

-(IBAction) getValueButtonPressed {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
   
    NSData *personData = [userDefaults valueForKey:@"Person"];
    
    NSData *peopleData = [userDefaults valueForKey:@"PeopleData"];
    
    NSMutableArray *people = [NSKeyedUnarchiver unarchiveObjectWithData:peopleData];
    
    NSMutableArray *stringArray = [NSMutableArray array];
    [stringArray addObject:@"Hello World"];
    
    [userDefaults setObject:stringArray forKey:@"StringArray"];
    
   // [people addObject:nil]; // add new object
    
    
    
    Person *person = (Person *) [NSKeyedUnarchiver unarchiveObjectWithData:personData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
