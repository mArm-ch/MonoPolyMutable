//
//  MonomorphicMutableDictionary.m
//  Monomorphic-APP
//
//  Created by David Ansermot on 02.03.13.
//  Copyright (c) 2013 David Ansermot. All rights reserved.
//

#import "MonomorphicMutableDictionary.h"

@implementation MonomorphicMutableDictionary

@synthesize allowedClass = _allowedClass;

#pragma mark - Init methods


/**
 * Init the array with a class type
 *
 * @param Class allowedClass: Array type class
 * @return id
 */
- (id)initWithClass:(Class)allowedClass {
    
    if (self = [super init]) {
        _allowedClass = allowedClass;
        _realDico = [[NSMutableDictionary alloc] init];
    }
    return self;
}





/**
 * Init the array with a class type and a capacity
 *
 * @param Class allowedClass: Array type class
 * @param NSUInteger capacity: The array's capacity
 * @return id
 */
- (id)initWithClass:(Class)allowedClass andCapacity:(NSUInteger)capacity {
    
    if (self = [super init]) {
        _allowedClass = allowedClass;
        _realDico = [[NSMutableDictionary alloc] initWithCapacity:capacity];
    }
    return self;
}





/**
 * Init the array with a class type from another dictionary
 *
 * @param Class allowedClass: Array type class
 * @param NSUInteger capacity: The array's capacity
 * @return id
 */
- (id)initWithClass:(Class)allowedClass andOtherDictionary:(NSDictionary *)otherDictionary {
    
    if (self = [super init]) {
        
        _allowedClass = allowedClass;
        
        for (id key in otherDictionary) {
            
            // If an object in the dictionary isn't of the right type, throw exception
            if (![[otherDictionary objectForKey:key] isMemberOfClass:allowedClass]) {
                NSException *exception = [NSException exceptionWithName:@"InvalidObjectType"
                                                                 reason:[NSString stringWithFormat:@"An object in the dictionary is not of type %@", _allowedClass]
                                                               userInfo:nil];
                @throw exception;
            }
        }
        
        _realDico = [[NSMutableDictionary alloc] initWithDictionary:otherDictionary];
    }
    return self;
}



@end
