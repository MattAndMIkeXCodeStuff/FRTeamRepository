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
    contactView.hidden=true;
    MCGameView.hidden=true;
    firstView.hidden=true;
    MCTGameView.hidden=false;
    TGameView.hidden=true;
    MCCView.hidden = true;

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
