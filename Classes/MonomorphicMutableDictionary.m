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















#pragma mark - NSMutableDictionary methods

/**
 * Set an object for a key
 *
 * @param id anObject: The object
 * @param id<NSCopying> aKey: The key
 * @return void
 */
- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    
    if (![anObject isMemberOfClass:_allowedClass]) {
        NSException *exception = [NSException exceptionWithName:@"InvalidObjectType"
                                                         reason:[NSString stringWithFormat:@"anObject is not of type %@", _allowedClass]
                                                       userInfo:nil];
        @throw exception;
        
    } else {
    
        [_realDico setObject:anObject forKey:aKey];
    
    }
    

}





/**
 * Set a value for a key
 *
 * @param id value: The value to insert
 * @param NSString* key: The key
 * @return void
 */
- (void)setValue:(id)value forKey:(NSString *)key {
    
    if (![value isMemberOfClass:_allowedClass]) {
        
        NSException *exception = [NSException exceptionWithName:@"InvalidObjectType"
                                                         reason:[NSString stringWithFormat:@"value is not of type %@", _allowedClass]
                                                       userInfo:nil];
        @throw exception;
    } else {
    
        [_realDico setValue:value forKey:key];
    
    }
}





/**
 * Remove an object for a key
 *
 * @param id aKey: The key
 * @return void
 */
- (void)removeObjectForKey:(id)aKey {
    [_realDico removeObjectForKey:aKey];
}





/**
 * Remove multiple object for multiple keys
 *
 * @param NSArray* keyArray: The keys
 * @return void
 */
- (void)removeObjectsForKeys:(NSArray *)keyArray {
    [_realDico removeObjectsForKeys:keyArray];
}





/**
 * Removes all objects
 *
 * @param void
 * @return void
 */
- (void)removeAllObjects {
    [_realDico removeAllObjects];
}















#pragma mark - NSDictionary methods

/**
 * Return number of items in dictionary
 *
 * @param void
 * @return NSUInteger
 */
- (NSUInteger)count {
    return [_realDico count];
}





/**
 * Returns an object for a key
 *
 * @param id aKey: The key
 * @return id
 */
- (id)objectForKey:(id)aKey {
    return [_realDico objectForKey:aKey];
}





/**
 * Returns a value for a key
 *
 * @param id key: The key
 * @return id
 */
- (id)valueForKey:(NSString *)key {
    return [_realDico valueForKey:key];
}



















#pragma mark - Block all other init methods

/**
 * Throw NotSupported eception
 *
 * @param void
 * @return id
 */
static id NotSupported() {
    NSException *exception = [NSException exceptionWithName:@"InvalidInitializer" reason:@"Only initWithClass: and initWithClass:andCapacity: and initWithClass:andCapacity:andOtherDictionary: are supported." userInfo:nil];
    @throw exception;
}













#pragma mark - Invalidated initializers

- (id)init { return NotSupported(); }
- (id)initWithCoder:(NSCoder *)aDecoder { return NotSupported(); }
- (id)initWithContentsOfFile:(NSString *)path { return NotSupported(); }
- (id)initWithContentsOfURL:(NSURL *)url { return NotSupported(); }
- (id)initWithDictionary:(NSDictionary *)otherDictionary copyItems:(BOOL)flag { return NotSupported(); }
- (id)initWithObjects:(NSArray *)objects forKeys:(NSArray *)keys { return NotSupported(); }
- (id)initWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt { return NotSupported(); }
- (id)initWithObjectsAndKeys:(id)firstObject, ... { return NotSupported(); }


@end
