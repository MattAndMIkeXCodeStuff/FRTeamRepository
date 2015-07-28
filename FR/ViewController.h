//
//  ViewController.h
//  FR
//
//  Created by Matthew C Burton on 6/18/14.
//  Copyright (c) 2014 Mattehw Burton. All rights reserved.
//
#define kmostTimeMCF @"timeMCF"
#define kmostTimeMCN @"timeMCN"
#define kmostTimeF @"timeF"
#define kbestTimeMCF @"bestTimeMCF"
#define kbestTimeMCN @"bestTimeMCN"
#define kbestTimeF @"bestTimeF"
#define khighscoreMCF @"highscoreMCF"
#define khighscoreMCN @"highscoreMCN"
#define khighscoreF @"highscoreF"
#define khighscoreFHard @"highscoreFHard"
#define kmusicBool @"musicBool"
#define kfxBool @"fxBool"
#define kcompanyBool @"companyBool"
#define kdepartmentBool @"departmentBool"
#define kdateBool @"dateBool"
#define kjobTitleBool @"jobTitleBool"
#define kmissedBool @"missedBool"
#define ktimesOpened @"timesOpened"
#define ktoken @"token"
#define klocalUserId @"localUserId"
#define khasAPlayer @"hasAPlayer"

#import <UIKit/UIKit.h>
#import "Person.h"
#import "User.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import "MSContactManipulater.h"
#import <GameKit/GameKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "AFNetworking.h"
#import <QuartzCore/QuartzCore.h>

static NSString * const BaseURLString = @"http://knownames.azurewebsites.net";

@interface ViewController : UIViewController <UIAlertViewDelegate>
{
    //outlet
    
        //view
    IBOutlet UIView*ActualLeaderboardViewTopBar;
    IBOutlet UIView*actualLeaderboardView;
    IBOutlet UIView*registrationView;
    IBOutlet UIView*editAccountView;
    IBOutlet UIView*forgotPasswordView;
    IBOutlet UIView*signInView;
    IBOutlet UIView*timerView;
    IBOutlet UIView*MCGameView;
    IBOutlet UIView*MCTGameView;
    IBOutlet UIView*FGameView;
    IBOutlet UIView*FTGameView;
    IBOutlet UIView*FCView;
    IBOutlet UIView*firstView;
    IBOutlet UIView*MCCView;
    IBOutlet UIView*FilterView;
    IBOutlet UIView*iV;
    IBOutlet UIView*nameView;
    IBOutlet UIView*moreInfoView;
    IBOutlet UIView*gameOverView;
    IBOutlet UIView*loadingView;
    IBOutlet UIView*hardFlashcardGuessView;
    IBOutlet UIView*settingsView;
    IBOutlet UIView*statsView;
    IBOutlet UIView*leaderBoardView;
    IBOutlet UIView*percentView;
    IBOutlet UIView*mCFacesView;
    IBOutlet UIView*datepickerBackground;
        //scroll view
    IBOutlet UIScrollView*scoresScrollView;
    IBOutlet UIScrollView*signUpScrollView;
    IBOutlet UIScrollView*moreInfoScrollView;
    IBOutlet UIScrollView*peopleStatsScrollView;
    IBOutlet UIScrollView*settingsScrollView;
    IBOutlet UIScrollView*statsScrollView;

        //text field
    IBOutlet UITextField*registerFN; //first name
    IBOutlet UITextField*registerLN; //last name
    IBOutlet UITextField*registerP;  //password
    IBOutlet UITextField*registerCP; //confirm password
    IBOutlet UITextField*registerE;  //email
    IBOutlet UITextField*registerU;  //username'
    IBOutlet UITextField*signInU;
    IBOutlet UITextField*signInP;
    IBOutlet UITextField*filterField;
    IBOutlet UITextField*jobTitleField;
    IBOutlet UITextField*deptTitleField;
    IBOutlet UITextField*companyTitleField;
    IBOutlet UITextField*hardTextField;
    IBOutlet UITextField*fromField;
    IBOutlet UITextField*toField;
    IBOutlet UITextField*percentField;
    IBOutlet UITextField*oldPassword;
    IBOutlet UITextField*newPassword;
    IBOutlet UITextField*confirmPassword;
    IBOutlet UITextField*emailFP;
    IBOutlet UITextField*userNameFP;

