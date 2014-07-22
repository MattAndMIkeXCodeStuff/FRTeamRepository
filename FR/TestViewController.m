//
//  TestViewController.m
//  FR
//
//  Created by Michael Selander on 7/6/14.
//  Copyright (c) 2014 Mattehw Burton. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController {
    int j;
}
@synthesize currentPeopleArray;
@synthesize contactGetter , nameAndButtonsView, personPic, nameLabel;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)showInfo:(id)sender {
    nameAndButtonsView.hidden = false;
}
-(IBAction)gotRight:(id)sender {
    
    if (j+1==currentPeopleArray.count) {
        j=0;
    }
    else {
        j++;
    }
    Person *currentPerson =[currentPeopleArray objectAtIndex:j];
    personPic.image = [currentPerson selfImage];

    if (currentPerson.lastName == NULL) {
        nameLabel.text = currentPerson.firstName;
        
    } else {
        nameLabel.text = [NSString stringWithFormat:@"%@ %@", currentPerson.firstName,currentPerson.lastName];
    }
    nameAndButtonsView.hidden = true;

}
-(IBAction)gotWrong:(id)sender {
    
    if (j+1==currentPeopleArray.count) {
        j=0;
    }
    else {
        j++;
    }
    Person *currentPerson =[currentPeopleArray objectAtIndex:j];
    personPic.image = [currentPerson selfImage];
    
    if (currentPerson.lastName == NULL) {
        nameLabel.text = currentPerson.firstName;
        
    } else {
        nameLabel.text = [NSString stringWithFormat:@"%@ %@", currentPerson.firstName,currentPerson.lastName];
    }
    nameAndButtonsView.hidden = true;
}
- (void)viewDidLoad
{
    contactGetter = [[MSContactManipulater alloc]init];
    currentPeopleArray = [contactGetter getContactsWithAnImage];
    for (int i = 0 ; i< currentPeopleArray.count; i++) {
        Person *p = [currentPeopleArray objectAtIndex:i];
        NSLog(@"%@",p.firstName);
    }
    j = rand()%currentPeopleArray.count;

    Person *currentPerson =[currentPeopleArray objectAtIndex:j];
    personPic.image = [currentPerson selfImage];
    
    if (currentPerson.lastName == NULL) {
        nameLabel.text = currentPerson.firstName;
        
    } else {
        nameLabel.text = [NSString stringWithFormat:@"%@ %@", currentPerson.firstName,currentPerson.lastName];
    }
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
