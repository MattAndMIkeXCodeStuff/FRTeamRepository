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
    
}
@property (nonatomic) UIImage* selfImage;
@property (nonatomic) NSString* firstName;
@property (nonatomic) NSString* lastName;
@property (nonatomic) bool isMale;
@property(nonatomic) NSString *company;
@property(nonatomic) NSString *department;
@property(nonatomic) NSString *jobTitle;
@property(nonatomic) NSString *notes;
@property(nonatomic)double numTimesCorrect;
@property(nonatomic)double numTimesGuessed;
@property(nonatomic)bool hasBeenGuessed;
@property(nonatomic)bool hasBeenGuessedRight;
@property(nonatomic)bool entryDate;
@property(nonatomic)NSDate* date;
//@property(nonatomic)NSString *fullName;

-(void)gotRight;
-(void)gotWrong;
-(double)returnPercentage;
- (void)setWithFirstName:(NSString*) fName andLastName:(NSString*) lName andImage:(UIImage*)img andGender:(bool)iM;
-(NSString *)getFullName;
@end
