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
@synthesize nameAndButtonsView, personPic, nameLabel, allButton, companyButton, jobTitleButton, departmentButton;
@synthesize labelsScrollView, filterCompanyText, filterCompanySwitches, filterDepartmentSwitches, filterDepartmentText, filterJobTitles, filterJobTitlesSwitches;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    frame0 = [UIImage imageNamed:@"IMG_0929.png"];
    frame1 = [UIImage imageNamed:@"IMG_0930.png"];
    frame2 = [UIImage imageNamed:@"IMG_0931.png"];
    frame3 = [UIImage imageNamed:@"IMG_0932.PNG"];
    frame4 = [UIImage imageNamed:@"IMG_0933.PNG"];
    frame5 = [UIImage imageNamed:@"IMG_0935.PNG"];
    frame6 = [UIImage imageNamed:@"IMG_0936.PNG"];
    frame7 = [UIImage imageNamed:@"IMG_0937.PNG"];
    frame8 = [UIImage imageNamed:@"IMG_0938.PNG"];
    frame9 = [UIImage imageNamed:@"IMG_0939.png"];
    frame10 =[UIImage imageNamed:@"IMG_0940.png"];
    
    //moreInfoBio.text = @"No Notes";
    //moreInfoBio = [[UITextView alloc]init];
    
    imageArray = [NSMutableArray arrayWithObjects:frame0, frame1, frame2, frame3, frame4, frame5, frame6, frame7,frame8,frame9,frame10, nil];
    
    igniteChange.animationImages = imageArray;
    igniteChange.animationDuration = 0.075*(imageArray.count);
    igniteChange.animationRepeatCount=100;
    [igniteChange startAnimating];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(countUpDuration) userInfo:Nil repeats:YES];
    filterJobTitlesText = [[NSMutableArray alloc]init];
    filterJobTitlesSwitches = [[NSMutableArray alloc]init];
    filterDepartmentSwitches = [[NSMutableArray alloc]init];
    filterDepartmentText = [[NSMutableArray alloc]init];
    filterCompanySwitches = [[NSMutableArray alloc]init];
    filterCompanyText = [[NSMutableArray alloc]init];
    
    bestTimeF = 1000000;
    bestTimeMCF = 1000000;
    bestTimeMCN = 1000000;

    
    
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
    
    mostTimeIntMCN =0;
    mostTimeIntMCF =0;
    mostTimeIntF =0;

    dateSwitch.on = false;
    

    [statsScrollView setScrollEnabled:YES];
    [statsScrollView setContentSize:CGSizeMake(320, 798)];

    
    [super viewDidLoad];
    
    hintLabel.text = [NSString stringWithFormat:@"H:%i", 3-numberOfHintsPressed];

/*
    SystemSoundID soundID;
    NSString *soundFile = [[NSBundle mainBundle] pathForResource:@"HoHey" ofType:@"mp3"];
    if(soundFile)
    {
        OSStatus status = AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundFile], &soundID);
        if(status == noErr)
        {
            AudioServicesPlaySystemSound(soundID);
            NSLog(@"%@ is playing\n", soundFile);
        } else {
            NSLog( @"no sound id created; error status code is %d", status);
        }
    } else {
        NSLog( @"couldn't find sound file... is it really in your app bundle?");
    }
    */
    
    //[self loadLabels:@"Company"];
    
    uniqueDepartmentsArray = [[NSMutableArray alloc]init];
    uniqueCompaniesArray = [[NSMutableArray alloc]init];
    uniqueJobTitlesArray = [[NSMutableArray alloc]init];
    filteringIndicator = [[UIActivityIndicatorView alloc]init];
    arrayOf50PercentAndOver = [[NSMutableArray alloc]init];
    
    
    //moreInfoScrollView = [[UIScrollView alloc]init];
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
    
    
    MSContactManipulater *contactGetter = [[MSContactManipulater alloc]init];
    allPeople = [[NSMutableArray alloc]init];
    allPeople = [contactGetter getContactsWithAnImage];
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
    //[self loadLabels:@"Department"];
    //[self loadLabels:@"Company"];

	// Do any additional setup after loading the view, typically from a nib.
    NSDate*d = [[NSDate alloc]init];
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yy"];
    toField.text = [formatter stringFromDate:d];
}







-(IBAction)showInfo:(id)sender
{
    if (currentPerson.lastName == NULL)
    {
        nameLabel.text = currentPerson.firstName;
        
    }
    else
    {
        nameLabel.text = [NSString stringWithFormat:@"%@ %@", currentPerson.firstName,currentPerson.lastName];
    }
    nameLabel.hidden = false;
    guessButton.hidden = true;
    nameView.hidden = false;
    infoButton.hidden = false;
    hintButton.hidden = true;

}
-(IBAction)gotRight:(id)sender {
    //NSLog(@"Got Right");
    if(timeOnThisCard > mostTimeIntF)
    {
        mostTimeIntF = timeOnThisCard;
        mostTimeF = currentPerson;
    }
    
    
    numberOfHintsPressed = 0;
    hintLabel.text = [NSString stringWithFormat:@"H:%i", 3-numberOfHintsPressed];
    timeOnThisCard = 0;
    timeOnThisCardLabel.text =@"0";
    currentPerson.hasBeenGuessed = true;
    currentPerson.hasBeenGuessedRight = true;
    [currentPerson gotRight];
    totalGuessed++;
    totalCorrect++;
    
    [arrayOf50PercentAndOver addObject:currentPerson];
    [arrayOf49PercentAndUnder removeObjectIdenticalTo:currentPerson];
    
    if([self checkIfAllPeopleHaveBeenGuessed] == false && practiceModeSwitch.isOn == false)
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
    else if([self checkIfAllPeopleHaveBeenGuessed] == true && practiceModeSwitch.isOn == false)
    {
        FTGameView.hidden = true;
        gameOverView.hidden = false;

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
        

        
        currentScore = (int)round(((1000*totalGuessed*totalGuessed*totalPercentage)/(totalSeconds)));
        [self printHighScore];
        
        FilterView.hidden = true;
        
        totalCorrect = 0;
        totalGuessed = 0;
        for(int i =0; i < allPeople.count; i++)
        {
            Person *p;
            p =[allPeople objectAtIndex:i];
            p.hasBeenGuessed = false;
            p.hasBeenGuessedRight = false;
            //NSLog(@"%id", p.hasBeenGuessed);
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
        FTGameView.hidden = true;
        gameOverView.hidden = false;

        guessButton.hidden = true;
        nameView.hidden = true;
        infoButton.hidden = true;
        hintButton.hidden = true;
        nameAndButtonsView.hidden = true;
        personPic.hidden = true;
        [arrayOf49PercentAndUnder removeAllObjects];
        [arrayOf50PercentAndOver removeAllObjects];
        
        percentLabel.text = @"YOU HAVE NOW GUESSED EVERY PERSON RIGHT AT LEAST ONCE";
        pointsLabel.text = @"TURN OFF PRACTICE MODE TO PLAY FOR POINTS";
        timerView.hidden = true;

        totalCorrect = 0;
        totalGuessed = 0;
        
        for(int i =0; i < allPeople.count; i++)
        {
            Person *p;
            p =[allPeople objectAtIndex:i];
            p.hasBeenGuessed = false;
            p.hasBeenGuessedRight = false;
            //NSLog(@"%id", p.hasBeenGuessed);
        }
    }
    numOfContactsLeftLabel.text = [NSString stringWithFormat:@"%i",arrayOf49PercentAndUnder.count];

}
-(IBAction)gotWrong:(id)sender {

   // NSLog(@"Got Wrong");
    if(timeOnThisCard > mostTimeIntF)
    {
        mostTimeIntF = timeOnThisCard;
        mostTimeF = currentPerson;
    }
    timeOnThisCard = 0;
    timeOnThisCardLabel.text =@"0";
    
    numberOfHintsPressed = 0;
    hintLabel.text = [NSString stringWithFormat:@"H:%i", 3-numberOfHintsPressed];
    
    currentPerson.hasBeenGuessed = true;
    [currentPerson gotWrong];
    
    totalGuessed++;
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
            gameOverView.hidden = false;
            timerView.hidden=false;

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
            
            totalSeconds = minutes*60 + seconds;
            currentScore = (int)round(((1000*totalGuessed*totalGuessed*totalPercentage)/totalSeconds));
            [self printHighScore];
            
            FilterView.hidden = true;
            
            totalCorrect = 0;
            totalGuessed = 0;
            timerView.hidden = true;
            for(int i =0; i < allPeople.count; i++)
            {
                Person *p;
                p =[allPeople objectAtIndex:i];
                p.hasBeenGuessed = false;
                //NSLog(@"%id", p.hasBeenGuessed);
                p.hasBeenGuessedRight = false;
            }

        }
        numOfContactsLeftLabel.text = [NSString stringWithFormat:@"%i",arrayOf49PercentAndUnder.count];
    }
    else if(practiceModeSwitch.isOn == true)
    {
        lastPerson = currentPerson;
        do{
            [self loadNewPerson];
        }while (lastPerson == currentPerson);

    }
}
-(void)printHighScoreMCF
{
    if(currentScoreMCF > highscoreMCF)
    {
        highscoreMCF = currentScoreMCF;
        pointsLabel.text = [NSString stringWithFormat:@"NEW HIGH SCORE! %i", currentScoreMCF];
        
    }
    else
    {
        pointsLabel.text = [NSString stringWithFormat:@"You scored %i", currentScoreMCF];
    }
    if(totalSeconds < bestTimeMCF)
    {
        bestTimeMCF = totalSeconds;
    }
}
-(void)printHighScoreMCN
{
    if(currentScoreMCN > highscoreMCN)
    {
        highscoreMCN = currentScoreMCN;
        pointsLabel.text = [NSString stringWithFormat:@"NEW HIGH SCORE! %i", currentScoreMCN];
        
    }
    else
    {
        pointsLabel.text = [NSString stringWithFormat:@"You scored %i", currentScoreMCN];
    }
    if(totalSeconds < bestTimeMCN)
    {
        bestTimeMCN = totalSeconds;
    }
}

