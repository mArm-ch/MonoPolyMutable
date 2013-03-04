//
//  MonomorphicMutableDictionary.h
//  Monomorphic-APP
//
//  Created by David Ansermot on 02.03.13.
//  Copyright (c) 2013 David Ansermot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MonomorphicMutableDictionary : NSMutableDictionary {
    
    Class _allowedClass;
    NSMutableDictionary *_realDico;
    
}

@property (atomic, readonly) Class allowedClass;

- (id)initWithClass:(Class)allowedClass;
- (id)initWithClass:(Class)allowedClass withCapacity:(NSUInteger)capacity;
- (id)initWithClass:(Class)allowedClass andOtherDictionary:(NSDictionary *)otherDictionary;

@end
