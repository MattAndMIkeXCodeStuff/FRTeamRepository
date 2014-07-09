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
@synthesize mcPersonPicture, currentContacts, contactGetter;
@synthesize currentPeopleArray;
@synthesize nameAndButtonsView, personPic, nameLabel;
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
    NSLog(@"Got Right");
    currentPerson.hasBeenGuessed = true;
    currentPerson.hasBeenGuessedRight = true;
    [currentPerson gotRight];
    [self loadNewPerson];
    totalGuessed++;
    totalCorrect++;
}
-(IBAction)gotWrong:(id)sender {
    NSLog(@"Got Wrong");
    currentPerson.hasBeenGuessed = true;
    [currentPerson gotWrong];
    [self loadNewPerson];
    totalGuessed++;

}
-(NSMutableArray*)chooseArray
{
    if(FGameView.hidden == false || MCGameView.hidden == false)//not timed game
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
    else if(FTGameView.hidden == false || MCTGameView.hidden == false)
    {
        if(arrayOf49PercentAndUnder.count>0)
        {
            return arrayOf49PercentAndUnder;
        }
    }
        return currentPeopleArray;
}

-(void)loadNewPerson
{
    NSLog(@"Percent Right = %f", [currentPerson returnPercentage]*100);
    if(MCGameView.hidden == false || FGameView.hidden == false)
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

            
            //}
        }
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
        
        if (currentPerson.lastName == NULL)
        {
            nameLabel.text = currentPerson.firstName;
            
        }
        else
        {
            nameLabel.text = [NSString stringWithFormat:@"%@ %@", currentPerson.firstName,currentPerson.lastName];
        }
        nameAndButtonsView.hidden = true;
    }
    if(MCTGameView.hidden == false || FTGameView.hidden == false)
    {
        if(currentPerson.hasBeenGuessedRight == true)
        {
            [arrayOf50PercentAndOver addObject:currentPerson];
            [arrayOf49PercentAndUnder removeObjectIdenticalTo:currentPerson];
            
        }

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
        
        if (currentPerson.lastName == NULL)
        {
            nameLabel.text = currentPerson.firstName;
            
        }
        else
        {
            nameLabel.text = [NSString stringWithFormat:@"%@ %@", currentPerson.firstName,currentPerson.lastName];
        }
        nameAndButtonsView.hidden = true;
    }
    NSLog(@"%i people in 49 array", arrayOf49PercentAndUnder.count);
    NSLog(@"%i people in 50 array", arrayOf50PercentAndOver.count);
    NSLog(@"%i total people", arrayOf50PercentAndOver.count + arrayOf49PercentAndUnder.count);
}
- (void)viewDidLoad
{
    
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(countUpDuration) userInfo:Nil repeats:YES];
    
    MCGameView.hidden=true;
    firstView.hidden=false;
    MCTGameView.hidden=true;
    FCGameView.hidden=true;
    MCCView.hidden = true;
    FGameView.hidden = true;
    FCGameView.hidden = true;
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
    [super viewDidLoad];
    filteringIndicator = [[UIActivityIndicatorView alloc]init];
    arrayOf50PercentAndOver = [[NSMutableArray alloc]init];
    
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
    
	// Do any additional setup after loading the view, typically from a nib.
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
-(void)countUpDuration
{
    if(MCTGameView.hidden == false || FTGameView.hidden == false ) //playing a timed game
    {
        if([self checkIfAllPeopleHaveBeenGuessedCorrectly]==true)
        {
            //game ends
            //go to view that shows stats
            MCGameView.hidden=true;
            firstView.hidden=true;
            MCTGameView.hidden=true;
            FCGameView.hidden=true;
            MCCView.hidden = true;
            FGameView.hidden = true;
            FCGameView.hidden = true;
            FTGameView.hidden = true;
            FilterView.hidden = true;
            nameAndButtonsView.hidden = true;
            personPic.hidden = true;
            showInfoButton.hidden = true;
            deptTitleField.hidden = true;
            jobTitleField.hidden = true;
            filterField.text = @"";
            filterLabel.text = @"Filter By:";
            companyTitleField.hidden = true;
            
            [arrayOf49PercentAndUnder removeAllObjects];
            [arrayOf50PercentAndOver removeAllObjects];
            
            gameOverView.hidden = false;
            totalPercentage = (totalCorrect/totalGuessed);
            NSLog(@"%f",totalGuessed);
            NSLog(@"%f",totalCorrect);
            NSLog(@"%f",totalPercentage);
            
            percentLabel.text = [NSString stringWithFormat:@"YOU GOT %f%% IN %@",totalPercentage*100,timerLable.text];
        }
        timerView.hidden = false;
        ++wait;
        if(wait == 100)
        {
            wait = 0;
            seconds += 1;
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
        }
    }
    else
    {
        timerView.hidden = true;
        seconds=0;
        minutes =0;
        timerLable.text = [NSString stringWithFormat:@"%i:0%i", minutes,seconds];

    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)goToMCCV:(id)sender {
    MCCView.hidden = false;
    MCGameView.hidden=true;
    firstView.hidden=true;
    MCTGameView.hidden=true;
    FCGameView.hidden=true;
    FGameView.hidden = true;
    FCGameView.hidden = true;
    FTGameView.hidden = true;
    FilterView.hidden = true;
    deptTitleField.hidden = true;
    jobTitleField.hidden = true;
    filterField.text = @"";
    filterLabel.text = @"Filter By:";
    companyTitleField.hidden = true;
    FilterView.hidden = false;
    gameOverView.hidden = true;

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
    currentPerson = [currentContacts objectAtIndex:currentContactIndex];
    
    mcButton1.backgroundColor = [UIColor clearColor];
    mcButton2.backgroundColor = [UIColor clearColor];
    mcButton3.backgroundColor = [UIColor clearColor];
    mcButton4.backgroundColor = [UIColor clearColor];
    
    mcPersonPicture.image = currentPerson.selfImage;
    int h = 0;
    do {
        h = rand()%currentContacts.count;
    } while(h==currentContactIndex);
    mcButton1.titleLabel.text = [NSString stringWithFormat:@"%@ %@",[[currentContacts objectAtIndex:h] firstName],[[currentContacts objectAtIndex:h] lastName]];
    int i = 0;
    do {
        i = rand()%currentContacts.count;
    } while(h==currentContactIndex || i==h);
    mcButton2.titleLabel.text = [NSString stringWithFormat:@"%@ %@",[[currentContacts objectAtIndex:i] firstName],[[currentContacts objectAtIndex:i] lastName]];
    int k = 0;
    do {
        k = rand()%currentContacts.count;
    } while(k==currentContactIndex || k==h || k==i);
    mcButton3.titleLabel.text = [NSString stringWithFormat:@"%@ %@",[[currentContacts objectAtIndex:k] firstName],[[currentContacts objectAtIndex:k] lastName]];
    int l= 0;
    do {
        l = rand()%currentContacts.count;
    } while(l==currentContactIndex || l==h || l==i || l==k);
    mcButton4.titleLabel.text = [NSString stringWithFormat:@"%@ %@",[[currentContacts objectAtIndex:l] firstName],[[currentContacts objectAtIndex:l] lastName]];
    
    int ra = rand()%4;
    if (ra==0) {
        mcButton1.titleLabel.text= [NSString stringWithFormat:@"%@ %@",currentPerson.firstName,currentPerson.lastName];
    }
    if (ra==1) {
        mcButton2.titleLabel.text= [NSString stringWithFormat:@"%@ %@",currentPerson.firstName,currentPerson.lastName];
    }
    if (ra==2) {
        mcButton3.titleLabel.text= [NSString stringWithFormat:@"%@ %@",currentPerson.firstName,currentPerson.lastName];
    }
    if (ra==3) {
        mcButton4.titleLabel.text= [NSString stringWithFormat:@"%@ %@",currentPerson.firstName,currentPerson.lastName];
    }
    //contactView.hidden=true;
    MCGameView.hidden=true;
    firstView.hidden=true;
    MCTGameView.hidden=false;
    FCGameView.hidden=true;
    MCCView.hidden = true;
    FGameView.hidden = true;
    FCGameView.hidden = true;
    FTGameView.hidden = true;
    deptTitleField.hidden = true;
    jobTitleField.hidden = true;
    filterField.text = @"";
    filterLabel.text = @"Filter By:";
    companyTitleField.hidden = true;
    FilterView.hidden = true;
    gameOverView.hidden = true;
    nameAndButtonsView.hidden = true;

}
//go to first view
-(IBAction)goToFV
{
    gameOverView.hidden = true;

    FilterView.hidden = true;
    MCGameView.hidden=true;
    firstView.hidden=false;
    FilterView.hidden = true;
    MCTGameView.hidden=true;
    FCGameView.hidden=true;
    MCCView.hidden = true;
    FGameView.hidden = true;
    FCGameView.hidden = true;
    FTGameView.hidden = true;
    deptTitleField.hidden = true;
    jobTitleField.hidden = true;
    filterField.text = @"";
    companyTitleField.hidden = true;
    nameAndButtonsView.hidden = true;

}
//go to multiple choice timed view
-(IBAction)goToMCTV
{
    FilterView.hidden = false;
    
    deptTitleField.hidden = true;
    jobTitleField.hidden = true;
    mcButton1.titleLabel.text = @"";
    mcButton2.titleLabel.text = @"";
    mcButton3.titleLabel.text = @"";
    mcButton4.titleLabel.text = @"";
    
    contactGetter = [[MSContactManipulater alloc]init];
    currentContacts = [contactGetter getContactsWithAnImage];
     
    int currentContactIndex = rand()%currentContacts.count;
    correctMCPerson = [currentContacts objectAtIndex:currentContactIndex];
     
    mcButton1.backgroundColor = [UIColor clearColor];
    mcButton2.backgroundColor = [UIColor clearColor];
    mcButton3.backgroundColor = [UIColor clearColor];
    mcButton4.backgroundColor = [UIColor clearColor];

    mcPersonPicture.image = correctMCPerson.selfImage;
    /*
    int h = 0;
    do {
        h = rand()%currentContacts.count;
    } while(h==currentContactIndex);
    mcButton1.titleLabel.text = [NSString stringWithFormat:@"%@ %@",[[currentContacts objectAtIndex:h] firstName],[[currentContacts objectAtIndex:h] lastName]];
    int i = 0;
    do {
        i = rand()%currentContacts.count;
    } while(h==currentContactIndex || i==h);
    mcButton2.titleLabel.text = [NSString stringWithFormat:@"%@ %@",[[currentContacts objectAtIndex:i] firstName],[[currentContacts objectAtIndex:i] lastName]];
    int k = 0;
    do {
        k = rand()%currentContacts.count;
    } while(k==currentContactIndex || k==h || k==i);
    mcButton3.titleLabel.text = [NSString stringWithFormat:@"%@ %@",[[currentContacts objectAtIndex:k] firstName],[[currentContacts objectAtIndex:k] lastName]];
    int l= 0;
    do {
        l = rand()%currentContacts.count;
    } while(l==currentContactIndex || l==h || l==i || l==k);
    mcButton4.titleLabel.text = [NSString stringWithFormat:@"%@ %@",[[currentContacts objectAtIndex:l] firstName],[[currentContacts objectAtIndex:l] lastName]];
    */
    
    int h = 0;
    h = rand()%currentPeopleArray.count-1;
    [self loadNewPerson];
    [mcButton1 setTitle:[NSString stringWithFormat:@"%@ %@",[currentPerson firstName],[currentPerson lastName]] forState:UIControlStateNormal];
    mcButton1.titleLabel.text = [NSString stringWithFormat:@"%@ %@",[currentPerson firstName],[currentPerson lastName]];
    NSLog(@"%@ %@",[currentPerson firstName],[currentPerson lastName]);
    
    //h gets a new value
    h = rand()%currentPeopleArray.count-1;
    [self loadNewPerson];
    [mcButton2 setTitle:[NSString stringWithFormat:@"%@ %@",[currentPerson firstName],[currentPerson lastName]] forState:UIControlStateNormal];
    mcButton2.titleLabel.text = [NSString stringWithFormat:@"%@",[currentPerson getFullName]];
    NSLog(@"%@ %@",[currentPerson firstName],[currentPerson lastName]);
    
    //h gets a new value
    h = rand()%currentPeopleArray.count-1;
    [self loadNewPerson];
    [mcButton3 setTitle:[NSString stringWithFormat:@"%@ %@",[currentPerson firstName],[currentPerson lastName]] forState:UIControlStateNormal];
    mcButton3.titleLabel.text = [NSString stringWithFormat:@"%@",[currentPerson getFullName]];
    NSLog(@"%@ %@",[currentPerson firstName],[currentPerson lastName]);
    
    //h gets a new value
    h = rand()%currentPeopleArray.count-1;
    [self loadNewPerson];
    [mcButton4 setTitle:[NSString stringWithFormat:@"%@ %@",[currentPerson firstName],[currentPerson lastName]] forState:UIControlStateNormal];
    mcButton4.titleLabel.text = [NSString stringWithFormat:@"%@",[currentPerson getFullName]];
    NSLog(@"%@ %@",[currentPerson firstName],[currentPerson lastName]);
    

    
    int ra = rand()%4;
    if (ra==0)
    {
        mcButton1.titleLabel.text= [NSString stringWithFormat:@"%@ %@",correctMCPerson.firstName,correctMCPerson.lastName];
        mcPersonPicture.image = correctMCPerson.selfImage;

    }
    else if (ra==1)
    {
        mcButton2.titleLabel.text= [NSString stringWithFormat:@"%@ %@",correctMCPerson.firstName,correctMCPerson.lastName];
        mcPersonPicture.image = correctMCPerson.selfImage;

    }
    else if (ra==2)
    {
        mcButton3.titleLabel.text= [NSString stringWithFormat:@"%@ %@",correctMCPerson.firstName,correctMCPerson.lastName];
        mcPersonPicture.image = correctMCPerson.selfImage;
        
    }
    else if (ra==3)
    {
        mcButton4.titleLabel.text= [NSString stringWithFormat:@"%@ %@",correctMCPerson.firstName,correctMCPerson.lastName];
        mcPersonPicture.image = correctMCPerson.selfImage;

    }
    //contactView.hidden=true;
    MCGameView.hidden=true;
    firstView.hidden=true;
    MCTGameView.hidden=false;
    FCGameView.hidden=true;
    MCCView.hidden = true;
    FGameView.hidden = true;
    FCGameView.hidden = true;
    FTGameView.hidden = true;
    deptTitleField.hidden = true;
    jobTitleField.hidden = true;
    filterField.text = @"";
    filterLabel.text = @"Filter By:";
    companyTitleField.hidden = true;
    FilterView.hidden = true;
    gameOverView.hidden = true;
    nameAndButtonsView.hidden = true;

}
-(IBAction)mcAnswerPressed:(id)sender
{
    
    filterField.text = @"";
    filterLabel.text = @"Filter By:";

    
    UIButton *b = (UIButton *)sender;
    NSLog(@"%@", b.titleLabel.text);
    NSLog(@"%@",[NSString stringWithFormat:@"%@ %@",currentPerson.firstName,currentPerson.lastName]);
    if ([b.titleLabel.text isEqualToString:correctMCPerson.fullName]) {
        [currentPerson gotRight];
        currentPerson.hasBeenGuessedRight = true;
        currentPerson.hasBeenGuessed = true;
        
        int currentContactIndex = rand()%arrayOf49PercentAndUnder.count-1;
        


        int h = 0;
        h = rand()%currentPeopleArray.count-1;
        /*
        do {
            h = rand()%currentContacts.count;
        } while(h==currentContactIndex);
        */
        [self loadNewPerson];
        [mcButton1 setTitle:[NSString stringWithFormat:@"%@ %@",[currentPerson firstName],[currentPerson lastName]] forState:UIControlStateNormal];
        mcButton1.titleLabel.text = [NSString stringWithFormat:@"%@ %@",[currentPerson firstName],[currentPerson lastName]];
        NSLog(@"%@ %@",[currentPerson firstName],[currentPerson lastName]);
        //h gets a new value
        h = rand()%currentPeopleArray.count-1;
        /*
        do {
            i = rand()%currentContacts.count;
        } while(h==currentContactIndex || i==h);
         */
        [self loadNewPerson];
        [mcButton2 setTitle:[NSString stringWithFormat:@"%@ %@",[currentPerson firstName],[currentPerson lastName]] forState:UIControlStateNormal];
        mcButton2.titleLabel.text = [NSString stringWithFormat:@"%@",[currentPerson getFullName]];
        NSLog(@"%@ %@",[currentPerson firstName],[currentPerson lastName]);

        //h gets a new value
        h = rand()%currentPeopleArray.count-1;
        /*
        do {
            k = rand()%currentContacts.count;
        } while(k==currentContactIndex || k==h || k==i);
         */
        [self loadNewPerson];
        [mcButton3 setTitle:[NSString stringWithFormat:@"%@ %@",[currentPerson firstName],[currentPerson lastName]] forState:UIControlStateNormal];
        mcButton3.titleLabel.text = [NSString stringWithFormat:@"%@",[currentPerson getFullName]];
        NSLog(@"%@ %@",[currentPerson firstName],[currentPerson lastName]);

        //h gets a new value
        h = rand()%currentPeopleArray.count-1;
        /*
        do {
            l = rand()%currentContacts.count;
        } while(l==currentContactIndex || l==h || l==i || l==k);
         */
        [self loadNewPerson];
        [mcButton4 setTitle:[NSString stringWithFormat:@"%@ %@",[currentPerson firstName],[currentPerson lastName]] forState:UIControlStateNormal];
        mcButton4.titleLabel.text = [NSString stringWithFormat:@"%@",[currentPerson getFullName]];
        NSLog(@"%@ %@",[currentPerson firstName],[currentPerson lastName]);

        int ra = rand()%4;
        if (ra==0)
        {
            mcButton1.titleLabel.text= [NSString stringWithFormat:@"%@ %@",correctMCPerson.firstName,correctMCPerson.lastName];
            mcPersonPicture.image = correctMCPerson.selfImage;
            
        }
        else if (ra==1)
        {
            mcButton2.titleLabel.text= [NSString stringWithFormat:@"%@ %@",correctMCPerson.firstName,correctMCPerson.lastName];
            mcPersonPicture.image = correctMCPerson.selfImage;
            
        }
        else if (ra==2)
        {
            mcButton3.titleLabel.text= [NSString stringWithFormat:@"%@ %@",correctMCPerson.firstName,correctMCPerson.lastName];
            mcPersonPicture.image = correctMCPerson.selfImage;
            
        }
        else if (ra==3)
        {
            mcButton4.titleLabel.text= [NSString stringWithFormat:@"%@ %@",correctMCPerson.firstName,correctMCPerson.lastName];
            mcPersonPicture.image = correctMCPerson.selfImage;
            
        }

    } else
    {
        b.backgroundColor = [UIColor redColor];
        [currentPerson gotWrong];
        currentPerson.hasBeenGuessed = true;
    }
}
//go to timed view
-(IBAction)goToTV
{
    nameAndButtonsView.hidden = true;
    MCGameView.hidden=true;
    firstView.hidden=true;
    MCTGameView.hidden=true;
    FCGameView.hidden=true;
    MCCView.hidden = false;
    FGameView.hidden = true;
    FCGameView.hidden = true;
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
//go to flashcard view
-(IBAction)goToFlashV
{
    MCGameView.hidden=true;
    firstView.hidden=true;
    MCTGameView.hidden=true;
    FCGameView.hidden=true;
    MCCView.hidden = true;
    FGameView.hidden = false;
    FCGameView.hidden = true;
    FTGameView.hidden = true;
    FilterView.hidden = true;
    gameOverView.hidden = true;
    nameAndButtonsView.hidden = true;

    personPic.hidden = false;
    showInfoButton.hidden = false;
    deptTitleField.hidden = true;
    jobTitleField.hidden = true;
    filterField.text = @"";
    filterLabel.text = @"Filter By:";
    companyTitleField.hidden = true;

}
//go to timed view
//go to flashcard chooser view
-(IBAction)goToFCV
{
    FilterView.hidden = false;
    MCGameView.hidden=true;
    firstView.hidden=true;
    MCTGameView.hidden=true;
    FCGameView.hidden=true;
    MCCView.hidden = true;
    FGameView.hidden = true;
    FCGameView.hidden = false;
    FTGameView.hidden = true;
    nameAndButtonsView.hidden = true;

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
//go to flashcard timed view
-(IBAction)goToFTV
{
    FilterView.hidden = true;
    MCGameView.hidden=true;
    firstView.hidden=true;
    MCTGameView.hidden=true;
    FCGameView.hidden=true;
    MCCView.hidden = true;
    FGameView.hidden = true;
    FCGameView.hidden = true;
    FTGameView.hidden = false;
    nameAndButtonsView.hidden = true;

    personPic.hidden = false;
    showInfoButton.hidden = false;
    deptTitleField.hidden = true;
    jobTitleField.hidden = true;
    companyTitleField.hidden = true;
    gameOverView.hidden = true;

    filterField.text = @"";
    filterLabel.text = @"Filter By:";

}


- (bool)isObjectIdenticalTo:(id)anObject inArray:(NSMutableArray*)aIQ
{
    int p;
    p = aIQ.count;
    NSLog(@"%i people in array before",p);
    
    Person *sentP;
    sentP = anObject;
    if(p-1 != 0 && p-1 > 0)
    {
        for (int h =0; h < (p-1); ++h)
        {
            NSLog(@"valH=%i",h);
            Person *pIQ;
            pIQ = [aIQ objectAtIndex:h];
            
            if (pIQ.firstName == sentP.firstName && pIQ.lastName == sentP.lastName && [pIQ returnPercentage] == [sentP returnPercentage] )
            {
                NSLog(@"object was in the array");
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
            NSLog(@"object was in the array");
            return true;
        }
    }
    else if(p-1 < 0)
    {
        //error the array is empty
    }
    NSLog(@"object was not in the array");
    return false;
}
-(IBAction)enteredFilter
{
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
        
        NSMutableArray*currentArray;
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
}
-(IBAction)enteredJobTitle
{
    [filteringIndicator startAnimating];
    filterField.hidden = true;
    companyTitleField.hidden = true;
    deptTitleField.hidden =true;
    jobTitleField.hidden =true;
    filterLabel.text = @"FILTERING";

    contactGetter = [[MSContactManipulater alloc]init];
    [filteringIndicator startAnimating];
    arrayOf49PercentAndUnder = [contactGetter getContactsWithJobTitle:jobTitleField.text];
    [filteringIndicator stopAnimating];
    NSMutableArray*currentArray;
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

    contactGetter = [[MSContactManipulater alloc]init];
    [filteringIndicator startAnimating];
    arrayOf49PercentAndUnder = [contactGetter getContactsWithDept:deptTitleField.text];
    [filteringIndicator stopAnimating];
    NSMutableArray*currentArray;
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
    FilterView.hidden = true;
    [filteringIndicator stopAnimating];

}
-(IBAction)enteredCompanyTitle
{

    contactGetter = [[MSContactManipulater alloc]init];
    [filteringIndicator startAnimating];
    arrayOf49PercentAndUnder = [contactGetter getContactsWithCompany:companyTitleField.text];
    [filteringIndicator stopAnimating];

    NSMutableArray*currentArray;
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
    FilterView.hidden = true;
}
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
-(IBAction)moreInfo
{
    moreInfoView.hidden=false;
    moreInfoName.text = [NSString stringWithFormat:@"%@ %@", currentPerson.firstName, currentPerson.lastName];
    moreInfoJobTitle.text = [NSString stringWithFormat:@"Job Title: %@", currentPerson.jobTitle];
    moreInfoCompany.text = [NSString stringWithFormat:@"Company: %@", currentPerson.company];
    moreInforDepartment.text = [NSString stringWithFormat:@"Department: %@", currentPerson.department];
    //moreInfoBio.text = [NSString stringWithFormat:@"Bio: %@", currentPerson.notes];

}
-(IBAction)lessInfo
{
    moreInfoView.hidden=true;
}
@end