-(void)printHighScore
{
    if(currentScore > highscore)
    {
        highscore = currentScore;
        pointsLabel.text = [NSString stringWithFormat:@"NEW HIGH SCORE! %i", currentScore];
        
    }
    else
    {
        pointsLabel.text = [NSString stringWithFormat:@"You scored %i", currentScore];
    }
    if(totalSeconds < bestTimeF)
    {
        bestTimeF = totalSeconds;
    }
}
-(NSMutableArray*)chooseArray
{
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
                    // NSLog(@"50 and over");
                    
                    return arrayOf50PercentAndOver;
                }
                else
                {
                    //NSLog(@"49 and under");
                    
                    return arrayOf49PercentAndUnder;
                }
            }
            else if(arrayOf49PercentAndUnder.count > 0 && arrayOf50PercentAndOver.count == 0)
            {
                //NSLog(@"49 and under");
                
                return arrayOf49PercentAndUnder;
                
            }
            else if(arrayOf50PercentAndOver.count > ((arrayOf49PercentAndUnder.count+arrayOf50PercentAndOver.count)/2) && arrayOf49PercentAndUnder.count == 0)
            {
                //NSLog(@"50 and over");
                
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

-(void)loadNewPerson
{
    //NSLog(@"Percent Right = %f", [currentPerson returnPercentage]*100);
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
            // NSLog(@"%i val of x",x);
            if(x == 0)
            {
                j = 0;
            }
            else
            {
                j = rand()%x;
            }
            // NSLog(@"%i val of j",j);
            currentPerson = [currentArray objectAtIndex:j];
            
            personPic.image = [currentPerson selfImage];
            
            // nameAndButtonsView.hidden = true;

        }
        else
        {
            //game ends
            //go to view that shows stats
            MCGameView.hidden=true;
            firstView.hidden=true;
            MCTGameView.hidden=true;
            FCView.hidden=true;
            MCCView.hidden = true;
            FGameView.hidden = true;
            FCView.hidden = true;
            FTGameView.hidden = true;
            FilterView.hidden = true;
            // nameAndButtonsView.hidden = true;
            personPic.hidden = true;
            showInfoButton.hidden = true;
            deptTitleField.hidden = true;
            jobTitleField.hidden = true;
            filterField.text = @"";
            filterLabel.text = @"Filter By:";
            companyTitleField.hidden = true;
            nameView.hidden = true;
            
            [arrayOf49PercentAndUnder removeAllObjects];
            [arrayOf50PercentAndOver removeAllObjects];
            
            gameOverView.hidden = false;
            timerView.hidden=false;

            totalPercentage = (totalCorrect/totalGuessed);
            //NSLog(@"%f",totalGuessed);
            //NSLog(@"%f",totalCorrect);
            //NSLog(@"%f",totalPercentage);
            
            percentLabel.text = [NSString stringWithFormat:@"YOU GOT %d%% (%f OUT OF %f) IN %i:%i",(int)round(totalPercentage*100),totalCorrect,totalGuessed,minutes,seconds];
            [self printHighScore];

        }
    }
    if(practiceModeSwitch.isOn == false)
    {
        NSMutableArray*currentArray;
        currentArray = [self chooseArray];
        int x;
        x =(currentArray.count-1);
        //NSLog(@"%i val of x",x);
        if(x == 0)
        {
            j = 0;
        }
        else
        {
            j = rand()%x;
        }
        // NSLog(@"%i val of j",j);
        currentPerson = [currentArray objectAtIndex:j];
        
        personPic.image = [currentPerson selfImage];
        
        
        //nameAndButtonsView.hidden = true;
    }
   // NSLog(@"%lu people in 49 array", (unsigned long)arrayOf49PercentAndUnder.count);
   // NSLog(@"%lu people in 50 array", (unsigned long)arrayOf50PercentAndOver.count);
   // NSLog(@"%u total people", arrayOf50PercentAndOver.count + arrayOf49PercentAndUnder.count);
   // NSLog(@"%i people in device", allPeople.count);
    
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
-(void)addJob:(NSString*)str
{
    if([self checkForString:str inArray:uniqueJobTitlesArray]==false && str.length > 0)
    {
        [uniqueJobTitlesArray addObject:str];
        //NSLog(@"J-%@,%i",str,uniqueJobTitlesArray.count);
        
    }
}
-(void)addCompany:(NSString*)str
{
    if([self checkForString:str inArray:uniqueCompaniesArray]==false && str.length > 0)
    {
        [uniqueCompaniesArray addObject:str];
        //NSLog(@"C-%@,%i",str,uniqueCompaniesArray.count);
        
    }
}
-(void)addDepartment:(NSString*)str
{
    if([self checkForString:str inArray:uniqueDepartmentsArray]==false && str.length > 0)
    {
        [uniqueDepartmentsArray addObject:str];
        //NSLog(@"D-%@,%i",str,uniqueDepartmentsArray.count);
        
    }
}

-(void)addFieldsFromArray:(NSMutableArray *)array
{
    for (int t=0; t<array.count; t++)
    {
        Person*p;
        p = [array objectAtIndex:t];
        [self addDepartment:p.department];
        [self addCompany:p.company];
        [self addJob:p.jobTitle];
    }
}
-(NSMutableArray*)getContactsWithCompany:(NSString*)company fromArray:(NSMutableArray*)array
{
    NSMutableArray*finalPeople;
    finalPeople = [[NSMutableArray alloc]init];
    
    for (int l = 0; l < array.count; l++)
    {
        
        Person *p;
        p = [[Person alloc]init];
        p = [array objectAtIndex:l];
       // NSLog(@"%@ person value",p.company);
        //NSLog(@"%@ name",p.firstName);
        //NSLog(@"%i", p.company.length);
        //NSLog(@"%@ sent value", company);
        if([company isEqualToString:@"None Specified"] && p.company.length == 0)
        {
            //p.company = @"None Specified";
            [finalPeople addObject:p];
        }
        else if ([p.company isEqualToString: company])
        {
            //NSLog(@"it worked");
            if ([self isObjectIdenticalTo:p inArray:arrayOf49PercentAndUnder] == false)
            {
                [finalPeople addObject:p];
            }
        }
}
    
    return finalPeople;
}
-(NSMutableArray*)getContactsWithJobTitle:(NSString*)jobTitle fromArray:(NSMutableArray*)array
{
    /*
    NSMutableArray*finalPeople;
    finalPeople = [[NSMutableArray alloc]init];
    for (int l = 0; l < array.count; l++)
    {
        Person *p;
        p = [[Person alloc]init];
        p = [array objectAtIndex:l];
        //NSLog(@"%@",p.jobTitle);
        if ([p.jobTitle isEqualToString: jobTitle])
        {
            NSLog(@"it worked");
            [finalPeople addObject:p];
        }
        if([jobTitle isEqualToString:[filterCompanyText objectAtIndex:1]])
        {
            //[finalPeople addObject:p];
        }
    }
    

    return finalPeople;\
     
     */
    NSMutableArray*finalPeople = [[NSMutableArray alloc]init];
    for (int i = 0; i<filterJobTitlesSwitches.count; i++)
    {
        if ([[filterJobTitlesSwitches objectAtIndex:i] isOn] == true)
        {
            //NSLog(@"%@ is On",[filterJobTitlesText objectAtIndex:i]);
            for (int l = 0; l < array.count; l++)
            {
                Person *p;
                p = [[Person alloc]init];
                p = [array objectAtIndex:l];
                //NSLog(p.jobTitle);
                if([p.jobTitle isEqualToString:[filterJobTitlesText objectAtIndex:i]])
                {
                    [finalPeople addObject:p];
                }
            }
        }
    }
    return finalPeople;
}

