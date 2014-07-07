//
//  Person.h
//  FR
//
//  Created by Matthew C Burton on 6/18/14.
//  Copyright (c) 2014 Mattehw Burton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    double numTimesCorrect;
    double numTimesGuessed;
}
@property (nonatomic) UIImage* selfImage;
@property (nonatomic) NSString* firstName;
@property (nonatomic) NSString* lastName;
@property (nonatomic) bool isMale;

-(void)gotRight;
-(void)gotWrong;
-(double)returnPercentage;
- (void)setWithFirstName:(NSString*) fName andLastName:(NSString*) lName andImage:(UIImage*)img andGender:(bool)iM;
@end
