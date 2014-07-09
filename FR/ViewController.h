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
    
    IBOutlet UITextField *filterField;
    
    Person* myPerson;
    NSMutableArray* arrayOfPeople;
    NSMutableArray* arrayOf50PercentAndOver;
    NSMutableArray* arrayOf49PercentAndUnder;

    IBOutlet UIView *FilterView;
    
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
    ABAddressBookRef addressBook;
    IBOutlet UIImageView *mcPersonPicture;
    NSArray *currentContacts;
    IBOutlet UIButton *mcButton1;
    IBOutlet UIButton *mcButton2;
    IBOutlet UIButton *mcButton3;
    IBOutlet UIButton *mcButton4;
    MSContactManipulater *contactGetter;
    
    IBOutlet UIButton*showInfoButton;
    
    Person *currentPerson;
    Person *correctMCPerson;
    
    IBOutlet UILabel*filterLabel;
    IBOutlet UITextField*jobTitleField;
    IBOutlet UITextField*deptTitleField;
    IBOutlet UITextField*companyTitleField;

    IBOutlet UIView*gameOverView;
    IBOutlet UILabel*percentLabel;
    
    double totalGuessed;
    double totalCorrect;
    double totalPercentage;
    
    IBOutlet UIActivityIndicatorView*filteringIndicator;
    
    IBOutlet UILabel*moreInfoName;
    IBOutlet UILabel*moreInfoJobTitle;
    IBOutlet UILabel*moreInforDepartment;
    IBOutlet UILabel*moreInfoCompany;
    IBOutlet UITextView*moreInfoBio;
    IBOutlet UIView*moreInfoView;
}
@property(nonatomic)int numberOfSmiths;
@property(nonatomic)IBOutlet UIImageView *mcPersonPicture;
@property(nonatomic)NSArray *currentContacts;
@property(nonatomic)NSMutableArray *currentPeopleArray;
@property(nonatomic)MSContactManipulater *contactGetter;
//go to contact view
@property(nonatomic)IBOutlet UIView *nameAndButtonsView;
@property(nonatomic)IBOutlet UIImageView *personPic;
@property(nonatomic)IBOutlet UILabel *nameLabel;
-(IBAction)showInfo:(id)sender;
-(IBAction)gotRight:(id)sender;
-(IBAction)gotWrong:(id)sender;


-(IBAction)moreInfo;
-(IBAction)lessInfo;


-(void)loadNewPerson;


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

-(IBAction)enteredFilter;
-(IBAction)enteredJobTitle;
-(IBAction)enteredDeptTitle;
-(IBAction)enteredCompanyTitle;

-(IBAction)mcAnswerPressed:(id)sender;

- (bool)isObjectIdenticalTo:(id)anObject inArray:(NSMutableArray*)aIQ;

-(bool)checkIfAllPeopleHaveBeenGuessed;

-(bool)checkIfAllPeopleHaveBeenGuessedCorrectly;

-(NSMutableArray*)chooseArray;
@end