        //label
    IBOutlet UILabel*currentLeaderboard;
    IBOutlet UILabel*timerLable;
    IBOutlet UILabel*timeOnThisCardLabel;
    IBOutlet UILabel*numOfContactsLeftLabel;
    IBOutlet UILabel*pointsLabel;
    IBOutlet UILabel*typeOfGame;
    IBOutlet UILabel*moreInfoName;
    IBOutlet UILabel*moreInfoJobTitle;
    IBOutlet UILabel*moreInforDepartment;
    IBOutlet UILabel*moreInfoCompany;
    IBOutlet UILabel*percentLabel;
    IBOutlet UILabel*hintLabel;
    IBOutlet UILabel*filterLabel;
    IBOutlet UILabel*bestTimeLabelMCF;
    IBOutlet UILabel*bestTimeLabelMCN;
    IBOutlet UILabel*bestTimeLabelF;
    IBOutlet UILabel*bestScoreLabelMCF;
    IBOutlet UILabel*bestScoreLabelMCN;
    IBOutlet UILabel*bestScoreLabelF;
    IBOutlet UILabel*mostTimeLabelMCF;
    IBOutlet UILabel*mostTimeLabelMCN;
    IBOutlet UILabel*mostTimeLabelF;
    IBOutlet UILabel*loadingLabel;
    IBOutlet UILabel*name1;
    IBOutlet UILabel*percent1;
    IBOutlet UILabel*myTitle;
    IBOutlet UILabel*n1;
    IBOutlet UILabel*n2;
    IBOutlet UILabel*n3;
    IBOutlet UILabel*n4;
    IBOutlet UILabel*correctPersonLabelMCF;
    IBOutlet UILabel*fromOrTo;
    IBOutlet UILabel*numSelectedLabel;
    IBOutlet UILabel*addedPoints;
        //button
    IBOutlet UIButton*signUpButton;
    IBOutlet UIButton*mcButton1;
    IBOutlet UIButton*mcButton2;
    IBOutlet UIButton*mcButton3;
    IBOutlet UIButton*mcButton4;
    IBOutlet UIButton*tFButton;
    IBOutlet UIButton*mCNamesButton;
    IBOutlet UIButton*mCFacesButton;
    IBOutlet UIButton*nextMCN;
    IBOutlet UIButton*iBMCN1;
    IBOutlet UIButton*iBMCN2;
    IBOutlet UIButton*iBMCN3;
    IBOutlet UIButton*iBMCN4;
    IBOutlet UIButton*guessButton;
    IBOutlet UIButton*infoButton;
    IBOutlet UIButton*hintButton;
    IBOutlet UIButton*fromButton;
    IBOutlet UIButton*toButton;
    IBOutlet UIButton*showInfoButton;
    IBOutlet UIButton*iBMCF1;
    IBOutlet UIButton*iBMCF2;
    IBOutlet UIButton*iBMCF3;
    IBOutlet UIButton*iBMCF4;
    IBOutlet UIButton*gBMCF1;
    IBOutlet UIButton*gBMCF2;
    IBOutlet UIButton*gBMCF3;
    IBOutlet UIButton*gBMCF4;
    IBOutlet UIButton*hintButtonMCF;
    IBOutlet UIButton*hintButtonMCN;
    IBOutlet UIButton*nextButtonMCF;
    IBOutlet UIButton*leaderBoardButton;
    IBOutlet UIButton*statsButton;
    IBOutlet UIButton*settingsButton;
    IBOutlet UIButton*enlargedImageClearBackground;

        //image view
    IBOutlet UIImageView *mcPersonPicture;
    IBOutlet UIImageView*iTIMCF1;
    IBOutlet UIImageView*iTIMCF2;
    IBOutlet UIImageView*iTIMCF3;
    IBOutlet UIImageView*iTIMCF4;
    IBOutlet UIImageView*iTIMCN1;
    IBOutlet UIImageView*iTIMCN2;
    IBOutlet UIImageView*iTIMCN3;
    IBOutlet UIImageView*iTIMCN4;
    IBOutlet UIImageView*iMCF1;
    IBOutlet UIImageView*iMCF2;
    IBOutlet UIImageView*iMCF3;
    IBOutlet UIImageView*iMCF4;
    IBOutlet UIImageView*columnSpacer1;
    IBOutlet UIImageView*columnSpacer2;
    IBOutlet UIImageView*columnSpacer3;
    IBOutlet UIImageView*columnSpacer4;
    IBOutlet UIImageView*rowSpacer1;
    IBOutlet UIImageView*image1;
    IBOutlet UIImageView *igniteChange;
    IBOutlet UIImageView*mySeparater1;
    IBOutlet UIImageView*mostTimeImageViewMCF;
    IBOutlet UIImageView*mostTimeImageViewMCN;
    IBOutlet UIImageView*mostTimeImageViewF;
    IBOutlet UIImageView*moreInfoViewImage;
    IBOutlet UIImageView*enlargedImage;
        //switch
    IBOutlet UISwitch*musicSwitchSetting;
    IBOutlet UISwitch*fxSwitchSetting;
    IBOutlet UISwitch*companySwitchSetting;
    IBOutlet UISwitch*dateSwitchSetting;
    IBOutlet UISwitch*departmentSwitchSetting;
    IBOutlet UISwitch*jobTitleSwitchSetting;
    IBOutlet UISwitch*percentMissedSwichSetting;
    IBOutlet UISwitch*practiceModeSwitch;
    IBOutlet UISwitch*dateSwitch;
    IBOutlet UISwitch*missedSwitch;
    IBOutlet UISwitch*noneSpecifiedDepartment;
    IBOutlet UISwitch*noneSpecifiedJobTitle;
    IBOutlet UISwitch*noneSpecifiedCompany;
        //segmented cotrol
    IBOutlet UISegmentedControl*filters;
    IBOutlet UISegmentedControl*stats;
    
