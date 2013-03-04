//
//  PolymorphicMutableArray.m
//  Monomorphic-APP
//
//  Created by David Ansermot on 02.03.13.
//  Copyright (c) 2013 David Ansermot. All rights reserved.
//

#import "PolymorphicMutableArray.h"

@implementation PolymorphicMutableArray

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
        _realArray = [[NSMutableArray alloc] init];
    }
    return self;
}





/**
 * Init the array with a class type and a capacity
 *
 * @param Class allowedClass: Array type class
 * @param NSUInteger capacity: The array's capacity
 *
 */
- (id)initWithClass:(Class)allowedClass andCapacity:(NSUInteger)capacity {
    
    if (self = [super init]) {
        _allowedClass = allowedClass;
        _realArray = [[NSMutableArray alloc] initWithCapacity:capacity];
    }
    return self;
}













#pragma mark - NSMutableArray original methods override

/**
 * Adds an object
 *
 * @param id anObject: The object
 * @return void
 */
- (void)addObject:(id)anObject {
    
    if ([anObject isKindOfClass:_allowedClass]) {
        
        [_realArray addObject:anObject];
        
    } else {
        
        NSException *exception = [NSException exceptionWithName:@"InvalidObjectType"
                                                         reason:[NSString stringWithFormat:@"anObject must be of class %@", _allowedClass]
                                                       userInfo:nil];
        @throw exception;
    }
    
}





/**
 * Insert an object at a position
 *
 * @param id anObject: The object
 * @param NSUInteger index: The position to insert to
 * @return void
 */
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index {
    
    if ([anObject isKindOfClass:_allowedClass]) {
        
        [_realArray insertObject:anObject atIndex:index];
        
    } else {
        
        NSException *exception = [NSException exceptionWithName:@"InvalidObjectType"
                                                         reason:[NSString stringWithFormat:@"anObject must be of class %@", _allowedClass]
                                                       userInfo:nil];
        @throw exception;
    }
    
}





/**
 * Remove an object at a position
 *
 * @param NSUInteger index: The position
 * @return void
 */
- (void)removeObjectAtIndex:(NSUInteger)index {
    [_realArray removeObjectAtIndex:index];
}





/**
 * Remove an object
 *
 * @param id anObject: The object
 * @return void
 */
- (void)removeObject:(id)anObject {
    [_realArray removeObject:anObject];
}





/**
 * Remove all the objects
 *
 * @param void
 * @return void
 */
- (void)removeAllObjects {
    [_realArray removeAllObjects];
}





/**
 * Removes the last object of the array
 *
 * @param void
 * @return void
 */
- (void)removeLastObject {
    [_realArray removeLastObject];
}


















#pragma mark - NSArray original methods override

/**
 * Returns the nmber of objects in the array
 *
 * @param void
 * @return NSUInteger
 */
- (NSUInteger)count {
    return [_realArray count];
}





/**
 * Returns the object at a position
 *
 * @param NSUInteger index: The position of the object
 * @return id
 */
- (id)objectAtIndex:(NSUInteger)index {
    return [_realArray objectAtIndex:index];
}















#pragma mark - Block all other init methods

/**
 * Throw NotSupported eception
 *
 * @param void
 * @return id
 */
static id NotSupported() {
    NSException *exception = [NSException exceptionWithName:@"InvalidInitializer" reason:@"Only initWithClass: and initWithClass:andCapacity: are supported." userInfo:nil];
    @throw exception;
}














#pragma mark - Invalidated initializers

- (id)initWithArray:(NSArray *)array { return NotSupported(); }
- (id)initWithArray:(NSArray *)array copyItems:(BOOL)flag { return NotSupported(); }
- (id)initWithCapacity:(NSUInteger)numItems { return NotSupported(); }
- (id)initWithCoder:(NSCoder *)aDecoder { return NotSupported(); }
- (id)initWithContentsOfFile:(NSString *)path { return NotSupported(); }
- (id)initWithContentsOfURL:(NSURL *)url { return NotSupported(); }
- (id)initWithObjects:(id)firstObj, ... { return NotSupported(); }
- (id)initWithObjects:(const id [])objects count:(NSUInteger)cnt { return NotSupported(); }

@end
