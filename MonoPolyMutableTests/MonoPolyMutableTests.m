//
//  MonoPolyMutableTests.m
//  MonoPolyMutableTests
//
//  Created by David Ansermot on 03.03.13.
//  Copyright (c) 2013 David Ansermot. All rights reserved.
//

#import "MonoPolyMutableTests.h"

#import "MonomorphicMutableArray.h"
#import "MonomorphicMutableDictionary.h"
#import "PolymorphicMutableArray.h"
#import "PolymorphicMutableDictionary.h"

@implementation MonoPolyMutableTests

- (void)setUp {
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown {
    // Tear-down code here.
    
    [super tearDown];
}


- (void)testMonomorphicMutableArray {
    
    MonomorphicMutableArray *typedArray = [[MonomorphicMutableArray alloc] initWithClass:[UILabel class]];
    
    UILabel *label = [[UILabel alloc] init];
        
    STAssertNoThrow([typedArray addObject:label], @"");
    STAssertNoThrow([typedArray insertObject:label atIndex:1], @"");
    STAssertThrows([typedArray addObject:[NSNumber numberWithInt:1]], @"");
    STAssertThrows([typedArray insertObject:[NSNumber numberWithInt:1] atIndex:2], @"");
    STAssertTrue(([typedArray count] == 2), @"");

    // Test initilizers exceptions throwing
    STAssertThrows([[MonomorphicMutableArray alloc] init], @"");
    STAssertThrows([[MonomorphicMutableArray alloc] initWithArray:[NSArray arrayWithObject:@""]], @"");
    STAssertThrows([[MonomorphicMutableArray alloc] initWithArray:[NSArray arrayWithObject:@""] copyItems:YES], @"");
    STAssertThrows([[MonomorphicMutableArray alloc] initWithCapacity:2], @"");
    STAssertThrows([[MonomorphicMutableArray alloc] initWithCoder:nil], @"");
    STAssertThrows([[MonomorphicMutableArray alloc] initWithContentsOfFile:@""], @"");
    STAssertThrows([[MonomorphicMutableArray alloc] initWithContentsOfURL:nil], @"");
                    
}


- (void)testMonomorphicMutableDictionary {
    
    MonomorphicMutableDictionary *typedDico = [[MonomorphicMutableDictionary alloc] initWithClass:[NSString class]];
    
}


- (void)testPolymorphicMutableArray {
    
    PolymorphicMutableArray *typedArray = [[PolymorphicMutableArray alloc] initWithClass:[NSString class]];
    
}


- (void)testPolymorphicMutableDictionary {
    
    PolymorphicMutableDictionary *typedDico = [[PolymorphicMutableDictionary alloc] initWithClass:[NSString class]];
    
}

@end
