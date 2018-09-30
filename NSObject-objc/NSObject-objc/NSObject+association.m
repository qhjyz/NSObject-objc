//
//  NSObject+association.m
//  Trader
//
//  Created by xuwenquan on 2018/9/29.
//  Copyright © 2018年 Guangzhou QiaoBangZhu Network Technology Co., Ltd. All rights reserved.
//

#import "NSObject+association.h"
#import "objc/runtime.h"

@implementation NSObject (association)

-(id) associationGetObjectWithKey:(const char*)key{
    return objc_getAssociatedObject(self,(const void*)key);
}

-(void) assocationSetObject:(id)object withKey:(const char*) key{
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_RETAIN);
}

@end
