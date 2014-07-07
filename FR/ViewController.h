//
//  ViewController.h
//  FR
//
//  Created by Matthew C Burton on 6/18/14.
//  Copyright (c) 2014 Mattehw Burton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
@interface ViewController : UIViewController
{
    Person* myPerson;
    NSMutableArray* arrayOfPeople;
    
    IBOutlet UIView* contactView;
    //MC stands for multiple choice
    IBOutlet UIView* MCGameView;
    //MCT stands for multiple choice timed
    IBOutlet UIView* MCTGameView;
    //T stands for timed game
    IBOutlet UIView* TGameView;
    //The first view
    IBOutlet UIView* firstView;
    //mcc stands for multiple choice chooser
    IBOutlet UIView* MCCView;
    ABAddressBookRef addressBook;
}
@property(nonatomic)int numberOfSmiths;
-(IBAction)addContactsFromAppleContactsApp;
-(IBAction)addContactFromScratch;
//go to contact view
-(IBAction)goToCV;
//go to multiple choice view
-(IBAction)goToMCV;
//go to first view
-(IBAction)goToFV;
//go to multiple choice timed view
-(IBAction)goToMCTV;
//go to timed view
-(IBAction)goToTV;
//go to multiple choice chooser view
-(IBAction)goToMCCV;
@end
