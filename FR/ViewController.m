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
    NSLog(@"Got Right");
    [currentPerson gotRight];
    NSLog(@"%f", [currentPerson returnPercentage]);
    if (currentPerson.returnPercentage < 0.5)
    {
        [arrayOf50PercentAndOver removeObjectIdenticalTo:currentPerson];
        [arrayOf49PercentAndUnder addObject:currentPerson];
    }
    else
    {
        [arrayOf49PercentAndUnder removeObjectIdenticalTo:currentPerson];
        NSLog(@"%i number of people in 49 array", arrayOf49PercentAndUnder.count);
        [arrayOf50PercentAndOver addObject:currentPerson];
    }
    NSMutableArray*currentArray;
    currentArray = [self chooseArray];
    
    j = rand()%currentArray.count - 1;
    
    
    currentPerson =[currentArray objectAtIndex:j];
    
    
    
    personPic.image = [currentPerson selfImage];
    
    if (currentPerson.lastName == NULL) {
        nameLabel.text = currentPerson.firstName;
        
    } else {
        nameLabel.text = [NSString stringWithFormat:@"%@ %@", currentPerson.firstName,currentPerson.lastName];
    }
    nameAndButtonsView.hidden = true;
}
-(IBAction)gotWrong:(id)sender {
    NSLog(@"Got Wrong");

    [currentPerson gotWrong];
    NSLog(@"%f", [currentPerson returnPercentage]);

    if (currentPerson.returnPercentage < 0.5)
    {
        
        [arrayOf50PercentAndOver removeObjectIdenticalTo:currentPerson];
        [arrayOf49PercentAndUnder addObject:currentPerson];
    }
    else
    {
        [arrayOf49PercentAndUnder removeObjectIdenticalTo:currentPerson];
        NSLog(@"%i number of people in 49 array", arrayOf49PercentAndUnder.count);
        [arrayOf50PercentAndOver addObject:currentPerson];
    }
    NSMutableArray*currentArray;
    currentArray = [self chooseArray];
    
    j = rand()%currentArray.count -1;
    
    currentPerson =[currentArray objectAtIndex:j];
    
    
    personPic.image = [currentPerson selfImage];
    
    if (currentPerson.lastName == NULL) {
        nameLabel.text = currentPerson.firstName;
        
    } else {
        nameLabel.text = [NSString stringWithFormat:@"%@ %@", currentPerson.firstName,currentPerson.lastName];
    }
    nameAndButtonsView.hidden = true;

}

