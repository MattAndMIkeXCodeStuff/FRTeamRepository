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
    NSLog(@"HEllO");
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
            [finalPeople addObject:myPerson];
            NSLog(@" %@ has a picture",firstName);
        }
        
        
    }
    return finalPeople;
}

@end
