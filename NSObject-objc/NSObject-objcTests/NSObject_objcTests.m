//
//  NSObject_objcTests.m
//  NSObject-objcTests
//
//  Created by xuwenquan on 2018/9/30.
//  Copyright © 2018年 Qiaobangzhu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSObject+association.h"

@interface NSObject_objcTests : XCTestCase

@end

@implementation NSObject_objcTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void) testAssociation {
    NSObject* obj = [[NSObject alloc] init];
    [obj assocationSetObject:@"abc" withKey:"abc"];
    id ret = [obj associationGetObjectWithKey:"abc"];
    XCTAssertEqual(@"abc", ret);
    
    [obj assocationSetObject:@"efg" withKey:"abc"];
    ret = [obj associationGetObjectWithKey:"abc"];
    XCTAssertEqual(@"efg", ret);

}

@end
