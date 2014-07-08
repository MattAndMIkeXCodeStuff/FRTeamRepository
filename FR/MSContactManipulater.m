//
//  MSContactManipulater.m
//  FR
//
//  Created by Michael Selander on 6/28/14.
//  Copyright (c) 2014 Mattehw Burton. All rights reserved.
//

#import "MSContactManipulater.h"

@implementation MSContactManipulater


-(NSArray *)getContactsWithAnImage {
    CFErrorRef error = nil;
    ABAddressBookRef addressBookYeah  = ABAddressBookCreateWithOptions(NULL, &error);
    ABAddressBookRequestAccessWithCompletion(addressBookYeah, ^(bool granted, CFErrorRef error) {
        if (error) {
            NSLog(@"error %@", error);
        }else if (granted){
            // Do what you want with the Address Book
            
        }else{
            NSLog(@"permission denied");
        }
        
        CFRelease(addressBookYeah);
    });
    if (!addressBookYeah) {
        NSLog(@"What the Freek why is there an error!");
    }
    
    NSLog(@"HEllO");
    CFArrayRef arrayOfPeople = ABAddressBookCopyArrayOfAllPeople(addressBookYeah);
    NSArray *people = (__bridge NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBookYeah);
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
            //NSLog(@" %@ Have A picture",firstName);
        }
        
        
    }
    return finalPeople;
}

@end
