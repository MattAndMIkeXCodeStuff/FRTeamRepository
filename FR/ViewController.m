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
    contactView.hidden=true;
    MCGameView.hidden=true;
    firstView.hidden=false;
    MCTGameView.hidden=true;
    TGameView.hidden=true;
    MCCView.hidden = true;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)addContactsFromAppleContactsApp
{
    
}
-(IBAction)addContactFromScratch
{
    
}
//go to contact view
-(IBAction)goToCV
{
    contactView.hidden=false;
    MCGameView.hidden=true;
    firstView.hidden=true;
    MCTGameView.hidden=true;
    TGameView.hidden=true;
    MCCView.hidden = true;

}
//go to multiple choice view
-(IBAction)goToMCV
{
    
    contactView.hidden=true;
    MCGameView.hidden=false;
    firstView.hidden=true;
    MCTGameView.hidden=true;
    TGameView.hidden=true;
    MCCView.hidden = true;

}
//go to first view
-(IBAction)goToFV
{
    contactView.hidden=true;
    MCGameView.hidden=true;
    firstView.hidden=false;
    MCTGameView.hidden=true;
    TGameView.hidden=true;
    MCCView.hidden = true;

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
    TGameView.hidden=true;
    MCCView.hidden = true;

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
    contactView.hidden=true;
    MCGameView.hidden=true;
    firstView.hidden=true;
    MCTGameView.hidden=true;
    TGameView.hidden=false;
    MCCView.hidden = true;

}
-(IBAction)goToMCCV
{
    contactView.hidden=true;
    MCGameView.hidden=true;
    firstView.hidden=true;
    MCTGameView.hidden=true;
    TGameView.hidden=true;
    MCCView.hidden = false;
}
@end