-(NSMutableArray*)getContactsWithDateFromArray:(NSMutableArray*)array
{
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
            
            ///NSLog(@"%@ for %@", [dF stringFromDate: p.date], p.firstName);
            
            if(([p.date laterDate:[dF dateFromString:toField.text]] != p.date && [p.date laterDate:[dF dateFromString:fromField.text]] == p.date))// || ( p.date == NULL))
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


-(NSMutableArray*)getContactsWithDepartment:(NSString*)dept fromArray:(NSMutableArray*)array
{
    NSMutableArray*finalPeople = [[NSMutableArray alloc]init];
    for (int i = 0; i<filterDepartmentSwitches.count; i++)
    {
        if ([[filterDepartmentSwitches objectAtIndex:i] isOn] == true)
        {
            //NSLog(@"%@ is On",[filterDepartmentText objectAtIndex:i]);
            for (int l = 0; l < array.count; l++)
            {
                Person *p;
                p = [[Person alloc]init];
                p = [array objectAtIndex:l];
                //NSLog(p.department);
                if([p.department isEqualToString:[filterDepartmentText objectAtIndex:i]])
                {
                    [finalPeople addObject:p];
                }
            }
        }
    }
    return finalPeople;
}
-(void)readValues
{
    [arrayOf49PercentAndUnder removeAllObjects];
    [arrayOf50PercentAndOver removeAllObjects];
    
    arrayOf49PercentAndUnder = [[NSMutableArray alloc]init];
    //NSLog(@"allPeople - %i",allPeople.count);
    
    for (int i = 0; i<filterCompanySwitches.count; i++)
    {
        if ([[filterCompanySwitches objectAtIndex:i] isOn])
        {
            //so because the mscontact manipulater was not working i decided that we could just use the array allpeople instead, and then filter out the ones we dont want with a method i created. the method is similar to the getContactsWithCompany method, the only difference is it works;)
            //NSLog(@"%@ is On",[filterCompanyText objectAtIndex:i]);
            
            [arrayOf49PercentAndUnder addObjectsFromArray: [self getContactsWithCompany:[filterCompanyText objectAtIndex:i] fromArray:allPeople]];
        }
    }
    alert = [[UIAlertView alloc] initWithTitle:@"Errorr" message:@"You have filtered out every person, therfore you cannot be tested" delegate:self cancelButtonTitle:@"Okay, it won't happen again" otherButtonTitles:NULL, nil];
    arrayOf49PercentAndUnder = [self getContactsWithDateFromArray:arrayOf49PercentAndUnder];
    arrayOf49PercentAndUnder = [self getContactsWithDepartment:@"test:" fromArray:arrayOf49PercentAndUnder];
    arrayOf49PercentAndUnder = [self getContactsWithJobTitle:@"test" fromArray:arrayOf49PercentAndUnder];
    
    if(arrayOf49PercentAndUnder.count == 0)
    {
        NSLog(@"show the alert");
        [alert show];
    }
    
    
    if([typeOfGame.text isEqualToString:@"Multiple Choice Faces"] || [typeOfGame.text isEqualToString:@"Multiple Choice Names"])
    {
        alert = [[UIAlertView alloc] initWithTitle:@"Errorr" message:@"In a Multiple Choice Game you must have at least 4 people" delegate:self cancelButtonTitle:@"Okay, it won't happen again" otherButtonTitles:NULL, nil];
        if(arrayOf49PercentAndUnder.count < 4)
        {
            [alert show];
        }
    }
    
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
-(void)fillArray:(NSMutableArray *)a fromArray:(NSMutableArray *)b
{
    for (int l = 0; l < b.count; l++)
    {
        [a addObject:[b objectAtIndex:l]];
        NSLog(@"added");
    }
}
-(void)swichValueChanged:(NSMutableArray*)switchArray fromSwitch: (id)sender
{
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
-(void)companySwitchValueChanged:(id)sender
{
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
-(void)departmentSwitchValueChanged:(id)sender
{
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
    
   // NSLog(@"yo");
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
    
    
   // NSLog(@"yo yo");
}
-(IBAction)dateChanged
{
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
-(IBAction)showPicker:(id)sender
{
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



-(void)loadLabels:(NSString *)labelType
{
   // NSLog(@"allPeople(top) - %i",allPeople.count);

    //NSLog(@"lType = %@",labelType);
    if ([labelType  isEqual: @"Date"])
    {
        from.hidden = false;
        to.hidden = false;
        fromField.hidden = false;
        toField.hidden = false;
        fromButton.hidden = false;
        toButton.hidden = false;
        date.hidden=false;
        fromOrTo.hidden = false;
        iV.hidden = false;
        dateSwitch.hidden = false;
    }
    else
    {
        from.hidden = true;
        to.hidden = true;
        fromField.hidden = true;
        toField.hidden = true;
        fromButton.hidden = true;
        toButton.hidden = true;
        date.hidden=true;
        fromOrTo.hidden = true;
        iV.hidden = true;
        dateSwitch.hidden = true;

        UILabel *newLabel = [[UILabel alloc]init];
        newLabel.text = @"All";
        [labelsScrollView addSubview:newLabel];
        newLabel.bounds  = CGRectMake(100, 10, 170, 30);
        newLabel.center = CGPointMake(100, 35);
        newLabel.textColor= [UIColor whiteColor];
        [labelsScrollView insertSubview:newLabel atIndex:0];
        UISwitch *switchThing = [[UISwitch alloc] init];
       // NSLog(@"%@",newLabel.text);
        [labelsScrollView addSubview:switchThing];
        switchThing.center = CGPointMake(220, 36);
        switchThing.on = true;
        
        UILabel *noneSpecified = [[UILabel alloc]init];
        noneSpecified.text = @"None Specified";
        [labelsScrollView addSubview:noneSpecified];
        noneSpecified.bounds  = CGRectMake(100, 10, 170, 30);
        noneSpecified.center = CGPointMake(100, 75);
        noneSpecified.textColor= [UIColor whiteColor];
        [labelsScrollView insertSubview:noneSpecified atIndex:1];
        UISwitch *noneSpecifiedSwitch = [[UISwitch alloc] init];
       // NSLog(@"%@",noneSpecified.text);
        [labelsScrollView addSubview:noneSpecifiedSwitch];
        noneSpecifiedSwitch.center = CGPointMake(220, 76);
        noneSpecifiedSwitch.on = true;

        if([labelType isEqual:@"Company"]) {
            if (filterCompanyText.count == 0)
            {
                
                //SEL theSelector = @selector(companySwitchValueChanged:);
                //[switchThing addTarget:self action:@selector(companySwitchValueChanged:)  forControlEvents:UIControlEventValueChanged];

                [filterCompanySwitches removeAllObjects];
                [filterCompanyText removeAllObjects];
                //this new label is the all new label
                [filterCompanyText addObject:newLabel.text];
                [filterCompanySwitches addObject:switchThing];
                [filterCompanyText addObject:noneSpecified.text];
                [filterCompanySwitches addObject:noneSpecifiedSwitch];
                
                 uniqueCompaniesArray = [uniqueCompaniesArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                
                for (int i =0 ; i<uniqueCompaniesArray.count; i++)
                {
                    
                    UILabel *newLabel = [[UILabel alloc]init];
                    newLabel.text = [uniqueCompaniesArray objectAtIndex:i];
                    [labelsScrollView addSubview:newLabel];
                    newLabel.bounds  = CGRectMake(100, 10, 170, 30);
                    newLabel.center = CGPointMake(100, 115+(40*i));
                    newLabel.textColor= [UIColor whiteColor];
                    [labelsScrollView insertSubview:newLabel atIndex:0];
                    UISwitch *switchThing = [[UISwitch alloc] init];
                    [labelsScrollView setContentSize:CGSizeMake(260, 115+(40*uniqueCompaniesArray.count))];
                    //NSLog(@"%@",newLabel.text);
                    [labelsScrollView addSubview:switchThing];
                    switchThing.center = CGPointMake(220, 116+(40*i));
                    switchThing.on=true;
                    [switchThing addTarget:self action:@selector(companySwitchValueChanged:) forControlEvents:UIControlEventValueChanged];
                    [filterCompanyText addObject:newLabel.text];
                    [filterCompanySwitches addObject:switchThing];

                }
            }
            else
            {
                NSMutableArray *newArray = [[NSMutableArray alloc] init];
                for (int i = 1; i<filterCompanySwitches.count; i++) {
                    bool isiton = [[filterCompanySwitches objectAtIndex:i] isOn];
                    [newArray addObject:[NSNumber numberWithBool:isiton]];
                }
                SEL theSelector = @selector(companySwitchValueChanged:);
                [switchThing addTarget:self action:@selector(companySwitchValueChanged:)  forControlEvents:UIControlEventValueChanged];
                
                [filterCompanySwitches removeAllObjects];
                [filterCompanyText removeAllObjects];
                [filterCompanyText addObject:newLabel.text];
                [filterCompanySwitches addObject:switchThing];
                [filterCompanyText addObject:noneSpecified.text];
                [filterCompanySwitches addObject:noneSpecifiedSwitch];
                
                
                for (int i =0 ; i<uniqueCompaniesArray.count; i++) {
                    
                    UILabel *newLabel = [[UILabel alloc]init];
                    newLabel.text = [uniqueCompaniesArray objectAtIndex:i];
                    [labelsScrollView addSubview:newLabel];
                    newLabel.bounds  = CGRectMake(100, 10, 170, 30);
                    newLabel.center = CGPointMake(100, 115+(40*i));
                    newLabel.textColor= [UIColor whiteColor];
                    [labelsScrollView insertSubview:newLabel atIndex:0];
                    UISwitch *switchThing = [[UISwitch alloc] init];
                    [labelsScrollView setContentSize:CGSizeMake(260, 115+(40*uniqueCompaniesArray.count))];
                    //NSLog(@"%@",newLabel.text);
                    [labelsScrollView addSubview:switchThing];
                    switchThing.center = CGPointMake(220, 116+(40*i));
                    [switchThing addTarget:self action:@selector(companySwitchValueChanged:) forControlEvents:UIControlEventValueChanged];
                    
                    [switchThing setOn:[[newArray objectAtIndex:i] boolValue] animated:NO];
                    [filterCompanyText addObject:newLabel.text];
                    [filterCompanySwitches addObject:switchThing];
                    [filterCompanyText addObject:noneSpecified.text];
                    [filterCompanySwitches addObject:noneSpecifiedSwitch];
                    
                }
                
            }
            
        }
        
        
        if ([labelType isEqual:@"Department"]) {
                if (filterDepartmentText.count == 0)
                {
                    [switchThing addTarget:self action:@selector(departmentSwitchValueChanged:)  forControlEvents:UIControlEventValueChanged];
                    [filterDepartmentSwitches removeAllObjects];
                    [filterDepartmentText removeAllObjects];
                    [filterDepartmentText addObject:newLabel.text];
                    [filterDepartmentSwitches addObject:switchThing];
                    [filterDepartmentText addObject:noneSpecified.text];
                    [filterDepartmentSwitches addObject:noneSpecifiedSwitch];
                    
                    uniqueDepartmentsArray = [uniqueDepartmentsArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                    
                    for (int i =0 ; i<uniqueDepartmentsArray.count; i++) {
                        
                        
                        UILabel *newLabel = [[UILabel alloc]init];
                        newLabel.text = [uniqueDepartmentsArray objectAtIndex:i];
                        [labelsScrollView addSubview:newLabel];
                        newLabel.bounds  = CGRectMake(100, 10, 170, 30);
                        newLabel.center = CGPointMake(100, 115+(40*i));
                        newLabel.textColor= [UIColor whiteColor];
                        [labelsScrollView insertSubview:newLabel atIndex:0];
                        UISwitch *switchThing = [[UISwitch alloc] init];
                        [labelsScrollView setContentSize:CGSizeMake(260, 115+(40*uniqueDepartmentsArray.count))];
                        //NSLog(@"%@",newLabel.text);
                        [labelsScrollView addSubview:switchThing];
                        switchThing.center = CGPointMake(220, 116+(40*i));
                        [switchThing addTarget:self action:@selector(departmentSwitchValueChanged:) forControlEvents:UIControlEventValueChanged];
                        switchThing.on=true;

                        [filterDepartmentText addObject:newLabel.text];
                        [filterDepartmentSwitches addObject:switchThing];
                        
                    }
                } else {
                    NSMutableArray *newArray = [[NSMutableArray alloc] init];
                    for (int i = 1; i<filterDepartmentSwitches.count; i++) {
                        bool isiton = [[filterDepartmentSwitches objectAtIndex:i] isOn];
                        [newArray addObject:[NSNumber numberWithBool:isiton]];
                    }
                    SEL theSelector = @selector(companySwitchValueChanged:);
                    [switchThing addTarget:self action:@selector(departmentSwitchValueChanged:)  forControlEvents:UIControlEventValueChanged];
                    
                    [filterDepartmentSwitches removeAllObjects];
                    [filterDepartmentText removeAllObjects];
                    [filterDepartmentText addObject:newLabel.text];
                    [filterDepartmentSwitches addObject:switchThing];
                    [filterDepartmentText addObject:noneSpecified.text];
                    [filterDepartmentSwitches addObject:noneSpecifiedSwitch];
                    
                    for (int i =0 ; i<uniqueDepartmentsArray.count; i++) {
                        
                        UILabel *newLabel = [[UILabel alloc]init];
                        newLabel.text = [uniqueDepartmentsArray objectAtIndex:i];
                        [labelsScrollView addSubview:newLabel];
                        newLabel.bounds  = CGRectMake(100, 10, 170, 30);
                        newLabel.center = CGPointMake(100, 115+(40*i));
                        newLabel.textColor= [UIColor whiteColor];
                        [labelsScrollView insertSubview:newLabel atIndex:0];
                        UISwitch *switchThing = [[UISwitch alloc] init];
                        [labelsScrollView setContentSize:CGSizeMake(260, 115+(40*uniqueDepartmentsArray.count))];
                        //NSLog(@"%@",newLabel.text);
                        [labelsScrollView addSubview:switchThing];
                        switchThing.center = CGPointMake(220, 116+(40*i));
                        [switchThing addTarget:self action:@selector(departmentSwitchValueChanged:) forControlEvents:UIControlEventValueChanged];
                        
                        [switchThing setOn:[[newArray objectAtIndex:i] boolValue] animated:NO];
                        [filterDepartmentText addObject:newLabel.text];
                        [filterDepartmentSwitches addObject:switchThing];
                        [filterDepartmentText addObject:noneSpecified.text];
                        [filterDepartmentSwitches addObject:noneSpecifiedSwitch];
                        
                    }
                    
                }
        }
        if ([labelType isEqual:@"Job Title"]) {
            if (filterJobTitlesText.count == 0) {
                SEL theSelector = @selector(companySwitchValueChanged:);
                [switchThing addTarget:self action:@selector(jobTitleSwitchValueChanged:)  forControlEvents:UIControlEventValueChanged];
                
                [filterJobTitlesSwitches removeAllObjects];
                [filterJobTitlesText removeAllObjects];
                [filterJobTitlesText addObject:newLabel.text];
                [filterJobTitlesSwitches addObject:switchThing];
                [filterJobTitlesText addObject:noneSpecified.text];
                [filterJobTitlesSwitches addObject:noneSpecifiedSwitch];
                
                uniqueJobTitlesArray = [uniqueJobTitlesArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                
                for (int i =0 ; i<uniqueJobTitlesArray.count; i++) {
                    
                    
                    UILabel *newLabel = [[UILabel alloc]init];
                    newLabel.text = [uniqueJobTitlesArray objectAtIndex:i];
                    [labelsScrollView addSubview:newLabel];
                    newLabel.bounds  = CGRectMake(100, 10, 170, 30);
                    newLabel.center = CGPointMake(100, 115+(40*i));
                    newLabel.textColor= [UIColor whiteColor];
                    [labelsScrollView insertSubview:newLabel atIndex:0];
                    UISwitch *switchThing = [[UISwitch alloc] init];
                    [labelsScrollView setContentSize:CGSizeMake(260, 115+(40*uniqueJobTitlesArray.count))];
                    //NSLog(@"%@",newLabel.text);
                    [labelsScrollView addSubview:switchThing];
                    switchThing.center = CGPointMake(220, 116+(40*i));
                    switchThing.on=true;

                    [switchThing addTarget:self action:@selector(jobTitleSwitchValueChanged:) forControlEvents:UIControlEventValueChanged];
                    [filterJobTitlesText addObject:newLabel.text];
                    [filterJobTitlesSwitches addObject:switchThing];
                    
                }
            } else {
                NSMutableArray *newArray = [[NSMutableArray alloc] init];
                for (int i = 1; i<filterJobTitlesSwitches.count; i++) {
                    bool isiton = [[filterJobTitlesSwitches objectAtIndex:i] isOn];
                    [newArray addObject:[NSNumber numberWithBool:isiton]];
                }
                SEL theSelector = @selector(companySwitchValueChanged:);
                [switchThing addTarget:self action:@selector(jobTitleSwitchValueChanged:)  forControlEvents:UIControlEventValueChanged];
                
                [filterJobTitlesSwitches removeAllObjects];
                [filterJobTitlesText removeAllObjects];
                [filterJobTitlesText addObject:newLabel.text];
                [filterJobTitlesSwitches addObject:switchThing];
                [filterJobTitlesText addObject:noneSpecified.text];
                [filterJobTitlesSwitches addObject:noneSpecifiedSwitch];
                
                for (int i =0 ; i<uniqueJobTitlesArray.count; i++) {
                    
                    UILabel *newLabel = [[UILabel alloc]init];
                    newLabel.text = [uniqueJobTitlesArray objectAtIndex:i];
                    [labelsScrollView addSubview:newLabel];
                    newLabel.bounds  = CGRectMake(100, 10, 170, 30);
                    newLabel.center = CGPointMake(100, 115+(40*i));
                    newLabel.textColor= [UIColor whiteColor];
                    [labelsScrollView insertSubview:newLabel atIndex:0];
                    UISwitch *switchThing = [[UISwitch alloc] init];
                    [labelsScrollView setContentSize:CGSizeMake(260, 115+(40*uniqueJobTitlesArray.count))];
                    //NSLog(@"%@",newLabel.text);
                    [labelsScrollView addSubview:switchThing];
                    switchThing.center = CGPointMake(220, 116+(40*i));
                    [switchThing addTarget:self action:@selector(jobTitleSwitchValueChanged:) forControlEvents:UIControlEventValueChanged];
                    
                    [switchThing setOn:[[newArray objectAtIndex:i] boolValue] animated:NO];
                    [filterJobTitlesText addObject:newLabel.text];
                    [filterJobTitlesSwitches addObject:switchThing];
                    [filterJobTitlesText addObject:noneSpecified.text];
                    [filterJobTitlesSwitches addObject:noneSpecifiedSwitch];
                }
            }
        }
    }
    //NSLog(@"allPeople(bottom) - %i",allPeople.count);
}
-(IBAction)segmentValueChanged:(id)sender {
    UISegmentedControl *s=  sender;
    for (UIView *object in [labelsScrollView subviews])
    {
        [object removeFromSuperview];
    }
    if ([s selectedSegmentIndex]==0) {
        [self loadLabels:@"Company"];
    }
    if ([s selectedSegmentIndex]==1) {
        [self loadLabels:@"Department"];
    }

    if ([s selectedSegmentIndex]==2) {
        [self loadLabels:@"Job Title"];
    }
    if([s selectedSegmentIndex] == 3){
        [self loadLabels:@"Date"];
    }

}
-(void)countUpDuration
{
    ++wait;
    if((practiceModeSwitch.isOn == false && FTGameView.hidden == false) || (practiceModeSwitch.isOn == false && mCFacesView.hidden == false) || (practiceModeSwitch.isOn == false && MCTGameView.hidden == false) )
    {
        if(wait%100 ==0 && moreInfoView.hidden == true)
        {
            wait = 0;
            seconds += 1;
            timeOnThisCard+=1;
            if(seconds <= 9)
            {
                timerLable.text = [NSString stringWithFormat:@"%i:0%i", minutes,seconds];
            }
            else
            {
                timerLable.text = [NSString stringWithFormat:@"%i:%i", minutes,seconds];
            }
            if(seconds == 59)
            {
                seconds = 0;
                //timerLableSeconds.text = [NSString stringWithFormat:@"0%i", countUpValue];

                minutes +=1;
                timerLable.text = [NSString stringWithFormat:@"%i:0%i", minutes,seconds];
            }

            timeOnThisCardLabel.text = [NSString stringWithFormat:@"%i", timeOnThisCard];
        }
    }
    else
    {
        seconds=0;
        minutes =0;
        timerLable.text = [NSString stringWithFormat:@"%i:0%i", minutes,seconds];
    }
    if(animating == true && wait%10 == 0)
    {
        if([nextView isEqualToString:@"FCV"])
        {
            //move the view to the right side of the screen
            [self animateView:FCView fromDirection:@"R"];
        }
        if([nextView isEqualToString:@"MCCV"])
        {
            //move the view to the right side of the screen
            [self animateView:MCCView fromDirection:@"R"];
        }
        if([nextView isEqualToString:@"MCGV"])
        {
            //move the view to the right side of the screen
            [self animateView:MCGameView fromDirection:@"R"];
        }
        if([nextView isEqualToString:@"FV"])
        {
            //move the view to the right side of the screen
            [self animateView:firstView fromDirection:@"R"];
        }
        if([nextView isEqualToString:@"MCTV"])
        {
            //move the view to the right side of the screen
            [self animateView:MCTGameView fromDirection:@"R"];
        }
        if([nextView isEqualToString:@"FTGV"])
        {
            //move the view to the right side of the screen
            [self animateView:FTGameView fromDirection:@"R"];
        }
        if([nextView isEqualToString:@"FTGV"])
        {
            //move the view to the right side of the screen
            [self animateView:FTGameView fromDirection:@"R"];
        }
        if([nextView isEqualToString:@"FGV"])
        {
            //move the view to the right side of the screen
            [self animateView:FGameView fromDirection:@"R"];
        }

    }
    else
    {
        xValR = firstView.center.x - firstView.bounds.size.width;
    }
    if(animatingBack == true)
    {
        if([nextView isEqualToString:@"FCV"])
        {
            //move the view to the right side of the screen
            [self animateView:FCView fromDirection:@"L"];
        }
    }
    else
    {
        xValL = firstView.center.x + firstView.bounds.size.width;
    }
}

-(void)animateView:(UIView*)v fromDirection:(NSString*)direction
{
    if([direction isEqualToString:@"R"])
    {
        //xValR++;
        v.center = CGPointMake(v.center.x+40, v.center.y);
        //NSLog(@"%f", v.center.x);
        if(160 <= v.center.x)
        {
            animating = false;
            nextView = @"";
        }
    }
    else
    {
        xValL--;
        v.center = CGPointMake(v.center.x-40, v.center.y);
        //NSLog(@"%f", v.center.x);
        if(160 <= v.center.x)
        {
            animatingBack = false;
            nextView = @"";
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)goToMCCV
{
    MCCView.hidden = false;
    MCGameView.hidden=true;
    firstView.hidden=true;
    MCTGameView.hidden=true;
    FCView.hidden=true;
    FGameView.hidden = true;
    FCView.hidden = true;
    FTGameView.hidden = true;
    FilterView.hidden = true;
    deptTitleField.hidden = true;
    jobTitleField.hidden = true;
    filterField.text = @"";
    filterLabel.text = @"Filter By:";
    companyTitleField.hidden = true;
    //right now the filter only works with the other view
    //FilterView.hidden = false;
    FilterView.hidden = true;

    gameOverView.hidden = true;
    nextView = @"MCCV";
    MCCView.center = CGPointMake(MCCView.center.x - MCCView.bounds.size.width, MCCView.center.y);
    nameView.hidden = true;

    animating = true;
}
//go to multiple choice view
-(IBAction)goToMCV
{
    
    deptTitleField.hidden = true;
    jobTitleField.hidden = true;
    mcButton1.titleLabel.text = @"";
    mcButton2.titleLabel.text = @"";
    mcButton3.titleLabel.text = @"";
    mcButton4.titleLabel.text = @"";
    /*
     contactGetter = [[MSContactManipulater alloc]init];
     currentContacts = [contactGetter getContactsWithAnImage];
     */
    int currentContactIndex = rand()%currentContacts.count;
    correctMCPerson = [currentContacts objectAtIndex:currentContactIndex];
    
    mcButton1.backgroundColor = [UIColor lightGrayColor];
    mcButton2.backgroundColor = [UIColor lightGrayColor];
    mcButton3.backgroundColor = [UIColor lightGrayColor];
    mcButton4.backgroundColor = [UIColor lightGrayColor];
    
    mcPersonPicture.image = correctMCPerson.selfImage;
    int h = 0;
    do {
        h = rand()%currentContacts.count;
    } while(h==currentContactIndex);
    [mcButton1 setTitle: [[currentContacts objectAtIndex:h] getFullName]forState:UIControlStateNormal];
    //mcButton1.titleLabel.text = [NSString stringWithFormat:@"%@ %@",[[currentContacts objectAtIndex:h] firstName],[[currentContacts objectAtIndex:h] lastName]];
    int i = 0;
    do {
        i = rand()%currentContacts.count;
    } while(h==currentContactIndex || i==h);
    [mcButton2 setTitle: [[currentContacts objectAtIndex:i] getFullName]forState:UIControlStateNormal];

    //mcButton2.titleLabel.text = [NSString stringWithFormat:@"%@ %@",[[currentContacts objectAtIndex:i] firstName],[[currentContacts objectAtIndex:i] lastName]];
    int k = 0;
    do {
        k = rand()%currentContacts.count;
    } while(k==currentContactIndex || k==h || k==i);
    [mcButton3 setTitle: [[currentContacts objectAtIndex:k] getFullName]forState:UIControlStateNormal];

    //mcButton3.titleLabel.text = [NSString stringWithFormat:@"%@ %@",[[currentContacts objectAtIndex:k] firstName],[[currentContacts objectAtIndex:k] lastName]];
    int l= 0;
    do {
        l = rand()%currentContacts.count;
    } while(l==currentContactIndex || l==h || l==i || l==k);
    [mcButton4 setTitle: [[currentContacts objectAtIndex:l] getFullName]forState:UIControlStateNormal];

    //mcButton4.titleLabel.text = [NSString stringWithFormat:@"%@ %@",[[currentContacts objectAtIndex:l] firstName],[[currentContacts objectAtIndex:l] lastName]];
    
    int ra = rand()%4;
    if (ra==0) {
        [mcButton1 setTitle:correctMCPerson.getFullName forState:UIControlStateNormal];
        //mcButton1.titleLabel.text= [NSString stringWithFormat:@"%@ %@",correctMCPerson.firstName,correctMCPerson.lastName];
    }
    if (ra==1) {
        [mcButton2 setTitle:correctMCPerson.getFullName forState:UIControlStateNormal];

        //mcButton2.titleLabel.text= [NSString stringWithFormat:@"%@ %@",correctMCPerson.firstName,correctMCPerson.lastName];
    }
    if (ra==2) {
        [mcButton3 setTitle:correctMCPerson.getFullName forState:UIControlStateNormal];

        //mcButton3.titleLabel.text= [NSString stringWithFormat:@"%@ %@",correctMCPerson.firstName,correctMCPerson.lastName];
    }
    if (ra==3) {
        [mcButton4 setTitle:correctMCPerson.getFullName forState:UIControlStateNormal];

        //mcButton4.titleLabel.text= [NSString stringWithFormat:@"%@ %@",correctMCPerson.firstName,correctMCPerson.lastName];
    }
    //contactView.hidden=true;
    MCGameView.hidden=true;
    firstView.hidden=true;
    MCTGameView.hidden=false;
    FCView.hidden=true;
    MCCView.hidden = true;
    FGameView.hidden = true;
    FCView.hidden = true;
    FTGameView.hidden = true;
    deptTitleField.hidden = true;
    jobTitleField.hidden = true;
    filterField.text = @"";
    filterLabel.text = @"Filter By:";
    companyTitleField.hidden = true;
    FilterView.hidden = true;
    gameOverView.hidden = true;
    nameAndButtonsView.hidden = true;
    nextView = @"MCGV";
    MCGameView.center = CGPointMake(MCGameView.center.x - MCGameView.bounds.size.width, MCGameView.center.y);
    nameView.hidden = true;

    animating = true;

}
//go to first view
-(IBAction)goToFV
{
    gameOverView.hidden = true;
    nextView = @"FV";
    firstView.center = CGPointMake(firstView.center.x - firstView.bounds.size.width, firstView.center.y);

    animating = true;

    FilterView.hidden = true;
    MCGameView.hidden=true;
    firstView.hidden=false;
    FilterView.hidden = true;
    MCTGameView.hidden=true;
    FCView.hidden=true;
    MCCView.hidden = true;
    FGameView.hidden = true;
    FCView.hidden = true;
    FTGameView.hidden = true;
    deptTitleField.hidden = true;
    jobTitleField.hidden = true;
    filterField.text = @"";
    companyTitleField.hidden = true;
    //nameAndButtonsView.hidden = true;
    nameView.hidden = true;
    settingsView.hidden = true;
    statsView.hidden = true;
    leaderBoardView.hidden = true;
}
//go to multiple choice timed view
-(IBAction)goToMCTV
{
    nextView = @"MCTV";
    MCTGameView.center = CGPointMake(MCTGameView.center.x - MCTGameView.bounds.size.width, MCTGameView.center.y);

    animating = true;

    MCGameView.hidden=true;
    firstView.hidden=true;
    MCTGameView.hidden=false;
    FCView.hidden=true;
    MCCView.hidden = true;
    FGameView.hidden = true;
    FCView.hidden = true;
    FTGameView.hidden = true;
    deptTitleField.hidden = true;
    jobTitleField.hidden = true;
    filterField.text = @"";
    filterLabel.text = @"Filter By:";
    companyTitleField.hidden = true;
    FilterView.hidden = true;
    gameOverView.hidden = true;
    //nameAndButtonsView.hidden = true;
    
    nameView.hidden = true;

    FilterView.hidden = false;
    
    deptTitleField.hidden = true;
    jobTitleField.hidden = true;
    mcButton1.titleLabel.text = @"";
    mcButton2.titleLabel.text = @"";
    mcButton3.titleLabel.text = @"";
    mcButton4.titleLabel.text = @"";
    
    MSContactManipulater *tcontactGetter = [[MSContactManipulater alloc]init];
    currentContacts = [tcontactGetter getContactsWithAnImage];
     
    int currentContactIndex = rand()%currentContacts.count;
    //[self chooseArray];
    correctMCPerson = [currentContacts objectAtIndex:currentContactIndex];
     
    mcButton1.backgroundColor = [UIColor lightGrayColor];
    mcButton2.backgroundColor = [UIColor lightGrayColor];
    mcButton3.backgroundColor = [UIColor lightGrayColor];
    mcButton4.backgroundColor = [UIColor lightGrayColor];
//
    mcPersonPicture.image = correctMCPerson.selfImage;
    
    int h = 0;
    do {
        h = rand()%currentContacts.count;
        //NSLog(@"%i",h);
    } while(h==currentContactIndex);
    [mcButton1 setTitle:[NSString stringWithFormat:@"%@",[[currentContacts objectAtIndex:h] getFullName]] forState:UIControlStateNormal];
    NSLog(@"%@",[[currentContacts objectAtIndex:h] getFullName]);
    int i = 0;
    do {
        i = rand()%currentContacts.count;
    } while(h==currentContactIndex || i==h);
    [mcButton2 setTitle:[NSString stringWithFormat:@"%@",[[currentContacts objectAtIndex:i] getFullName]] forState:UIControlStateNormal];
    NSLog(@"%@",[[currentContacts objectAtIndex:i] getFullName]);
    int k = 0;
    do {
        k = rand()%currentContacts.count;
    } while(k==currentContactIndex || k==h || k==i);
    [mcButton3 setTitle:[NSString stringWithFormat:@"%@",[[currentContacts objectAtIndex:k] getFullName]] forState:UIControlStateNormal];
        NSLog(@"%@",[[currentContacts objectAtIndex:k] getFullName]);
    int l= 0;
    do {
        l = rand()%currentContacts.count;
    } while(l==currentContactIndex || l==h || l==i || l==k);
    [mcButton4 setTitle:[NSString stringWithFormat:@"%@",[[currentContacts objectAtIndex:l] getFullName]] forState:UIControlStateNormal];
        NSLog(@"%@",[[currentContacts objectAtIndex:l] getFullName]);
    /*
    
    int h = 0;
    h = rand()%currentPeopleArray.count-1;
    [self loadNewPerson];
    [mcButton1 setTitle:[NSString stringWithFormat:@"%@ %@",[currentPerson firstName],[currentPerson lastName]] forState:UIControlStateNormal];
    //mcButton1.titleLabel.text = [NSString stringWithFormat:@"%@ %@",[currentPerson firstName],[currentPerson lastName]];
    NSLog(@"%@ %@",[currentPerson firstName],[currentPerson lastName]);
    
    //h gets a new value
    h = rand()%currentPeopleArray.count-1;
    [self loadNewPerson];
    [mcButton2 setTitle:[NSString stringWithFormat:@"%@ %@",[currentPerson firstName],[currentPerson lastName]] forState:UIControlStateNormal];
    //mcButton2.titleLabel.text = [NSString stringWithFormat:@"%@",[currentPerson getFullName]];
    NSLog(@"%@ %@",[currentPerson firstName],[currentPerson lastName]);
    
    //h gets a new value
    h = rand()%currentPeopleArray.count-1;
    [self loadNewPerson];
    [mcButton3 setTitle:[NSString stringWithFormat:@"%@ %@",[currentPerson firstName],[currentPerson lastName]] forState:UIControlStateNormal];
    //mcButton3.titleLabel.text = [NSString stringWithFormat:@"%@",[currentPerson getFullName]];
    NSLog(@"%@ %@",[currentPerson firstName],[currentPerson lastName]);
    
    //h gets a new value
    h = rand()%currentPeopleArray.count-1;
    [self loadNewPerson];
    [mcButton4 setTitle:[NSString stringWithFormat:@"%@ %@",[currentPerson firstName],[currentPerson lastName]] forState:UIControlStateNormal];
    //mcButton4.titleLabel.text = [NSString stringWithFormat:@"%@",[currentPerson getFullName]];
    NSLog(@"%@ %@",[currentPerson firstName],[currentPerson lastName]);
    
     */
    NSLog(@"Correct Person = %@",[correctMCPerson getFullName]);
    int ra = rand()%4;
    if (ra==0)
    {
        [mcButton1 setTitle:[NSString stringWithFormat:@"%@",[correctMCPerson getFullName]] forState:UIControlStateNormal];
        mcPersonPicture.image = correctMCPerson.selfImage;

    }
    else if (ra==1)
    {
        [mcButton2 setTitle:[NSString stringWithFormat:@"%@",[correctMCPerson getFullName]] forState:UIControlStateNormal];
        mcPersonPicture.image = correctMCPerson.selfImage;

    }
    else if (ra==2)
    {
        [mcButton3 setTitle:[NSString stringWithFormat:@"%@",[correctMCPerson getFullName]] forState:UIControlStateNormal];
        mcPersonPicture.image = correctMCPerson.selfImage;
        
    }
    else if (ra==3)
    {
        [mcButton4 setTitle:[NSString stringWithFormat:@"%@",[correctMCPerson getFullName]] forState:UIControlStateNormal];
        mcPersonPicture.image = correctMCPerson.selfImage;

    }
    //contactView.hidden=true;
 }
-(IBAction)mcAnswerPressed:(id)sender
{
    nextMCN.hidden = false;
    totalGuessed++;
    filterField.text = @"";
    filterLabel.text = @"Filter By:";

    if(practiceModeSwitch.isOn == true && currentPerson.hasBeenGuessed == false)
    {
        UIButton *b = (UIButton *)sender;
        if ([b.titleLabel.text isEqualToString:correctMCPerson.getFullName])
        {
            [currentPerson gotRight];
            totalCorrect++;
            currentPerson.hasBeenGuessedRight = true;
            currentPerson.hasBeenGuessed = true;
            [arrayOf49PercentAndUnder removeObjectIdenticalTo:correctMCPerson];
            [arrayOf50PercentAndOver addObject:correctMCPerson];
        }
        else
        {
            b.backgroundColor = [UIColor redColor];
            [currentPerson gotWrong];
            currentPerson.hasBeenGuessed = true;
        }
    }
    else if (practiceModeSwitch.isOn == false && currentPerson.hasBeenGuessed == false)
    {
        UIButton *b = (UIButton *)sender;
        [arrayOf49PercentAndUnder removeObjectIdenticalTo:correctMCPerson];
        [arrayOf50PercentAndOver addObject:correctMCPerson];
        if ([b.titleLabel.text isEqualToString:correctMCPerson.getFullName])
        {
            [currentPerson gotRight];
            totalCorrect++;
            currentPerson.hasBeenGuessedRight = true;
            currentPerson.hasBeenGuessed = true;
        }
        else
        {
            [currentPerson gotWrong];
            currentPerson.hasBeenGuessed = true;
        }
        if([mcButton1.titleLabel.text isEqualToString:correctMCPerson.getFullName])
        {
            mcButton1.backgroundColor = [UIColor greenColor];
        }
        else
        {
            mcButton1.backgroundColor = [UIColor redColor];
        }
        if([mcButton2.titleLabel.text isEqualToString:correctMCPerson.getFullName])
        {
            mcButton2.backgroundColor = [UIColor greenColor];
        }
        else
        {
            mcButton2.backgroundColor = [UIColor redColor];
        }
        if([mcButton3.titleLabel.text isEqualToString:correctMCPerson.getFullName])
        {
            mcButton3.backgroundColor = [UIColor greenColor];
        }
        else
        {
            mcButton3.backgroundColor = [UIColor redColor];
        }
        if([mcButton4.titleLabel.text isEqualToString:correctMCPerson.getFullName])
        {
            mcButton4.backgroundColor = [UIColor greenColor];
        }
        else
        {
            mcButton4.backgroundColor = [UIColor redColor];
        }
    }
    if(arrayOf49PercentAndUnder.count < 4)
    {
        gameOverView.hidden = false;
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
        
        currentScoreMCN = (int)round(((1000*totalGuessed*totalGuessed*totalPercentage)/(totalSeconds)));
        [self printHighScoreMCN];
        
        FilterView.hidden = true;
        
        totalCorrect = 0;
        totalGuessed = 0;
        for(int i =0; i < allPeople.count; i++)
        {
            Person *p;
            p =[allPeople objectAtIndex:i];
            p.hasBeenGuessed = false;
            p.hasBeenGuessedRight = false;
            //NSLog(@"%id", p.hasBeenGuessed);
        }
    }
}
-(IBAction)nextMCN
{
    [self generateNewPeopleMCN];
    nextMCN.hidden = true;
    currentPerson.hasBeenGuessed = false;
    numOfContactsLeftLabel.text = [NSString stringWithFormat:@"%i",arrayOf49PercentAndUnder.count];

}
//go to timed view
//depricated
/*
-(IBAction)goToTV
{
    nameAndButtonsView.hidden = true;
    MCGameView.hidden=true;
    firstView.hidden=true;
    MCTGameView.hidden=true;
    FCView.hidden=true;
    MCCView.hidden = false;
    FGameView.hidden = true;
    FCView.hidden = true;
    FTGameView.hidden = true;
    FilterView.hidden = true;
    personPic.hidden = true;
    showInfoButton.hidden = true;
    nameAndButtonsView.hidden = true;
    deptTitleField.hidden = true;
    jobTitleField.hidden = true;
    filterField.text = @"";
    filterLabel.text = @"Filter By:";
    companyTitleField.hidden = true;
    gameOverView.hidden = true;

}
 */
//go to flashcard view
-(IBAction)goToFlashV
{
    MCGameView.hidden=true;
    firstView.hidden=true;
    MCTGameView.hidden=true;
    FCView.hidden=true;
    MCCView.hidden = true;
    FGameView.hidden = false;
    FCView.hidden = true;
    FTGameView.hidden = true;
    FilterView.hidden = true;
    gameOverView.hidden = true;
    nameAndButtonsView.hidden = false;
    nameView.hidden = true;

    personPic.hidden = false;
    showInfoButton.hidden = false;
    deptTitleField.hidden = true;
    jobTitleField.hidden = true;
    filterField.text = @"";
    filterLabel.text = @"Filter By:";
    companyTitleField.hidden = true;
    nextView = @"FGV";
    FGameView.center = CGPointMake(FGameView.center.x - FGameView.bounds.size.width, FGameView.center.y);

    animating = true;

}
//go to timed view
//go to flashcard chooser view
-(IBAction)goToFCV
{
    FilterView.hidden = false;
    MCGameView.hidden=true;
    firstView.hidden=true;
    MCTGameView.hidden=true;
    FCView.hidden=true;
    MCCView.hidden = true;
    FGameView.hidden = true;
    FCView.hidden = false;
    FTGameView.hidden = true;
    nameAndButtonsView.hidden = true;

    infoButton.hidden = true;
    
    personPic.hidden = true;
    showInfoButton.hidden = true;
    nameAndButtonsView.hidden = true;
    deptTitleField.hidden = true;
    jobTitleField.hidden = true;
    filterField.text = @"";
    filterLabel.text = @"Filter By:";
    companyTitleField.hidden = true;
    gameOverView.hidden = true;
    nextView = @"FCV";
    FCView.center = CGPointMake(FCView.center.x - FCView.bounds.size.width, FCView.center.y);

    animating = true;

}

-(IBAction)showFilterView:(id)sender
{
    firstView.hidden=true;
    MCTGameView.hidden=true;
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
    mCFacesView.hidden=true;
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
    //nextView = @"Filter";
    //FilterView.center = CGPointMake(FilterView.center.x - FilterView.bounds.size.width, FilterView.center.y);
    //animating = true;
    
    //NSLog(@"%@",sender);
    
    if(sender ==tFButton)
    {
        typeOfGame.text = @"Flashcard Game";
    }
    if(sender == mCNamesButton)
    {
        typeOfGame.text = @"Multiple Choice Names";
    }
    if(sender == mCFacesButton)
    {
        typeOfGame.text = @"Multiple Choice Faces";
    }
    FilterView.hidden=false;
}

//go to flashcard timed view
-(IBAction)goToFTV
{
    
    FilterView.hidden = true;
    MCGameView.hidden=true;
    firstView.hidden=true;
    MCTGameView.hidden=true;
    FCView.hidden=true;
    MCCView.hidden = true;
    FGameView.hidden = true;
    FCView.hidden = true;
    FTGameView.hidden = false;
    nameAndButtonsView.hidden = false;
    nameView.hidden = false;

    personPic.hidden = false;
    showInfoButton.hidden = false;
    deptTitleField.hidden = true;
    jobTitleField.hidden = true;
    companyTitleField.hidden = true;
    gameOverView.hidden = true;

    filterField.text = @"";
    filterLabel.text = @"Filter By:";
    nextView = @"FTGV";
    FTGameView.center = CGPointMake(FTGameView.center.x - FTGameView.bounds.size.width, FTGameView.center.y);
    
    nameView.hidden = true;


}
-(IBAction)goToNewView:(id)sender
{
    if(sender == leaderBoardButton)
    {
        leaderBoardView.hidden = false;
        firstView.hidden = true;

    }
    else if(sender == statsButton)
    {
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
        if(bT < 10)
        {
            bestTimeLabelF.text = [NSString stringWithFormat:@"Best Time: %i:0%i",m,bT];
        }
        else
        {
            bestTimeLabelF.text = [NSString stringWithFormat:@"Best Time: %i:%i",m,bT];
        }
        
        m=0;
        bT = bestTimeMCF;
        while(bT > 60)
        {
            bT-=60;
            m++;
        }
            
        if(bT < 10)
        {
            bestTimeLabelMCF.text = [NSString stringWithFormat:@"Best Time: %i:0%i",m,bT];
        }
        else
        {
            bestTimeLabelMCF.text = [NSString stringWithFormat:@"Best Time: %i:%i",m,bT];
        }
        
        m=0;
        bT = bestTimeMCN;

        while(bT > 60)
        {
            bT-=60;
            m++;
        }
            
        if(bT < 10)
        {
            bestTimeLabelMCN.text = [NSString stringWithFormat:@"Best Time: %i:0%i",m,bT];
        }
        else
        {
            bestTimeLabelMCN.text = [NSString stringWithFormat:@"Best Time: %i:%i",m,bT];
        }
        
        mostTimeLabelF.text = [NSString stringWithFormat:@"Most Time Taken On: %@ (%i Seconds)", mostTimeF.getFullName,mostTimeIntF];
        mostTimeLabelMCF.text = [NSString stringWithFormat:@"Most Time Taken On: %@ (%i Seconds)", mostTimeMCF.getFullName,mostTimeIntMCF];
        mostTimeLabelMCN.text = [NSString stringWithFormat:@"Most Time Taken On: %@ (%i Seconds)", mostTimeMCN.getFullName,mostTimeIntMCN];
        
        mostTimeImageViewF.image = mostTimeF.selfImage;
        mostTimeImageViewMCF.image = mostTimeMCF.selfImage;
        mostTimeImageViewMCN.image = mostTimeMCN.selfImage;

        statsView.hidden = false;
        firstView.hidden = true;

    }
    else if(sender == settingsButton)
    {
        settingsView.hidden = false;
        firstView.hidden = true;

    }
}



-(IBAction)hintButtonPressed
{
    ++numberOfHintsPressed;
    hintLabel.text = [NSString stringWithFormat:@"H:%i", 3-numberOfHintsPressed];
    [self generateDotsForTime:numberOfHintsPressed];
}
-(void)generateDotsForTime:(int)t
{
    
    nameView.hidden = false;
    
    NSString*fNDots;
    NSString*lNDots;

    fNDots = @" ";
    lNDots = @" ";

    if( t == 1)
    {
        seconds+=3;
        
        for(int l = 0; l<currentPerson.firstName.length; ++l)
        {
            fNDots = [NSString stringWithFormat:@"-%@",fNDots];
        }
        for(int l = 0; l<currentPerson.lastName.length; ++l)
        {
            lNDots = [NSString stringWithFormat:@"-%@",lNDots];
        }
        
        nameLabel.text = [NSString stringWithFormat:@"%@ %@",fNDots,lNDots];
    }
    if( t == 2)
    {
        seconds+=3;

        for(int l = 0; l<currentPerson.firstName.length-1; ++l)
        {
            fNDots = [NSString stringWithFormat:@"-%@",fNDots];
        }
        for(int l = 0; l<currentPerson.lastName.length-1; ++l)
        {
            lNDots = [NSString stringWithFormat:@"-%@",lNDots];
        }
        fNDots = [NSString stringWithFormat:@"%c%@",[currentPerson.firstName characterAtIndex:0],fNDots];
        lNDots = [NSString stringWithFormat:@"%c%@",[currentPerson.lastName characterAtIndex:0], lNDots];

        nameLabel.text = [NSString stringWithFormat:@"%@ %@",fNDots,lNDots];
    }
    if( t == 3)
    {
        seconds+=3;

        for(int l = currentPerson.firstName.length-1; l>0; --l)
        {
            if(l%2 == 0)
            {
                fNDots = [NSString stringWithFormat:@"%c%@",[currentPerson.firstName characterAtIndex:l],fNDots];
            }
            else
            {
                fNDots = [NSString stringWithFormat:@"-%@",fNDots];
            }
        }
        for(int l = currentPerson.lastName.length-1; l>0; --l)
        {
            if(l%2 == 0)
            {
                lNDots = [NSString stringWithFormat:@"%c%@",[currentPerson.lastName characterAtIndex:l],lNDots];
            }
            else
            {
                lNDots = [NSString stringWithFormat:@"-%@",lNDots];
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
    if(seconds >= 59)
    {
        seconds = 0;
        //timerLableSeconds.text = [NSString stringWithFormat:@"0%i", countUpValue];
        
        minutes +=1;
        timerLable.text = [NSString stringWithFormat:@"%i:0%i", minutes,seconds];
    }
    
}

- (bool)isObjectIdenticalTo:(id)anObject inArray:(NSMutableArray*)aIQ
{
    int p;
    p = aIQ.count;
    //NSLog(@"%i people in array before",p);
    
    Person *sentP;
    sentP = anObject;
    if(p-1 != 0 && p-1 > 0)
    {
        for (int h =0; h < (p-1); ++h)
        {
            //NSLog(@"valH=%i",h);
            Person *pIQ;
            pIQ = [aIQ objectAtIndex:h];
            
            if (pIQ.firstName == sentP.firstName && pIQ.lastName == sentP.lastName && [pIQ returnPercentage] == [sentP returnPercentage] )
            {
                //NSLog(@"object was in the array");
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
            //NSLog(@"object was in the array");
            return true;
        }
    }
    else if(p-1 < 0)
    {
        //error the array is empty
    }
    //NSLog(@"object was not in the array");
    return false;
}
//depricated
/*
-(IBAction)pressedAll:(id)sender
{
    [arrayOf49PercentAndUnder removeAllObjects];
    [arrayOf50PercentAndOver removeAllObjects];
    MSContactManipulater *contactGetter;
    contactGetter = [[MSContactManipulater alloc]init];
    arrayOf49PercentAndUnder = [[NSMutableArray alloc]init];
    arrayOf49PercentAndUnder = [contactGetter getContactsWithAnImage];
    //[self addFields];
    
    
    NSMutableArray*currentArray;

    FilterView.hidden = true;
    NSLog(@"all contacts");
    
    
    [filteringIndicator startAnimating];
    arrayOf49PercentAndUnder = [contactGetter getContactsWithAnImage];
    [filteringIndicator stopAnimating];
    
    currentArray = arrayOf49PercentAndUnder;
    
    j = rand()%arrayOf49PercentAndUnder.count;
    
    
    currentPerson =[currentArray objectAtIndex:j];
    
    personPic.image = [currentPerson selfImage];
    if (currentPerson.lastName == NULL)
    {
        nameLabel.text = currentPerson.firstName;
        
    }
    else
    {
        nameLabel.text = [NSString stringWithFormat:@"%@ %@", currentPerson.firstName,currentPerson.lastName];
    }

}
-(IBAction)pressedCompany:(id)sender {
    [arrayOf49PercentAndUnder removeAllObjects];
    [arrayOf50PercentAndOver removeAllObjects];
    MSContactManipulater *contactGetter;

    contactGetter = [[MSContactManipulater alloc]init];
    arrayOf49PercentAndUnder = [contactGetter getContactsWithAnImage];
    //[self addFields];
    companyTitleField.hidden = false;
    allButton.enabled = false;
    jobTitleButton.enabled = false;
    departmentButton.enabled = false;
    //companyButton.enabled = false;
}
-(IBAction)pressedDepartment:(id)sender
{
    [arrayOf49PercentAndUnder removeAllObjects];
    [arrayOf50PercentAndOver removeAllObjects];
    MSContactManipulater *contactGetter;

    contactGetter = [[MSContactManipulater alloc]init];
    arrayOf49PercentAndUnder = [contactGetter getContactsWithAnImage];
    //[self addFields];
    deptTitleField.hidden = false;
    allButton.enabled = false;
    jobTitleButton.enabled = false;
    //departmentButton.enabled = false;
    companyButton.enabled = false;
}
*/
-(bool)checkForString:(NSString*)str inArray:(NSMutableArray*)arr
{
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
//depricated
/*
-(IBAction)pressedJobTitle:(id)sender {
    [arrayOf49PercentAndUnder removeAllObjects];
    [arrayOf50PercentAndOver removeAllObjects];
    MSContactManipulater *contactGetter;

    contactGetter = [[MSContactManipulater alloc]init];
    arrayOf49PercentAndUnder = [contactGetter getContactsWithAnImage];
    //[self addFields];
    
    jobTitleField.hidden = false;
    allButton.enabled = false;
    //jobTitleButton.enabled = false;
    departmentButton.enabled = false;
    companyButton.enabled = false;
    
}
-(IBAction)enteredFilter
{
    [arrayOf49PercentAndUnder removeAllObjects];
    [arrayOf50PercentAndOver removeAllObjects];
    MSContactManipulater *contactGetter;

    contactGetter = [[MSContactManipulater alloc]init];
    arrayOf49PercentAndUnder = [contactGetter getContactsWithAnImage];
    //[self addFields];
    
    NSMutableArray*currentArray;

    [arrayOf49PercentAndUnder removeAllObjects];
    [arrayOf50PercentAndOver removeAllObjects];


    NSLog(@"button succesfully pressed");
    if ([[filterField.text uppercaseString]  isEqual: @"DEPARTMENT"])
    {
        //show different departments
        NSLog(@"department");
        filterLabel.text = @"Department Title:";
        deptTitleField.hidden = false;
    }
    else if ([[filterField.text uppercaseString]  isEqual: @"JOB TITLE"])
    {
        //show different JOB TITLES
        NSLog(@"job titles");
        filterLabel.text = @"Job Title:";
        jobTitleField.hidden = false;
    }
    else if ([[filterField.text uppercaseString]  isEqual: @"COMPANY"])
    {
        //show different JOB TITLES
        NSLog(@"company");
        filterLabel.text = @"Company:";
        companyTitleField.hidden = false;
    }
    else if ([[filterField.text uppercaseString]  isEqual: @"ALL"])
    {
        FilterView.hidden = true;
        NSLog(@"all contacts");
        
        contactGetter = [[MSContactManipulater alloc]init];
        
        [filteringIndicator startAnimating];
        arrayOf49PercentAndUnder = [contactGetter getContactsWithAnImage];
        [filteringIndicator stopAnimating];
        
        currentArray = arrayOf49PercentAndUnder;
        
        j = rand()%arrayOf49PercentAndUnder.count;
        
        
        currentPerson =[currentArray objectAtIndex:j];
        
        personPic.image = [currentPerson selfImage];
        if (currentPerson.lastName == NULL)
        {
            nameLabel.text = currentPerson.firstName;
            
        }
        else
        {
            nameLabel.text = [NSString stringWithFormat:@"%@ %@", currentPerson.firstName,currentPerson.lastName];
        }
    }
    
    else
    {

    }
    currentPeopleArray = currentArray;

}
-(IBAction)enteredJobTitle
{
    [filteringIndicator startAnimating];
    filterField.hidden = true;
    companyTitleField.hidden = true;
    deptTitleField.hidden =true;
    jobTitleField.hidden =true;
    filterLabel.text = @"FILTERING";
    MSContactManipulater *contactGetter;

    contactGetter = [[MSContactManipulater alloc]init];
    [filteringIndicator startAnimating];
    arrayOf49PercentAndUnder = [contactGetter getContactsWithJobTitle:jobTitleField.text];
    [filteringIndicator stopAnimating];
    NSMutableArray*currentArray;
    currentArray = arrayOf49PercentAndUnder;
    currentPeopleArray = currentArray;
    j = rand()%arrayOf49PercentAndUnder.count;
    
    
    currentPerson =[currentArray objectAtIndex:j];
    personPic.image = [currentPerson selfImage];
    
    if (currentPerson.lastName == NULL)
    {
        nameLabel.text = currentPerson.firstName;
        
    }
    else
    {
        nameLabel.text = [NSString stringWithFormat:@"%@ %@", currentPerson.firstName,currentPerson.lastName];
    }
    FilterView.hidden = true;
    [filteringIndicator stopAnimating];
}
-(IBAction)enteredDeptTitle
{
    filteringIndicator.hidesWhenStopped = true;
    filterField.hidden = true;
    companyTitleField.hidden = true;
    deptTitleField.hidden =true;
    jobTitleField.hidden =true;
    filterLabel.text = @"FILTERING";
    MSContactManipulater *contactGetter;

    contactGetter = [[MSContactManipulater alloc]init];
    [filteringIndicator startAnimating];
    arrayOf49PercentAndUnder = [contactGetter getContactsWithDept:deptTitleField.text];
    [filteringIndicator stopAnimating];
    NSMutableArray*currentArray;
    currentArray = arrayOf49PercentAndUnder;
    currentPeopleArray = currentArray;
    j = rand()%arrayOf49PercentAndUnder.count;
    
    
    currentPerson =[currentArray objectAtIndex:j];
    
    personPic.image = [currentPerson selfImage];
    
    if (currentPerson.lastName == NULL)
    {
        nameLabel.text = currentPerson.firstName;
        
    }
    else
    {
        nameLabel.text = [NSString stringWithFormat:@"%@ %@", currentPerson.firstName,currentPerson.lastName];
    }
    FilterView.hidden = true;
    [filteringIndicator stopAnimating];

}
-(IBAction)enteredCompanyTitle
{
    MSContactManipulater *contactGetter;

    contactGetter = [[MSContactManipulater alloc]init];
    [filteringIndicator startAnimating];
    arrayOf49PercentAndUnder = [contactGetter getContactsWithCompany:companyTitleField.text];
    [filteringIndicator stopAnimating];

    NSMutableArray*currentArray;
    currentArray = arrayOf49PercentAndUnder;
    
    j = rand()%arrayOf49PercentAndUnder.count;
    
    
    currentPerson =[currentArray objectAtIndex:j];
    currentPeopleArray = currentArray;
    personPic.image = [currentPerson selfImage];
    
    if (currentPerson.lastName == NULL)
    {
        nameLabel.text = currentPerson.firstName;
        
    }
    else
    {
        nameLabel.text = [NSString stringWithFormat:@"%@ %@", currentPerson.firstName,currentPerson.lastName];
    }
    FilterView.hidden = true;
}
 */
-(bool)checkIfAllPeopleHaveBeenGuessed
{
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
-(bool)checkIfAllPeopleHaveBeenGuessedCorrectly
{
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
-(IBAction)personGuessedMCF:(id)sender
{
    
    totalGuessed++;
    
    if(sender == gBMCF1)
    {
        //they guessed the top left person
        n1.text = [NSString stringWithFormat:@"%@ %@",pMCF1.firstName, pMCF1.lastName];
        iBMCF1.hidden = false;
        iTIMCF1.hidden = false;
        [self checkIfCorrectMCF:pMCF1];

    }
    if(sender == gBMCF2)
    {
        //they guessed the top right person
        n2.text = [NSString stringWithFormat:@"%@ %@",pMCF2.firstName, pMCF2.lastName];
        iBMCF2.hidden = false;
        iTIMCF2.hidden = false;
        [self checkIfCorrectMCF:pMCF2];

    }
    if(sender == gBMCF3)
    {
        //they guessed the bottom left person
        n3.text = [NSString stringWithFormat:@"%@ %@",pMCF3.firstName, pMCF3.lastName];
        iBMCF3.hidden = false;
        iTIMCF3.hidden = false;
        [self checkIfCorrectMCF:pMCF3];

    }
    if(sender == gBMCF4)
    {
        //they guessed the bottom right person
        n4.text = [NSString stringWithFormat:@"%@ %@",pMCF4.firstName, pMCF4.lastName];
        iBMCF4.hidden = false;
        iTIMCF4.hidden = false;
        [self checkIfCorrectMCF:pMCF4];

    }
    
    
    
}
-(void)checkIfCorrectMCF:(Person*)pIQ
{
    
    if ((pIQ == correctPersonMCF && practiceModeSwitch.isOn == true) || (practiceModeSwitch.isOn == false))
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

        
        n1.text = [NSString stringWithFormat:@"%@ %@",pMCF1.firstName,pMCF1.lastName];
        n2.text = [NSString stringWithFormat:@"%@ %@",pMCF2.firstName,pMCF2.lastName];
        n3.text = [NSString stringWithFormat:@"%@ %@",pMCF3.firstName,pMCF3.lastName];
        n4.text = [NSString stringWithFormat:@"%@ %@",pMCF4.firstName,pMCF4.lastName];

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
        }
        //NSLog(@"percent %f", totalCorrect/totalGuessed);
    }
    else
    {
        if(pIQ == pMCF1)
        {
            //got wrong
            iTIMCF1.image = [UIImage imageNamed:@"SmallTD.png"];
        }
        if(pIQ == pMCF2)
        {
            //got wrong
            iTIMCF2.image = [UIImage imageNamed:@"SmallTD.png"];

        }
        if(pIQ == pMCF3)
        {
            //got wrong
            iTIMCF3.image = [UIImage imageNamed:@"SmallTD.png"];

        }
        if(pIQ == pMCF4)
        {
            //got wrong
            iTIMCF4.image = [UIImage imageNamed:@"SmallTD.png"];

        }
    }
}
-(IBAction)hintMCF
{
    
}
-(IBAction)nextMCF
{
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

-(void)assignCorrectPersonMCF
{
    int x;
    x = (rand()%4);
    NSLog([NSString stringWithFormat:@"%i",x]);
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
    
    correctPersonLabelMCF.text = [NSString stringWithFormat:@"%@ %@",correctPersonMCF.firstName, correctPersonMCF.lastName];
}
-(void)generateNewPeopleMCF
{
    if(timeOnThisCard > mostTimeIntMCF)
    {
        mostTimeIntMCF = timeOnThisCard;
        mostTimeMCF = currentPerson;
    }
    timeOnThisCard = 0;

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
        //you are down to 3 people so there are only 3 possibilities
        mCFacesView.hidden = true;
        gameOverView.hidden = false;
        
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
        
        currentScoreMCF = (int)round(((1000*totalGuessed*totalGuessed*totalPercentage)/(totalSeconds)));
        [self printHighScoreMCF];
        
        FilterView.hidden = true;
        
        totalCorrect = 0;
        totalGuessed = 0;
        for(int i =0; i < allPeople.count; i++)
        {
            Person *p;
            p =[allPeople objectAtIndex:i];
            p.hasBeenGuessed = false;
            p.hasBeenGuessedRight = false;
            //NSLog(@"%id", p.hasBeenGuessed);
        }

    }
}
-(IBAction)moreInfoMCF:(id)sender
{
    if(sender == iBMCF1)
    {
        [self showMoreInfo:pMCF1];
    }
    if(sender == iBMCF2)
    {
        [self showMoreInfo:pMCF2];
    }
    if(sender == iBMCF3)
    {
        [self showMoreInfo:pMCF3];
    }
    if(sender == iBMCF4)
    {
        [self showMoreInfo:pMCF4];
    }
}
-(void)showMoreInfo:(Person *)pIQ
{
    moreInfoView.hidden=false;
    moreInfoViewImage.image = pIQ.selfImage;
    timerLable.text = @"Pause";
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
-(IBAction)moreInfo
{
    moreInfoView.hidden=false;
    moreInfoViewImage.image = personPic.image;
    timerLable.text = @"Pause";
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
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:20.0];
    
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
-(IBAction)lessInfo
{
    moreInfoView.hidden=true;
}
-(IBAction)hideFilterViewAndFilter
{
    [self readValues];
    if((arrayOf49PercentAndUnder.count > 0 && [typeOfGame.text isEqualToString:@"Flashcard Game"]) || (([typeOfGame.text isEqualToString:@"Multiple Choice Faces"] || [typeOfGame.text isEqualToString:@"Multiple Choice Names"]) && arrayOf49PercentAndUnder.count > 3))
    {
        FilterView.hidden = true;
    }
}

-(void)generateNewPeopleMCN
{
    if(timeOnThisCard > mostTimeIntMCN)
    {
        mostTimeIntMCN = timeOnThisCard;
        mostTimeMCN = currentPerson;
    }
    timeOnThisCard = 0;
    int rn;
    
    Person*pMCN1;
    Person*pMCN2;
    Person*pMCN3;
    Person*pMCN4;

    mcButton1.backgroundColor = [UIColor lightGrayColor];
    mcButton2.backgroundColor = [UIColor lightGrayColor];
    mcButton3.backgroundColor = [UIColor lightGrayColor];
    mcButton4.backgroundColor = [UIColor lightGrayColor];
    //
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
    
    [mcButton1 setTitle:[NSString stringWithFormat:@"%@",[pMCN1 getFullName]] forState:UIControlStateNormal];
    [mcButton2 setTitle:[NSString stringWithFormat:@"%@",[pMCN2 getFullName]] forState:UIControlStateNormal];
    [mcButton3 setTitle:[NSString stringWithFormat:@"%@",[pMCN3 getFullName]] forState:UIControlStateNormal];
    [mcButton4 setTitle:[NSString stringWithFormat:@"%@",[pMCN4 getFullName]] forState:UIControlStateNormal];

    
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

    /*
    
    
    int h = 0;
    do {
        h = rand()%arrayOf49PercentAndUnder.count;
        //NSLog(@"%i",h);
    } while(h==currentContactIndex);
    [mcButton1 setTitle:[NSString stringWithFormat:@"%@",[[arrayOf49PercentAndUnder objectAtIndex:h] getFullName]] forState:UIControlStateNormal];
    NSLog(@"%@",[[arrayOf49PercentAndUnder objectAtIndex:h] getFullName]);
    int i = 0;
    do {
        i = rand()%arrayOf49PercentAndUnder.count;
    } while(h==currentContactIndex || i==h);
    [mcButton2 setTitle:[NSString stringWithFormat:@"%@",[[arrayOf49PercentAndUnder objectAtIndex:i] getFullName]] forState:UIControlStateNormal];
    NSLog(@"%@",[[arrayOf49PercentAndUnder objectAtIndex:i] getFullName]);
    int k = 0;
    do {
        k = rand()%arrayOf49PercentAndUnder.count;
    } while(k==currentContactIndex || k==h || k==i);
    [mcButton3 setTitle:[NSString stringWithFormat:@"%@",[[arrayOf49PercentAndUnder objectAtIndex:k] getFullName]] forState:UIControlStateNormal];
    NSLog(@"%@",[[arrayOf49PercentAndUnder objectAtIndex:k] getFullName]);
    int l= 0;
    do {
        l = rand()%arrayOf49PercentAndUnder.count;
    } while(l==currentContactIndex || l==h || l==i || l==k);
    [mcButton4 setTitle:[NSString stringWithFormat:@"%@",[[arrayOf49PercentAndUnder objectAtIndex:l] getFullName]] forState:UIControlStateNormal];
    int ra = rand()%4;
    if (ra==0)
    {
        [mcButton1 setTitle:[NSString stringWithFormat:@"%@",[correctMCPerson getFullName]] forState:UIControlStateNormal];
        mcPersonPicture.image = correctMCPerson.selfImage;
        
    }
    else if (ra==1)
    {
        [mcButton2 setTitle:[NSString stringWithFormat:@"%@",[correctMCPerson getFullName]] forState:UIControlStateNormal];
        mcPersonPicture.image = correctMCPerson.selfImage;
        
    }
    else if (ra==2)
    {
        [mcButton3 setTitle:[NSString stringWithFormat:@"%@",[correctMCPerson getFullName]] forState:UIControlStateNormal];
        mcPersonPicture.image = correctMCPerson.selfImage;
        
    }
    else if (ra==3)
    {
        [mcButton4 setTitle:[NSString stringWithFormat:@"%@",[correctMCPerson getFullName]] forState:UIControlStateNormal];
        mcPersonPicture.image = correctMCPerson.selfImage;
        
    }
     */
    timerView.hidden = false;
}

-(IBAction)goButtonPressed
{

    
    
    [self readValues];
    if((arrayOf49PercentAndUnder.count > 0 && [typeOfGame.text isEqualToString:@"Flashcard Game"]) || (([typeOfGame.text isEqualToString:@"Multiple Choice Faces"] || [typeOfGame.text isEqualToString:@"Multiple Choice Names"]) && arrayOf49PercentAndUnder.count > 3))
    {
        FilterView.hidden= true;
        timerView.hidden=false;
        timerLable.text = [NSString stringWithFormat:@"%i:0%i", minutes,seconds];
        timeOnThisCardLabel.text = @"0";
        
        seconds=0;
        minutes=0;
        timeOnThisCard = 0;
        
        if([typeOfGame.text  isEqual: @"Flashcard Game"])
        {
            personPic.hidden = false;
            guessButton.hidden = false;
            FTGameView.hidden = false;
            FilterView.hidden = true;
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
            FTGameView.center = CGPointMake(FTGameView.center.x - FTGameView.bounds.size.width, FTGameView.center.y);
            nameView.hidden = true;
            animating = true;
            
        }
        if([typeOfGame.text  isEqual: @"Multiple Choice Names"])
        {
            
            MCTGameView.hidden = false;
            [self generateNewPeopleMCN];
        }
        if([typeOfGame.text  isEqual: @"Multiple Choice Faces"])
        {
            mCFacesView.hidden = false;
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

        }
        if(practiceModeSwitch.isOn == true)
        {
            //NSLog(@"in practice mode");
            timerLable.hidden = true;
        }
        else if (practiceModeSwitch.isOn == false)
        {
            //NSLog(@"not in practice mode");
            
            timerLable.hidden = false;
        }
    }
}
@end
