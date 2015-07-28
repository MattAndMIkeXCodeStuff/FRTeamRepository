//
//  ViewController.m
//  FR
//
//  Created by Matthew C Burton on 6/18/14.
//  Copyright (c) 2014 Mattehw Burton. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController
{
    int j;
}
@synthesize mcPersonPicture, currentContacts;
@synthesize currentPeopleArray;
@synthesize nameAndButtonsView, personPic, nameLabel;
@synthesize labelsScrollView, filterCompanyText, filterCompanySwitches, filterDepartmentSwitches, filterDepartmentText, filterJobTitles, filterJobTitlesSwitches;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)authenticatePlayer{
    //show sign in view
    [self animateIn:signInView];

}
-(NSString*)showSignUpErrors{
    NSString*description = [[NSString alloc]init];
   //this section will house a bunch of tests that will tell the problems that the user's registration contains
    if(registerCP.text.length == 0 || registerE.text.length == 0 || registerFN.text.length == 0 || registerLN.text.length == 0 || registerP.text.length == 0 || registerU.text.length == 0)
    {
        //something is empty
        description = [NSString stringWithFormat:@"%@ Please enter all information.", description];
    }
    if (registerP.text.length < 6 || [registerP.text isEqual:registerCP.text] == false)
    {
        description = [NSString stringWithFormat:@"%@ Please make your password have 6 characters a number, a sybol and at least one capitol letter. Example: Cre8ivity!", description];
    }
    if(true == false)//email is not a real email
    {
        description = [NSString stringWithFormat:@"%@ Please enter a real email address.", description];
    }
    
    if(description.length == 0)
    {
        description = @"What have you done?!?! The problem is, I really dont know. Shame on you for making this hard for me.";
    }
    return description;
}
-(void)updateAchievements{
    
}
- (void)viewDidLoad{
    
    

    Font = [UIFont fontWithName:@"Flexo" size:14];
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:Font forKey:NSFontAttributeName];
    [stats setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [filters setTitleTextAttributes:attributes forState:UIControlStateNormal];

    
    
    //moreInfoBio.text = @"No Notes";
    //moreInfoBio = [[UITextView alloc]init];
    
    
    
    
    //imageArray = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"0.png"], [UIImage imageNamed:@"1.png"], [UIImage imageNamed:@"2.png"], [UIImage imageNamed:@"3.png"], [UIImage imageNamed:@"4.png"], [UIImage imageNamed:@"5.png"], [UIImage imageNamed:@"6.png"], [UIImage imageNamed:@"7.png"],[UIImage imageNamed:@"8.png"],[UIImage imageNamed:@"9.png"],[UIImage imageNamed:@"10.png"],[UIImage imageNamed:@"10.png"],[UIImage imageNamed:@"10.png"],[UIImage imageNamed:@"10.png"],[UIImage imageNamed:@"10.png"], [UIImage imageNamed:@"10.png"], [UIImage imageNamed:@"9.png"], [UIImage imageNamed:@"8.png"], [UIImage imageNamed:@"7.png"], [UIImage imageNamed:@"6.png"], [UIImage imageNamed:@"5.png"], [UIImage imageNamed:@"4.png"], [UIImage imageNamed:@"3.png"], [UIImage imageNamed:@"2.png"], [UIImage imageNamed:@"1.png"], [UIImage imageNamed:@"0.png"], nil];
    igniteChange.animationImages = imageArray;
    igniteChange.animationDuration = 0.08*(imageArray.count);
    igniteChange.animationRepeatCount=100;
    [igniteChange startAnimating];
    
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(countUpDuration) userInfo:Nil repeats:YES];
    filterJobTitlesText = [[NSMutableArray alloc]init];
    filterJobTitlesSwitches = [[NSMutableArray alloc]init];
    filterDepartmentSwitches = [[NSMutableArray alloc]init];
    filterDepartmentText = [[NSMutableArray alloc]init];
    filterCompanySwitches = [[NSMutableArray alloc]init];
    filterCompanyText = [[NSMutableArray alloc]init];
    
    defaults = [NSUserDefaults standardUserDefaults];
    
    int b = (int)([defaults integerForKey:khighscoreF]);
    if (b==0) {
        bestTimeF = 10000000;
    } else {
        bestTimeF = b;
    }
    b = (int)[defaults integerForKey:kbestTimeMCF];
    if (b==0) {
        bestTimeMCF= 10000000;
    } else {
        bestTimeMCF = b;
    }
    b = (int)[defaults integerForKey:kbestTimeMCN];
    if (b==0) {
        bestTimeMCN = 10000000;
    } else {
        bestTimeMCN = b;
    }
    highscore = (int)[defaults integerForKey:khighscoreF];
    highscoreHardMode = (int)[defaults integerForKey:khighscoreFHard];
    highscoreMCN = (int)[defaults integerForKey:khighscoreMCN];
    highscoreMCF = (int)[defaults integerForKey:khighscoreMCF];
    
    token = [[NSUserDefaults standardUserDefaults] stringForKey:@"ktoken"];
    localUserId = [[NSUserDefaults standardUserDefaults] stringForKey:@"klocalUserId"];

    typeOfGameString = @"Full Name";
    
    enlargedImageClearBackground.hidden = true;
    forgotPasswordView.hidden = true;
    editAccountView.hidden = true;
    nameView.hidden = true;
    MCGameView.hidden=true;
    firstView.hidden=false;
    MCTGameView.hidden=true;
    FCView.hidden=true;
    MCCView.hidden = true;
    FGameView.hidden = true;
    FCView.hidden = true;
    FTGameView.hidden = true;
    personPic.hidden = true;
    showInfoButton.hidden = true;
    nameAndButtonsView.hidden = true;
    FilterView.hidden = true;
    deptTitleField.hidden = true;
    jobTitleField.hidden = true;
    gameOverView.hidden = true;
    filteringIndicator.hidesWhenStopped = true;
    moreInfoView.hidden =true;
    nameView.hidden = true;
    infoButton.hidden = true;
    hintButton.hidden = true;
    practiceModeSwitch.on = false;
    mCFacesView.hidden = true;
    timerView.hidden = true;
    nextButtonMCF.hidden = true;
    iBMCF1.hidden = true;
    iBMCF2.hidden = true;
    iBMCF3.hidden = true;
    iBMCF4.hidden = true;
    iTIMCF1.hidden = true;
    iTIMCF2.hidden = true;
    iTIMCF3.hidden = true;
    iTIMCF4.hidden = true;
    fromOrTo.hidden = true;
    statsView.hidden = true;
    settingsView.hidden = true;
    leaderBoardView.hidden = true;
    actualLeaderboardView.hidden = true;
    iBMCN1.hidden = true;
    iBMCN2.hidden = true;
    iBMCN3.hidden = true;
    iBMCN4.hidden = true;
    hardFlashcardGuessView.hidden = true;

    signInView.hidden = true;
    registrationView.hidden = true;
    
    mostTimeIntMCN =0;
    mostTimeIntMCF =0;
    mostTimeIntF =0;

    dateSwitch.on = false;
    
    
    [signUpScrollView setScrollEnabled:YES];
    [signUpScrollView setContentSize:CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height + signUpButton.center.y + signUpButton.bounds.size.height)];
    
    [labelsScrollView setScrollEnabled:YES];
    [labelsScrollView setContentSize:CGSizeMake(labelsScrollView.bounds.size.width, 115)];

    [statsScrollView setScrollEnabled:YES];
    [statsScrollView setContentSize:CGSizeMake(320, 798)];
    
    [settingsScrollView setScrollEnabled:YES];
    [settingsScrollView setContentSize:CGSizeMake(320, 670)];
    
    [super viewDidLoad];
    
    [practiceModeSwitch setOn:YES animated:NO];
    
    [self playSoundNamed:@"Cheers Theme" andType:@"m4a" andFX:false];

    hintLabel.text = [NSString stringWithFormat:@"H:%i", 2-numberOfHintsPressed];

    
    [self authenticatePlayer];
    
    uniqueDepartmentsArray = [[NSMutableArray alloc]init];
    uniqueCompaniesArray = [[NSMutableArray alloc]init];
    uniqueJobTitlesArray = [[NSMutableArray alloc]init];
    numInJobTitles = [[NSMutableArray alloc]init];
    numInCompanies = [[NSMutableArray alloc]init];
    numInDepartments = [[NSMutableArray alloc]init];

    noneSpecifiedCompany = [[UISwitch alloc] init];
    noneSpecifiedDepartment = [[UISwitch alloc] init];
    noneSpecifiedJobTitle = [[UISwitch alloc] init];

    noneSpecifiedCompany.on = true;
    noneSpecifiedDepartment.on = true;
    noneSpecifiedJobTitle.on = true;
    
    filteringIndicator = [[UIActivityIndicatorView alloc]init];
    arrayOf50PercentAndOver = [[NSMutableArray alloc]init];
    [moreInfoScrollView setScrollEnabled:YES];
    [moreInfoScrollView setContentSize:CGSizeMake(moreInfoScrollView.bounds.size.width, 310)];
    
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusDenied ||
        ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusRestricted){
        //1
        NSLog(@"Denied");
    } else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized){
        //2
        NSLog(@"Authorized");
    } else{ //ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined
        //3
        NSLog(@"Not determined");
        ABAddressBookRequestAccessWithCompletion(ABAddressBookCreateWithOptions(NULL, nil), ^(bool granted, CFErrorRef error) {
            if (!granted){
                //4
                NSLog(@"Just denied");
                return;
            }
            //5
            NSLog(@"Just authorized");
            
        });
    }
    
    viewDidLoadString = @"Loaded";
    

    
    if(token.length > 0 && localUserId.length > 0)
    {
        [self animateOut:signInView];

        defaults = [NSUserDefaults standardUserDefaults];
        
        companySwitchSetting.on =  [defaults boolForKey:@"kcompanyBool"];
        departmentSwitchSetting.on =   [defaults boolForKey:@"kdepartmentBool"];
        dateSwitchSetting.on =   [defaults boolForKey:@"kdateBool"];
        jobTitleSwitchSetting.on =   [defaults boolForKey:@"kjobTitleBool"];
        musicSwitchSetting.on =   [defaults boolForKey:@"kmusicBool"];
        fxSwitchSetting.on =   [defaults boolForKey:@"kfxBool"];
        percentMissedSwichSetting.on =  [defaults boolForKey:@"kmissedBool"];
        
        [companySwitchSetting setOn:[defaults boolForKey:@"kcompanyBool"] animated:YES];
        [departmentSwitchSetting setOn:[defaults boolForKey:@"kdepartmentBool"] animated:YES];
        [dateSwitchSetting setOn:[defaults boolForKey:@"kdateBool"] animated:YES];
        [jobTitleSwitchSetting setOn:[defaults boolForKey:@"kjobTitleBool"] animated:YES];
        [musicSwitchSetting setOn:[defaults boolForKey:@"kmusicBool"] animated:YES];
        [fxSwitchSetting setOn:[defaults boolForKey:@"kfxBool"] animated:YES];
        [percentMissedSwichSetting setOn:[defaults boolForKey:@"kmissedBool"] animated:YES];

    }
    else //new user or re-logging in so reset preset
    {
        companySwitchSetting.on =  true;
        departmentSwitchSetting.on =  true;
        dateSwitchSetting.on =  true;
        jobTitleSwitchSetting.on =  false;
        musicSwitchSetting.on =  true;
        fxSwitchSetting.on =  true;
        percentMissedSwichSetting.on = true;
        
        defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setBool:companySwitchSetting.on forKey:kcompanyBool];
        [defaults setBool:departmentSwitchSetting.on forKey:kdepartmentBool];
        [defaults setBool:dateSwitchSetting.on forKey:kdateBool];
        [defaults setBool:jobTitleSwitchSetting.on forKey:kjobTitleBool];
        [defaults setBool:musicSwitchSetting.on forKey:kmusicBool];
        [defaults setBool:fxSwitchSetting.on forKey:kfxBool];
        [defaults setBool:percentMissedSwichSetting.on forKey:kmissedBool];
        [defaults synchronize];
    }
    
    [self updateCurrentFilters];
    typeOfGame.text = @"";
}
-(NSArray *)addInfoFromSavedData {
    NSArray *allThePeople = [[NSMutableArray alloc] init];
    NSUserDefaults *theDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [theDefaults objectForKey:@"dataKey"];
    allThePeople = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSLog(@"How Many People Can We Get? - %lu",(unsigned long)allThePeople.count);
    
    totalPeople = (int)allThePeople.count;
    
    for (int i = 0; i<allThePeople.count; i++)
    {
        Person *thisGuy = [[Person alloc]init];
        thisGuy = [allThePeople objectAtIndex:i];
    }
    return allThePeople;
    
}
-(void)saveData{
    NSUserDefaults *theDefaults = [NSUserDefaults standardUserDefaults];
    NSData *theData = [NSKeyedArchiver archivedDataWithRootObject:allPeople];
    [theDefaults setObject:theData forKey:@"dataKey"];
    [theDefaults synchronize];
}
-(void)respondToNumInARow{
    if(numInARow == 25)
    {
        //play some cool animation
        seconds-=5;
    }
    if(seconds < 0)
    {
        seconds = 60 + seconds;
        minutes--;
    }
    else if(seconds <= 9)
    {
        timerLable.text = [NSString stringWithFormat:@"%i:0%i", minutes,seconds];
    }
    else
    {
        timerLable.text = [NSString stringWithFormat:@"%i:%i", minutes,seconds];
    }
    if(seconds == 60)
    {
        seconds = 0;
        //timerLableSeconds.text = [NSString stringWithFormat:@"0%i", countUpValue];
        
        minutes +=1;
        timerLable.text = [NSString stringWithFormat:@"%i:0%i", minutes,seconds];
    }

}
-(void)printHighScoreMCF{
    if(practiceModeSwitch.isOn == false)
    {
        if(currentScoreMCF > highscoreMCF)
        {
            percentage = [[NSString alloc]init];
            percentage = [NSString stringWithFormat:@"%i",(int)round(totalPercentage*100)];
            
            numInGame = [[NSString alloc]init];
            numInGame = [NSString stringWithFormat:@"%i",(int)totalGuessed];
            highscoreMCF = currentScoreMCF;
            [self playSoundNamed:@"Cheers Theme" andType:@"m4a" andFX:true];
            
            defaults = [NSUserDefaults standardUserDefaults];
            NSInteger i = (NSInteger) highscoreMCF;
            [defaults setInteger:i forKey:khighscoreMCF];
            [defaults synchronize];

            
            pointsLabel.text = [NSString stringWithFormat:@"NEW HIGH SCORE! %i", currentScoreMCF];
            
            //this is done badly - the leaderboard Id should not be hardcoded
            
            
            NSString *string = [NSString stringWithFormat:@"%@/api/scores", BaseURLString];
            NSString *scoreValueString = [NSString stringWithFormat:@"%i", currentScoreMCF];
            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
            [manager.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
            [manager POST:string
               parameters:@{@"scoreValue": scoreValueString, @"userId": localUserId,@"leaderboardId": @"3",@"scoreNumberOfContacts":numInGame,@"scorePercentage":percentage}
                  success:^(AFHTTPRequestOperation *operation, id responseObject)
             {
                 //NSLog(@"posted score");
             } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 NSLog(@"Error: %@", error);
                 UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Posting Score"
                                                                     message:@""//[error localizedDescription]
                                                                    delegate:nil
                                                           cancelButtonTitle:@"Ok"
                                                           otherButtonTitles:nil];
                 [alertView show];
                 
             }];
        }
        else
        {
            pointsLabel.text = [NSString stringWithFormat:@"You scored %i", currentScoreMCF];
        }
    }

    if((double)totalSeconds/totalCorrect < bestTimeMCF)
    {
        bestTimeMCF = (double)totalSeconds/totalCorrect;
        defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:bestTimeMCF forKey:kbestTimeMCF];
        [defaults synchronize];
    }
    currentScoreMCF = 0;
}
-(void)printHighScoreMCN{
    if(practiceModeSwitch.isOn == false)
    {
        if(currentScoreMCN > highscoreMCN)
        {
            percentage = [[NSString alloc]init];
            percentage = [NSString stringWithFormat:@"%i",(int)round(totalPercentage*100)];
            
            numInGame = [[NSString alloc]init];
            numInGame = [NSString stringWithFormat:@"%i",(int)totalGuessed];
            
            highscoreMCN = currentScoreMCN;
            NSInteger i = (NSInteger) highscoreMCN;
            [self playSoundNamed:@"Cheers Theme" andType:@"m4a" andFX:true];
            defaults = [NSUserDefaults standardUserDefaults];
            [defaults setInteger:i forKey:khighscoreMCN];
            [defaults synchronize];

            pointsLabel.text = [NSString stringWithFormat:@"NEW HIGH SCORE! %i", currentScoreMCN];
            
            //this is done badly - the leaderboard Id should not be hardcoded in but it is.
            
            NSString *string = [NSString stringWithFormat:@"%@/api/scores", BaseURLString];
            NSString *scoreValueString = [NSString stringWithFormat:@"%i", currentScoreMCN];
            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
            [manager.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
            [manager POST:string
               parameters:@{@"scoreValue": scoreValueString, @"userId": localUserId,@"leaderboardId": @"2",@"scoreNumberOfContacts":numInGame,@"scorePercentage":percentage}
                  success:^(AFHTTPRequestOperation *operation, id responseObject)
             {
                 //NSLog(@"posted score");
             } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 NSLog(@"Error: %@", error);
                 UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Posting Score"
                                                                     message:@""//[error localizedDescription]
                                                                    delegate:nil
                                                           cancelButtonTitle:@"Ok"
                                                           otherButtonTitles:nil];
                 [alertView show];
                 
             }];
        }
        else
        {
            pointsLabel.text = [NSString stringWithFormat:@"You scored %i", currentScoreMCN];
        }
        if((double)totalSeconds/totalCorrect < bestTimeMCN)
        {
            bestTimeMCN = (double)totalSeconds/totalCorrect;
            NSInteger i = (NSInteger) bestTimeMCN;
            defaults = [NSUserDefaults standardUserDefaults];
            [defaults setInteger:i forKey:kbestTimeMCN];
            [defaults synchronize];
        }
    }
    else
    {
        percentLabel.text = @"YOU HAVE NOW GUESSED EVERY PERSON RIGHT AT LEAST ONCE";
        pointsLabel.text = @"TURN OFF PRACTICE MODE TO PLAY FOR POINTS";
    }
    currentScoreMCN = 0;
}
-(void)printHighScore{
    pointsLabel.text = @"NO POINTS AWARDED FOR FLASHCARD GAME";
}
-(NSMutableArray*)chooseArray{
    if(practiceModeSwitch.isOn == true)//not timed game
    {
        if(arrayOf50PercentAndOver.count > 0 || arrayOf49PercentAndUnder.count>0)
        {
            if(arrayOf50PercentAndOver.count > 0 && arrayOf49PercentAndUnder.count > 0)
            {
                int rn;
                rn = (rand()%10);
                if(rn <= 3 && arrayOf50PercentAndOver.count > 0)
                {
                    
                    return arrayOf50PercentAndOver;
                }
                else
                {
                    
                    return arrayOf49PercentAndUnder;
                }
            }
            else if(arrayOf49PercentAndUnder.count > 0 && arrayOf50PercentAndOver.count == 0)
            {
                
                return arrayOf49PercentAndUnder;
                
            }
            else if(arrayOf50PercentAndOver.count > ((arrayOf49PercentAndUnder.count+arrayOf50PercentAndOver.count)/2) && arrayOf49PercentAndUnder.count == 0)
            {
                
                return arrayOf50PercentAndOver;
            }
            
        }
    }
    else if(practiceModeSwitch.isOn ==true)
    {
        if(arrayOf49PercentAndUnder.count>0)
        {
            return arrayOf49PercentAndUnder;
        }
        else
        {
            //game over, they have done every person in the array right
        }
    }
    return currentPeopleArray;
    
}
-(void)loadNewPerson{
    if(practiceModeSwitch.isOn == true)
    {
        if (currentPerson.returnPercentage < 0.5)
        {
            //if(arrayOf50PercentAndOver.count > 0) // the 1 is intentional, in order to add objects to the array the array must have at least one object
            //{
            //idk how to right now but eventually we'll need to test to make sure the person is not already in this array and if it is not then we can remove it from the other and add it to this one
            if ([self isObjectIdenticalTo:currentPerson inArray:arrayOf50PercentAndOver]==true)
            {
                [arrayOf49PercentAndUnder addObject:currentPerson];
                [arrayOf50PercentAndOver removeObjectIdenticalTo:currentPerson];
            }

            //}
        }
        else if (currentPerson.returnPercentage >= 0.5)
        {
            //if(arrayOf49PercentAndUnder.count > 0)// the 1 is intentional, in order to add objects to the array the array must have at least one
            //{
            //idk how to right now but eventually we'll need to test to make sure the person is not already in this array and if it is not then we can remove it from the other and add it to this one
            if ([self isObjectIdenticalTo:currentPerson inArray:arrayOf49PercentAndUnder]==true)
            {
                [arrayOf50PercentAndOver addObject:currentPerson];
                [arrayOf49PercentAndUnder removeObjectIdenticalTo:currentPerson];
            }
        }
        
        if(arrayOf49PercentAndUnder.count > 0)
        {
            //load new array
            NSMutableArray*currentArray;
            currentArray = [self chooseArray];
            int x;
            x =(currentArray.count-1);
            if(x == 0)
            {
                j = 0;
            }
            else
            {
                j = rand()%x;
            }
            currentPerson = [currentArray objectAtIndex:j];
            
            personPic.image = [currentPerson selfImage];
            

        }
        else
        {
            //game ends
            //go to view that shows stats

            [self animateOut:FTGameView];
            
            [arrayOf49PercentAndUnder removeAllObjects];
            [arrayOf50PercentAndOver removeAllObjects];
            addedPoints.hidden = true;

            [self animateIn:gameOverView];

            timerView.hidden=false;
            numInARow =0;

            totalPercentage = (totalCorrect/totalGuessed);

            percentLabel.text = [NSString stringWithFormat:@"YOU GOT %d%% (%f OUT OF %f) IN %i:%i",(int)round(totalPercentage*100),totalCorrect,totalGuessed,minutes,seconds];
            [self printHighScore];
            [self updateAchievements];
            currentScore = 0;

            [self saveData];
        }
    }
    if(practiceModeSwitch.isOn == false)
    {
        NSMutableArray*currentArray;
        currentArray = [self chooseArray];
        int x;
        x =(currentArray.count-1);
        if(x == 0)
        {
            j = 0;
        }
        else
        {
            j = rand()%x;
        }
        currentPerson = [currentArray objectAtIndex:j];
        
        personPic.image = [currentPerson selfImage];
        
        
        //nameAndButtonsView.hidden = true;
    }

}
-(BOOL)prefersStatusBarHidden{
    return YES;
}
-(void)addJob:(NSString*)str{
    if([self checkForString:str inArray:uniqueJobTitlesArray]==false && str.length > 0)
    {
        [uniqueJobTitlesArray addObject:str];
        NSString* x = @"1";
        [numInJobTitles addObject:x];
        ++ totalInJobTitles;
    }
    else if(str.length >0)
    {
        ++totalInJobTitles;
        for(int i =0; i < uniqueJobTitlesArray.count; i++)
        {
            NSString *sIQ;
            sIQ = [uniqueJobTitlesArray objectAtIndex:i];
            if([sIQ isEqualToString: str])
            {
                NSString*iIQ;
                iIQ = [numInJobTitles objectAtIndex:i];
                int x;
                x = [iIQ integerValue];
                ++x;
                iIQ = [NSString stringWithFormat:@"%i",x];
                [numInJobTitles replaceObjectAtIndex:i withObject:iIQ];
            }
        }
    }
}
-(void)addCompany:(NSString*)str{
    if([self checkForString:str inArray:uniqueCompaniesArray]==false && str.length > 0)
    {
        [uniqueCompaniesArray addObject:str];
        NSString* x = @"1";
        [numInCompanies addObject:x];
        ++totalInCompanies;
    }
    else if(str.length >0)
    {
        ++totalInCompanies;
        for(int i =0; i < uniqueCompaniesArray.count; i++)
        {
            NSString *sIQ;
            sIQ = [uniqueCompaniesArray objectAtIndex:i];
            if([sIQ isEqualToString: str])
            {
                NSString*iIQ;
                iIQ = [numInCompanies objectAtIndex:i];
                int x;
                x = [iIQ integerValue];
                ++x;
                iIQ = [NSString stringWithFormat:@"%i",x];
                [numInCompanies replaceObjectAtIndex:i withObject:iIQ];
            }
        }
    }
}
-(void)addDepartment:(NSString*)str{
    if([self checkForString:str inArray:uniqueDepartmentsArray]==false && str.length > 0)
    {
        [uniqueDepartmentsArray addObject:str];
        NSString* x = @"1";
        [numInDepartments addObject:x];
        ++totalInDepartments;
    }
    else if(str.length >0)
    {
        ++totalInDepartments;
        for(int i =0; i < uniqueDepartmentsArray.count; i++)
        {
            NSString *sIQ;
            sIQ = [uniqueDepartmentsArray objectAtIndex:i];
            if([sIQ isEqualToString: str])
            {
                NSString*iIQ;
                iIQ = [numInDepartments objectAtIndex:i];
                int x;
                x = [iIQ integerValue];
                ++x;
                iIQ = [NSString stringWithFormat:@"%i",x];
                [numInDepartments replaceObjectAtIndex:i withObject:iIQ];
            }
        }
    }
}
-(void)addFieldsFromArray:(NSMutableArray *)array{
    for (int t=0; t<array.count; t++)
    {
        Person*p;
        p = [array objectAtIndex:t];
        [self addDepartment:p.department];
        [self addCompany:p.company];
        [self addJob:p.jobTitle];
    }
}
-(NSMutableArray*)getContactsWithCompany:(NSString*)company fromArray:(NSMutableArray*)array{
    NSMutableArray*finalPeople;
    finalPeople = [[NSMutableArray alloc]init];
    
    for (int l = 0; l < array.count; l++)
    {
        
        Person *p;
        p = [[Person alloc]init];
        p = [array objectAtIndex:l];
        
        if([company containsString:@"None Specified"] && p.company.length == 0 && [self isObjectIdenticalTo:p inArray:finalPeople] == false)
        {
            [finalPeople addObject:p];
        }
        else if ([p.company isEqualToString: company])
        {
            if ([self isObjectIdenticalTo:p inArray:arrayOf49PercentAndUnder] == false)
            {
                [finalPeople addObject:p];
            }
        }
}
    
    return finalPeople;
}
-(NSMutableArray*)getContactsWithJobTitle:(NSString*)jobTitle fromArray:(NSMutableArray*)array{
    NSMutableArray*finalPeople = [[NSMutableArray alloc]init];
    for (int i = 0; i<filterJobTitlesSwitches.count; i++)
    {
        jobTitle = [filterJobTitlesText objectAtIndex:i];
        if ([[filterJobTitlesSwitches objectAtIndex:i] isOn] == true)
        {
            
            for (int l = 0; l < array.count; l++)
            {
                Person *p;
                p = [[Person alloc]init];
                p = [array objectAtIndex:l];
                if([jobTitle containsString:@"None Specified"] && p.jobTitle.length == 0 && [self isObjectIdenticalTo:p inArray:finalPeople] == false)
                {
                    [finalPeople addObject:p];
                }
                if([p.jobTitle isEqualToString:[filterJobTitlesText objectAtIndex:i]] && [self isObjectIdenticalTo:p inArray:finalPeople] == false)
                {
                    [finalPeople addObject:p];
                }
            }
        }
    }
    return finalPeople;
}
-(NSMutableArray*)getContactsWithPercentage:(NSString*)percentage fromArray:(NSMutableArray*)array{
    if(missedSwitch.isOn == true)
    {
        NSMutableArray*finalPeople = [[NSMutableArray alloc]init];
        for (int l = 0 ; l<array.count; l++) {
            Person *p;
            p = [[Person alloc]init];
            p = [array objectAtIndex:l];

            if([p returnPercentage]*100 <= [percentage doubleValue])
            {
                [finalPeople addObject:p];
            }
        }
        return finalPeople;
    }
    else
    {
        return  array;
    }
}
-(NSMutableArray*)getContactsWithDateFromArray:(NSMutableArray*)array{
    if(dateSwitch.isOn == true)
    {
        NSMutableArray*finalPeople = [[NSMutableArray alloc]init];
        for (int l = 0; l < array.count; l++)
        {
            Person *p;
            p = [[Person alloc]init];
            p = [array objectAtIndex:l];
            NSDateFormatter*dF = [[NSDateFormatter alloc]init];
            [dF setDateFormat:@"MM/dd/yy"];
            
            
            if((([p.date laterDate:[dF dateFromString:toField.text]] != p.date && [p.date laterDate:[dF dateFromString:fromField.text]] == p.date))&& [self isObjectIdenticalTo:p inArray:finalPeople] == false)// || ( p.date == NULL))
            {
                [finalPeople addObject:p];
            }
        }
        return finalPeople;
    }
    else
    {
        return array;
    }
}
-(NSMutableArray*)getContactsWithDepartment:(NSString*)dept fromArray:(NSMutableArray*)array{
    NSMutableArray*finalPeople = [[NSMutableArray alloc]init];
    for (int i = 0; i<filterDepartmentSwitches.count; i++)
    {
        if ([[filterDepartmentSwitches objectAtIndex:i] isOn] == true)
        {
            dept = [filterDepartmentText objectAtIndex:i];
            for (int l = 0; l < array.count; l++)
            {
                Person *p;
                p = [[Person alloc]init];
                p = [array objectAtIndex:l];
                if([dept containsString:@"None Specified"] && p.department.length == 0 && [self isObjectIdenticalTo:p inArray:finalPeople] == false)
                {
                    [finalPeople addObject:p];
                }
                if([p.department isEqualToString:[filterDepartmentText objectAtIndex:i]] && [self isObjectIdenticalTo:p inArray:finalPeople] == false)
                {
                    [finalPeople addObject:p];
                }
            }
        }
    }
    return finalPeople;
}
-(void)readValues{
    [arrayOf49PercentAndUnder removeAllObjects];
    [arrayOf50PercentAndOver removeAllObjects];
    
    arrayOf49PercentAndUnder = [[NSMutableArray alloc]init];
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:Font forKey:NSFontAttributeName];
    [filters setTitleTextAttributes:attributes forState:UIControlStateNormal];

    if(filters.numberOfSegments > 0)
    {
        for (int i = 0; i<filterCompanySwitches.count; i++)
        {
            if ([[filterCompanySwitches objectAtIndex:i] isOn])
            {
                //so because the mscontact manipulater was not working i decided that we could just use the array allpeople instead, and then filter out the ones we dont want with a method i created. the method is similar to the getContactsWithCompany method, the only difference is it works;)
                
                [arrayOf49PercentAndUnder addObjectsFromArray: [self getContactsWithCompany:[filterCompanyText objectAtIndex:i] fromArray:allPeople]];
            }
        }
        alert = [[UIAlertView alloc] initWithTitle:@"Oops..." message:@"You have filtered out every person, therfore you cannot be tested." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:NULL, nil];
        arrayOf49PercentAndUnder = [self getContactsWithDateFromArray:arrayOf49PercentAndUnder];
        arrayOf49PercentAndUnder = [self getContactsWithDepartment:@"test:" fromArray:arrayOf49PercentAndUnder];
        arrayOf49PercentAndUnder = [self getContactsWithJobTitle:@"test" fromArray:arrayOf49PercentAndUnder];
        arrayOf49PercentAndUnder = [self getContactsWithPercentage:percentField.text fromArray:arrayOf49PercentAndUnder];
        
        
        if(arrayOf49PercentAndUnder.count == 0)
        {
            [self animateIn:FilterView];
            [alert show];

        }
        
        if([typeOfGame.text isEqualToString:@"Multiple Choice Faces"] || [typeOfGame.text isEqualToString:@"Multiple Choice Names"])
        {
            alert = [[UIAlertView alloc] initWithTitle:@"Oops..." message:@"In a Multiple Choice Game you must have at least four people." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:NULL, nil];
            if(arrayOf49PercentAndUnder.count < 4)
            {
                [self animateIn:FilterView];

                [alert show];
            }
        }
        else if (arrayOf49PercentAndUnder.count > 0)
        {

            NSMutableArray* currentArray;
            currentArray = arrayOf49PercentAndUnder;
            j = rand()%arrayOf49PercentAndUnder.count;
            currentPerson =[currentArray objectAtIndex:j];
            currentPeopleArray = currentArray;
            personPic.image = [currentPerson selfImage];
            numOfContactsLeftLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)arrayOf49PercentAndUnder.count];
        }
    }
    else
    {
        arrayOf49PercentAndUnder = [[NSMutableArray alloc]init];
        [arrayOf49PercentAndUnder addObjectsFromArray:allPeople];
        if((arrayOf49PercentAndUnder.count > 0 && [typeOfGame.text isEqualToString:@"Flashcard Game"]) || (([typeOfGame.text isEqualToString:@"Multiple Choice Faces"] || [typeOfGame.text isEqualToString:@"Multiple Choice Names"]) && arrayOf49PercentAndUnder.count > 3))
        {
            NSMutableArray* currentArray;
            currentArray = arrayOf49PercentAndUnder;
            j = rand()%arrayOf49PercentAndUnder.count;
            currentPerson =[currentArray objectAtIndex:j];
            currentPeopleArray = currentArray;
            personPic.image = [currentPerson selfImage];
            
            numOfContactsLeftLabel.text = [NSString stringWithFormat:@"%i",arrayOf49PercentAndUnder.count];
        }

    }

    numOfContactsLeftLabel.text = [NSString stringWithFormat:@"%i",arrayOf49PercentAndUnder.count];

}
-(void)fillArray:(NSMutableArray *)a fromArray:(NSMutableArray *)b{
    for (int l = 0; l < b.count; l++)
    {
        [a addObject:[b objectAtIndex:l]];
    }
}
-(void)swichValueChanged:(NSMutableArray*)switchArray fromSwitch: (id)sender{
    if ([[switchArray objectAtIndex:0] isOn] && sender == [switchArray objectAtIndex:0] )
    {
        for (int i = 0; i<switchArray.count; i++)
        {
            [[switchArray objectAtIndex:i] setOn:YES animated:YES];
        }
    }
    else if ([[switchArray objectAtIndex:0] isOn]==false && sender == [switchArray objectAtIndex:0] )
    {
        for (int i = 0; i<switchArray.count; i++)
        {
            [[switchArray objectAtIndex:i] setOn:NO animated:YES];
        }
    }
}
-(void)companySwitchValueChanged:(id)sender{
    if ([[filterCompanySwitches objectAtIndex:0] isOn] && sender == [filterCompanySwitches objectAtIndex:0] )
    {
        for (int i = 0; i<filterCompanySwitches.count; i++)
        {
            [[filterCompanySwitches objectAtIndex:i] setOn:YES animated:YES];
        }
    }
    else if ([[filterCompanySwitches objectAtIndex:0] isOn]==false && sender == [filterCompanySwitches objectAtIndex:0] )
    {
        for (int i = 0; i<filterCompanySwitches.count; i++)
        {
            [[filterCompanySwitches objectAtIndex:i] setOn:NO animated:YES];
        }
    }
    
}
-(void)departmentSwitchValueChanged:(id)sender{
    if ([[filterDepartmentSwitches objectAtIndex:0] isOn] && sender == [filterDepartmentSwitches objectAtIndex:0] )
    {
        for (int i = 0; i<filterDepartmentSwitches.count; i++) {
            [[filterDepartmentSwitches objectAtIndex:i] setOn:YES animated:YES];
        }
    }
    else if ([[filterDepartmentSwitches objectAtIndex:0] isOn]==false && sender == [filterDepartmentSwitches objectAtIndex:0] )
    {
        for (int i = 0; i<filterDepartmentSwitches.count; i++)
        {
            [[filterDepartmentSwitches objectAtIndex:i] setOn:NO animated:YES];
        }
    }
    
}
-(void)jobTitleSwitchValueChanged:(id)sender {
    if ([[filterJobTitlesSwitches objectAtIndex:0] isOn] && sender == [filterJobTitlesSwitches objectAtIndex:0] )
    {
        for (int i = 0; i<filterJobTitlesSwitches.count; i++)
        {
            [[filterJobTitlesSwitches objectAtIndex:i] setOn:YES animated:YES];
        }
    }
    else if ([[filterJobTitlesSwitches objectAtIndex:0] isOn]==false && sender == [filterJobTitlesSwitches objectAtIndex:0] )
    {
        for (int i = 0; i<filterJobTitlesSwitches.count; i++)
        {
            [[filterJobTitlesSwitches objectAtIndex:i] setOn:NO animated:YES];
        }
    }
    
    
}
-(NSArray*)sortByPercentageArrayOfPeople:(NSMutableArray*)array{
    NSMutableArray *lessArray = [[NSMutableArray alloc] init] ;
    NSMutableArray *greaterArray =[[NSMutableArray alloc] init] ;
    if ([array count] <1)
    {
        return nil;
    }
    int randomPivotPoint = arc4random() % [array count];
    Person *pIQ;
    pIQ =[array objectAtIndex:randomPivotPoint];

    double pivotValue = [pIQ returnPercentage];
    [array removeObjectAtIndex:randomPivotPoint];
    for (Person *p in array)
    {
        //quickSortCount++; //This is required to see how many iterations does it take to sort the array using quick sort
        if ([p returnPercentage] < pivotValue)
        {
            [lessArray addObject:p];
        }
        else
        {
            [greaterArray addObject:p];
        }
    }
    
    NSMutableArray *sortedArray = [[NSMutableArray alloc] init];
    [sortedArray addObjectsFromArray:[self sortByPercentageArrayOfPeople:lessArray]];
    [sortedArray addObject:pIQ];
    [sortedArray addObjectsFromArray:[self sortByPercentageArrayOfPeople:greaterArray]];
    
    return sortedArray;
    
}
-(void)loadLabels:(NSString *)labelType{
    //numSelectedLabel.text = [NSString stringWithFormat:@"%i Contacts Selected",totalPeople];
    numSelected = totalPeople;
    if ([labelType  isEqual: @"Date"])
    {
        iV.hidden = false;
        percentView.hidden = true;
        
        date.hidden = false;
        datepickerBackground.hidden = false;
    }
    else if([labelType  isEqual: @"Missed"])
    {
        iV.hidden = true;
        percentView.hidden = false;
        date.hidden=true;
        datepickerBackground.hidden = true;
    }
    else
    {
        iV.hidden = true;
        percentView.hidden = true;
        date.hidden=true;
        datepickerBackground.hidden=true;
        
        UILabel *newLabel = [[UILabel alloc]init];
        newLabel.text = [NSString stringWithFormat:@"All (%i)",totalPeople];
        [labelsScrollView addSubview:newLabel];
        newLabel.bounds  = CGRectMake(100, 10, 170, 30);
        newLabel.center = CGPointMake(100, 35);
        newLabel.textColor= [UIColor whiteColor];
        newLabel.font = Font;
        [labelsScrollView insertSubview:newLabel atIndex:0];
        UISwitch *switchThing = [[UISwitch alloc] init];
        [labelsScrollView addSubview:switchThing];
        switchThing.center = CGPointMake(220, 36);
        switchThing.on = true;
        switchThing.onTintColor = fxSwitchSetting.onTintColor;
        
        
        
        if([labelType isEqual:@"Company"]) {
            if (filterCompanyText.count == 0 || filterCompanyText.count == 1)
            {
                UILabel *noneSpecified = [[UILabel alloc]init];
                noneSpecified.text = [NSString stringWithFormat:@"None Specified (%i)", totalPeople-totalInCompanies];
                [labelsScrollView addSubview:noneSpecified];
                noneSpecified.bounds  = CGRectMake(100, 10, 170, 30);
                noneSpecified.center = CGPointMake(100, 75);
                noneSpecified.textColor= [UIColor whiteColor];
                noneSpecified.font = Font;
                [labelsScrollView insertSubview:noneSpecified atIndex:1];
                [labelsScrollView addSubview:noneSpecifiedCompany];
                noneSpecifiedCompany.center = CGPointMake(220, 76);
                noneSpecifiedCompany.onTintColor = fxSwitchSetting.onTintColor;
                //SEL theSelector = @selector(companySwitchValueChanged:);
                //[switchThing addTarget:self action:@selector(companySwitchValueChanged:)  forControlEvents:UIControlEventValueChanged];
                
                [filterCompanySwitches removeAllObjects];
                [filterCompanyText removeAllObjects];
                //this new label is the all new label
                [filterCompanyText addObject:newLabel.text];
                [filterCompanySwitches addObject:switchThing];
                [filterCompanyText addObject:noneSpecified.text];
                [filterCompanySwitches addObject:noneSpecifiedCompany];
                
                //uniqueCompaniesArray = [uniqueCompaniesArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                
                for (int i =0 ; i<uniqueCompaniesArray.count; i++)
                {
                    
                    UILabel *newLabel = [[UILabel alloc]init];
                    newLabel.text = [uniqueCompaniesArray objectAtIndex:i];
                    [filterCompanyText addObject:newLabel.text];
                    newLabel.text = [NSString stringWithFormat:@"%@ (%@)", newLabel.text, [numInCompanies objectAtIndex:i]];
                    [labelsScrollView addSubview:newLabel];
                    newLabel.bounds  = CGRectMake(100, 10, 170, 30);
                    newLabel.center = CGPointMake(100, 115+(40*i));
                    newLabel.textColor= [UIColor whiteColor];
                    newLabel.font = Font;
                    [labelsScrollView insertSubview:newLabel atIndex:0];
                    UISwitch *switchThing = [[UISwitch alloc] init];
                    [labelsScrollView setContentSize:CGSizeMake(labelsScrollView.bounds.size.width, 115+(40*uniqueCompaniesArray.count))];
                    [labelsScrollView addSubview:switchThing];
                    switchThing.center = CGPointMake(220, 116+(40*i));
                    switchThing.on=true;
                    switchThing.onTintColor = fxSwitchSetting.onTintColor;
                    [switchThing addTarget:self action:@selector(companySwitchValueChanged:) forControlEvents:UIControlEventValueChanged];
                    [switchThing addTarget:self action:@selector(filterSwitchOn:) forControlEvents:UIControlEventValueChanged];
                    [filterCompanyText addObject:newLabel.text];
                    [filterCompanySwitches addObject:switchThing];
                    
                }
            }
            else
            {
                NSMutableArray *newArray = [[NSMutableArray alloc] init];
                for (int i = 0; i<filterCompanySwitches.count; i++) {
                    bool isiton = [[filterCompanySwitches objectAtIndex:i] isOn];
                    if (isiton)
                    {
                        
                    } else
                    {
                        
                    }
                    [newArray addObject:[NSNumber numberWithBool:isiton]];
                }
                [switchThing addTarget:self action:@selector(companySwitchValueChanged:)  forControlEvents:UIControlEventValueChanged];
                [switchThing addTarget:self action:@selector(filterSwitchOn:) forControlEvents:UIControlEventValueChanged];
                
                switchThing.on = [[filterCompanySwitches objectAtIndex:0] isOn];
                switchThing.onTintColor = fxSwitchSetting.onTintColor;
                
                [filterCompanySwitches removeAllObjects];
                [filterCompanyText removeAllObjects];
                [filterCompanyText addObject:newLabel.text];
                [filterCompanySwitches addObject:switchThing];
                
                UILabel *noneSpecified = [[UILabel alloc]init];
                noneSpecified.text = [NSString stringWithFormat:@"None Specified (%i)", totalPeople-totalInCompanies];
                [labelsScrollView addSubview:noneSpecified];
                noneSpecified.bounds  = CGRectMake(100, 10, 170, 30);
                noneSpecified.center = CGPointMake(100, 75);
                noneSpecified.textColor= [UIColor whiteColor];
                noneSpecified.font = Font;
                [labelsScrollView insertSubview:noneSpecified atIndex:1];
                [labelsScrollView addSubview:noneSpecifiedCompany];
                noneSpecifiedCompany.center = CGPointMake(220, 76);
                noneSpecifiedCompany.onTintColor = fxSwitchSetting.onTintColor;
                [filterCompanyText addObject:noneSpecified.text];
                [filterCompanySwitches addObject:noneSpecifiedCompany];
                
                
                
                
                for (int i =0 ; i<uniqueCompaniesArray.count; i++) {
                    
                    UILabel *newLabel = [[UILabel alloc]init];
                    newLabel.text = [uniqueCompaniesArray objectAtIndex:i];
                    [filterCompanyText addObject:newLabel.text];
                    newLabel.text = [NSString stringWithFormat:@"%@ (%@)", newLabel.text, [numInCompanies objectAtIndex:i]];
                    [labelsScrollView addSubview:newLabel];
                    newLabel.bounds  = CGRectMake(100, 10, 170, 30);
                    newLabel.center = CGPointMake(100, 115+(40*i));
                    newLabel.textColor= [UIColor whiteColor];
                    newLabel.font = Font;
                    [labelsScrollView insertSubview:newLabel atIndex:0];
                    UISwitch *switchThing = [[UISwitch alloc] init];
                    [labelsScrollView setContentSize:CGSizeMake(labelsScrollView.bounds.size.width, 115+(40*uniqueCompaniesArray.count))];
                    [labelsScrollView addSubview:switchThing];
                    switchThing.center = CGPointMake(220, 116+(40*i));
                    [switchThing addTarget:self action:@selector(companySwitchValueChanged:) forControlEvents:UIControlEventValueChanged];
                    switchThing.onTintColor = fxSwitchSetting.onTintColor;
                    [switchThing addTarget:self action:@selector(filterSwitchOn:) forControlEvents:UIControlEventValueChanged];
                    
                    [switchThing setOn:[[newArray objectAtIndex:i+2] boolValue] animated:NO];
                    [filterCompanySwitches addObject:switchThing];
                    
                }
            
            }
            
        }
        
        if ([labelType isEqual:@"Department"]) {
            if (filterDepartmentText.count == 0 || filterDepartmentText.count == 1)
            {
                
                //[switchThing addTarget:self action:@selector(departmentSwitchValueChanged:)  forControlEvents:UIControlEventValueChanged];
                [filterDepartmentSwitches removeAllObjects];
                [filterDepartmentText removeAllObjects];
                [filterDepartmentText addObject:newLabel.text];
                [filterDepartmentSwitches addObject:switchThing];
                
                
                //uniqueDepartmentsArray = [uniqueDepartmentsArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                
                UILabel *noneSpecified = [[UILabel alloc]init];
                noneSpecified.text = [NSString stringWithFormat:@"None Specified (%i)", totalPeople-totalInDepartments];
                [labelsScrollView addSubview:noneSpecified];
                noneSpecified.bounds  = CGRectMake(100, 10, 170, 30);
                noneSpecified.center = CGPointMake(100, 75);
                noneSpecified.textColor= [UIColor whiteColor];
                noneSpecified.font = Font;
                [labelsScrollView insertSubview:noneSpecified atIndex:1];
                [labelsScrollView addSubview:noneSpecifiedDepartment];
                noneSpecifiedDepartment.center = CGPointMake(220, 76);
                noneSpecifiedDepartment.onTintColor = fxSwitchSetting.onTintColor;
                [filterDepartmentText addObject:noneSpecified.text];
                [filterDepartmentSwitches addObject:noneSpecifiedDepartment];
                for (int i =0 ; i<uniqueDepartmentsArray.count; i++) {
                    UILabel *newLabel = [[UILabel alloc]init];
                    newLabel.text = [uniqueDepartmentsArray objectAtIndex:i];
                    [filterDepartmentText addObject:newLabel.text];
                    newLabel.text = [NSString stringWithFormat:@"%@ (%@)", newLabel.text, [numInDepartments objectAtIndex:i]];
                    [labelsScrollView addSubview:newLabel];
                    newLabel.bounds  = CGRectMake(100, 10, 170, 30);
                    newLabel.center = CGPointMake(100, 115+(40*i));
                    newLabel.textColor= [UIColor whiteColor];
                    newLabel.font = Font;
                    [labelsScrollView insertSubview:newLabel atIndex:0];
                    UISwitch *switchThing = [[UISwitch alloc] init];
                    [labelsScrollView setContentSize:CGSizeMake(labelsScrollView.bounds.size.width, 115+(40*uniqueDepartmentsArray.count))];
                    [labelsScrollView addSubview:switchThing];
                    switchThing.center = CGPointMake(220, 116+(40*i));
                    [switchThing addTarget:self action:@selector(departmentSwitchValueChanged:) forControlEvents:UIControlEventValueChanged];
                    [switchThing addTarget:self action:@selector(filterSwitchOn:) forControlEvents:UIControlEventValueChanged];
                    
                    switchThing.on=true;
                    switchThing.onTintColor = fxSwitchSetting.onTintColor;
                    
                    [filterDepartmentSwitches addObject:switchThing];
                    
                }
            }
            else
            {
                NSMutableArray *newArray = [[NSMutableArray alloc] init];
                for (int i = 0; i<filterDepartmentSwitches.count; i++) {
                    bool isiton = [[filterDepartmentSwitches objectAtIndex:i] isOn];
                    [newArray addObject:[NSNumber numberWithBool:isiton]];
                    if (isiton)
                    {
                        
                    } else {
                        
                    }
                }
                SEL theSelector = @selector(companySwitchValueChanged:);
                [switchThing addTarget:self action:@selector(departmentSwitchValueChanged:)  forControlEvents:UIControlEventValueChanged];
                [switchThing addTarget:self action:@selector(filterSwitchOn:) forControlEvents:UIControlEventValueChanged];
                
                switchThing.on = [[filterDepartmentSwitches objectAtIndex:0] isOn];
                switchThing.onTintColor = fxSwitchSetting.onTintColor;
                
                [filterDepartmentSwitches removeAllObjects];
                [filterDepartmentText removeAllObjects];
                [filterDepartmentText addObject:newLabel.text];
                [filterDepartmentSwitches addObject:switchThing];
                
                UILabel *noneSpecified = [[UILabel alloc]init];
                noneSpecified.text = [NSString stringWithFormat:@"None Specified (%i)", totalPeople-totalInDepartments];
                [labelsScrollView addSubview:noneSpecified];
                noneSpecified.bounds  = CGRectMake(100, 10, 170, 30);
                noneSpecified.center = CGPointMake(100, 75);
                noneSpecified.textColor= [UIColor whiteColor];
                noneSpecified.font = Font;
                [labelsScrollView insertSubview:noneSpecified atIndex:1];
                [labelsScrollView addSubview:noneSpecifiedDepartment];
                noneSpecifiedDepartment.center = CGPointMake(220, 76);
                noneSpecifiedDepartment.onTintColor = fxSwitchSetting.onTintColor;
                [filterDepartmentText addObject:noneSpecified.text];
                [filterDepartmentSwitches addObject:noneSpecifiedDepartment];
                
                for (int i =0 ; i<uniqueDepartmentsArray.count; i++) {
                    
                    UILabel *newLabel = [[UILabel alloc]init];
                    newLabel.text = [uniqueDepartmentsArray objectAtIndex:i];
                    [filterDepartmentText addObject:newLabel.text];
                    newLabel.text = [NSString stringWithFormat:@"%@ (%@)", newLabel.text, [numInDepartments objectAtIndex:i]];
                    [labelsScrollView addSubview:newLabel];
                    newLabel.bounds  = CGRectMake(100, 10, 170, 30);
                    newLabel.center = CGPointMake(100, 115+(40*i));
                    newLabel.textColor= [UIColor whiteColor];
                    newLabel.font = Font;
                    [labelsScrollView insertSubview:newLabel atIndex:0];
                    UISwitch *switchThing = [[UISwitch alloc] init];
                    [labelsScrollView setContentSize:CGSizeMake(labelsScrollView.bounds.size.width, 115+(40*uniqueDepartmentsArray.count))];
                    [labelsScrollView addSubview:switchThing];
                    switchThing.center = CGPointMake(220, 116+(40*i));
                    [switchThing addTarget:self action:@selector(departmentSwitchValueChanged:) forControlEvents:UIControlEventValueChanged];
                    [switchThing addTarget:self action:@selector(filterSwitchOn:) forControlEvents:UIControlEventValueChanged];
                    
                    switchThing.onTintColor = fxSwitchSetting.onTintColor;
                    
                    [switchThing setOn:[[newArray objectAtIndex:i+2] boolValue] animated:NO];
                    [filterDepartmentSwitches addObject:switchThing];
                }
                
            }
        }
        if ([labelType isEqual:@"Job Title"]) {
            if (filterJobTitlesText.count == 0) {
                [switchThing addTarget:self action:@selector(jobTitleSwitchValueChanged:)  forControlEvents:UIControlEventValueChanged];
                [switchThing addTarget:self action:@selector(filterSwitchOn:) forControlEvents:UIControlEventValueChanged];
                
                [filterJobTitlesSwitches removeAllObjects];
                [filterJobTitlesText removeAllObjects];
                [filterJobTitlesText addObject:newLabel.text];
                [filterJobTitlesSwitches addObject:switchThing];
                
                // uniqueJobTitlesArray = [uniqueJobTitlesArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                
                UILabel *noneSpecified = [[UILabel alloc]init];
                noneSpecified.text = [NSString stringWithFormat:@"None Specified (%i)", totalPeople-totalInJobTitles];
                [labelsScrollView addSubview:noneSpecified];
                noneSpecified.bounds  = CGRectMake(100, 10, 170, 30);
                noneSpecified.center = CGPointMake(100, 75);
                noneSpecified.textColor= [UIColor whiteColor];
                noneSpecified.font = Font;
                [labelsScrollView insertSubview:noneSpecified atIndex:1];
                [labelsScrollView addSubview:noneSpecifiedJobTitle];
                noneSpecifiedJobTitle.center = CGPointMake(220, 76);
                noneSpecifiedJobTitle.onTintColor = fxSwitchSetting.onTintColor;
                [filterJobTitlesText addObject:noneSpecified.text];
                [filterJobTitlesSwitches addObject:noneSpecifiedJobTitle];
                
                for (int i =0 ; i<uniqueJobTitlesArray.count; i++) {
                    
                    
                    UILabel *newLabel = [[UILabel alloc]init];
                    // newLabel.text = [NSString stringWithFormat:@"%@ (%@)", [uniqueJobTitlesArray objectAtIndex:i],[numInJobTitles objectAtIndex:i]];
                    newLabel.text = [uniqueJobTitlesArray objectAtIndex:i];
                    
                    [labelsScrollView addSubview:newLabel];
                    newLabel.bounds  = CGRectMake(100, 10, 170, 30);
                    newLabel.center = CGPointMake(100, 115+(40*i));
                    newLabel.textColor= [UIColor whiteColor];
                    newLabel.font = Font;
                    [labelsScrollView insertSubview:newLabel atIndex:0];
                    UISwitch *switchThing = [[UISwitch alloc] init];
                    [labelsScrollView setContentSize:CGSizeMake(labelsScrollView.bounds.size.width, 115+(40*uniqueJobTitlesArray.count))];
                    [labelsScrollView addSubview:switchThing];
                    switchThing.center = CGPointMake(220, 116+(40*i));
                    switchThing.on=true;
                    switchThing.onTintColor = fxSwitchSetting.onTintColor;
                    
                    [switchThing addTarget:self action:@selector(jobTitleSwitchValueChanged:) forControlEvents:UIControlEventValueChanged];
                    [switchThing addTarget:self action:@selector(filterSwitchOn:) forControlEvents:UIControlEventValueChanged];
                    
                    [filterJobTitlesText addObject:newLabel.text];
                    [filterJobTitlesSwitches addObject:switchThing];
                    
                }
            } else {
                NSMutableArray *newArray = [[NSMutableArray alloc] init];
                for (int i = 0; i<filterJobTitlesSwitches.count; i++) {
                    bool isiton = [[filterJobTitlesSwitches objectAtIndex:i] isOn];
                    [newArray addObject:[NSNumber numberWithBool:isiton]];
                }
                [switchThing addTarget:self action:@selector(jobTitleSwitchValueChanged:)  forControlEvents:UIControlEventValueChanged];
                [switchThing addTarget:self action:@selector(filterSwitchOn:) forControlEvents:UIControlEventValueChanged];
                
                switchThing.on = [[filterJobTitlesSwitches objectAtIndex:0] isOn];
                [filterJobTitlesSwitches removeAllObjects];
                [filterJobTitlesText removeAllObjects];
                [filterJobTitlesText addObject:newLabel.text];
                [filterJobTitlesSwitches addObject:switchThing];
                
                UILabel *noneSpecified = [[UILabel alloc]init];
                noneSpecified.text = [NSString stringWithFormat:@"None Specified (%i)", totalPeople-totalInJobTitles];
                [labelsScrollView addSubview:noneSpecified];
                noneSpecified.bounds  = CGRectMake(100, 10, 170, 30);
                noneSpecified.center = CGPointMake(100, 75);
                noneSpecified.textColor= [UIColor whiteColor];
                noneSpecified.font = Font;
                [labelsScrollView insertSubview:noneSpecified atIndex:1];
                [labelsScrollView addSubview:noneSpecifiedJobTitle];
                noneSpecifiedJobTitle.center = CGPointMake(220, 76);
                noneSpecifiedJobTitle.onTintColor = fxSwitchSetting.onTintColor;
                
                [filterJobTitlesText addObject:noneSpecified.text];
                [filterJobTitlesSwitches addObject:noneSpecifiedJobTitle];
                
                for (int i =0 ; i<uniqueJobTitlesArray.count; i++) {
                    
                    UILabel *newLabel = [[UILabel alloc]init];
                    //newLabel.text = [NSString stringWithFormat:@"%@ (%@)", [uniqueJobTitlesArray objectAtIndex:i],[numInJobTitles objectAtIndex:i]];
                    newLabel.text = [uniqueJobTitlesArray objectAtIndex:i];
                    [filterJobTitlesText addObject:newLabel.text];
                    newLabel.text = [NSString stringWithFormat:@"%@ (%@)", newLabel.text, [numInJobTitles objectAtIndex:i]];
                    
                    [labelsScrollView addSubview:newLabel];
                    newLabel.bounds  = CGRectMake(100, 10, 170, 30);
                    newLabel.center = CGPointMake(100, 115+(40*i));
                    newLabel.textColor= [UIColor whiteColor];
                    newLabel.font = Font;
                    [labelsScrollView insertSubview:newLabel atIndex:0];
                    UISwitch *switchThing = [[UISwitch alloc] init];
                    [labelsScrollView setContentSize:CGSizeMake(labelsScrollView.bounds.size.width, 115+(40*uniqueJobTitlesArray.count))];
                    [labelsScrollView addSubview:switchThing];
                    switchThing.center = CGPointMake(220, 116+(40*i));
                    [switchThing addTarget:self action:@selector(jobTitleSwitchValueChanged:) forControlEvents:UIControlEventValueChanged];
                    [switchThing addTarget:self action:@selector(filterSwitchOn:) forControlEvents:UIControlEventValueChanged];
                    
                    switchThing.onTintColor = fxSwitchSetting.onTintColor;
                    
                    [switchThing setOn:[[newArray objectAtIndex:i+2] boolValue] animated:NO];
                    [filterJobTitlesSwitches addObject:switchThing];
                }
            }
        }
    }
}
-(void)showLoadingUI:(int)percentDone :(int)i :(int)total{
    loadingLabel.text = [NSString stringWithFormat:@"%i%% (%i of %i) ",percentDone,i,total];
    [progressInLoading setProgress:((float)percentDone/100) animated:NO];
}
-(void)countUpDuration{
    if([viewDidLoadString isEqual:@"Loaded"])
    {
        //MSContactManipulater *contactGetter = [[MSContactManipulater alloc]init];
        allPeople = [[NSMutableArray alloc]init];
        //allPeople = [contactGetter getContactsWithAnImage];
        ABAddressBookRef addressBook2  = ABAddressBookCreateWithOptions(NULL, NULL);
        NSMutableArray *people = (__bridge NSMutableArray *)ABAddressBookCopyArrayOfAllPeople(addressBook2);
        progressInLoading = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
        [progressInLoading setProgress:0.0f animated:NO];
        int count = people.count;
        
        double d = 0.0;
        NSMutableArray *finalPeople = [[NSMutableArray alloc]init];
        
        
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
        dispatch_async(queue, ^{
            int p = [people count];
            for (int i=0; i<p; i++) {
                double d = ((double)i)/count;
                //[self showLoadingUI:(int)round(d*100) :i :count];

                dispatch_async(dispatch_get_main_queue(), ^{
                    //[self showLoadingUI:(int)round(d*100) :i :count];
                    progressInLoading.progress = i/count;
                });
            }
        });
        
        
        for (int i = 0; i<[people count]; i++)
        {
            d = ((double)i)/count;
            [self showLoadingUI:(int)round(d*100) :i :count];
            ABRecordRef r = (__bridge ABRecordRef)([people objectAtIndex:i]);
            if (ABPersonHasImageData(r) == true)
            {
                NSString *firstName = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonFirstNameProperty));
                NSString *lastName = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonLastNameProperty));
                UIImage *Cimage = [[UIImage alloc]init];
                Cimage = [UIImage imageWithData:(__bridge NSData *)ABPersonCopyImageDataWithFormat(r, kABPersonImageFormatThumbnail)];
                Person *thePerson = [[Person alloc] init];
                if(Cimage != nil)
                {
                    [thePerson setWithFirstName:firstName andLastName:lastName andImage:Cimage andGender:true];
                    thePerson.company = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonOrganizationProperty));
                    thePerson.department = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonDepartmentProperty));
                    thePerson.jobTitle = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonJobTitleProperty));
                    thePerson.notes = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonNoteProperty));
                    ABMultiValueRef anniversaries = ABRecordCopyValue(r, kABPersonDateProperty);
                    NSString *anniversaryLabel;
                    for (CFIndex t=0; t < ABMultiValueGetCount(anniversaries); t++) {
                        anniversaryLabel = (__bridge NSString*)ABMultiValueCopyLabelAtIndex(anniversaries, t);
                        if([anniversaryLabel isEqualToString:(NSString *)kABPersonAnniversaryLabel]||[anniversaryLabel isEqualToString:@"Start Date"])
                        {
                            NSDate *anniversaryDate=(__bridge NSDate *)ABMultiValueCopyValueAtIndex(anniversaries,t);
                            thePerson.date = (__bridge NSDate *)ABMultiValueCopyValueAtIndex(anniversaries, t);
                        }
                    }
                    [finalPeople addObject:thePerson];
                }
            }
        }
        allPeople = finalPeople;
        NSArray *savedPeople = [[NSArray alloc] init];
        savedPeople = [self addInfoFromSavedData];
        for (int i = 0; i<allPeople.count; i++)
        {
            for (int l = 0; l<savedPeople.count; l++)
            {
                if ([[[allPeople objectAtIndex:i] getFullName] caseInsensitiveCompare: [[savedPeople objectAtIndex:l] getFullName]] == NSOrderedSame) {
                    [[allPeople objectAtIndex:i] setNumTimesCorrect: [[savedPeople objectAtIndex:l] getNumTimesCorrect]];
                    [[allPeople objectAtIndex:i] setNumTimesGuessed: [[savedPeople objectAtIndex:l] getNumTimesGuessed]];
                    
                }
            }
        }
        [self saveData];
        [self addFieldsFromArray:allPeople];
        
        [self loadLabels:@"Company"];
        for (UIView *object in [labelsScrollView subviews])
        {
            [object removeFromSuperview];
        }
        [self loadLabels:@"Department"];
        for (UIView *object in [labelsScrollView subviews])
        {
            [object removeFromSuperview];
        }
        [self loadLabels:@"Job Title"];
        for (UIView *object in [labelsScrollView subviews])
        {
            [object removeFromSuperview];
        }
        [self loadLabels:@"Company"];
        // Do any additional setup after loading the view, typically from a nib.

        NSDate*myDate = [[NSDate alloc]init];
        NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MM/dd/yy"];
        toField.text = [formatter stringFromDate:myDate];
        filters.selectedSegmentIndex = 0;
        viewDidLoadString = @"Done";
        
        if (timesOpened == 1)
        {
            alert =[[UIAlertView alloc] initWithTitle:@"Close Down" message:@"Apple requires complete shutdown for KnowNames to recieve your contacts" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:NULL, nil];
        }
        [alert show];
         
    }
    ++wait;

    if((practiceModeSwitch.isOn == false && FTGameView.hidden == false) || (practiceModeSwitch.isOn == false && mCFacesView.hidden == false) || (practiceModeSwitch.isOn == false && MCTGameView.hidden == false) )
    {
        if(wait%100 == 0)
        {
            NSLog(@"updated time");

            wait = 0;
            

            if([typeOfGame.text  isEqual: @"Multiple Choice Names"])
            {
                if(iBMCN1.hidden == true||iBMCN4.hidden == true||iBMCN2.hidden==true||iBMCN3.hidden==true)//in other words they have not guessed all of the answers and so the timer should go
                {
                    seconds += 1;
                    timeOnThisCard-=1;
                }
            }
            else if([typeOfGame.text  isEqual: @"Multiple Choice Faces"])
            {
                if(iBMCF1.hidden == true||iBMCF2.hidden==true||iBMCF3.hidden==true||iBMCF4.hidden==true)//in other words they have not guessed all of the answers and so the timer should go
                {
                    seconds += 1;
                    timeOnThisCard-=1;
                }
            }
            else if([typeOfGame.text  isEqual: @"Flashcard Game"])
            {
                seconds += 1;
                timeOnThisCard-=1;
            }
            
            
            if(seconds <= 9)
            {
                timerLable.text = [NSString stringWithFormat:@"%i:0%i", minutes,seconds];
            }
            else
            {
                timerLable.text = [NSString stringWithFormat:@"%i:%i", minutes,seconds];
            }
            if(seconds == 60)
            {
                seconds = 0;
                //timerLableSeconds.text = [NSString stringWithFormat:@"0%i", countUpValue];

                minutes +=1;
                timerLable.text = [NSString stringWithFormat:@"%i:0%i", minutes,seconds];
            }

            timeOnThisCardLabel.text = [NSString stringWithFormat:@"%i", timeOnThisCard];
            if(timeOnThisCard<0)
            {
                timeOnThisCardLabel.text = @"0";
            }
        }
    }
    else
    {
        seconds=0;
        minutes =0;
        timerLable.text = [NSString stringWithFormat:@"%i:0%i", minutes,seconds];
    }
         
}
-(void)animateView:(UIView*)v fromDirection:(NSString*)direction forThis:(double)secs toView:(UIView*)nextV{
    if([direction isEqualToString:@"R"])
    {
        //[UIView transitionFromView:v toView:nextV duration:secs options:UIViewAnimationOptionCurveEaseIn completion:nil];
    }
    else if([direction isEqualToString:@"L"])
    {

    }
    else if([direction isEqualToString:@"T"])
    {

    }
    else if([direction isEqualToString:@"B"])
    {

    }
    [UIView commitAnimations];
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController{
    [gameCenterViewController dismissViewControllerAnimated:YES completion:nil];
}
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
-(void)generateDotsForTime:(int)t{
    
    nameView.hidden = false;
    
    NSString*fNDots;
    NSString*lNDots;

    fNDots = @" ";
    lNDots = @" ";

    if( t == 1)
    {
        seconds+=3;
        timeOnThisCard-=3;
        timeOnThisCardLabel.text = [NSString stringWithFormat:@"%i", timeOnThisCard];
        
        for(int l = 0; l<currentPerson.firstName.length && currentPerson.firstName != nil; ++l)
        {
            fNDots = [NSString stringWithFormat:@"•%@",fNDots];
        }
        
        for(int l = 0; l<currentPerson.lastName.length && currentPerson.lastName != nil; ++l)
        {
            lNDots = [NSString stringWithFormat:@"•%@",lNDots];
        }
        
        nameLabel.text = [NSString stringWithFormat:@"%@ %@",fNDots,lNDots];
    }
    if( t == 2)
    {
        seconds+=3;
        timeOnThisCard-=3;
        timeOnThisCardLabel.text = [NSString stringWithFormat:@"%i", timeOnThisCard];

        for(int l = 0; l<currentPerson.firstName.length-1 && currentPerson.firstName != nil; ++l)
        {
            fNDots = [NSString stringWithFormat:@"•%@",fNDots];
        }
        for(int l = 0; l<currentPerson.lastName.length-1 && currentPerson.lastName != nil; ++l)
        {
            lNDots = [NSString stringWithFormat:@"•%@",lNDots];
        }
        fNDots = [NSString stringWithFormat:@"%c%@",[currentPerson.firstName characterAtIndex:0],fNDots];
        lNDots = [NSString stringWithFormat:@"%c%@",[currentPerson.lastName characterAtIndex:0], lNDots];

        nameLabel.text = [NSString stringWithFormat:@"%@ %@",fNDots,lNDots];
    }
    if( t == 3)
    {
        seconds+=3;
        timeOnThisCard-=3;
        timeOnThisCardLabel.text = [NSString stringWithFormat:@"%i", timeOnThisCard];

        for(int l = currentPerson.firstName.length-1 ; l>0 && currentPerson.firstName != nil; --l)
        {
            if(l%2 == 0)
            {
                fNDots = [NSString stringWithFormat:@"%c%@",[currentPerson.firstName characterAtIndex:l],fNDots];
            }
            else
            {
                fNDots = [NSString stringWithFormat:@"•%@",fNDots];
            }
        }
        for(int l = currentPerson.lastName.length-1 ; l>0 && currentPerson.lastName != nil; --l)
        {
            if(l%2 == 0)
            {
                lNDots = [NSString stringWithFormat:@"%c%@",[currentPerson.lastName characterAtIndex:l],lNDots];
            }
            else
            {
                lNDots = [NSString stringWithFormat:@"•%@",lNDots];
            }
        }
        fNDots = [NSString stringWithFormat:@"%c%@",[currentPerson.firstName characterAtIndex:0],fNDots];
        lNDots = [NSString stringWithFormat:@"%c%@",[currentPerson.lastName characterAtIndex:0], lNDots];

        nameLabel.text = [NSString stringWithFormat:@"%@ %@",fNDots,lNDots];
    }
    if( t > 3)
    {
        hintLabel.text = @"H:0";
    }
    if(seconds <= 9)
    {
        timerLable.text = [NSString stringWithFormat:@"%i:0%i", minutes,seconds];
    }
    else
    {
        timerLable.text = [NSString stringWithFormat:@"%i:%i", minutes,seconds];
    }
    if(seconds == 60)
    {
        seconds = 0;
        //timerLableSeconds.text = [NSString stringWithFormat:@"0%i", countUpValue];
        
        minutes +=1;
        timerLable.text = [NSString stringWithFormat:@"%i:0%i", minutes,seconds];
    }
    else if(seconds > 59)
    {
        seconds = seconds - 60;
        //timerLableSeconds.text = [NSString stringWithFormat:@"0%i", countUpValue];
        
        minutes +=1;
        timerLable.text = [NSString stringWithFormat:@"%i:0%i", minutes,seconds];
    }
    
}
-(bool)isObjectIdenticalTo:(id)anObject inArray:(NSMutableArray*)aIQ{
    int p;
    p = aIQ.count;
    
    Person *sentP;
    sentP = anObject;
    if(p-1 != 0 && p-1 > 0)
    {
        for (int h =0; h < (p-1); ++h)
        {
            Person *pIQ;
            pIQ = [aIQ objectAtIndex:h];
            
            if (pIQ.firstName == sentP.firstName && pIQ.lastName == sentP.lastName && [pIQ returnPercentage] == [sentP returnPercentage] )
            {
                return true;
            }
        }
    }
    else if(p-1 == 0)
    {
        Person *pIQ;
        pIQ = [aIQ objectAtIndex:0];
        if (pIQ.firstName == sentP.firstName && pIQ.lastName == sentP.lastName && [pIQ returnPercentage] == [sentP returnPercentage] )
        {
            return true;
        }
    }
    else if(p-1 < 0)
    {
        //error the array is empty
    }
    return false;
}
-(bool)checkForString:(NSString*)str inArray:(NSMutableArray*)arr{
    for(int p=0; p<arr.count;p++)
    {
        NSString *sIQ;
        sIQ = [arr objectAtIndex:p];
        if([sIQ isEqualToString: str])
        {
            return true;
        }
    }
    return false;
}
-(bool)checkIfAllPeopleHaveBeenGuessed{
    if(arrayOf49PercentAndUnder.count > 0)
    {
        for (int f = 0; f<arrayOf49PercentAndUnder.count; f++)
        {
            Person *pIQ;
            pIQ = [arrayOf49PercentAndUnder objectAtIndex:f];
            if(pIQ.hasBeenGuessed == false)
            {
                return false;
            }
        }
    }
    if(arrayOf50PercentAndOver.count > 0)
    {
        for (int f = 0; f<arrayOf50PercentAndOver.count; f++)
        {
            Person *pIQ;
            pIQ = [arrayOf50PercentAndOver objectAtIndex:f];
            if(pIQ.hasBeenGuessed == false)
            {
                return false;
            }
        }
    }
    return true;
}
-(bool)checkIfAllPeopleHaveBeenGuessedCorrectly{
    if(arrayOf49PercentAndUnder.count > 0)
    {
        for (int f = 0; f<arrayOf49PercentAndUnder.count; f++)
        {
            Person *pIQ;
            pIQ = [arrayOf49PercentAndUnder objectAtIndex:f];
            if(pIQ.hasBeenGuessedRight == false)
            {
                return false;
            }
        }
    }
    if(arrayOf50PercentAndOver.count > 0)
    {
        for (int f = 0; f<arrayOf50PercentAndOver.count; f++)
        {
            Person *pIQ;
            pIQ = [arrayOf50PercentAndOver objectAtIndex:f];
            if(pIQ.hasBeenGuessedRight == false)
            {
                return false;
            }
        }
    }
    return true;
}
-(bool)object: (id)object isInArray: (NSMutableArray*)array{
//    @try
//    {
        Person*pIQ = object;
        for (int i = 0; i<arrayOf49PercentAndUnder.count; ++i)
        {
            if (pIQ == [arrayOf49PercentAndUnder objectAtIndex:i]) {
                return true;
            }
        }
//    }
//    @catch(int x = 9)
//    {
//        return false;
//    }
    return false;
    
}
-(void)checkIfCorrectMCF:(Person*)pIQ{
    
    if ((pIQ == correctPersonMCF && practiceModeSwitch.isOn == true && correctPersonMCF.hasBeenGuessedRight == false) || (practiceModeSwitch.isOn == false && correctPersonMCF.hasBeenGuessed == false))
    {
        nextButtonMCF.hidden = false;
        iBMCF1.hidden = false;
        iBMCF2.hidden = false;
        iBMCF3.hidden = false;
        iBMCF4.hidden = false;
        
        iTIMCF1.hidden = false;
        iTIMCF2.hidden = false;
        iTIMCF3.hidden = false;
        iTIMCF4.hidden = false;

        NSString *nameString = [[NSString alloc]init];
        if([typeOfGameString isEqual:@"Full Name"])
        {
            nameString =[pMCF1 getFullName];
        }
        if([typeOfGameString isEqual:@"Last Name"])
        {
            nameString = [pMCF1 lastName];
        }
        if([typeOfGameString isEqual:@"First Name"])
        {
            nameString = [pMCF1 firstName];
        }
        n1.text = nameString;
        
        if([typeOfGameString isEqual:@"Full Name"])
        {
            nameString =[pMCF2 getFullName];
        }
        if([typeOfGameString isEqual:@"Last Name"])
        {
            nameString = [pMCF2 lastName];
        }
        if([typeOfGameString isEqual:@"First Name"])
        {
            nameString = [pMCF2 firstName];
        }
        n2.text = nameString;

        if([typeOfGameString isEqual:@"Full Name"])
        {
            nameString =[pMCF3 getFullName];
        }
        if([typeOfGameString isEqual:@"Last Name"])
        {
            nameString = [pMCF3 lastName];
        }
        if([typeOfGameString isEqual:@"First Name"])
        {
            nameString = [pMCF3 firstName];
        }
        n3.text = nameString;
        if([typeOfGameString isEqual:@"Full Name"])
        {
            nameString =[pMCF4 getFullName];
        }
        if([typeOfGameString isEqual:@"Last Name"])
        {
            nameString = [pMCF4 lastName];
        }
        if([typeOfGameString isEqual:@"First Name"])
        {
            nameString = [pMCF4 firstName];
        }
        n4.text = nameString;

        [arrayOf49PercentAndUnder removeObjectIdenticalTo:correctPersonMCF];
        [arrayOf50PercentAndOver addObject:correctPersonMCF];
        
        
        if(correctPersonMCF == pMCF1)
        {
            //got right
            iTIMCF1.image = [UIImage imageNamed:@"SmallTU.png"];
        }
        else
        {
            iTIMCF1.image = [UIImage imageNamed:@"SmallTD.png"];
        }
        if(correctPersonMCF == pMCF2)
        {
            //got right
            iTIMCF2.image = [UIImage imageNamed:@"SmallTU.png"];
           
        }
        else
        {
            iTIMCF2.image = [UIImage imageNamed:@"SmallTD.png"];
        }
        if(correctPersonMCF == pMCF3)
        {
            //got right
            iTIMCF3.image = [UIImage imageNamed:@"SmallTU.png"];
            
        }
        else
        {
            iTIMCF3.image = [UIImage imageNamed:@"SmallTD.png"];
        }
        if(correctPersonMCF == pMCF4)
        {
            //got right
            iTIMCF4.image = [UIImage imageNamed:@"SmallTU.png"];
            
        }
        else
        {
            iTIMCF4.image = [UIImage imageNamed:@"SmallTD.png"];
        }

        if(correctPersonMCF == pIQ)
        {
            totalCorrect++;
            [self playSoundNamed:@"DingSound" andType:@"m4a" andFX:true];
            [pIQ gotRight];
            if(timeOnThisCard>0)
            {
                currentScoreMCF+=100-(10*(10-timeOnThisCard));
                addedPoints.text = [NSString stringWithFormat:@"Score: %i",currentScoreMCF];
                //[self animateIn:addedPoints];
                //[self animateOut:addedPoints];
            }
            numInARow++;
        }
        else
        {
            [self playSoundNamed:@"DongSound" andType:@"m4a" andFX:true];
            [pIQ gotWrong];
            numInARow = 0;
        }
        //[correctPersonMCF gotRight];
        numInARow++;
        correctPersonMCF.hasBeenGuessedRight = true;
        correctPersonMCF.hasBeenGuessed = true;
    }
    else
    {
        if((practiceModeSwitch.isOn == false && correctPersonMCF.hasBeenGuessed == false) || (practiceModeSwitch.isOn == true && correctPersonMCF.hasBeenGuessedRight == false) )
        {
            correctPersonMCF.hasBeenGuessed = true;

            if(pIQ == pMCF1 && iTIMCF1.hidden == true)
            {
                //got wrong
                iTIMCF1.image = [UIImage imageNamed:@"SmallTD.png"];
                [correctPersonMCF gotWrong];
                numInARow = 0;
                [self playSoundNamed:@"DongSound" andType:@"m4a" andFX:true];

            }
            if(pIQ == pMCF2 && iTIMCF2.hidden == true)
            {
                //got wrong
                iTIMCF2.image = [UIImage imageNamed:@"SmallTD.png"];
                [correctPersonMCF gotWrong];
                numInARow = 0;
                [self playSoundNamed:@"DongSound" andType:@"m4a" andFX:true];

            }
            if(pIQ == pMCF3 && iTIMCF3.hidden == true)
            {
                //got wrong
                iTIMCF3.image = [UIImage imageNamed:@"SmallTD.png"];
                [correctPersonMCF gotWrong];
                numInARow = 0;
                [self playSoundNamed:@"DongSound" andType:@"m4a" andFX:true];

            }
            if(pIQ == pMCF4 && iTIMCF4.hidden == true)
            {
                //got wrong
                iTIMCF4.image = [UIImage imageNamed:@"SmallTD.png"];
                [correctPersonMCF gotWrong];
                numInARow = 0;
                [self playSoundNamed:@"DongSound" andType:@"m4a" andFX:true];

            }
        }
    }
    [self respondToNumInARow];
}
-(void)assignCorrectPersonMCF{
    int x;
    x = (rand()%4);
    if(x == 3)
    {
        correctPersonMCF = pMCF4;
    }
    if(x == 2)
    {
        correctPersonMCF = pMCF3;
    }
    if(x == 1)
    {
        correctPersonMCF = pMCF2;
    }
    if(x == 0)
    {
        correctPersonMCF = pMCF1;
    }
    NSString *nameString = [[NSString alloc]init];
    if([typeOfGameString isEqual:@"Full Name"])
    {
        nameString =[correctPersonMCF getFullName];
    }
    if([typeOfGameString isEqual:@"Last Name"])
    {
        nameString = [correctPersonMCF lastName];
    }
    if([typeOfGameString isEqual:@"First Name"])
    {
        nameString = [correctPersonMCF firstName];
    }
    correctPersonLabelMCF.text = nameString;
}
-(void)generateNewPeopleMCF{
    if(timeOnThisCard > mostTimeIntMCF)
    {
        mostTimeIntMCF = timeOnThisCard;
        NSInteger i = (NSInteger) mostTimeIntMCF;
        defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:i forKey:kmostTimeMCF];
        [defaults synchronize];
        mostTimeMCF = currentPerson;
    }

        timeOnThisCard = 10;
        timeOnThisCardLabel.text =@"10";
    
    if (arrayOf49PercentAndUnder.count > 3)
    {
        int x;
        x = (rand()%arrayOf49PercentAndUnder.count);
        
        pMCF1 = [arrayOf49PercentAndUnder objectAtIndex:x];
        
        do {
            x = (rand()%arrayOf49PercentAndUnder.count);
            
            pMCF2 = [arrayOf49PercentAndUnder objectAtIndex:x];
            
        }while (pMCF2 == pMCF1);
        
        
        do
        {
            x = (rand()%arrayOf49PercentAndUnder.count);
            
            pMCF3 = [arrayOf49PercentAndUnder objectAtIndex:x];
            
        }while (pMCF3 == pMCF1 || pMCF2 == pMCF3);
        
        do
        {
            x = (rand()%arrayOf49PercentAndUnder.count);
            
            pMCF4 = [arrayOf49PercentAndUnder objectAtIndex:x];
            
        }while (pMCF4 == pMCF1 || pMCF4 == pMCF2 || pMCF4 == pMCF3);
        
        iMCF1.image = pMCF1.selfImage;
        iMCF2.image = pMCF2.selfImage;
        iMCF3.image = pMCF3.selfImage;
        iMCF4.image = pMCF4.selfImage;
        
        n1.text = @"";
        n2.text = @"";
        n3.text = @"";
        n4.text = @"";
        
        
        [self assignCorrectPersonMCF];
    }
    else
    {
        //you are down to 3 or less people so there are only 3 possibilities
        if (arrayOf49PercentAndUnder.count == 0) {
            
            [self animateOut:mCFacesView];

            [self animateIn:gameOverView];
            addedPoints.hidden = true;

            numInARow =0;
            

            guessButton.hidden = true;
            nameView.hidden = true;
            infoButton.hidden = true;
            hintButton.hidden = true;
            nameAndButtonsView.hidden = true;
            personPic.hidden = true;
            [arrayOf49PercentAndUnder removeAllObjects];
            [arrayOf50PercentAndOver removeAllObjects];
            timerView.hidden = true;
            
            totalPercentage = totalCorrect/totalGuessed;
            
            if(seconds <=9)
            {
                percentLabel.text = [NSString stringWithFormat:@"YOU GOT %d%% (%i OUT OF %i) IN %i:0%i",(int)round(totalPercentage*100),(int)round(totalCorrect),(int)round(totalGuessed),minutes,seconds];
            }
            else
            {
                percentLabel.text = [NSString stringWithFormat:@"YOU GOT %d%% (%i OUT OF %i) IN %i:%i",(int)round(totalPercentage*100),(int)round(totalCorrect),(int)round(totalGuessed),minutes,seconds];
            }
            
            totalSeconds = minutes*60 + seconds;
            [self saveData];
            //currentScoreMCF = (int)round(((1000*totalGuessed*totalGuessed*totalPercentage)/(totalSeconds*totalSeconds)));
            [self printHighScoreMCF];
            [self updateAchievements];
            currentScoreMCF = 0;
            [self animateOut:FilterView];

            totalCorrect = 0;
            totalGuessed = 0;
            for(int i =0; i < allPeople.count; i++)
            {
                Person *p;
                p =[allPeople objectAtIndex:i];
                p.hasBeenGuessed = false;
                p.hasBeenGuessedRight = false;
            }
        }
        else
        {
            
            int x;
            x = (rand()%arrayOf50PercentAndOver.count);
            
            pMCF1 = [arrayOf50PercentAndOver objectAtIndex:x];
            
            do {
                if(arrayOf50PercentAndOver.count > 1)
                {
                    x = (rand()%arrayOf50PercentAndOver.count);
                    pMCF2 = [arrayOf50PercentAndOver objectAtIndex:x];
                }
                else
                {
                    x = (rand()%arrayOf49PercentAndUnder.count);
                    pMCF2 = [arrayOf49PercentAndUnder objectAtIndex:x];
                }
            }while (pMCF2 == pMCF1);
            
            
            do
            {
                if(arrayOf50PercentAndOver.count > 2)
                {
                    x = (rand()%arrayOf50PercentAndOver.count);
                    pMCF3 = [arrayOf50PercentAndOver objectAtIndex:x];
                }
                else
                {
                    x = (rand()%arrayOf49PercentAndUnder.count);
                    pMCF3 = [arrayOf49PercentAndUnder objectAtIndex:x];
                }
            }while (pMCF3 == pMCF1 || pMCF2 == pMCF3);
            
            do
            {
                if(arrayOf50PercentAndOver.count > 3)
                {
                    x = (rand()%arrayOf50PercentAndOver.count);
                    pMCF4 = [arrayOf50PercentAndOver objectAtIndex:x];
                }
                else
                {
                    x = (rand()%arrayOf49PercentAndUnder.count);
                    pMCF4 = [arrayOf49PercentAndUnder objectAtIndex:x];
                }
            }while (pMCF4 == pMCF1 || pMCF4 == pMCF2 || pMCF4 == pMCF3);
            
            if(pMCF4.selfImage == pMCF1.selfImage || pMCF4.selfImage == pMCF2.selfImage || pMCF4.selfImage == pMCF3.selfImage ||  pMCF3.selfImage == pMCF1.selfImage || pMCF2.selfImage == pMCF3.selfImage || pMCF2.selfImage == pMCF1.selfImage)
            {
                NSLog(@"the method did not work");
            }
            //If you only have 3 people left
            do
            {
                int rn3;
                rn3 = rand()%4;
                if(arrayOf49PercentAndUnder.count + arrayOf50PercentAndOver.count < 5)
                {
                    // THEY ONLY have four people
                    if (rn3==0)
                    {
                        correctPersonMCF = pMCF1;
                    }
                    else if (rn3==1)
                    {
                        correctPersonMCF = pMCF2;
                    }
                    else if (rn3==2)
                    {
                        correctPersonMCF = pMCF3;
                        
                    }
                    else if (rn3==3)
                    {
                        correctPersonMCF = pMCF4;
                    }
                }
                else
                {
                    if (rn3==0)
                    {
                        rn3 = rand()%arrayOf49PercentAndUnder.count;
                        pMCF1 = [arrayOf49PercentAndUnder objectAtIndex:rn3];
                        correctPersonMCF = pMCF1;
                    }
                    else if (rn3==1)
                    {
                        rn3 = rand()%arrayOf49PercentAndUnder.count;
                        pMCF2 = [arrayOf49PercentAndUnder objectAtIndex:rn3];
                        correctPersonMCF = pMCF2;
                    }
                    else if (rn3==2)
                    {
                        rn3 = rand()%arrayOf49PercentAndUnder.count;
                        pMCF3 = [arrayOf49PercentAndUnder objectAtIndex:rn3];
                        correctPersonMCF = pMCF3;
                    }
                    else if (rn3==3)
                    {
                        rn3 = rand()%arrayOf49PercentAndUnder.count;
                        pMCF4 = [arrayOf49PercentAndUnder objectAtIndex:rn3];
                        correctPersonMCF = pMCF4;
                    }
                }
            }while ([self object:correctPersonMCF isInArray:arrayOf49PercentAndUnder]==false);
            iMCF1.image = pMCF1.selfImage;
            iMCF2.image = pMCF2.selfImage;
            iMCF3.image = pMCF3.selfImage;
            iMCF4.image = pMCF4.selfImage;
            
            n1.text = @"";
            n2.text = @"";
            n3.text = @"";
            n4.text = @"";
            correctPersonLabelMCF.text = [NSString stringWithFormat:@"%@ %@",correctPersonMCF.firstName, correctPersonMCF.lastName];
        }
    }
}
-(void)animateIn:(UIView*)view{
    view.hidden=false;
    [UIView animateWithDuration:0.1 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        view.layer.affineTransform = CGAffineTransformMakeScale(0.0f, 0.0f);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            view.layer.affineTransform = CGAffineTransformMakeScale(1.0f, 1.0f);
        } completion:nil];
    }];
}
-(void)animateOut:(UIView*)view{
    view.hidden=false;
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        view.layer.affineTransform = CGAffineTransformMakeScale(0.001f, 0.001f);
    } completion:^(BOOL finished) {
        view.hidden=true;
        [UIView animateWithDuration:0.1 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            view.layer.affineTransform = CGAffineTransformMakeScale(1.0f, 1.0f);
        } completion:nil];
    }];
}
-(void)animateFlip:(UIView*)viewToReplace withVeiw:(UIView*)replacementView{
    //replacementView.hidden = false;
    [self.view addSubview:viewToReplace];
    [UIView transitionFromView:viewToReplace
                        toView:replacementView
                      duration:1
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    completion:^(BOOL finished) {
                        //viewToReplace.hidden = true;
                    }];
    
}
-(void)showMoreInfo:(Person *)pIQ{
   [self.view addSubview:moreInfoView];

    if([typeOfGame.text isEqualToString:@"Flashcard Game"])
    {
        [self animateFlip:FTGameView withVeiw:moreInfoView];
        moreInfoView.hidden = false;
    }
    else if ([typeOfGame.text isEqualToString:@"Multiple Choice Faces"])
    {
        [self animateFlip:mCFacesView withVeiw:moreInfoView];
        moreInfoView.hidden = false;
    }
    else if([typeOfGame.text isEqualToString:@"Multiple Choice Names"])
    {
        [self animateFlip:MCTGameView withVeiw:moreInfoView];
        moreInfoView.hidden = false;
    }
    else{
        [self animateIn:moreInfoView];
        
    }
    
    moreInfoViewImage.image = pIQ.selfImage;
   // timerLable.text = @"Pause";
    if(pIQ.firstName.length > 0 && pIQ.lastName.length > 0)
    {
        moreInfoName.text = [NSString stringWithFormat:@"%@ %@", pIQ.firstName, pIQ.lastName];
    }
    else if(pIQ.firstName.length > 0)
    {
        moreInfoName.text = [NSString stringWithFormat:@"%@", pIQ.firstName];
    }
    else
    {
        moreInfoName.text = @"No Name Specified";
    }
    if(pIQ.jobTitle.length > 0)
    {
        moreInfoJobTitle.text = [NSString stringWithFormat:@"%@", pIQ.jobTitle];
    }
    else
    {
        moreInfoJobTitle.text = @"No Job Specified";
    }
    if(pIQ.company.length > 0)
    {
        moreInfoCompany.text = [NSString stringWithFormat:@"%@", pIQ.company];
        
    }
    else
    {
        moreInfoCompany.text = @"No Company Specified";
    }
    if(pIQ.department.length > 0)
    {
        moreInforDepartment.text = [NSString stringWithFormat:@"%@", pIQ.department];
        
    }
    else
    {
        moreInforDepartment.text = @"No Department Specified";
    }
    if(pIQ.notes.length > 0)
    {
        moreInfoBio.text = [NSString stringWithFormat:@"     %@", pIQ.notes];
        
    }
    else
    {
        moreInfoBio.text = @"No Notes";
    }
}
-(void)generateNewPeopleMCN{
    if(timeOnThisCard > mostTimeIntMCN)
    {
        mostTimeIntMCN = timeOnThisCard;
        NSInteger i = (NSInteger) mostTimeIntMCN;
        defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:i forKey:kmostTimeMCN];
        [defaults synchronize];
        mostTimeMCN = currentPerson;
    }

        timeOnThisCard = 10;
        timeOnThisCardLabel.text =@"10";
      timeOnThisCardLabel.text = [NSString stringWithFormat:@"%i", timeOnThisCard];
    int rn;
    
    if(arrayOf49PercentAndUnder.count >3)
    {
        mcPersonPicture.image = correctMCPerson.selfImage;
        
        rn = rand()%arrayOf49PercentAndUnder.count;
        pMCN1 = [arrayOf49PercentAndUnder objectAtIndex:rn];
        do
        {
            rn = rand()%arrayOf49PercentAndUnder.count;
            pMCN2 = [arrayOf49PercentAndUnder objectAtIndex:rn];
        }while (pMCN1 == pMCN2);
        do
        {
            rn = rand()%arrayOf49PercentAndUnder.count;
            pMCN3 = [arrayOf49PercentAndUnder objectAtIndex:rn];
        }while (pMCN1 == pMCN3 || pMCN3 == pMCN2);
        do
        {
            rn = rand()%arrayOf49PercentAndUnder.count;
            pMCN4 = [arrayOf49PercentAndUnder objectAtIndex:rn];
        }while (pMCN4 == pMCN3 || pMCN4 == pMCN2|| pMCN4 == pMCN1);
        
        
        NSString *nameString = [[NSString alloc]init];
        if([typeOfGameString isEqual:@"Full Name"])
        {
            nameString =[pMCN1 getFullName];
        }
        if([typeOfGameString isEqual:@"Last Name"])
        {
            nameString = [pMCN1 lastName];
        }
        if([typeOfGameString isEqual:@"First Name"])
        {
            nameString = [pMCN1 firstName];
        }
        [mcButton1 setTitle:nameString forState:UIControlStateNormal];
        if([typeOfGameString isEqual:@"Full Name"])
        {
            nameString =[pMCN2 getFullName];
        }
        if([typeOfGameString isEqual:@"Last Name"])
        {
            nameString = [pMCN2 lastName];
        }
        if([typeOfGameString isEqual:@"First Name"])
        {
            nameString = [pMCN2 firstName];
        }
        [mcButton2 setTitle:nameString forState:UIControlStateNormal];
        if([typeOfGameString isEqual:@"Full Name"])
        {
            nameString =[pMCN3 getFullName];
        }
        if([typeOfGameString isEqual:@"Last Name"])
        {
            nameString = [pMCN3 lastName];
        }
        if([typeOfGameString isEqual:@"First Name"])
        {
            nameString = [pMCN3 firstName];
        }
        [mcButton3 setTitle:nameString forState:UIControlStateNormal];
        if([typeOfGameString isEqual:@"Full Name"])
        {
            nameString = [pMCN4 getFullName];
        }
        if([typeOfGameString isEqual:@"Last Name"])
        {
            nameString = [pMCN4 lastName];
        }
        if([typeOfGameString isEqual:@"First Name"])
        {
            nameString = [pMCN4 firstName];
        }
        [mcButton4 setTitle:nameString forState:UIControlStateNormal];
        
        
        rn = rand()%4;
        if (rn==0)
        {
            correctMCPerson = pMCN1;
            
        }
        else if (rn==1)
        {
            correctMCPerson = pMCN2;
            
        }
        else if (rn==2)
        {
            correctMCPerson = pMCN3;
        }
        else if (rn==3)
        {
            correctMCPerson = pMCN4;
        }
        
        mcPersonPicture.image = correctMCPerson.selfImage;
        currentPerson = correctMCPerson;
    } else
    {
        //If their is less than 4 people you havent guessed
        rn = rand()%arrayOf50PercentAndOver.count;
        pMCN1 = [arrayOf50PercentAndOver objectAtIndex:rn];
        
        do
        {
            if(arrayOf50PercentAndOver.count > 1)
            {
                rn = (rand()%arrayOf50PercentAndOver.count);
                pMCN2 = [arrayOf50PercentAndOver objectAtIndex:rn];
            }
            else
            {
                rn = (rand()%arrayOf49PercentAndUnder.count);
                pMCN2 = [arrayOf49PercentAndUnder objectAtIndex:rn];
            }
        }while (pMCN1 == pMCN2);
        do
        {
            if(arrayOf50PercentAndOver.count > 2)
            {
                rn = (rand()%arrayOf50PercentAndOver.count);
                pMCN3 = [arrayOf50PercentAndOver objectAtIndex:rn];
            }
            else
            {
                rn = (rand()%arrayOf49PercentAndUnder.count);
                pMCN3 = [arrayOf49PercentAndUnder objectAtIndex:rn];
            }
        }while (pMCN1 == pMCN3 || pMCN3 == pMCN2);
        do
        {
            if(arrayOf50PercentAndOver.count > 3)
            {
                rn = (rand()%arrayOf50PercentAndOver.count);
                pMCN4 = [arrayOf50PercentAndOver objectAtIndex:rn];
            }
            else
            {
                rn = (rand()%arrayOf49PercentAndUnder.count);
                pMCN4 = [arrayOf49PercentAndUnder objectAtIndex:rn];
            }
        }while (pMCN4 == pMCN3 || pMCN4 == pMCN2|| pMCN4 == pMCN1);

        
        
        do
        {
            rn = rand()%4;
            if(arrayOf49PercentAndUnder.count + arrayOf50PercentAndOver.count < 5)
            {
                // THEY ONLY have four people
                if (rn==0)
                {
                    correctMCPerson = pMCN1;
                }
                else if (rn==1)
                {
                    correctMCPerson = pMCN2;
                }
                else if (rn==2)
                {
                    correctMCPerson = pMCN3;
                    
                }
                else if (rn==3)
                {
                    correctMCPerson = pMCN4;
                }
            }
            else
            {
                if (rn==0)
                {
                    rn = rand()%arrayOf49PercentAndUnder.count;
                    pMCN1 = [arrayOf49PercentAndUnder objectAtIndex:rn];
                    correctMCPerson = pMCN1;
                }
                else if (rn==1)
                {
                    rn = rand()%arrayOf49PercentAndUnder.count;
                    pMCN2 = [arrayOf49PercentAndUnder objectAtIndex:rn];
                    correctMCPerson = pMCN2;
                }
                else if (rn==2)
                {
                    rn = rand()%arrayOf49PercentAndUnder.count;
                    pMCN3 = [arrayOf49PercentAndUnder objectAtIndex:rn];
                    correctMCPerson = pMCN3;
                }
                else if (rn==3)
                {
                    rn = rand()%arrayOf49PercentAndUnder.count;
                    pMCN4 = [arrayOf49PercentAndUnder objectAtIndex:rn];
                    correctMCPerson = pMCN4;
                }
            }
            
        }while ([self object:correctMCPerson isInArray:arrayOf49PercentAndUnder]==false);
        
        [mcButton1 setTitle:[NSString stringWithFormat:@"%@",[pMCN1 getFullName]] forState:UIControlStateNormal];
        [mcButton2 setTitle:[NSString stringWithFormat:@"%@",[pMCN2 getFullName]] forState:UIControlStateNormal];
        [mcButton3 setTitle:[NSString stringWithFormat:@"%@",[pMCN3 getFullName]] forState:UIControlStateNormal];
        [mcButton4 setTitle:[NSString stringWithFormat:@"%@",[pMCN4 getFullName]] forState:UIControlStateNormal];
        
        
                mcPersonPicture.image = correctMCPerson.selfImage;
        currentPerson = correctMCPerson;
        
        
        
    
    }
    timerView.hidden = false;
}
-(void)playSoundNamed:(NSString*)soundName andType:(NSString*)type andFX:(BOOL)isFX{
    
    soundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:soundName ofType:type]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &SoundID);
    
    if(fxSwitchSetting.isOn  && isFX)
    {
        AudioServicesPlaySystemSound(SoundID);
    }
    else if(musicSwitchSetting.isOn && !isFX)
    {
        AudioServicesPlaySystemSound(SoundID);
    }
     
}
-(void)updateCurrentFilters{
    [filters removeAllSegments];
    
    defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:dateSwitchSetting.on forKey:@"kdateBool"];
    [defaults setBool:jobTitleSwitchSetting.on forKey:@"kjobTitleBool"];
    [defaults setBool:departmentSwitchSetting.on forKey:@"kdepartmentBool"];
    [defaults setBool:companySwitchSetting.on forKey:@"kcompanyBool"];
    [defaults setBool:musicSwitchSetting.on forKey:@"kmusicBool"];
    [defaults setBool:fxSwitchSetting.on forKey:@"kfxBool"];
    [defaults setBool:percentMissedSwichSetting.on forKey:@"kmissedBool"];
    [defaults synchronize];
    
    if(dateSwitchSetting.isOn == true)
    {
        [filters insertSegmentWithTitle:@"Date" atIndex:0 animated:YES];
    }
    if(percentMissedSwichSetting.isOn == true)
    {
        [filters insertSegmentWithTitle:@"Missed" atIndex:0 animated:YES];
    }
    if(jobTitleSwitchSetting.isOn == true)
    {
        [filters insertSegmentWithTitle:@"Job Title" atIndex:0 animated:YES];
    }
    if(departmentSwitchSetting.isOn == true)
    {
        [filters insertSegmentWithTitle:@"Department" atIndex:0 animated:YES];
    }
    if(companySwitchSetting.isOn == true)
    {
        [filters insertSegmentWithTitle:@"Company" atIndex:0 animated:YES];
    }
    

    
    if(filters.numberOfSegments > 4)
    {
        alert = [[UIAlertView alloc] initWithTitle:@"Oops..." message:@"You may only have a maximum of four filters." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:NULL, nil];
        [jobTitleSwitchSetting setOn:false animated:YES];
        [alert show];
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0)
    {
        return; //Cancel
    }
    else
    {
        if (forgotPasswordView.hidden==false) {
            // Send the user to the Settings for this app
            NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            [[UIApplication sharedApplication] openURL:settingsURL];
        }
        
        //erase stats
        defaults = [NSUserDefaults standardUserDefaults];
        bestTimeF = 100000000;
        [defaults setInteger:bestTimeF forKey:kbestTimeF];
        bestTimeMCF = 100000000;
        [defaults setInteger:bestTimeMCF forKey:kbestTimeMCF];
        bestTimeMCN = 100000000;
        [defaults setInteger:bestTimeMCN forKey:kbestTimeMCN];
        highscore = 0;
        [defaults setInteger:highscore forKey:khighscoreF];
        highscoreMCF = 0;
        [defaults setInteger:highscoreMCF forKey:khighscoreMCF];
        highscoreMCN = 0;
        [defaults setInteger:highscoreMCN forKey:khighscoreMCN];
        
        for(int i =0; i<allPeople.count;++i)
        {
            Person *pIQ;
            pIQ = [allPeople objectAtIndex:i];
            pIQ.numTimesCorrect=0;
            pIQ.numTimesGuessed=0;
        }
        NSData *theData = [NSKeyedArchiver archivedDataWithRootObject:allPeople];
        [defaults setObject:theData forKey:@"dataKey"];
        
        [defaults synchronize];
    }

}
 
