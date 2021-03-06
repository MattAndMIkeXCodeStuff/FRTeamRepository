//
//  Person.m
//  FR
//
//  Created by Matthew C Burton on 6/18/14.
//  Copyright (c) 2014 Mattehw Burton. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize firstName;
@synthesize lastName;
@synthesize selfImage;
@synthesize isMale;
@synthesize numTimesCorrect;
@synthesize numTimesGuessed;
- (void)setWithFirstName:(NSString*) fName andLastName:(NSString*) lName andImage:(UIImage*)img andGender:(bool)iM
{
    firstName = fName;
    lastName = lName;
    selfImage = img;
    isMale = iM;
}
-(double)returnPercentage {
    NSLog(@"ntc=%f",numTimesCorrect);
    NSLog(@"ntg=%f",numTimesGuessed);
    NSLog(@"p=%f",(numTimesCorrect/numTimesGuessed));

    
    return (double)(numTimesCorrect/numTimesGuessed);
}
-(void)gotRight {
    numTimesCorrect++;
    numTimesGuessed++;
}
-(void)gotWrong {
    numTimesGuessed++;
}
-(NSString *)getFullName {
    NSString *fullName;
    if (self.firstName == NULL) {
        fullName = lastName;
    }
    else if (self.lastName == NULL) {
        fullName = firstName;
    }
    else {
        fullName = [NSString stringWithFormat:@"%@ %@",firstName,lastName];
    }
    return fullName;
    
}
@end
