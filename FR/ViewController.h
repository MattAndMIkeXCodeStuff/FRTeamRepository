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
    IBOutlet UILabel* timerLable;
    NSTimer *timer;
    int seconds;
    int minutes;
    int wait;
    IBOutlet UIView *timerView;
    
    Person* myPerson;
    NSMutableArray* arrayOfPeople;
    NSMutableArray* arrayOf50PercentAndOver;
    NSMutableArray* arrayOf49PercentAndUnder;

    
    
    //MC stands for multiple choice
    IBOutlet UIView* MCGameView;
    //MCT stands for multiple choice timed
    IBOutlet UIView* MCTGameView;
    //F stands for flashcard game
    IBOutlet UIView* FGameView;
    //FT stands for flashcard timed game
    IBOutlet UIView* FTGameView;
    //FT stands for flashcard timed game
    IBOutlet UIView* FCGameView;
    //The first view
    IBOutlet UIView* firstView;
    //mcc stands for multiple choice chooser
    IBOutlet UIView* MCCView;
    
    IBOutlet UIButton*showInfoButton;
    
    Person *currentPerson;
    
    
}
@property(nonatomic)NSMutableArray *currentPeopleArray;
@property(nonatomic)MSContactManipulater *contactGetter;
@property(nonatomic)IBOutlet UIView *nameAndButtonsView;
@property(nonatomic)IBOutlet UIImageView *personPic;
@property(nonatomic)IBOutlet UILabel *nameLabel;
-(IBAction)showInfo:(id)sender;
-(IBAction)gotRight:(id)sender;
-(IBAction)gotWrong:(id)sender;


-(int)checkFName:(NSString*)fN LName:(NSString*)lN inArray:(NSMutableArray*)array;


-(void)countUpDuration;

//go to multiple choice view
-(IBAction)goToMCV;
//go to first view
-(IBAction)goToFV;
//go to multiple choice timed view
-(IBAction)goToMCTV;
//go to flashcard view
-(IBAction)goToFlashV;
//go to flashcard chooser view
-(IBAction)goToFCV;
//go to flashcard timed view
-(IBAction)goToFTV;
//go to multiple choice chooser view
-(IBAction)goToMCCV;

-(NSMutableArray*)chooseArray;
@end

