//
//  MSContactManipulater.m
//  FR
//
//  Created by Michael Selander on 6/28/14.
//  Copyright (c) 2014 Mattehw Burton. All rights reserved.
//

#import "MSContactManipulater.h"

@implementation MSContactManipulater


-(NSMutableArray *)getContactsWithAnImage {
    ABAddressBookRef addressBook2  = ABAddressBookCreateWithOptions(NULL, NULL);
    //NSLog(@"image");
    NSMutableArray *people = (__bridge NSMutableArray *)ABAddressBookCopyArrayOfAllPeople(addressBook2);
    NSMutableArray *finalPeople = [[NSMutableArray alloc]init];
    for (int i = 0; i<[people count]; i++) {
        ABRecordRef r = (__bridge ABRecordRef)([people objectAtIndex:i]);
        if (ABPersonHasImageData(r)) {
            NSString *firstName = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonFirstNameProperty));
            NSString *lastName = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonLastNameProperty));
            UIImage *Cimage = [[UIImage alloc]init];
            Cimage = [UIImage imageWithData:(__bridge NSData *)ABPersonCopyImageDataWithFormat(r, kABPersonImageFormatThumbnail)];
            Person *myPerson = [[Person alloc] init];
            [myPerson setWithFirstName:firstName andLastName:lastName andImage:Cimage andGender:true];
            myPerson.company = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonOrganizationProperty));
            myPerson.department = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonDepartmentProperty));
            [finalPeople addObject:myPerson];
        }
        
        
    }
    return finalPeople;
}
-(NSMutableArray *)getContactsWithJobTitle:(NSString*)jobTitle
{
    //NSLog(@"job");

    ABAddressBookRef addressBook2  = ABAddressBookCreateWithOptions(NULL, NULL);
    NSMutableArray *people = (__bridge NSMutableArray *)ABAddressBookCopyArrayOfAllPeople(addressBook2);
    NSMutableArray *finalPeople = [[NSMutableArray alloc]init];
    for (int i = 0; i<[people count]; i++) {
        ABRecordRef r = (__bridge ABRecordRef)([people objectAtIndex:i]);
        if (ABPersonHasImageData(r)) {
            NSString *firstName = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonFirstNameProperty));
            NSString *lastName = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonLastNameProperty));
            UIImage *Cimage = [[UIImage alloc]init];
            Cimage = [UIImage imageWithData:(__bridge NSData *)ABPersonCopyImageDataWithFormat(r, kABPersonImageFormatThumbnail)];
            Person *myPerson = [[Person alloc] init];
            [myPerson setWithFirstName:firstName andLastName:lastName andImage:Cimage andGender:true];
            myPerson.company = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonOrganizationProperty));
            myPerson.department = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonDepartmentProperty));
            myPerson.jobTitle = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonJobTitleProperty));
            if([[myPerson.jobTitle uppercaseString] isEqual: [jobTitle uppercaseString]])
            {
                [finalPeople addObject:myPerson];
                //NSLog(@" %@ has a picture his/her job is called %@ ",firstName, jobTitle);
             
            }
        }
    }
    return finalPeople;
}
-(NSMutableArray *)getContactsWithCompany:(NSString*)company
{
    //NSLog(@"company");
    
    ABAddressBookRef addressBook2  = ABAddressBookCreateWithOptions(NULL, NULL);
    NSMutableArray *people = (__bridge NSMutableArray *)ABAddressBookCopyArrayOfAllPeople(addressBook2);
    NSMutableArray *finalPeople = [[NSMutableArray alloc]init];
    for (int i = 0; i<[people count]; i++) {
        ABRecordRef r = (__bridge ABRecordRef)([people objectAtIndex:i]);
        if (ABPersonHasImageData(r)) {
            NSString *firstName = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonFirstNameProperty));
            NSString *lastName = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonLastNameProperty));
            UIImage *Cimage = [[UIImage alloc]init];
            Cimage = [UIImage imageWithData:(__bridge NSData *)ABPersonCopyImageDataWithFormat(r, kABPersonImageFormatThumbnail)];
            Person *myPerson = [[Person alloc] init];
            [myPerson setWithFirstName:firstName andLastName:lastName andImage:Cimage andGender:true];
            myPerson.company = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonOrganizationProperty));
            myPerson.department = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonDepartmentProperty));
            myPerson.jobTitle = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonJobTitleProperty));

            
             if([[myPerson.company uppercaseString] isEqual: [company uppercaseString]])
             {
             [finalPeople addObject:myPerson];
             //NSLog(@" %@ has a picture and works at %@ ",firstName, company);
             
             }
        }
    }
    return finalPeople;
}
-(NSMutableArray *)getContactsWithDept:(NSString*)deptTitle
{
    ABAddressBookRef addressBook2  = ABAddressBookCreateWithOptions(NULL, NULL);
   // NSLog(@"department");
    NSMutableArray *people = (__bridge NSMutableArray *)ABAddressBookCopyArrayOfAllPeople(addressBook2);
    NSMutableArray *finalPeople = [[NSMutableArray alloc]init];
    for (int i = 0; i<[people count]; i++) {
        ABRecordRef r = (__bridge ABRecordRef)([people objectAtIndex:i]);
        if (ABPersonHasImageData(r))
        {
            NSString *firstName = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonFirstNameProperty));
            NSString *lastName = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonLastNameProperty));
            UIImage *Cimage = [[UIImage alloc]init];
            Cimage = [UIImage imageWithData:(__bridge NSData *)ABPersonCopyImageDataWithFormat(r, kABPersonImageFormatThumbnail)];
            Person *myPerson = [[Person alloc] init];
            [myPerson setWithFirstName:firstName andLastName:lastName andImage:Cimage andGender:true];
            myPerson.company = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonOrganizationProperty));
            myPerson.department = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonDepartmentProperty));
            myPerson.jobTitle = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonJobTitleProperty));

            if([[myPerson.department uppercaseString] isEqual: [deptTitle uppercaseString]])
            {
                [finalPeople addObject:myPerson];
                //NSLog(@" %@ has a picture and is in the %@ department",firstName, deptTitle);
            }
        }
        
        
    }
    return finalPeople;
}

@end