-(int)checkFName:(NSString*)fN LName:(NSString*)lN inArray:(NSMutableArray*)array
{
    for(int a=0; a < (array.count)-1; a++)
    {
        Person *pIQ;
        pIQ = [array objectAtIndexedSubscript:a];
        if (pIQ.firstName == fN && pIQ.lastName == lN)
        {
            return a;
        }
    }
    return -1;
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
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    myPerson = [[Person alloc] init];
    [myPerson setWithFirstName:@"mike" andLastName:@"Selander" andImage:[UIImage imageNamed:@"Unkown.jpeg"] andGender:true];
    [myPerson setFirstName:@"Michael"];
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
-(void)countUpDuration
{
    if(MCTGameView.hidden == false || FTGameView.hidden == false ) //playing a timed game
    {
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
//go to multiple choice view
-(IBAction)goToMCV
{
    MCGameView.hidden=false;
    firstView.hidden=true;
    MCTGameView.hidden=true;
    FCGameView.hidden=true;
    MCCView.hidden = true;
    FGameView.hidden = true;
    FCGameView.hidden = true;
    FTGameView.hidden = true;
    
    personPic.hidden = false;
    showInfoButton.hidden = false;
}
//go to first view
-(IBAction)goToFV
{
    MCGameView.hidden=true;
    firstView.hidden=false;
    MCTGameView.hidden=true;
    FCGameView.hidden=true;
    MCCView.hidden = true;
    FGameView.hidden = true;
    FCGameView.hidden = true;
    FTGameView.hidden = true;
    

}
//go to multiple choice timed view
-(IBAction)goToMCTV
{
    MCGameView.hidden=true;
    firstView.hidden=true;
    MCTGameView.hidden=false;
    FCGameView.hidden=true;
    MCCView.hidden = true;
    FGameView.hidden = true;
    FCGameView.hidden = true;
    FTGameView.hidden = true;
    
    personPic.hidden = false;
    showInfoButton.hidden = false;
}
-(IBAction)goToMCCV
{
    MCGameView.hidden=true;
    firstView.hidden=true;
    MCTGameView.hidden=true;
    FCGameView.hidden=true;
    MCCView.hidden = false;
    FGameView.hidden = true;
    FCGameView.hidden = true;
    FTGameView.hidden = true;
    
    personPic.hidden = true;
    showInfoButton.hidden = true;
    nameAndButtonsView.hidden = true;
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
    
    personPic.hidden = false;
    showInfoButton.hidden = false;
    
    
    contactGetter = [[MSContactManipulater alloc]init];
    arrayOf49PercentAndUnder = [contactGetter getContactsWithAnImage];
    
    for (int i = 0 ; i< arrayOf49PercentAndUnder.count; i++) {
        Person *p = [arrayOf49PercentAndUnder objectAtIndex:i];
        NSLog(@"%@",p.firstName);
    }
    
    NSMutableArray*currentArray;
    currentArray = arrayOf49PercentAndUnder;
    
    j = rand()%arrayOf49PercentAndUnder.count;

    
    currentPerson =[currentArray objectAtIndex:j];
    
    personPic.image = [currentPerson selfImage];
    
    if (currentPerson.lastName == NULL) {
        nameLabel.text = currentPerson.firstName;
        
    } else {
        nameLabel.text = [NSString stringWithFormat:@"%@ %@", currentPerson.firstName,currentPerson.lastName];
    }

    
}

-(NSMutableArray*)chooseArray
{

    if(arrayOf50PercentAndOver.count > 0 || arrayOf49PercentAndUnder.count>0)
    {
        if(arrayOf50PercentAndOver.count > 0 && arrayOf49PercentAndUnder.count>0)
        {
            int rn;
            rn = (rand()%10);
            if(rn <= 3 && arrayOf50PercentAndOver.count > 0)
            {
                NSLog(@"50 and over");
                
                return arrayOf50PercentAndOver;
            }
            else
            {
                NSLog(@"49 and under");
                
                return arrayOf49PercentAndUnder;
            }
        }
        else if(arrayOf49PercentAndUnder.count > 0 && arrayOf50PercentAndOver.count == 0)
        {
            NSLog(@"49 and under");

            return arrayOf49PercentAndUnder;
            
        }
        else if(arrayOf50PercentAndOver.count > 0 && arrayOf49PercentAndUnder.count == 0)
        {
            NSLog(@"50 and over");

            return arrayOf50PercentAndOver;
        }
        
    }
    else
    {
        //error
    }
    return currentPeopleArray;

}
//go to flashcard chooser view
-(IBAction)goToFCV
{
    MCGameView.hidden=true;
    firstView.hidden=true;
    MCTGameView.hidden=true;
    FCGameView.hidden=true;
    MCCView.hidden = true;
    FGameView.hidden = true;
    FCGameView.hidden = false;
    FTGameView.hidden = true;
    
    personPic.hidden = true;
    showInfoButton.hidden = true;
    nameAndButtonsView.hidden = true;
}
//go to flashcard timed view
-(IBAction)goToFTV
{
    MCGameView.hidden=true;
    firstView.hidden=true;
    MCTGameView.hidden=true;
    FCGameView.hidden=true;
    MCCView.hidden = true;
    FGameView.hidden = true;
    FCGameView.hidden = true;
    FTGameView.hidden = false;
    
    personPic.hidden = false;
    showInfoButton.hidden = false;
}
@end
