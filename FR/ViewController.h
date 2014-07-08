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
#import "MSContactManipulater.h"
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
    IBOutlet UIImageView *mcPersonPicture;
    NSArray *currentContacts;
    IBOutlet UIButton *mcButton1;
    IBOutlet UIButton *mcButton2;
    IBOutlet UIButton *mcButton3;
    IBOutlet UIButton *mcButton4;
    MSContactManipulater *contactGetter;
    Person *currentPerson;
}
@property(nonatomic)int numberOfSmiths;
@property(nonatomic)IBOutlet UIImageView *mcPersonPicture;
@property(nonatomic)NSArray *currentContacts;
@property(nonatomic)MSContactManipulater *contactGetter;
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
-(IBAction)mcAnswerPressed:(id)sender;
@end
