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
    
    int timeOnThisCard;
    IBOutlet UILabel* timeOnThisCardLabel;
    
    IBOutlet UILabel* numOfContactsLeftLabel;
    int numOfContactsLeft;
    
    IBOutlet UILabel *pointsLabel;
    int totalSeconds;
    int currentScore;
    int highscore;
    
    IBOutlet UILabel*typeOfGame;
    
    IBOutlet UIDatePicker *date;
    
    IBOutlet UIButton*tFButton;
    IBOutlet UIButton*mCNamesButton;
    IBOutlet UIButton*mCFacesButton;

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
    IBOutlet UIView* FCView;
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
   // MSContactManipulater *contactGetter;
    
    IBOutlet UIButton*showInfoButton;
    
    IBOutlet UIView*nameView;
    
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
    IBOutlet UIScrollView*moreInfoScrollView;

    
    NSMutableArray* uniqueCompaniesArray;
    NSMutableArray* uniqueDepartmentsArray;
    NSMutableArray* uniqueJobTitlesArray;
    
    NSMutableArray* filterCompanySwitches;
    NSMutableArray* filterCompanyText;
    NSMutableArray* filterDepartmentSwitches;
    NSMutableArray* filterDepartmentText;
    NSMutableArray* filterJobTitlesSwitches;
    NSMutableArray* filterJobTitlesText;
    
    NSMutableArray* allContacts;
    
    NSMutableArray* allPeople;
    
    bool animating;
    bool animatingBack;
    NSString *nextView;
    
    int xValR;
    int xValL;
    
    UIImage *frame0;
    UIImage *frame1;
    UIImage *frame2;
    UIImage *frame3;
    UIImage *frame4;
    UIImage *frame5;
    UIImage *frame6;
    UIImage *frame7;
    UIImage *frame8;
    UIImage *frame9;
    UIImage *frame10;
    
    IBOutlet UIImageView *igniteChange;
    
    NSMutableArray *imageArray;

    IBOutlet UIButton*guessButton;
    
    IBOutlet UIButton*infoButton;
    IBOutlet UIButton*hintButton;
    
    IBOutlet UISwitch*practiceModeSwitch;
    
    IBOutlet UIImageView*moreInfoViewImage;
    
    int numberOfHintsPressed;
    
    IBOutlet UILabel*hintLabel;
    
    IBOutlet UILabel*from;
    IBOutlet UILabel*to;
    IBOutlet UITextField*fromField;
    IBOutlet UITextField*toField;
    IBOutlet UIButton*fromButton;
    IBOutlet UIButton*toButton;
    
    bool onFrom;
    
    IBOutlet UIView*mCFacesView;
    //name 1, 2, 3, and 4
    IBOutlet UILabel*n1;
    IBOutlet UILabel*n2;
    IBOutlet UILabel*n3;
    IBOutlet UILabel*n4;
    //image multiple choice faces 1, 2, 3, and 4
    IBOutlet UIImageView*iMCF1;
    IBOutlet UIImageView*iMCF2;
    IBOutlet UIImageView*iMCF3;
    IBOutlet UIImageView*iMCF4;
    //info button multiple choice faces 1, 2, 3, and 4
    IBOutlet UIButton*iBMCF1;
    IBOutlet UIButton*iBMCF2;
    IBOutlet UIButton*iBMCF3;
    IBOutlet UIButton*iBMCF4;
    //guess button multiple choice faces 1, 2, 3, and 4
    IBOutlet UIButton*gBMCF1;
    IBOutlet UIButton*gBMCF2;
    IBOutlet UIButton*gBMCF3;
    IBOutlet UIButton*gBMCF4;
    //person multiple choice faces 1, 2, 3, and 4
    Person*pMCF1;
    Person*pMCF2;
    Person*pMCF3;
    Person*pMCF4;
    Person*correctPersonMCF;
    IBOutlet UILabel*correctPersonLabelMCF;
    IBOutlet UIButton*nextButtonMCF;
    // image thum icon
    IBOutlet UIImageView*iTIMCF1;
    IBOutlet UIImageView*iTIMCF2;
    IBOutlet UIImageView*iTIMCF3;
    IBOutlet UIImageView*iTIMCF4;
    
}
//more info multiple choice faces
-(IBAction)moreInfoMCF:(id)sender;
-(void)showMoreInfo:(Person*)pIQ;
-(IBAction)personGuessedMCF:(id)sender;
-(void)assignCorrectPersonMCF;
-(void)generateNewPeopleMCF;
-(void)checkIfCorrectMCF:(Person*)pIQ;
-(IBAction)nextMCF;
-(IBAction)hintMCF;


