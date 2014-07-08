//
//  MSContactManipulater.h
//  FR
//
//  Created by Michael Selander on 6/28/14.
//  Copyright (c) 2014 Mattehw Burton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import "Person.h"
@interface MSContactManipulater : NSObject {
ABAddressBookRef addressBook;
}

-(NSMutableArray *)getContactsWithAnImage;
@end