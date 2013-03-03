//
//  PolymorphicMutableArray.h
//  Monomorphic-APP
//
//  Created by David Ansermot on 02.03.13.
//  Copyright (c) 2013 David Ansermot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PolymorphicMutableArray : NSMutableArray {
    
    Class _allowedClass;
    NSMutableArray *_realArray;
    
}

@property (atomic, readonly) Class allowedClass;

- (id)initWithClass:(Class)allowedClass andCapacity:(NSUInteger)capacity;
- (id)initWithClass:(Class)allowedClass;

@end