//ibactions
//view change these actions typically include all setup required for the view to be shown
-(IBAction)backToLeaderboardView:(id)sender{
    [self playSoundNamed:@"ClickSound" andType:@"m4a" andFX:true];
    [self animateOut:actualLeaderboardView];
    [self animateIn:leaderBoardView];

    for(UIView *object in [scoresScrollView subviews])
    {

        [object removeFromSuperview];
        
    }
}
-(IBAction)goToNewLoginView:(id)sender{
    [self animateOut:editAccountView];

    [self animateOut:forgotPasswordView];

    if(sender == signUpButton)
    {
        [self animateOut:signInView];

        [self animateIn:registrationView];

    }
    else
    {
        [self animateOut:registrationView];
        [self animateIn:signInView];

    }
}
-(IBAction)goToFV{
    
    typeOfGame.text = @"";
    
    [percentField resignFirstResponder];
    [self animateOut:FilterView];

    
    [self playSoundNamed:@"ClickSound" andType:@"m4a" andFX:true];
    
    [self updateCurrentFilters];
    if(filters.numberOfSegments <=4)
    {
        [self animateOut:gameOverView];

        nextView = @"FV";
        
        [self animateOut:FilterView];

        [self animateOut:MCGameView];
        [self animateIn:firstView];

        FilterView.hidden = true;
        [self animateOut:MCTGameView];
        MCCView.hidden = true;
        FGameView.hidden = true;
        FCView.hidden = true;
        FTGameView.hidden = true;
        deptTitleField.hidden = true;
        jobTitleField.hidden = true;
        filterField.text = @"";
        companyTitleField.hidden = true;
        nameView.hidden = true;
        settingsView.hidden = true;
        statsView.hidden = true;
        leaderBoardView.hidden = true;
        actualLeaderboardView.hidden = true;
    }
}
-(IBAction)goButtonPressed{
    [self playSoundNamed:@"ClickSound" andType:@"m4a" andFX:true];
    numberOfHintsPressed = 0;

    

    [self readValues];
    if((arrayOf49PercentAndUnder.count > 0 && [typeOfGame.text isEqualToString:@"Flashcard Game"]) || (([typeOfGame.text isEqualToString:@"Multiple Choice Faces"] || [typeOfGame.text isEqualToString:@"Multiple Choice Names"]) && arrayOf49PercentAndUnder.count > 3))
    {
        [self animateOut:FilterView];

        timerView.hidden=false;
        timerLable.text = [NSString stringWithFormat:@"%i:0%i", minutes,seconds];
        timeOnThisCardLabel.text = @"10";
        
        currentScore=0;
        
        seconds=0;
        minutes=0;

            timeOnThisCard = 10;
            timeOnThisCardLabel.text =@"10";
        
        if([typeOfGame.text  isEqual: @"Flashcard Game"])
        {
            hintLabel.text = [NSString stringWithFormat:@"H:%i", 3-numberOfHintsPressed];
            mostTimeIntF =0;
            mostTimeF = NULL;
            personPic.hidden = false;
            guessButton.hidden = false;
            [self animateOut:FilterView];

            [self animateIn:FTGameView];


            nameAndButtonsView.hidden = false;
            nameView.hidden = false;
            hintButton.hidden=false;
            showInfoButton.hidden = false;
            gameOverView.hidden = true;
            
            //numberOfHintsPressed = 3;
            //hintLabel.text = [NSString stringWithFormat:@"H:%i",numberOfHintsPressed];
            
            filterField.text = @"";
            filterLabel.text = @"Filter By:";
            nextView = @"FTGV";
            nameView.hidden = true;
            totalGuessed = arrayOf49PercentAndUnder.count;

        }
        if([typeOfGame.text  isEqual: @"Multiple Choice Names"])
        {
            addedPoints.hidden = false;
            addedPoints.textColor = [UIColor whiteColor];
            hintLabel.text = [NSString stringWithFormat:@"H:%i", 2-numberOfHintsPressed];
            mostTimeIntMCN = 0;
            mostTimeMCN = NULL;
            
            [self animateIn:MCTGameView];

            [self generateNewPeopleMCN];
            iTIMCN1.hidden = true;
            iTIMCN2.hidden = true;
            iTIMCN3.hidden = true;
            iTIMCN4.hidden = true;
            nextMCN.hidden = true;
            totalGuessed = arrayOf49PercentAndUnder.count;

        }
        if([typeOfGame.text  isEqual: @"Multiple Choice Faces"])
        {
            addedPoints.hidden = false;
            addedPoints.textColor = filters.tintColor;
            hintLabel.text = [NSString stringWithFormat:@"H:%i", 2-numberOfHintsPressed];
            mostTimeMCF = NULL;
            mostTimeIntMCF = 0;
            [self animateIn:mCFacesView];

            nextButtonMCF.hidden = true;
            iBMCF1.hidden = true;
            iBMCF2.hidden = true;
            iBMCF3.hidden = true;
            iBMCF4.hidden = true;
            
            iTIMCF1.hidden = true;
            iTIMCF2.hidden = true;
            iTIMCF3.hidden = true;
            iTIMCF4.hidden = true;
            [self generateNewPeopleMCF];
            totalGuessed = arrayOf49PercentAndUnder.count;

        }
        if(practiceModeSwitch.isOn == true)
        {
            timerLable.hidden = true;
        }
        else if (practiceModeSwitch.isOn == false)
        {
            timerLable.hidden = false;
        }
    }
}
-(IBAction)showFilterView:(id)sender{
    [self playSoundNamed:@"ClickSound" andType:@"m4a" andFX:true];
    addedPoints.hidden = true;
    addedPoints.text = NULL;
    [self animateOut:MCTGameView];
    [self animateOut:mCFacesView];
    [self animateOut:FTGameView];
    
    currentScore = 0;
    currentScoreMCF = 0;
    currentScoreMCN = 0;
    
    if(filters.numberOfSegments > 0)
    {
        [filters setSelectedSegmentIndex:0];
        for (UIView *object in [labelsScrollView subviews])
        {
            [object removeFromSuperview];
        }
        [self loadLabels:[filters titleForSegmentAtIndex:0]];
    }
    
    
    iBMCN1.hidden = true;
    iBMCN2.hidden = true;
    iBMCN3.hidden = true;
    iBMCN4.hidden = true;

    iTIMCN1.hidden = true;
    iTIMCN2.hidden = true;
    iTIMCN3.hidden = true;
    iTIMCN4.hidden = true;
    nextMCN.hidden = true;
    
    for(int i =0; i < allPeople.count; i++)
    {
        Person *p;
        p =[allPeople objectAtIndex:i];
        p.hasBeenGuessed = false;
        p.hasBeenGuessedRight = false;
    }
    
    if(sender ==tFButton)
    {
        //[self animateView:firstView fromDirection:@"L" forThis:2];
        typeOfGame.text = @"Flashcard Game";
    }
    else if(sender == mCNamesButton)
    {
        //[self animateView:firstView fromDirection:@"L" forThis:2];
        typeOfGame.text = @"Multiple Choice Names";
    }
    else if(sender == mCFacesButton)
    {
        //[self animateView:firstView fromDirection:@"L" forThis:2];
        typeOfGame.text = @"Multiple Choice Faces";
    }
    
    if(filters.numberOfSegments > 0)
    {
        [self animateOut:firstView];
        [self animateOut:FTGameView];
        [self animateOut:MCGameView];
        [self animateOut:mCFacesView];
        FCView.hidden=true;
        MCCView.hidden = true;
        FGameView.hidden = true;
        FTGameView.hidden = true;
        nameAndButtonsView.hidden = true;
        companyTitleField.hidden = true;
        gameOverView.hidden = true;
        infoButton.hidden = true;
        personPic.hidden = true;
        showInfoButton.hidden = true;
        nameAndButtonsView.hidden = true;
        deptTitleField.hidden = true;
        jobTitleField.hidden = true;
        [self animateOut:mCFacesView];
        hintButton.hidden = true;
        moreInfoView.hidden = true;
        totalCorrect=0;
        totalGuessed=0;
        totalSeconds=0;
        seconds=0;
        minutes=0;
        timerView.hidden=true;
        
        [arrayOf49PercentAndUnder removeAllObjects];
        [arrayOf50PercentAndOver removeAllObjects];
        
        
        numInARow =0;

        [self animateIn:FilterView];

        [hardTextField resignFirstResponder];
        hardFlashcardGuessView.center = nameAndButtonsView.center;
    }
    else
    {
        [self animateOut:firstView];
        [self animateOut:FTGameView];
        [self animateOut:MCGameView];
        [self animateOut:mCFacesView];
        [self goButtonPressed];
        numberOfHintsPressed =0;
        hintLabel.text = [NSString stringWithFormat:@"H:%i", 3-numberOfHintsPressed];

        if(sender != tFButton && sender != mCNamesButton && sender != mCFacesButton)
        {
            
            [self animateOut:FTGameView];
            [self animateOut:MCGameView];
            [self animateOut:mCFacesView];
            [self animateOut:actualLeaderboardView];

            [self animateIn:firstView];
            currentScore = 0;
            currentScoreMCF = 0;
            currentScoreMCN = 0;
            timerView.hidden = true;
        }
    }
}
-(IBAction)goToNewView:(id)sender{
    [self playSoundNamed:@"ClickSound" andType:@"m4a" andFX:true];
    
    if(sender == leaderBoardButton)
    {
        [self animateOut:firstView];
        [self animateIn:leaderBoardView];
        NSString *string = [NSString stringWithFormat:@"%@/api/leaderboard", BaseURLString];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
        [manager GET:string
          parameters:@{}
             success:^(AFHTTPRequestOperation *operation, id responseObject) {
                 //show/create leaderboard
                 
                 
                 NSDictionary *dictionary = responseObject;
                 
                 leaderboardNames = [[NSArray alloc]init];
                 leaderboardIDs =[[NSArray alloc]init];
                 
                 leaderboardNames = [dictionary valueForKey:@"name"];
                 leaderboardIDs = [dictionary valueForKey:@"Id"];
                 
                 for(int i =0; i<leaderboardNames.count; ++i)
                 {
                     //create button and separators
                     UIButton*button;
                     button = [[UIButton alloc]init];
                     NSString*name=[[NSString alloc]init];
                     name = [leaderboardNames objectAtIndex:i];
                     [button setTitle:name forState:UIControlStateNormal];
                     button.titleLabel.font = Font;
                     [button setTitleColor:filters.tintColor forState:UIControlStateNormal];
                     button.titleLabel.font =  [UIFont fontWithName:@"Flexo" size:20];
                     [button addTarget:self action:@selector(chooseLeaderboard:) forControlEvents:UIControlEventTouchUpInside];
                     button.reversesTitleShadowWhenHighlighted = true;
                     button.bounds = CGRectMake(100, 10, 280, 40);
                     button.center=CGPointMake(leaderBoardView.center.x, 40*i+45);
                     [leaderBoardView addSubview:button];
                 }
                 
             } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 NSLog(@"Error: %@", error);
                 UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Getting to Leaderboard"
                                                                     message:@""//[error localizedDescription]
                                                                    delegate:nil
                                                           cancelButtonTitle:@"Ok"
                                                           otherButtonTitles:nil];
                 [alertView show];
             }];
    }
    else if(sender == statsButton)
    {
        statsScrollView.hidden = false;

        peopleStatsScrollView.hidden = true;
        for (UIView *object in [peopleStatsScrollView subviews])
        {
            [object removeFromSuperview];
        }
        
        bestScoreLabelF.text = [NSString stringWithFormat:@"Highest Score: %i",highscore];
        bestScoreLabelMCF.text = [NSString stringWithFormat:@"Highest Score: %i",highscoreMCF];
        bestScoreLabelMCN.text = [NSString stringWithFormat:@"Highest Score: %i",highscoreMCN];
        
        int m;
        int bT = bestTimeF;
        m=0;
        
        while(bT > 60)
        {
            bT-=60;
            m++;
        }
        
        if(m < 60)
        {
            if(bT < 10)
            {
                bestTimeLabelF.text = [NSString stringWithFormat:@"Best Rate: %i:0%i/Contact Correct",m,bT];
            }
            else
            {
                bestTimeLabelF.text = [NSString stringWithFormat:@"Best Rate: %i:%i/Contact Correct",m,bT];
            }
        }
        else
        {
            bestTimeLabelF.text = @"No Scores Yet";
        }
        
        
        m=0;
        bT = bestTimeMCF;
        while(bT > 60)
        {
            bT-=60;
            m++;
        }
        
        if(m < 60)
        {
            if(bT < 10)
            {
                bestTimeLabelMCF.text = [NSString stringWithFormat:@"Best Rate: %i:0%i/Contact Correct",m,bT];
            }
            else
            {
                bestTimeLabelMCF.text = [NSString stringWithFormat:@"Best Rate: %i:%i/Contact Correct",m,bT];
            }
        }
        else
        {
            bestTimeLabelMCF.text = @"No Scores Yet";
        }
        m=0;
        bT = bestTimeMCN;
        
        while(bT > 60)
        {
            bT-=60;
            m++;
        }
        if(m < 60)
        {
            if(bT < 10)
            {
                bestTimeLabelMCN.text = [NSString stringWithFormat:@"Best Rate: %i:0%i/Contact Correct",m,bT];
            }
            else
            {
                bestTimeLabelMCN.text = [NSString stringWithFormat:@"Best Rate: %i:%i/Contact Correct",m,bT];
            }
        }
        else
        {
            bestTimeLabelMCN.text = @"No Scores Yet";
        }
        mostTimeLabelF.text = [NSString stringWithFormat:@"Most Time Taken On: %@ (%i Seconds)", mostTimeF.getFullName,mostTimeIntF];
        mostTimeLabelMCF.text = [NSString stringWithFormat:@"Most Time Taken On: %@ (%i Seconds)", mostTimeMCF.getFullName,mostTimeIntMCF];
        mostTimeLabelMCN.text = [NSString stringWithFormat:@"Most Time Taken On: %@ (%i Seconds)", mostTimeMCN.getFullName,mostTimeIntMCN];
        
        mostTimeImageViewF.image = mostTimeF.selfImage;
        mostTimeImageViewMCF.image = mostTimeMCF.selfImage;
        mostTimeImageViewMCN.image = mostTimeMCN.selfImage;
        [self animateOut:firstView];

        [self animateIn:statsView];

        
        [stats setSelectedSegmentIndex:0];
    }
    else if(sender == settingsButton)
    {
        [self animateOut:firstView];

        [self animateIn:settingsView];

        
        statsScrollView.hidden = false;
        peopleStatsScrollView.hidden = true;
        for (UIView *object in [peopleStatsScrollView subviews])
        {
            [object removeFromSuperview];
        }
    }
}
-(IBAction)forgotPassword{
    [self animateOut:signInView];

    [self animateIn:forgotPasswordView];

}
-(IBAction)editAccount{
    [self animateOut:settingsView];
    [self animateIn:editAccountView];

}
//web / view change
-(IBAction)signIn{
    // /token
    NSString *string = [NSString stringWithFormat:@"%@/token", BaseURLString];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:string
       parameters:@{@"grant_type": @"password", @"password": signInP.text,@"userName": signInU.text
                    }
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              [self animateOut:registrationView];
              [self animateOut:signInView];
              [signInP resignFirstResponder];
              [signInU resignFirstResponder];
              NSDictionary *dictionary = responseObject; //[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&convertError];
              
              token=[dictionary valueForKey:@"access_token"];
              token = [NSString stringWithFormat:@"Bearer %@",token];
    
              [self animateIn:firstView];

              [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"ktoken"];
              [[NSUserDefaults standardUserDefaults] synchronize];
              
              
              //now request the rest of the user information
              NSString *string = [NSString stringWithFormat:@"%@/api/user/userinfo", BaseURLString];
              AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
              [manager.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
              [manager GET:string
                parameters:@{}
                   success:^(AFHTTPRequestOperation *operation, id responseObject) {
                       NSDictionary *dictionary = responseObject;
                       
                       NSArray* values = [[NSArray alloc] initWithArray:dictionary.allValues];
                       
                       //this is also not done well, i just know where the userId is

                       NSLog(@"%@", [values objectAtIndex:0]);
                       NSLog(@"%@", [values objectAtIndex:1]);
                       NSLog(@"%@", [values objectAtIndex:2]);
                       NSLog(@"%@", [values objectAtIndex:3]);

                       localUserId = [values objectAtIndex:3];

                       [[NSUserDefaults standardUserDefaults] setObject:localUserId forKey:@"klocalUserId"];
                       [[NSUserDefaults standardUserDefaults] synchronize];
                       
                       NSLog(@"%@ local user id", localUserId);
                       
                   } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                       NSLog(@"Error: %@", error);

                   }];
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             // NSLog(@"Error: %@", error);
              UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Signing In"
                                                                  message:@""//[error localizedDescription]
                                                                 delegate:nil
                                                        cancelButtonTitle:@"Ok"
                                                        otherButtonTitles:nil];
              [alertView show];
              
          }];
}
-(IBAction)logout{
    
    NSString *string = [NSString stringWithFormat:@"%@/api/Account/Logout", BaseURLString];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
    [manager POST:string
       parameters:@{}
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              
              [self eraseStats];
              [self animateOut:settingsView];

              [self animateIn:signInView];

              signInP.text = NULL;
              signInU.text = NULL;
              
              token = @"";
              [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"ktoken"];
              [[NSUserDefaults standardUserDefaults] synchronize];
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

              
          }];

    

}
-(IBAction)changePassword{
    NSString *string = [NSString stringWithFormat:@"%@/api/account/changepassword", BaseURLString];
    [self animateOut:editAccountView];

    [self animateIn:signInView];
    
    NSLog(@"op - %@",oldPassword.text);
    NSLog(@"np - %@",newPassword.text);
    NSLog(@"cnp - %@",confirmPassword.text);


    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
    [manager POST:string
       parameters:@{@"oldpassword": oldPassword.text, @"newpassword": newPassword.text,@"confirmpassword": confirmPassword.text}
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              [oldPassword resignFirstResponder];
              [newPassword resignFirstResponder];
              [confirmPassword resignFirstResponder];
              
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
               NSLog(@"Error: %@", error.localizedDescription);
              UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Editing Account"
                                                                  message:@""//[error localizedDescription]
                                                                 delegate:nil
                                                        cancelButtonTitle:@"Ok"
                                                        otherButtonTitles:nil];
              [self animateOut:signInView];

              [self animateIn:settingsView];

              [alertView show];
              [oldPassword resignFirstResponder];
              [newPassword resignFirstResponder];
              [confirmPassword resignFirstResponder];

          }];
}
-(IBAction)sendEmail{
    [self animateOut:forgotPasswordView];
    [self animateIn:signInView];
    [userNameFP resignFirstResponder];

    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Email"
                                                        message:[NSString stringWithFormat:@"Check your email in a minute and you should recieve your new password"]
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];
    
    NSString *string = [NSString stringWithFormat:@"%@/api/account/ForgotPassword?username=%@", BaseURLString,userNameFP.text];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:string
       parameters:@{}
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Email Sent"
                                                                  message:[NSString stringWithFormat:@"New password sent to %@!",userNameFP.text]
                                                                 delegate:nil
                                                        cancelButtonTitle:@"Ok"
                                                        otherButtonTitles:nil];
              [alertView show];
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"Error: %@", error.localizedDescription);
              UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                  message:@""//[error localizedDescription]
                                                                 delegate:nil
                                                        cancelButtonTitle:@"Ok"
                                                        otherButtonTitles:nil];

              [alertView show];
          }];
} // sends email to user of new password
-(IBAction)signUp{
    //account/register
    NSString *string = [NSString stringWithFormat:@"%@/api/account/register", BaseURLString];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:string
       parameters:@{@"username": registerU.text, @"password": registerP.text,@"email": registerE.text,@"confirmPassword": registerCP.text,@"firstName": registerFN.text,@"lastName": registerLN.text
                    }
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              [self animateOut:registrationView];
              [self animateIn:signInView];

              [registerCP resignFirstResponder];
              [registerE resignFirstResponder];
              [registerFN resignFirstResponder];
              [registerLN resignFirstResponder];
              [registerP resignFirstResponder];
              [registerU resignFirstResponder];

              NSLog(@"JSON: %@", responseObject);
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"Error: %@", error.localizedDescription);
              UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                  message:@""//[error localizedDescription]
                                                                 delegate:nil
                                                        cancelButtonTitle:@"Ok"
                                                        otherButtonTitles:nil];
              
              [alertView show];
          }];
}
-(IBAction)chooseLeaderboard:(id)sender{
    [self playSoundNamed:@"ClickSound" andType:@"m4a" andFX:true];
    UIButton*leaderboardButtonPressed = sender;
    NSString *string = [NSString stringWithFormat:@"%@/api/scores/points/", BaseURLString];
    NSString *sIQ;
    for (int i =0; i<leaderboardNames.count; i++) {
        sIQ = [leaderboardNames objectAtIndex:i];
        if([leaderboardButtonPressed.titleLabel.text isEqual:sIQ])
        {
            currentLeaderboard.text = sIQ;
            sIQ = [leaderboardIDs objectAtIndex:i];
            string = [NSString stringWithFormat:@"%@%@",string,sIQ];
        }
    }
    
    [self animateOut:leaderBoardView];
    [self animateIn:actualLeaderboardView];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
    [manager GET:string
      parameters:@{}
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSDictionary *dictionary = responseObject;
             
             scores = [[NSArray alloc]init];
             numsOfPeople = [[NSArray alloc]init];
             percentages = [[NSArray alloc]init];
             people = [[NSMutableArray alloc]init];
             
             scores = [dictionary valueForKey:@"ScoreValue"];
             numsOfPeople = [dictionary valueForKey:@"ScoreNumberOfContacts"];
             percentages= [dictionary valueForKey:@"ScorePercentage"];
             //i can get their first and last name separately but it is difficult to add them together
             NSDictionary *userDictionary = [dictionary valueForKey:@"User"];
             
             NSArray*firstNames = [[NSArray alloc]initWithArray:[userDictionary valueForKey:@"FirstName"]];
             NSArray*lastNames = [[NSArray alloc]initWithArray:[userDictionary valueForKey:@"LastName"]];
             for(int i =0; i < firstNames.count; ++i)
             {
                 NSString *fn = [[NSString alloc] init];
                 NSString *ln = [[NSString alloc] init];
                 NSString *n = [[NSString alloc] init];
                 
                 fn = [firstNames objectAtIndex:i];
                 ln = [lastNames objectAtIndex:i];
                 n = [NSString stringWithFormat:@"%@ %@", fn, ln ];
                 [people addObject:n];
             }
             
             //people = [userDictionary valueForKey:@"Username"];
             
             
             [scoresScrollView setScrollEnabled:YES];
             [scoresScrollView setContentSize:CGSizeMake(actualLeaderboardView.bounds.size.width, actualLeaderboardView.bounds.size.height)];
             
             for(int i =0; i<scores.count; ++i)
             {
                 //create button and separators
                 UIImageView*image = [[UIImageView alloc]init];
                 
                 int length = (i ==0) ? 1 : (int) log10(i) + 1;
                 
                 Person*pIQ = [[Person alloc]init];
                 
                 for(int r = 0; r<allPeople.count;++r)
                 {
                     
                     pIQ = [allPeople objectAtIndex:r];
                     
                     if([pIQ.fullName isEqual:[people objectAtIndex:i]])
                     {
                         image.image = pIQ.selfImage;
                         break;
                     }
                     else
                     {
                         image.image = [UIImage imageNamed:@"AppIcon-2"];
                     }
                 }
                 
                 int height = 60;
                 
                 [image setBounds:CGRectMake(129 + length-1, 10, height, height)];
                 image.frame =CGRectMake(129 + length -1, 10, height, height);
                 
                 UIButton*button;
                 button = [[UIButton alloc]init];
                 NSString*name=[[NSString alloc]init];
                 name = [people objectAtIndex:i];
                 NSString  *score = [[NSString alloc]init];
                 score = [scores objectAtIndex:i];
                 NSString  *numOfPeople = [[NSString alloc]init];
                 numOfPeople = [numsOfPeople objectAtIndex:i];
                 NSString  *percentString = [[NSString alloc]init];
                 percentString = [percentages objectAtIndex:i];
                 
                 [button addSubview:image];
                 
                 button.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
                 [button setTitle: [NSString stringWithFormat:@"%i                    %@\n                      %@ points\n                      %@ people %@%%", i+1,name,score,numOfPeople,percentString] forState: UIControlStateNormal];
                 [button setTitleColor:filters.tintColor forState:UIControlStateNormal];
                 button.titleLabel.font =  [UIFont fontWithName:@"Flexo" size:17];
                 [button addTarget:self action:@selector(personOnLeaderboardTapped:) forControlEvents:UIControlEventTouchUpInside];
                 button.reversesTitleShadowWhenHighlighted = true;
                 button.bounds = CGRectMake(100, 10, 280, height);
                 button.center=CGPointMake(leaderBoardView.center.x, (height + 10)*i+height+10);
                 button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
                 button.titleLabel.numberOfLines = 3;
                 
                 [scoresScrollView addSubview:button];
                 
                 if(button.center.y + button.bounds.size.height/2 + 10 > actualLeaderboardView.bounds.size.height)
                 {
                     [scoresScrollView setContentSize:CGSizeMake(actualLeaderboardView.bounds.size.width, button.center.y + button.bounds.size.height/2 + 10 + height) ];
                 }
             }
             
             
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
             NSLog(@"%@ - this is the URL", string);
             UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Getting to Leaderboard"
                                                                 message:@"Try logging out and then back in..."//[error localizedDescription]
                                                                delegate:nil
                                                       cancelButtonTitle:@"Ok"
                                                       otherButtonTitles:nil];
             [alertView show];
         }];
}
//reveal / show change
-(IBAction)showPicker:(id)sender{
    [self playSoundNamed:@"ClickSound" andType:@"m4a" andFX:true];

    NSDate* currentDate;
    currentDate = [[NSDate alloc]init];
    NSDateFormatter*dF = [[NSDateFormatter alloc]init];
    [dF setDateFormat:@"MM/dd/yy"];

    if(sender == fromButton)
    {
        fromOrTo.text = @"From:";
        onFrom=true;
        
        //eventuall max date will equal min date
        date.maximumDate = [dF dateFromString:toField.text];
        date.minimumDate = [dF dateFromString:@"08/01/08"];
        
        
       // date.date =  [[fromField.text]DateValue];
        //date.minimumDate =
        
        if(fromField.text != NULL)
        {
            //eventually we will make the date always equal the date selected
            date.date= [dF dateFromString:fromField.text];
        }
        else
        {
            date.date = date.minimumDate;
        }
    }
    if(sender == toButton)
    {
        fromOrTo.text = @"To:";

        //eventually min date will equal from date
        date.maximumDate = currentDate;
        date.minimumDate = [dF dateFromString:fromField.text];

        //date.date = fromField.text;
        if(toField.text != NULL)
        {
            //eventually we will make the date always equal the date selected
            date.date= [dF dateFromString:toField.text];
        }
        else
        {
            date.date = currentDate;
        }
        onFrom=false;
    }
}
-(IBAction)moreInfoMC:(id)sender{
    [self playSoundNamed:@"ClickSound" andType:@"m4a" andFX:true];

    if(sender == iBMCF1)
    {
        [self showMoreInfo:pMCF1];
    }
    else if(sender == iBMCF2)
    {
        [self showMoreInfo:pMCF2];
    }
    else if(sender == iBMCF3)
    {
        [self showMoreInfo:pMCF3];
    }
    else if(sender == iBMCF4)
    {
        [self showMoreInfo:pMCF4];
    }
    else if(sender == iBMCN1)
    {
        [self showMoreInfo:pMCN1];
    }
    else if(sender == iBMCN2)
    {
        [self showMoreInfo:pMCN2];
    }
    else if(sender == iBMCN3)
    {
        [self showMoreInfo:pMCN3];
    }
    else if(sender == iBMCN4)
    {
        [self showMoreInfo:pMCN4];
    }
    else
    {
        //they're in the stats view
        for(int i =0; i < buttonsOnStatsView.count; ++i)
        {
            if(sender == [buttonsOnStatsView objectAtIndex:i])
            {
                currentPerson = [peopleOnStatsView objectAtIndex:i];
                [self showMoreInfo:currentPerson];
            }
        }
    }
}
-(IBAction)showEnlargedImage{
    enlargedImage.image = moreInfoViewImage.image;
    enlargedImageClearBackground.hidden = false;
    enlargedImage.contentMode = UIViewContentModeScaleAspectFit;
    [self animateIn:enlargedImage];
}
-(IBAction)hideEnlargedImage{
    enlargedImage.hidden = true;
    enlargedImageClearBackground.hidden = true;
    [self animateOut:enlargedImage];

}
-(IBAction)moreInfo{

    [self showMoreInfo:currentPerson];
    
    [self playSoundNamed:@"ClickSound" andType:@"m4a" andFX:true];
    [self.view addSubview:moreInfoView];
    if([typeOfGame.text isEqualToString:@"Flashcard Game"])
    {
        
        [self animateFlip:FTGameView withVeiw:moreInfoView];
    }
    else if ([typeOfGame.text isEqualToString:@"Multiple Choice Faces"])
    {
        [self animateFlip:mCFacesView withVeiw:moreInfoView];
        moreInfoView.hidden = false;
    }
    else if([typeOfGame.text isEqualToString:@"Multiple Choice Names"])
    {
        [self animateFlip:MCTGameView withVeiw:moreInfoView];
        moreInfoView.hidden = false;
    }
    else{
        [self animateIn:moreInfoView];
    }
    
    moreInfoViewImage.image = personPic.image;
    //timerLable.text = @"Pause";
    if(currentPerson.firstName.length > 0 && currentPerson.lastName.length > 0)
    {
        moreInfoName.text = [NSString stringWithFormat:@"%@ %@", currentPerson.firstName, currentPerson.lastName];
    }
    else if(currentPerson.firstName.length > 0)
    {
        moreInfoName.text = [NSString stringWithFormat:@"%@", currentPerson.firstName];
    }
    else
    {
        moreInfoName.text = @"No Name Specified";
    }
    if(currentPerson.jobTitle.length > 0)
    {
        moreInfoJobTitle.text = [NSString stringWithFormat:@"%@", currentPerson.jobTitle];
    }
    else
    {
        moreInfoJobTitle.text = @"No Job Specified";
    }
    if(currentPerson.company.length > 0)
    {
        moreInfoCompany.text = [NSString stringWithFormat:@"%@", currentPerson.company];
        
    }
    else
    {
        moreInfoCompany.text = @"No Company Specified";
    }
    if(currentPerson.department.length > 0)
    {
        moreInforDepartment.text = [NSString stringWithFormat:@"%@", currentPerson.department];
   
    }
    else
    {
        moreInforDepartment.text = @"No Department Specified";
    }
    UIFont *font = [UIFont fontWithName:@"Flexo" size:20.0];
    
    [moreInfoBio setFont:font];
    
    if(currentPerson.notes.length > 0)
    {
        moreInfoBio.text = [NSString stringWithFormat:@"%@", currentPerson.notes];

    }
    else
    {
        moreInfoBio.text = @"No Notes";
    }

}
-(IBAction)showInfo:(id)sender{
    [self playSoundNamed:@"ClickSound" andType:@"m4a" andFX:true];
    NSString *nameString = [[NSString alloc]init];
    if([typeOfGameString isEqual:@"Full Name"])
    {
        nameString =[currentPerson getFullName];
    }
    if([typeOfGameString isEqual:@"Last Name"])
    {
        nameString = [currentPerson lastName];
    }
    if([typeOfGameString isEqual:@"First Name"])
    {
        nameString = [currentPerson firstName];
    }
    
    if (currentPerson.lastName == NULL)
    {
        nameLabel.text = nameString;
    }
    
    else
    {
        nameLabel.text = nameString;
    }
    //this one needs no animation
    nameLabel.hidden = false;
    guessButton.hidden = true;
    nameView.hidden = false;
    infoButton.hidden = false;
    hintButton.hidden = true;
    
}
-(IBAction)gotRight:(id)sender {
    numInARow++;
    [self playSoundNamed:@"DingSound" andType:@"m4a" andFX:true];
    if(timeOnThisCard > mostTimeIntF)
    {
        mostTimeIntF = timeOnThisCard;
        mostTimeF = currentPerson;
    }
    
    if(timeOnThisCard>0)
    {
        currentScore += 100 - (10*(10 -timeOnThisCard));

    }
    
    numberOfHintsPressed = 0;
    hintLabel.text = [NSString stringWithFormat:@"H:%i", 3-numberOfHintsPressed];
    
    timeOnThisCard = 10;
    timeOnThisCardLabel.text =@"10";
    currentPerson.hasBeenGuessed = true;
    currentPerson.hasBeenGuessedRight = true;
    totalCorrect++;
    
    [arrayOf50PercentAndOver addObject:currentPerson];
    [arrayOf49PercentAndUnder removeObjectIdenticalTo:currentPerson];
    
    if([self checkIfAllPeopleHaveBeenGuessed] == false && practiceModeSwitch.isOn == false)
    {
        lastPerson = currentPerson;
        do
        {
            [self loadNewPerson];
        }while (lastPerson == currentPerson);
        guessButton.hidden = false;
        nameView.hidden = true;
        infoButton.hidden = true;
        hintButton.hidden = false;
        
    }
    else if([self checkIfAllPeopleHaveBeenGuessed] == true && practiceModeSwitch.isOn == false)
    {
        [self animateOut:FTGameView];
        [self animateIn:gameOverView];
        addedPoints.hidden = true;
        addedPoints.text = NULL;

        //[self animateView:FTGameView fromDirection:@"L" forThis:2];
        gameOverView.hidden = false;
        numInARow =0;
        guessButton.hidden = true;
        nameView.hidden = true;
        infoButton.hidden = true;
        hintButton.hidden = true;
        nameAndButtonsView.hidden = true;
        personPic.hidden = true;
        [arrayOf49PercentAndUnder removeAllObjects];
        [arrayOf50PercentAndOver removeAllObjects];
        timerView.hidden = true;
        
        totalPercentage = totalCorrect/totalGuessed;
        
        if(seconds <=9)
        {
            percentLabel.text = [NSString stringWithFormat:@"YOU GOT %d%% (%i OUT OF %i) IN %i:0%i",(int)round(totalPercentage*100),(int)round(totalCorrect),(int)round(totalGuessed),minutes,seconds];
        }
        else
        {
            percentLabel.text = [NSString stringWithFormat:@"YOU GOT %d%% (%i OUT OF %i) IN %i:%i",(int)round(totalPercentage*100),(int)round(totalCorrect),(int)round(totalGuessed),minutes,seconds];
        }
        
        totalSeconds = minutes*60 + seconds;
        [self saveData];

        
        currentScore = (int)round(((1000*totalGuessed*totalGuessed*totalPercentage)/(totalSeconds)));
        [self printHighScore];
        [self updateAchievements];
        
        currentScore = 0;

        
        totalCorrect = 0;
        totalGuessed = 0;
        for(int i =0; i < allPeople.count; i++)
        {
            Person *p;
            p =[allPeople objectAtIndex:i];
            p.hasBeenGuessed = false;
            p.hasBeenGuessedRight = false;
        }
    }
    if([self checkIfAllPeopleHaveBeenGuessedCorrectly] == false && practiceModeSwitch.isOn == true)
    {
        lastPerson = currentPerson;
        do{
            [self loadNewPerson];
        }while (lastPerson == currentPerson);
        guessButton.hidden = false;
        nameView.hidden = true;
        infoButton.hidden = true;
        hintButton.hidden = false;
    }
    else if([self checkIfAllPeopleHaveBeenGuessedCorrectly] == true && practiceModeSwitch.isOn == true)
    {
        //[self animateView:FTGameView fromDirection:@"L" forThis:2];
        [self animateOut:MCTGameView];
        [self animateIn:gameOverView];
        addedPoints.hidden = true;

        numInARow =0;

        guessButton.hidden = true;
        nameView.hidden = true;
        infoButton.hidden = true;
        hintButton.hidden = true;
        nameAndButtonsView.hidden = true;
        personPic.hidden = true;
        [arrayOf49PercentAndUnder removeAllObjects];
        [arrayOf50PercentAndOver removeAllObjects];
        
  
        timerView.hidden = true;

        totalCorrect = 0;
        totalGuessed = 0;
        
        for(int i =0; i < allPeople.count; i++)
        {
            Person *p;
            p =[allPeople objectAtIndex:i];
            p.hasBeenGuessed = false;
            p.hasBeenGuessedRight = false;
        }
    }
    numOfContactsLeftLabel.text = [NSString stringWithFormat:@"%i",arrayOf49PercentAndUnder.count];
    [self respondToNumInARow];
}
-(IBAction)gotWrong:(id)sender {
    numInARow = 0;
    if(timeOnThisCard > mostTimeIntF)
    {
        mostTimeIntF = timeOnThisCard;
        mostTimeF = currentPerson;
    }

        timeOnThisCard = 10;
        timeOnThisCardLabel.text =@"10";
    

    
    numberOfHintsPressed = 0;
    hintLabel.text = [NSString stringWithFormat:@"H:%i", 3-numberOfHintsPressed];
    
    currentPerson.hasBeenGuessed = true;
    [self playSoundNamed:@"DongSound" andType:@"m4a" andFX:true];

    guessButton.hidden = false;
    nameView.hidden = true;
    infoButton.hidden = true;
    hintButton.hidden = false;
    
    if(practiceModeSwitch.isOn == false)
    {
        
        [arrayOf50PercentAndOver addObject:currentPerson];
        [arrayOf49PercentAndUnder removeObjectIdenticalTo:currentPerson];
        if(arrayOf49PercentAndUnder.count > 0)
        {
            lastPerson = currentPerson;
            do{
            [self loadNewPerson];
            }while (lastPerson == currentPerson);
        }
        else
        {
           // [self animateView:FTGameView fromDirection:@"L" forThis:2];
            [self animateOut:MCTGameView];
            [self animateIn:gameOverView];
            addedPoints.hidden = true;

            timerView.hidden=false;
            numInARow =0;

            guessButton.hidden = true;
            nameView.hidden = true;
            infoButton.hidden = true;
            hintButton.hidden = true;
            nameAndButtonsView.hidden = true;
            personPic.hidden = true;
            [arrayOf49PercentAndUnder removeAllObjects];
            [arrayOf50PercentAndOver removeAllObjects];
            
            totalPercentage = totalCorrect/totalGuessed;
            
            if(seconds <=9)
            {
                percentLabel.text = [NSString stringWithFormat:@"YOU GOT %d%% (%i OUT OF %i) IN %i:0%i",(int)round(totalPercentage*100),(int)round(totalCorrect),(int)round(totalGuessed),minutes,seconds];
            }
            else
            {
                percentLabel.text = [NSString stringWithFormat:@"YOU GOT %d%% (%i OUT OF %i) IN %i:%i",(int)round(totalPercentage*100),(int)round(totalCorrect),(int)round(totalGuessed),minutes,seconds];
            }
            [self saveData];
            totalSeconds = minutes*60 + seconds;
            currentScore = (int)round(((1000*totalGuessed*totalGuessed*totalPercentage)/(totalSeconds*totalSeconds)));
            [self printHighScore];
            [self updateAchievements];
            currentScore = 0;
            [self animateOut:FilterView];

            [self saveData];
            totalCorrect = 0;
            totalGuessed = 0;
            timerView.hidden = true;
            for(int i =0; i < allPeople.count; i++)
            {
                Person *p;
                p =[allPeople objectAtIndex:i];
                p.hasBeenGuessed = false;
                p.hasBeenGuessedRight = false;
            }

        }
        numOfContactsLeftLabel.text = [NSString stringWithFormat:@"%i",arrayOf49PercentAndUnder.count];
    }
    else if(practiceModeSwitch.isOn == true)
    {
        lastPerson = currentPerson;
        if(arrayOf49PercentAndUnder.count > 1)
        {
            do{
                [self loadNewPerson];
            }while (lastPerson == currentPerson);
        }
        else
        {
            [self animateOut:MCTGameView];
            [self animateIn:gameOverView];
            addedPoints.hidden = true;

            timerView.hidden=false;
            numInARow =0;

            guessButton.hidden = true;
            nameView.hidden = true;
            infoButton.hidden = true;
            hintButton.hidden = true;
            nameAndButtonsView.hidden = true;
            personPic.hidden = true;
            [arrayOf49PercentAndUnder removeAllObjects];
            [arrayOf50PercentAndOver removeAllObjects];
            
            
            [self printHighScore];
            [self updateAchievements];
            currentScore = 0;
            [self animateOut:FilterView];

            totalCorrect = 0;
            totalGuessed = 0;
            timerView.hidden = true;
            for(int i =0; i < allPeople.count; i++)
            {
                Person *p;
                p =[allPeople objectAtIndex:i];
                p.hasBeenGuessed = false;
                p.hasBeenGuessedRight = false;
            }
        }
    }
}
-(IBAction)hintMCF{
    [self playSoundNamed:@"HintSound" andType:@"m4a" andFX:true];
    if(iTIMCF1.hidden == true || iTIMCF2.hidden == true || iTIMCF3.hidden == true || iTIMCF4.hidden == true)
    {
        if(numberOfHintsPressed < 2)
        {
            int x;
            Person* randomPerson;
            bool canGoOn;
            canGoOn = false;
            do
            {
                x = rand()%4;
                if(x == 0 && iBMCF1.hidden == true)
                {
                    randomPerson = pMCF1;
                    canGoOn = true;
                }
                if(x == 1 && iBMCF2.hidden == true)
                {
                    randomPerson = pMCF2;
                    canGoOn = true;
                }
                if(x == 2 && iBMCF3.hidden == true)
                {
                    randomPerson = pMCF3;
                    canGoOn = true;
                }
                if(x == 3 && iBMCF4.hidden == true)
                {
                    randomPerson = pMCF4;
                    canGoOn = true;
                }
                
            }while(randomPerson == correctPersonMCF || canGoOn == false);
            
            if(randomPerson == pMCF1)
            {
                iBMCF1.hidden = false;
                iTIMCF1.hidden = false;
                n1.text = [NSString stringWithFormat:@"%@ %@",pMCF1.firstName,pMCF1.lastName];
                iTIMCF1.image = [UIImage imageNamed:@"SmallTD.png"];
            }
            if(randomPerson == pMCF2)
            {
                iBMCF2.hidden = false;
                iTIMCF2.hidden = false;
                n2.text = [NSString stringWithFormat:@"%@ %@",pMCF2.firstName,pMCF2.lastName];
                iTIMCF2.image = [UIImage imageNamed:@"SmallTD.png"];
            }
            if(randomPerson == pMCF3)
            {
                iBMCF3.hidden = false;
                iTIMCF3.hidden = false;
                n3.text = [NSString stringWithFormat:@"%@ %@",pMCF3.firstName,pMCF3.lastName];
                iTIMCF3.image = [UIImage imageNamed:@"SmallTD.png"];
            }
            if(randomPerson == pMCF4)
            {
                iBMCF4.hidden = false;
                iTIMCF4.hidden = false;
                n4.text = [NSString stringWithFormat:@"%@ %@",pMCF4.firstName,pMCF4.lastName];
                iTIMCF4.image = [UIImage imageNamed:@"SmallTD.png"];
            }
            
            ++numberOfHintsPressed;
            hintLabel.text = [NSString stringWithFormat:@"H:%i", 2-numberOfHintsPressed];
            seconds+=5;
            timeOnThisCard-=5;
            timeOnThisCardLabel.text = [NSString stringWithFormat:@"%i", timeOnThisCard];

            if( numberOfHintsPressed > 2)
            {
                hintLabel.text = @"H:0";
            }
            if(seconds <= 9)
            {
                timerLable.text = [NSString stringWithFormat:@"%i:0%i", minutes,seconds];
            }
            else
            {
                timerLable.text = [NSString stringWithFormat:@"%i:%i", minutes,seconds];
            }
            if(seconds == 60)
            {
                seconds = 0;
                //timerLableSeconds.text = [NSString stringWithFormat:@"0%i", countUpValue];
                
                minutes +=1;
                timerLable.text = [NSString stringWithFormat:@"%i:0%i", minutes,seconds];
            }
            else if(seconds > 59)
            {
                seconds = seconds - 60;
                //timerLableSeconds.text = [NSString stringWithFormat:@"0%i", countUpValue];
                
                minutes +=1;
                timerLable.text = [NSString stringWithFormat:@"%i:0%i", minutes,seconds];
            }
        }
    }
}
-(IBAction)hintMCN{
    [self playSoundNamed:@"HintSound" andType:@"m4a" andFX:true];
    if(iTIMCN1.hidden == true || iTIMCN2.hidden == true || iTIMCN3.hidden == true || iTIMCN4.hidden == true)
    {
        if(numberOfHintsPressed < 2)
        {
            int x;
            Person* randomPerson;
            bool canGoOn;
            canGoOn = false;
            do
            {
                x = rand()%4;
                if(x == 0 && iTIMCN1.hidden == true)
                {
                    randomPerson = pMCN1;
                    canGoOn = true;
                }
                if(x == 1 && iTIMCN2.hidden == true)
                {
                    randomPerson = pMCN2;
                    canGoOn = true;
                }
                if(x == 2 && iTIMCN3.hidden == true)
                {
                    randomPerson = pMCN3;
                    canGoOn = true;
                }
                if(x == 3 && iTIMCN4.hidden == true)
                {
                    randomPerson = pMCN4;
                    canGoOn = true;
                }
                
            }while(randomPerson == correctMCPerson || canGoOn == false);
            
            if(randomPerson == pMCN1)
            {
                iBMCN1.hidden = false;
                iTIMCN1.hidden = false;
                iTIMCN1.image = [UIImage imageNamed:@"SmallTD.png"];
            }
            if(randomPerson == pMCN2)
            {
                iBMCN2.hidden = false;
                iTIMCN2.hidden = false;
                iTIMCN2.image = [UIImage imageNamed:@"SmallTD.png"];
            }
            if(randomPerson == pMCN3)
            {
                iBMCN3.hidden = false;
                iTIMCN3.hidden = false;
                iTIMCN3.image = [UIImage imageNamed:@"SmallTD.png"];
            }
            if(randomPerson == pMCN4)
            {
                iBMCN4.hidden = false;
                iTIMCN4.hidden = false;
                iTIMCN4.image = [UIImage imageNamed:@"SmallTD.png"];
            }
            
            ++numberOfHintsPressed;
            hintLabel.text = [NSString stringWithFormat:@"H:%i", 2-numberOfHintsPressed];
            seconds+=5;
            timeOnThisCard-=5;
            timeOnThisCardLabel.text = [NSString stringWithFormat:@"%i", timeOnThisCard];

            if( numberOfHintsPressed > 2)
            {
                hintLabel.text = @"H:0";
            }
            if(seconds <= 9)
            {
                timerLable.text = [NSString stringWithFormat:@"%i:0%i", minutes,seconds];
            }
            else
            {
                timerLable.text = [NSString stringWithFormat:@"%i:%i", minutes,seconds];
            }
            if(seconds == 60)
            {
                seconds = 0;
                //timerLableSeconds.text = [NSString stringWithFormat:@"0%i", countUpValue];
                
                minutes +=1;
                timerLable.text = [NSString stringWithFormat:@"%i:0%i", minutes,seconds];
            }
            else if(seconds > 59)
            {
                seconds = seconds - 60;
                //timerLableSeconds.text = [NSString stringWithFormat:@"0%i", countUpValue];
                
                minutes +=1;
                timerLable.text = [NSString stringWithFormat:@"%i:0%i", minutes,seconds];
            }
        }
    }
}
-(IBAction)nextMCF{
    [self playSoundNamed:@"ClickSound" andType:@"m4a" andFX:true];
    numberOfHintsPressed = 0;
    [self generateNewPeopleMCF];
    nextButtonMCF.hidden = true;
    iBMCF1.hidden = true;
    iBMCF2.hidden = true;
    iBMCF3.hidden = true;
    iBMCF4.hidden = true;
    
    iTIMCF1.hidden = true;
    iTIMCF2.hidden = true;
    iTIMCF3.hidden = true;
    iTIMCF4.hidden = true;
    
    
    numOfContactsLeftLabel.text = [NSString stringWithFormat:@"%i",arrayOf49PercentAndUnder.count];
}
-(IBAction)nextMCN{
    if(arrayOf49PercentAndUnder.count ==0)
    {
        iBMCN1.hidden = true;
        iBMCN2.hidden = true;
        iBMCN3.hidden = true;
        iBMCN4.hidden = true;
        
        iTIMCN1.hidden = true;
        iTIMCN2.hidden = true;
        iTIMCN3.hidden = true;
        iTIMCN4.hidden = true;
        nextMCN.hidden = true;
        numInARow =0;
        
        [self animateOut:MCTGameView];

        [self animateIn:gameOverView];
        addedPoints.hidden = true;

        guessButton.hidden = true;
        nameView.hidden = true;
        infoButton.hidden = true;
        hintButton.hidden = true;
        nameAndButtonsView.hidden = true;
        personPic.hidden = true;
        [arrayOf49PercentAndUnder removeAllObjects];
        [arrayOf50PercentAndOver removeAllObjects];
        timerView.hidden = true;
        
        totalPercentage = totalCorrect/totalGuessed;
        
        if(seconds <=9)
        {
            percentLabel.text = [NSString stringWithFormat:@"YOU GOT %d%% (%i OUT OF %i) IN %i:0%i",(int)round(totalPercentage*100),(int)round(totalCorrect),(int)round(totalGuessed),minutes,seconds];
        }
        else
        {
            percentLabel.text = [NSString stringWithFormat:@"YOU GOT %d%% (%i OUT OF %i) IN %i:%i",(int)round(totalPercentage*100),(int)round(totalCorrect),(int)round(totalGuessed),minutes,seconds];
        }
        [self saveData];
        totalSeconds = minutes*60 + seconds;
        
        //currentScoreMCN = (int)round(((1000*totalGuessed*totalGuessed*totalPercentage)/(totalSeconds*totalSeconds)));
        [self printHighScoreMCN];
        [self updateAchievements];
        currentScoreMCN = 0;
        [self animateOut:FilterView];
        
        totalCorrect = 0;
        totalGuessed = 0;
        for(int i =0; i < allPeople.count; i++)
        {
            Person *p;
            p =[allPeople objectAtIndex:i];
            p.hasBeenGuessed = false;
            p.hasBeenGuessedRight = false;
        }
    }
    else
    {
        [self playSoundNamed:@"ClickSound" andType:@"m4a" andFX:true];
        numberOfHintsPressed = 0;
        hintLabel.text = [NSString stringWithFormat:@"H:%i", 2-numberOfHintsPressed];
        
        iBMCN1.hidden = true;
        iBMCN2.hidden = true;
        iBMCN3.hidden = true;
        iBMCN4.hidden = true;
        
        iTIMCN1.hidden = true;
        iTIMCN2.hidden = true;
        iTIMCN3.hidden = true;
        iTIMCN4.hidden = true;
        nextMCN.hidden = true;
        
        [self generateNewPeopleMCN];
        currentPerson.hasBeenGuessed = false;
        numOfContactsLeftLabel.text = [NSString stringWithFormat:@"%i",arrayOf49PercentAndUnder.count];
    }
}
-(IBAction)hintButtonPressed{
    if(numberOfHintsPressed < 3)
    {
        [self playSoundNamed:@"HintSound" andType:@"m4a" andFX:true];
        
    }
    
    ++numberOfHintsPressed;
    hintLabel.text = [NSString stringWithFormat:@"H:%i", 3-numberOfHintsPressed];
    [self generateDotsForTime:numberOfHintsPressed];
}
-(IBAction)percentChanged{
    percentField.text = [NSString stringWithFormat:@"%@%%",percentField.text];
}
-(IBAction)mcAnswerPressed:(id)sender{
    iBMCN1.hidden = false;
    iBMCN2.hidden = false;
    iBMCN3.hidden = false;
    iBMCN4.hidden = false;
    
    filterField.text = @"";
    filterLabel.text = @"Filter By:";
    
    //(pIQ == correctPersonMCF && practiceModeSwitch.isOn == true && correctPersonMCF.hasBeenGuessedRight == false) || (practiceModeSwitch.isOn == false && correctPersonMCF.hasBeenGuessed == false)
    // (practiceModeSwitch.isOn == false && correctPersonMCF.hasBeenGuessed == false) || (practiceModeSwitch.isOn == true && correctPersonMCF.hasBeenGuessedRight == false)
    NSString *nameString = [[NSString alloc]init];
    if([typeOfGameString isEqual:@"Full Name"])
    {
        nameString =[correctMCPerson getFullName];
    }
    if([typeOfGameString isEqual:@"Last Name"])
    {
        nameString = [correctMCPerson lastName];
    }
    if([typeOfGameString isEqual:@"First Name"])
    {
        nameString = [correctMCPerson firstName];
    }

    if (practiceModeSwitch.isOn == false && correctMCPerson.hasBeenGuessed == false)
    {
        nextMCN.hidden = false;
        UIButton *b = (UIButton *)sender;
        [arrayOf49PercentAndUnder removeObjectIdenticalTo:correctMCPerson];
        [arrayOf50PercentAndOver addObject:correctMCPerson];
        if ([b.titleLabel.text isEqualToString:correctMCPerson.getFullName] && correctMCPerson.hasBeenGuessed == false)
        {
            if(b == mcButton1)
            {
                iTIMCN1.hidden = false;
                iTIMCN1.image = [UIImage imageNamed:@"SmallTU.png"];
            }
            if(b == mcButton2)
            {
                iTIMCN2.hidden = false;
                iTIMCN2.image = [UIImage imageNamed:@"SmallTU.png"];
            }
            if(b == mcButton3)
            {
                iTIMCN3.hidden = false;
                iTIMCN3.image = [UIImage imageNamed:@"SmallTU.png"];
            }
            if(b == mcButton4)
            {
                iTIMCN4.hidden = false;
                iTIMCN4.image = [UIImage imageNamed:@"SmallTU.png"];
            }
            [correctMCPerson gotRight];
            numInARow++;
            [self playSoundNamed:@"DingSound" andType:@"m4a" andFX:true];
            totalCorrect++;
            correctMCPerson.hasBeenGuessedRight = true;
            correctMCPerson.hasBeenGuessed = true;
            if(timeOnThisCard>0)
            {
                currentScoreMCN+=100-(10*(10-timeOnThisCard));
                addedPoints.text = [NSString stringWithFormat:@"Score: %i",currentScoreMCN];
                //[self animateIn:addedPoints];
                //[self animateOut:addedPoints];
            }
        }
        else if ([b.titleLabel.text isEqualToString:correctMCPerson.getFullName] != true && correctMCPerson.hasBeenGuessed == false)
        {
            if(b == mcButton1)
            {
                iTIMCN1.hidden = false;
                iTIMCN1.image = [UIImage imageNamed:@"SmallTD.png"];
            }
            if(b == mcButton2)
            {
                iTIMCN2.hidden = false;
                iTIMCN2.image = [UIImage imageNamed:@"SmallTD.png"];
            }
            if(b == mcButton3)
            {
                iTIMCN3.hidden = false;
                iTIMCN3.image = [UIImage imageNamed:@"SmallTD.png"];
            }
            if(b == mcButton4)
            {
                iTIMCN4.hidden = false;
                iTIMCN4.image = [UIImage imageNamed:@"SmallTD.png"];
            }
            [correctMCPerson gotWrong];
            numInARow = 0;
            correctMCPerson.hasBeenGuessed=true;
            [self playSoundNamed:@"DongSound" andType:@"m4a" andFX:true];
        }
        if([mcButton1.titleLabel.text isEqualToString:nameString])
        {
            //mcButton1.backgroundColor = [UIColor greenColor];
            iTIMCN1.hidden = false;
            iTIMCN1.image = [UIImage imageNamed:@"SmallTU.png"];
            
        }
        else
        {
            iTIMCN1.hidden = false;
            iTIMCN1.image = [UIImage imageNamed:@"SmallTD.png"];
        }
        if([mcButton2.titleLabel.text isEqualToString:nameString])
        {
            iTIMCN2.hidden = false;
            iTIMCN2.image = [UIImage imageNamed:@"SmallTU.png"];
        }
        else
        {
            iTIMCN2.hidden = false;
            iTIMCN2.image = [UIImage imageNamed:@"SmallTD.png"];
        }
        if([mcButton3.titleLabel.text isEqualToString:nameString])
        {
            iTIMCN3.hidden = false;
            iTIMCN3.image = [UIImage imageNamed:@"SmallTU.png"];
        }
        else
        {
            iTIMCN3.hidden = false;
            iTIMCN3.image = [UIImage imageNamed:@"SmallTD.png"];
        }
        if([mcButton4.titleLabel.text isEqualToString:nameString])
        {
            iTIMCN4.hidden = false;
            iTIMCN4.image = [UIImage imageNamed:@"SmallTU.png"];
        }
        else
        {
            iTIMCN4.hidden = false;
            iTIMCN4.image = [UIImage imageNamed:@"SmallTD.png"];
        }
    }
    [self respondToNumInARow];
}
-(IBAction)personGuessedMCF:(id)sender{

    
    if(sender == gBMCF1)
    {
        //they guessed the top left person
        n1.text = [NSString stringWithFormat:@"%@ %@",pMCF1.firstName, pMCF1.lastName];

        [self checkIfCorrectMCF:pMCF1];
        iBMCF1.hidden = false;
        iTIMCF1.hidden = false;
    }
    if(sender == gBMCF2)
    {
        //they guessed the top right person
        n2.text = [NSString stringWithFormat:@"%@ %@",pMCF2.firstName, pMCF2.lastName];

        [self checkIfCorrectMCF:pMCF2];
        iBMCF2.hidden = false;
        iTIMCF2.hidden = false;
    }
    if(sender == gBMCF3)
    {
        //they guessed the bottom left person
        n3.text = [NSString stringWithFormat:@"%@ %@",pMCF3.firstName, pMCF3.lastName];

        [self checkIfCorrectMCF:pMCF3];
        iBMCF3.hidden = false;
        iTIMCF3.hidden = false;
    }
    if(sender == gBMCF4)
    {
        //they guessed the bottom right person
        n4.text = [NSString stringWithFormat:@"%@ %@",pMCF4.firstName, pMCF4.lastName];

        [self checkIfCorrectMCF:pMCF4];
        iBMCF4.hidden = false;
        iTIMCF4.hidden = false;
    }
    
}
-(IBAction)personOnLeaderboardTapped:(id)sender{
    [self playSoundNamed:@"ClickSound" andType:@"m4a" andFX:true];
    
    //so first we need to find the index by using the first characters in the sender for example %i                 %@ \n                               %@ points
    
    Person*pIQ = [[Person alloc]init];
    UIButton *b = (UIButton *)sender;
    NSString *title = [[NSString alloc]init];
    NSString *n = [[NSString alloc]init];
    NSString *index = [[NSString alloc]init];
    title = b.titleLabel.text;
    char c;
    int i = 0;
    
    do
    {
        c = [title characterAtIndex:i];
        index = [NSString stringWithFormat:@"%@%c",index,c];
        i++;
    }while (c != ' ');
    
    i = [index intValue];
    
    //then we need to use that index in the NSMutableArray people which has the names and find a name in allPeople
    
    n = [people objectAtIndex:i-1];
    
    
    
    for(int i = 0; i<allPeople.count;++i)
    {
        
        pIQ = [allPeople objectAtIndex:i];
        
        if([pIQ.fullName isEqual:n])
        {
            [self showMoreInfo:pIQ];
            return;
        }
    }
    //the person was not there
    alert =[[UIAlertView alloc] initWithTitle:@"Sorry" message:@"Looks like you don't have this person in your phone" delegate:self cancelButtonTitle:@"Too Bad ;(" otherButtonTitles:NULL, nil];
    
    [alert show];
    
}
-(IBAction)segmentValueChanged:(id)sender {
    [self playSoundNamed:@"ClickSound" andType:@"m4a" andFX:true];
    
    UISegmentedControl *s=  sender;
    for (UIView *object in [labelsScrollView subviews])
    {
        [object removeFromSuperview];
    }
    [self loadLabels: [s titleForSegmentAtIndex:s.selectedSegmentIndex]];
}
//hide
-(IBAction)lessInfo{
    [self playSoundNamed:@"ClickSound" andType:@"m4a" andFX:true];

    
    if([typeOfGame.text isEqualToString:@"Flashcard Game"]||[typeOfGame.text isEqualToString:@"Multiple Choice Faces"]||[typeOfGame.text isEqualToString:@"Multiple Choice Names"])
    {
        [self.view addSubview:MCTGameView];
        [self.view addSubview:mCFacesView];
        [self.view addSubview:FTGameView];
        [self animateFlip:moreInfoView withVeiw:MCTGameView];
        [self.view addSubview:timerView];
        [self.view addSubview:addedPoints];
    }
    else{
        [self animateOut:moreInfoView];

        moreInfoView.hidden = true;
    }


}
-(IBAction)hideFilterViewAndFilter{
    [self playSoundNamed:@"ClickSound" andType:@"m4a" andFX:true];

    [self readValues];
    if((arrayOf49PercentAndUnder.count > 0 && [typeOfGame.text isEqualToString:@"Flashcard Game"]) || (([typeOfGame.text isEqualToString:@"Multiple Choice Faces"] || [typeOfGame.text isEqualToString:@"Multiple Choice Names"]) && arrayOf49PercentAndUnder.count > 3))
    {
        [self animateOut:FilterView];
    }
}
-(IBAction)hidePercentEditer{
    [percentField resignFirstResponder];
}
//programmatically added targets
-(IBAction)filterSwitchOn:(id)sender{
    UISwitch * sIQ = [[UISwitch alloc]init];
    sIQ = sender;
    
    if([[filters titleForSegmentAtIndex:filters.selectedSegmentIndex]  isEqual: @"Company"])
    {
        for(int i =2; i < filterCompanySwitches.count; ++ i)
        {
            
            if(sender == [filterCompanySwitches objectAtIndex:i] && sIQ.on == true)
            {
                numSelected+=[[numInCompanies objectAtIndex:i-2] integerValue];
                //numSelectedLabel.text = [NSString stringWithFormat:@"%i Contacts Selected",numSelected];
            }
            if(sender == [filterCompanySwitches objectAtIndex:i] && sIQ.on == false)
            {
                numSelected-=[[numInCompanies objectAtIndex:i-2] integerValue];
                //numSelectedLabel.text = [NSString stringWithFormat:@"%i Contacts Selected",numSelected];
            }
        }
    }
    if([[filters titleForSegmentAtIndex:filters.selectedSegmentIndex]  isEqual: @"Department"])
    {
        for(int i =2; i < filterDepartmentSwitches.count; ++ i)
        {
            if(sender == [filterDepartmentSwitches objectAtIndex:i] && sIQ.on == true)
            {
                numSelected+=[[numInDepartments objectAtIndex:i-2] integerValue];
                //numSelectedLabel.text = [NSString stringWithFormat:@"%i Contacts Selected",numSelected];
            }
            if(sender == [filterDepartmentSwitches objectAtIndex:i] && sIQ.on == false)
            {
                numSelected-=[[numInDepartments objectAtIndex:i-2] integerValue];
                //numSelectedLabel.text = [NSString stringWithFormat:@"%i Contacts Selected",numSelected];
            }
        }
    }
    if([[filters titleForSegmentAtIndex:filters.selectedSegmentIndex]  isEqual: @"Job Title"])
    {
        for(int i =2; i < filterJobTitlesSwitches.count; ++ i)
        {
            if(sender == [filterJobTitlesSwitches objectAtIndex:i] && sIQ.on == true)
            {
                numSelected+=[[numInJobTitles objectAtIndex:i-2] integerValue];
                //numSelectedLabel.text = [NSString stringWithFormat:@"%i Contacts Selected",numSelected];
            }
            if(sender == [filterJobTitlesSwitches objectAtIndex:i] && sIQ.on == false)
            {
                numSelected-=[[numInJobTitles objectAtIndex:i-2] integerValue];
                //numSelectedLabel.text = [NSString stringWithFormat:@"%i Contacts Selected",numSelected];
            }
        }
    }
    
}
-(IBAction)showPeopleStatsView{
    
    NSMutableArray*peopleArray;
    peopleArray = allPeople;
    peopleArray = [self sortByPercentageArrayOfPeople:peopleArray];
    buttonsOnStatsView = [[NSMutableArray alloc]init];
    peopleOnStatsView = [[NSMutableArray alloc]init];
    
    myTitle.font = Font;
    
    [peopleStatsScrollView addSubview:myTitle];
    [peopleStatsScrollView addSubview:mySeparater1];
    [peopleStatsScrollView addSubview:rowSpacer1];
    [peopleStatsScrollView addSubview:columnSpacer1];
    [peopleStatsScrollView addSubview:columnSpacer2];
    [peopleStatsScrollView addSubview:columnSpacer3];
    [peopleStatsScrollView addSubview:columnSpacer4];
    
    
    [columnSpacer1 setBounds:CGRectMake(columnSpacer1.center.x, columnSpacer1.center.y, columnSpacer1.bounds.size.width,  48*peopleArray.count+2)];
    columnSpacer1.center = CGPointMake(columnSpacer1.center.x, (columnSpacer1.bounds.size.height/2 + rowSpacer1.center.y)-rowSpacer1.bounds.size.height/2);
    
    [columnSpacer2 setBounds:CGRectMake(columnSpacer2.center.x, columnSpacer2.center.y, columnSpacer2.bounds.size.width,  48*peopleArray.count+2)];
    columnSpacer2.center = CGPointMake(columnSpacer2.center.x, (columnSpacer2.bounds.size.height/2 + rowSpacer1.center.y)-rowSpacer1.bounds.size.height/2);
    
    [columnSpacer3 setBounds:CGRectMake(columnSpacer3.center.x, columnSpacer3.center.y, columnSpacer3.bounds.size.width,  48*peopleArray.count+2)];
    columnSpacer3.center = CGPointMake(columnSpacer3.center.x, (columnSpacer3.bounds.size.height/2 + rowSpacer1.center.y)-rowSpacer1.bounds.size.height/2);
    
    [columnSpacer4 setBounds:CGRectMake(columnSpacer4.center.x, columnSpacer4.center.y, columnSpacer4.bounds.size.width,  48*peopleArray.count+2)];
    columnSpacer4.center = CGPointMake(columnSpacer4.center.x, (columnSpacer4.bounds.size.height/2 + rowSpacer1.center.y)-rowSpacer1.bounds.size.height/2);
    for(int i = 0; i < peopleArray.count; ++i)
    {
        UIButton*button;
        button = [[UIButton alloc]init];
        UIImageView*spacer;
        spacer = [[UIImageView alloc]init];
        UIImageView*image;
        image = [[UIImageView alloc]init];
        UILabel*name;
        name = [[UILabel alloc]init];
        UILabel*percent;
        percent = [[UILabel alloc]init];
        
        Person*pIQ;
        pIQ =[peopleArray objectAtIndex:i];
        [peopleOnStatsView addObject:pIQ];
        image.image = pIQ.selfImage;
        spacer.image = [UIImage imageNamed:@"separater.png"];
        name.text = [pIQ getFullName];
        name.textAlignment = name1.textAlignment;
        name.font = Font;
        percent.text = [NSString stringWithFormat:@"%d%%",(int)round([pIQ returnPercentage]*100)];
        percent.textAlignment = percent1.textAlignment;
        percent.font = Font;
        
        double colorMultiplier;
        colorMultiplier = [pIQ returnPercentage];
        
        if(colorMultiplier>0.5)
        {
            button.alpha = 0.5*colorMultiplier + 0.1;
            [button setBackgroundColor: [UIColor greenColor]];
        }
        else
        {
            button.alpha = 0.5*(1-colorMultiplier) + 0.1;
            [button setBackgroundColor: [UIColor redColor]];
        }
        [button addTarget:self action:@selector(moreInfoMC:) forControlEvents:UIControlEventTouchUpInside];
        button.reversesTitleShadowWhenHighlighted = true;
        
        [buttonsOnStatsView addObject:button];
        
        [peopleStatsScrollView addSubview:name];
        [peopleStatsScrollView addSubview:percent];
        [peopleStatsScrollView addSubview:spacer];
        [peopleStatsScrollView addSubview:button];
        [peopleStatsScrollView addSubview:columnSpacer1];
        [peopleStatsScrollView addSubview:columnSpacer2];
        [peopleStatsScrollView addSubview:columnSpacer3];
        [peopleStatsScrollView addSubview:columnSpacer4];
        [peopleStatsScrollView addSubview:image];
        
        
        
        //[percent set]
        
        [spacer setBounds:CGRectMake(rowSpacer1.center.x, rowSpacer1.center.x, rowSpacer1.bounds.size.width,  rowSpacer1.bounds.size.height)];
        spacer.center = CGPointMake(rowSpacer1.center.x, rowSpacer1.center.y+i*48);
        image.center=CGPointMake(image1.center.x, image1.center.y+i*48);
        [image setBounds:CGRectMake(image1.center.x, image1.center.x, image1.bounds.size.width,  image1.bounds.size.height)];
        
        name.bounds  = CGRectMake(100, 10, name1.bounds.size.width ,name1.bounds.size.height);
        name.center=CGPointMake(name1.center.x, name1.center.y+i*48);
        button.bounds = CGRectMake(100, 10, 280, 40);
        button.center=CGPointMake(160, name.center.y);
        name.textColor = name1.textColor;
        percent.bounds  = CGRectMake(100, 10, percent1.bounds.size.width ,percent1.bounds.size.height);
        percent.textColor = percent1.textColor;
        percent.center=CGPointMake(percent1.center.x, percent1.center.y+i*48);
    }
    [peopleStatsScrollView setContentSize:CGSizeMake(peopleStatsScrollView.bounds.size.width, 48*(peopleArray.count+1)+10)];
}
//other
-(IBAction)closeKeyboard:(id)sender{
    [sender resignFirstResponder];
}
-(IBAction)beganEditing:(id)sender{
    UITextField*textfield = [[UITextField alloc]init];
    textfield = sender;
    [signUpScrollView setContentOffset:CGPointMake(0, textfield.center.y-(textfield.bounds.size.height*2)) animated:YES];
}
-(IBAction)checkAnswer:(id)sender{
    UITextField*field;
    field = sender;
    [field resignFirstResponder];
    if([typeOfGameString isEqual:@"Full Name"])
    {
        if([[hardTextField.text uppercaseString] isEqual: [[currentPerson getFullName] uppercaseString]])
        {
            [self gotRight:infoButton];
            if(timeOnThisCard>0)
            {
                currentScore+=100-(10*(10-timeOnThisCard));
            }
        }
        else
        {
            [self gotWrong:infoButton];
        }
    }
    if([typeOfGameString isEqual:@"First Name"])
    {
        if([[hardTextField.text uppercaseString] isEqual: [currentPerson.firstName uppercaseString]])
        {
            [self gotRight:infoButton];
            if(timeOnThisCard>0)
            {
                currentScore+=100-(10*(10-timeOnThisCard));
            }
        }
        else
        {
            [self gotWrong:infoButton];
        }
    }
    if([typeOfGameString isEqual:@"Last Name"])
    {
        if([[hardTextField.text uppercaseString] isEqual: [currentPerson.lastName uppercaseString]])
        {
            [self gotRight:infoButton];
            if(timeOnThisCard>0)
            {
                currentScore+=100-(10*(10-timeOnThisCard));
            }
        }
        else
        {
            [self gotWrong:infoButton];
        }
    }
    field.text = @"";
    hardFlashcardGuessView.center = nameAndButtonsView.center;
}
-(IBAction)moveHardTextFieldIntoView{
    hardFlashcardGuessView.center = FTGameView.center;
}
-(IBAction)dateChanged{
    [self playSoundNamed:@"ClickSound" andType:@"m4a" andFX:true];

    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yy"];
    
    if(onFrom == true)
    {
        fromField.text = [formatter stringFromDate:date.date];
    }
    else
    {
        toField.text = [formatter stringFromDate:date.date];
    }
}
-(IBAction)changeStatsView:(id)sender{
    [self playSoundNamed:@"ClickSound" andType:@"m4a" andFX:true];
    UISegmentedControl *s=  sender;
    if([[s titleForSegmentAtIndex:s.selectedSegmentIndex] isEqualToString:@"Game Stats"])
    {
        statsScrollView.hidden = false;
        
        peopleStatsScrollView.hidden = true;
        for (UIView *object in [peopleStatsScrollView subviews])
        {
            [object removeFromSuperview];
        }
    }
    if([[s titleForSegmentAtIndex:s.selectedSegmentIndex] isEqualToString:@"Player Stats"])
    {
        statsScrollView.hidden = true;
        peopleStatsScrollView.hidden = false;
        [self showPeopleStatsView];
    }
}
-(IBAction)customDate{
    [self playSoundNamed:@"ClickSound" andType:@"m4a" andFX:true];

    if(dateSwitchSetting.isOn == true)
    {
        /*
        UIAlertView *dateAlertView = [[UIAlertView alloc]initWithTitle:@"Enter a Date Type" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add", nil];
        [dateAlertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
        [[dateAlertView textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeAlphabet];
        [dateAlertView show];
         */
    }
}
-(IBAction)eraseStats{
    alert = [[UIAlertView alloc] initWithTitle:@"Are you sure?" message:@"Are you sure you want to erase all of your stats?" delegate:self cancelButtonTitle:@"Keep Stats" otherButtonTitles:@"Erase", nil];
    [alert show];
}

@end
