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
            myPerson.notes = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonNoteProperty));
            [finalPeople addObject:myPerson];
        } else
        {
            ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, nil);
            //ABRecordSetValue(r, kABPersonNicknameProperty, (__bridge CFStringRef)@"", nil);
            //ABPersonSetImageData(r, (__bridge CFDataRef)(UIImageJPEGRepresentation([UIImage imageNamed:@"No Image Available.png"], 0.7f)), nil);
            //ABPersonRemoveImageData(r, nil);
            //ABRecordSetValue(r, kABPersonFirstNameProperty, (__bridge CFStringRef)@"asdf", nil);
            ABAddressBookAddRecord(addressBookRef, r, nil);
            ABAddressBookSave(addressBookRef, nil);
            //ABRecordSetImageData([UIImage imageNamed:@"No Image Available.png"]);
            //asdfdddssdfsdsdfsdfsdfsdfsdfsdfsdfsdfdfas adf sABRecordSetImageData(r,(__bridge CFDataRef)(UIImageJPEGRepresentation([UIImage imageNamed:@"No Image Available.png"], 0.7f)),nil);
        
        }
        
        
    }
    ABAddressBookSave(addressBook, nil);
    return finalPeople;
}
-(NSMutableArray *)getContactsWithJobTitle:(NSString*)jobTitle
{
    //NSLog(@"job");

    ABAddressBookRef addressBook2
    = ABAddressBookCreateWithOptions(NULL, NULL);
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
            myPerson.notes = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonNoteProperty));

            if([[myPerson.jobTitle uppercaseString] isEqual: [jobTitle uppercaseString]])
            {
                [finalPeople addObject:myPerson];
                //NSLog(@" %@ has a picture his/her job is called %@ ",firstName, jobTitle);
             
            }
        }
    }
    if([[jobTitle uppercaseString] isEqualToString:@"ALL"])
    {
        for (int i = 0; i<[people count]; i++) {
            ABRecordRef r = (__bridge ABRecordRef)([people objectAtIndex:i]);
            
            ABRecordSetValue(r, kABPersonNicknameProperty, (__bridge CFStringRef)@"Healthy Catalyst", nil);
            //ABRecordSetValue(r, kABPersonNicknameProperty, @"My Best Friend", nil);
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
                myPerson.notes = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonNoteProperty));

                [finalPeople addObject:myPerson];
            } else {
                //ABRecordSetImageData([UIImage imageNamed:@"No Image Available.png"]);
                
                //asdfdddssdfsdsdfsdfsdfsdfsdfsdfsdfsdfdfas adf sABRecordSetImageData(r,(__bridge CFDataRef)(UIImageJPEGRepresentation([UIImage imageNamed:@"No Image Available.png"], 0.7f)),nil);
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
            myPerson.notes = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonNoteProperty));

            
             if([[myPerson.company uppercaseString] isEqual: [company uppercaseString]])
             {
             [finalPeople addObject:myPerson];
             //NSLog(@" %@ has a picture and works at %@ ",firstName, company);
             
             }
        }
    }
    if([[company uppercaseString] isEqualToString:@"ALL"])
    {
        for (int i = 0; i<[people count]; i++) {
            ABRecordRef r = (__bridge ABRecordRef)([people objectAtIndex:i]);
            
            ABRecordSetValue(r, kABPersonNicknameProperty, (__bridge CFStringRef)@"Healthy Catalyst", nil);
            //ABRecordSetValue(r, kABPersonNicknameProperty, @"My Best Friend", nil);
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
                myPerson.notes = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonNoteProperty));

                [finalPeople addObject:myPerson];
            } else {
                //ABRecordSetImageData([UIImage imageNamed:@"No Image Available.png"]);
                
                //asdfdddssdfsdsdfsdfsdfsdfsdfsdfsdfsdfdfas adf sABRecordSetImageData(r,(__bridge CFDataRef)(UIImageJPEGRepresentation([UIImage imageNamed:@"No Image Available.png"], 0.7f)),nil);
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
            myPerson.notes = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonNoteProperty));

            if([[myPerson.department uppercaseString] isEqual: [deptTitle uppercaseString]])
            {
                [finalPeople addObject:myPerson];
                //NSLog(@" %@ has a picture and is in the %@ department",firstName, deptTitle);
            }
        }
        
        
    }
    if([[deptTitle uppercaseString] isEqualToString:@"ALL"])
    {
        for (int i = 0; i<[people count]; i++) {
            ABRecordRef r = (__bridge ABRecordRef)([people objectAtIndex:i]);
            
            ABRecordSetValue(r, kABPersonNicknameProperty, (__bridge CFStringRef)@"Healthy Catalyst", nil);
            //ABRecordSetValue(r, kABPersonNicknameProperty, @"My Best Friend", nil);
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
                myPerson.notes = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonNoteProperty));

                [finalPeople addObject:myPerson];
            } else {
                //ABRecordSetImageData([UIImage imageNamed:@"No Image Available.png"]);
                
                //asdfdddssdfsdsdfsdfsdfsdfsdfsdfsdfsdfdfas adf sABRecordSetImageData(r,(__bridge CFDataRef)(UIImageJPEGRepresentation([UIImage imageNamed:@"No Image Available.png"], 0.7f)),nil);
            }
        }
    }
    
    
    return finalPeople;
}
-(NSMutableArray *)getContactsWithEntryDate:(NSDate*)dateEntered
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
            myPerson.notes = (__bridge NSString *)(ABRecordCopyValue(r, kABPersonNoteProperty));

 //           myPerson.entryDate = (__bridge NSDate *)(ABRecordCopyValue(r, kabda));
//            if([[myPerson.department uppercaseString] isEqual: [dat uppercaseString]])
//            {
//                [finalPeople addObject:myPerson];
//                //NSLog(@" %@ has a picture and is in the %@ department",firstName, deptTitle);
//            }
        }
    }
    return finalPeople;
}

-(void)removeContactsWithJobTitle:(NSString*)jobTitle fromArray:(NSMutableArray *)array
{
    for (int l; l < array.count; l++)
    {
        Person *p;
        p = [array objectAtIndex:l];
    
        if([p.jobTitle isEqualToString: jobTitle])
        {
            [array removeObjectIdenticalTo:p];
        }
    }
}
-(void)removeContactsWithDept:(NSString*)deptTitle fromArray:(NSMutableArray *)array
{
    for (int l; l < array.count; l++)
    {
        Person *p;
        p = [array objectAtIndex:l];
        
        if([p.department isEqualToString: deptTitle])
        {
            [array removeObjectIdenticalTo:p];
        }
    }
}
-(void)removeContactsWithCompany:(NSString*)company fromArray:(NSMutableArray *)array
{
    for (int l; l < array.count; l++)
    {
        Person *p;
        p = [array objectAtIndex:l];
        
        if([p.company isEqualToString: company])
        {
            [array removeObjectIdenticalTo:p];
        }
    }
}

-(bool)checkForString:(NSString*)str inArray:(NSMutableArray*)arr
{
    for(int p=0; p<arr.count;p++)
    {
        NSString *sIQ;
        sIQ = [arr objectAtIndex:p];
        if([sIQ isEqualToString: str])
        {
            return true;
        }
    }
    return false;
}

@end
