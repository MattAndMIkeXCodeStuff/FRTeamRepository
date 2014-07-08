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
@synthesize mcPersonPicture, currentContacts, contactGetter;
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
    
    contactView.hidden=true;
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
    mcButton1.titleLabel.text = @"";
    mcButton2.titleLabel.text = @"";
    mcButton3.titleLabel.text = @"";
    mcButton4.titleLabel.text = @"";
    contactGetter = [[MSContactManipulater alloc]init];
    currentContacts = [contactGetter getContactsWithAnImage];
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
    contactView.hidden=true;
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
-(IBAction)mcAnswerPressed:(id)sender {
    UIButton *b = (UIButton *)sender;
    NSLog(@"%@", b.titleLabel.text);
    NSLog(@"%@",[NSString stringWithFormat:@"%@ %@",currentPerson.firstName,currentPerson.lastName]);
    if ([b.titleLabel.text isEqualToString:[currentPerson getFullName]]) {
        int currentContactIndex = rand()%currentContacts.count;
        currentPerson = [currentContacts objectAtIndex:currentContactIndex];
        
        mcPersonPicture.image = currentPerson.selfImage;
        mcButton1.backgroundColor = [UIColor clearColor];
        mcButton2.backgroundColor = [UIColor clearColor];
        mcButton3.backgroundColor = [UIColor clearColor];
        mcButton4.backgroundColor = [UIColor clearColor];

        int h = 0;
        do {
            h = rand()%currentContacts.count;
        } while(h==currentContactIndex);
        [mcButton1 setTitle:[NSString stringWithFormat:@"%@ %@",[[currentContacts objectAtIndex:h] firstName],[[currentContacts objectAtIndex:h] lastName]] forState:UIControlStateNormal];
        int i = 0;
        do {
            i = rand()%currentContacts.count;
        } while(h==currentContactIndex || i==h);
        [mcButton2 setTitle:[NSString stringWithFormat:@"%@ %@",[[currentContacts objectAtIndex:i] firstName],[[currentContacts objectAtIndex:i] lastName]] forState:UIControlStateNormal];        int k = 0;
        do {
            k = rand()%currentContacts.count;
        } while(k==currentContactIndex || k==h || k==i);
        [mcButton3 setTitle:[NSString stringWithFormat:@"%@ %@",[[currentContacts objectAtIndex:k] firstName],[[currentContacts objectAtIndex:k] lastName]] forState:UIControlStateNormal];
        int l= 0;
        do {
            l = rand()%currentContacts.count;
        } while(l==currentContactIndex || l==h || l==i || l==k);
        [mcButton4 setTitle:[NSString stringWithFormat:@"%@ %@",[[currentContacts objectAtIndex:l] firstName],[[currentContacts objectAtIndex:l] lastName]] forState:UIControlStateNormal];
        
        int ra = rand()%4;
        if (ra==0) {
            [mcButton1 setTitle: [currentPerson getFullName] forState:UIControlStateNormal];
        }
        if (ra==1) {
            [mcButton2 setTitle:  [currentPerson getFullName]  forState:UIControlStateNormal];
        }
        if (ra==2) {
            [mcButton3 setTitle:  [currentPerson getFullName] forState:UIControlStateNormal];
        }
        if (ra==3) {
            [mcButton4 setTitle:  [currentPerson getFullName]  forState:UIControlStateNormal];
        }

    } else {
        b.backgroundColor = [UIColor redColor];
    }
}
//go to timed view
-(IBAction)goToTV
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
    arrayOf50PercentAndOver = [contactGetter getContactsWithAnImage];
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
        if(arrayOf50PercentAndOver.count > 0 && arrayOf49PercentAndUnder.count > 0)
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
        return currentPeopleArray;

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
    
    
    contactGetter = [[MSContactManipulater alloc]init];
    arrayOf49PercentAndUnder = [contactGetter getContactsWithAnImage];
    arrayOf50PercentAndOver = [contactGetter getContactsWithAnImage];
    for (int i = 0 ; i< arrayOf49PercentAndUnder.count; i++) {
        Person *p = [arrayOf49PercentAndUnder objectAtIndex:i];
        NSLog(@"%@",p.firstName);
    }
    
    NSMutableArray*currentArray;
    currentArray = arrayOf49PercentAndUnder;
    int x;
    x =arrayOf49PercentAndUnder.count;
    j = rand()%x;
    
    
    currentPerson =[currentArray objectAtIndex:j];
    
    personPic.image = [currentPerson selfImage];
    
    if (currentPerson.lastName == NULL) {
        nameLabel.text = currentPerson.firstName;
        
    } else {
        nameLabel.text = [NSString stringWithFormat:@"%@ %@", currentPerson.firstName,currentPerson.lastName];
    }
    

}
@end
