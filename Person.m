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
@synthesize fullName;
@synthesize selfImage;
@synthesize isMale;
@synthesize numTimesCorrect;
@synthesize numTimesGuessed;

@synthesize totalNumTimesCorrectF;
@synthesize totalNumTimesGuessedF;
@synthesize totalNumTimesCorrectMCF;
@synthesize totalNumTimesGuessedMCF;
@synthesize totalNumTimesCorrectMCN;
@synthesize totalNumTimesGuessedMCN;
@synthesize hasEverEverBeenGuessedInTheHistoryOfThisWholeGame;

- (void)setWithFirstName:(NSString*) fName andLastName:(NSString*) lName andImage:(UIImage*)img andGender:(bool)iM
{
    firstName = fName;
    lastName = lName;
    selfImage = img;
    fullName = [NSString stringWithFormat:@"%@ %@",firstName,lastName];
    isMale = iM;
}
-(double)returnPercentage
{
    return (double)(numTimesCorrect/numTimesGuessed);
}
-(double)getNumTimesCorrect {
    return numTimesCorrect;
}
-(double)getNumTimesGuessed {
    return numTimesGuessed;
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
-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:value forKey:@"Value"];
    [encoder encodeObject:firstName forKey:@"FirstName"];
    [encoder encodeObject:lastName forKey:@"LastName"];
    [encoder encodeDouble:numTimesGuessed forKey:@"NumGuessed"];
    [encoder encodeDouble:numTimesCorrect forKey:@"NumCorrect"];

}

-(id)initWithCoder:(NSCoder *)decoder
{
    self.value = [decoder decodeObjectForKey:@"Value"];
    self.firstName = [decoder decodeObjectForKey:@"FirstName"];
    self.lastName = [decoder decodeObjectForKey:@"LastName"];
    self.numTimesGuessed = [decoder decodeDoubleForKey:@"NumGuessed"];
    self.numTimesCorrect = [decoder decodeDoubleForKey:@"NumCorrect"];
    
    return self;
}
@end