        //miscellaneous
    IBOutlet UIDatePicker *date;
    IBOutlet UITextView*moreInfoBio;
    IBOutlet UIActivityIndicatorView*filteringIndicator;
    IBOutlet UIProgressView*progressInLoading;
    IBOutlet UISlider*typeOfGameSlider;
    
    //int
    int timeOnThisCard;
    int currentScore;
    int highscore;
    int highscoreHardMode;
    int currentScoreMCF;
    int highscoreMCF;
    int theScoreTheyGet;
    int numOfContactsLeft;
    int currentScoreMCN;
    int highscoreMCN;
    int totalSeconds;
    int seconds;
    int minutes;
    int wait;
    int timesOpened;
    int numInARow;
    int xValR;
    int xValL;
    int numberOfHintsPressed;
    int mostTimeIntMCF;
    int mostTimeIntMCN;
    int mostTimeIntF;
    int totalInCompanies;
    int totalInDepartments;
    int totalInJobTitles;
    int totalPeople;
    int numSelected;
    
    
    //string
    NSString*token;
    NSString*localUserId;
    NSString*nextView;
    NSString*viewDidLoadString;
    NSString*dateTypeString;
    NSString*typeOfGameString;
    NSString*percentage;
    NSString*numInGame;
    //bool
    BOOL hasAPlayer;
    bool onFrom;
    
    //miscellaneous
    NSUserDefaults*defaults;
    UIFont*Font;
    NSTimer*timer;
    UIAlertView*alert;
    SystemSoundID SoundID;
    NSURL*soundURL;
    ABAddressBookRef addressBook;

    //array
    NSArray* leaderboardNames;
    NSArray* leaderboardIDs;
    NSArray*scores;
    NSArray*numsOfPeople;
    NSArray*percentages;
    NSArray *currentContacts;

    //mutable array
    NSMutableArray*arrayOfPeople;
    NSMutableArray*arrayOf50PercentAndOver;
    NSMutableArray*arrayOf49PercentAndUnder;
    NSMutableArray*uniqueCompaniesArray;
    NSMutableArray*uniqueDepartmentsArray;
    NSMutableArray*uniqueJobTitlesArray;
    NSMutableArray*numInCompanies;
    NSMutableArray*numInJobTitles;
    NSMutableArray*numInDepartments;
    NSMutableArray*filterCompanySwitches;
    NSMutableArray*filterCompanyText;
    NSMutableArray*filterDepartmentSwitches;
    NSMutableArray*filterDepartmentText;
    NSMutableArray*filterJobTitlesSwitches;
    NSMutableArray*filterJobTitlesText;
    NSMutableArray*allContacts;
    NSMutableArray*allPeople;
    NSMutableArray*imageArray;
    NSMutableArray*buttonsOnStatsView;
    NSMutableArray*peopleOnStatsView;
    NSMutableArray *lowest;
    NSMutableArray*people;

    //person
    Person*myPerson;
    Person*currentPerson;
    Person*correctMCPerson;
    Person*pMCN1;
    Person*pMCN2;
    Person*pMCN3;
    Person*pMCN4;
    Person*pMCF1;
    Person*pMCF2;
    Person*pMCF3;
    Person*pMCF4;
    Person*correctPersonMCF;
    Person*lastPerson;
    Person*mostTimeMCF;
    Person*mostTimeMCN;
    Person*mostTimeF;
    
    //double
    double totalGuessed;
    double totalCorrect;
    double totalPercentage;
    double bestTimeMCF;
    double bestTimeMCN;
    double bestTimeF;
    
    //image
    UIImage*frame0;
    UIImage*frame1;
    UIImage*frame2;
    UIImage*frame3;
    UIImage*frame4;
    UIImage*frame5;
    UIImage*frame6;
    UIImage*frame7;
    UIImage*frame8;
    UIImage*frame9;
    UIImage*frame10;
}