@property(nonatomic)int numberOfSmiths;
@property(nonatomic)IBOutlet UIScrollView *labelsScrollView;
@property(nonatomic)IBOutlet UIImageView *mcPersonPicture;
@property(nonatomic)NSArray *currentContacts;
@property(nonatomic)NSMutableArray *currentPeopleArray;
@property(nonatomic)NSMutableArray *filterCompanySwitches;
@property(nonatomic)NSMutableArray *filterCompanyText;

@property(nonatomic)NSMutableArray *filterDepartmentSwitches;

@property(nonatomic)NSMutableArray *filterDepartmentText;

@property(nonatomic)NSMutableArray *filterJobTitlesSwitches;

@property(nonatomic)NSMutableArray *filterJobTitles;


//@property(nonatomic)MSContactManipulater *contactGetter;
//filter view buttons
@property(nonatomic)IBOutlet UIButton *allButton;
@property(nonatomic)IBOutlet UIButton *companyButton;
@property(nonatomic)IBOutlet UIButton *departmentButton;
@property(nonatomic)IBOutlet UIButton *jobTitleButton;

//go to contact view
@property(nonatomic)IBOutlet UIView *nameAndButtonsView;
@property(nonatomic)IBOutlet UIImageView *personPic;
@property(nonatomic)IBOutlet UILabel *nameLabel;

-(IBAction)showPicker:(id)sender;
-(IBAction)dateChanged;

-(IBAction)showInfo:(id)sender;
-(IBAction)gotRight:(id)sender;
-(IBAction)gotWrong:(id)sender;

-(IBAction)goButtonPressed;

-(void)loadLabels:(NSString *)labelType;

-(IBAction)moreInfo;
-(IBAction)lessInfo;


-(void)loadNewPerson;

-(void)printHighScore;

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

-(void)readValues;

-(IBAction)segmentValueChanged:(id)sender;
-(IBAction)mcAnswerPressed:(id)sender;

-(bool)checkForString:(NSString*)str inArray:(NSMutableArray*)arr;

- (bool)isObjectIdenticalTo:(id)anObject inArray:(NSMutableArray*)aIQ;

-(bool)checkIfAllPeopleHaveBeenGuessed;

-(bool)checkIfAllPeopleHaveBeenGuessedCorrectly;
//When they press the button on the filter View
-(IBAction)pressedAll:(id)sender;
-(IBAction)pressedDepartment:(id)sender;
-(IBAction)pressedCompany:(id)sender;
-(IBAction)pressedJobTitle:(id)sender;

-(IBAction)hideFilterViewAndFilter;

-(void)addJob:(NSString*)str;
-(void)Company:(NSString*)str;
-(void)addDepartment:(NSString*)str;
-(void)addFieldsFromArray:(NSMutableArray*)array;
-(NSMutableArray*)chooseArray;
-(void)fillArray:(NSMutableArray *)a fromArray:(NSMutableArray *)b;

-(void)generateDotsForTime:(int)t;

-(void)animateView:(UIView*)v fromDirection:(NSString*)direction;
-(NSMutableArray*)getContactsWithCompany:(NSString*)company fromArray:(NSMutableArray*)array;
-(NSMutableArray*)getContactsWithJobTitle:(NSString*)jobTitle fromArray:(NSMutableArray*)array;
-(NSMutableArray*)getContactsWithDepartment:(NSString*)dept fromArray:(NSMutableArray*)array;

-(IBAction)showFilterView:(id)sender;

-(IBAction)hintButtonPressed;
@end