//actions
-(IBAction)signIn;
-(IBAction)signUp;
-(IBAction)changePassword;
-(IBAction)forgotPassword;
-(IBAction)sendEmail;

-(IBAction)goToNewLoginView:(id)sender;
-(IBAction)beganEditing:(id)sender;
-(IBAction)logout;
-(IBAction)editAccount;
-(IBAction)chooseLeaderboard:(id)sender;
-(IBAction)closeKeyboard:(id)sender;
-(IBAction)checkAnswer:(id)sender;
-(IBAction)moveHardTextFieldIntoView;
-(IBAction)moreInfoMC:(id)sender;
-(IBAction)personGuessedMCF:(id)sender;
-(IBAction)nextMCF;
-(IBAction)hintMCF;

-(IBAction)nextMCN;
-(IBAction)hintMCN;
-(IBAction)customDate;
-(IBAction)eraseStats;
-(IBAction)changeStatsView:(id)sender;
-(IBAction)goToNewView:(id)sender;
-(IBAction)backToLeaderboardView:(id)sender;
-(IBAction)showPicker:(id)sender;
-(IBAction)dateChanged;
-(IBAction)showInfo:(id)sender;
-(IBAction)gotRight:(id)sender;
-(IBAction)gotWrong:(id)sender;
-(IBAction)goButtonPressed;
-(IBAction)moreInfo;
-(IBAction)enlargeImage;
-(IBAction)lessInfo;
-(IBAction)hidePercentEditer;
-(IBAction)percentChanged;
-(IBAction)goToFV;
-(IBAction)segmentValueChanged:(id)sender;
-(IBAction)mcAnswerPressed:(id)sender;
-(IBAction)hideFilterViewAndFilter;
-(IBAction)showPeopleStatsView;
-(IBAction)showFilterView:(id)sender;
-(IBAction)hintButtonPressed;
-(IBAction)personOnLeaderboardTapped:(id)sender;
-(IBAction)filterSwitchOn:(id)sender;


//methods
-(void)respondToNumInARow;
-(void)showMoreInfo:(Person*)pIQ;
-(void)assignCorrectPersonMCF;
-(void)generateNewPeopleMCF;
-(void)checkIfCorrectMCF:(Person*)pIQ;
-(void)generateNewPeopleMCN;
-(void)loadLabels:(NSString *)labelType;
-(void)playSoundNamed:(NSString*)soundName andType:(NSString*)type andFX:(BOOL)isFX;
-(void)updateCurrentFilters;
-(void)loadNewPerson;
-(void)printHighScore;
-(void)printHighScoreMCF;
-(void)printHighScoreMCN;
-(void)showLoadingUI:(int)percentDone :(int)i :(int)total;
-(void)countUpDuration;
-(void)readValues;
-(void)addJob:(NSString*)str;
-(void)addDepartment:(NSString*)str;
-(void)addFieldsFromArray:(NSMutableArray*)array;
-(void)fillArray:(NSMutableArray *)a fromArray:(NSMutableArray *)b;
-(void)authenticatePlayer;
-(void)generateDotsForTime:(int)t;

-(void)animateIn:(UIView*)view;
-(void)animateOut:(UIView*)view;
-(void)animateFlip:(UIView*)viewToReplace withVeiw:(UIView*)replacementView;
-(NSString*)showSignUpErrors;

-(bool)checkForString:(NSString*)str inArray:(NSMutableArray*)arr;
-(bool)isObjectIdenticalTo:(id)anObject inArray:(NSMutableArray*)aIQ;
-(bool)checkIfAllPeopleHaveBeenGuessed;
-(bool)checkIfAllPeopleHaveBeenGuessedCorrectly;
-(bool)object: (id)object isInArray: (NSMutableArray*)array;

-(NSArray*)sortByPercentageArrayOfPeople:(NSMutableArray*)array;

-(NSMutableArray*)chooseArray;
-(NSMutableArray*)getContactsWithCompany:(NSString*)company fromArray:(NSMutableArray*)array;
-(NSMutableArray*)getContactsWithJobTitle:(NSString*)jobTitle fromArray:(NSMutableArray*)array;
-(NSMutableArray*)getContactsWithDepartment:(NSString*)dept fromArray:(NSMutableArray*)array;
-(NSMutableArray*)getContactsWithDateFromArray:(NSMutableArray*)array;
-(NSMutableArray*)getContactsWithPercentage:(NSString*)percentage fromArray:(NSMutableArray*)array;


//properties
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
@property(nonatomic)IBOutlet UIView *nameAndButtonsView;
@property(nonatomic)IBOutlet UIImageView *personPic;
@property(nonatomic)IBOutlet UILabel *nameLabel;

@end

