//
//  NSObject+inspectable.m
//  Trader
//
//  Created by xuwenquan on 2018/9/17.
//  Copyright © 2018年 Guangzhou QiaoBangZhu Network Technology Co., Ltd. All rights reserved.
//

#import "NSObject+inspectable.h"
#import <objc/runtime.h>
#import <JRSwizzle/JRSwizzle.h>

@implementation NSObject (inspectable)

-(void) dumpInfo
{
    Class clazz = [self class];
    u_int count;
    
    Ivar* ivars = class_copyIvarList(clazz, &count);
    NSMutableArray* ivarArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count ; i++)
    {
        const char* ivarName = ivar_getName(ivars[i]);
        [ivarArray addObject:[NSString  stringWithCString:ivarName encoding:NSUTF8StringEncoding]];
    }
    free(ivars);
    
    objc_property_t* properties = class_copyPropertyList(clazz, &count);
    NSMutableArray* propertyArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count ; i++)
    {
        const char* propertyName = property_getName(properties[i]);
        [propertyArray addObject:[NSString  stringWithCString:propertyName encoding:NSUTF8StringEncoding]];
    }
    free(properties);
    
    Method* methods = class_copyMethodList(clazz, &count);
    NSMutableArray* methodArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count ; i++)
    {
        SEL selector = method_getName(methods[i]);
        const char* methodName = sel_getName(selector);
        [methodArray addObject:[NSString  stringWithCString:methodName encoding:NSUTF8StringEncoding]];
    }
    free(methods);
    
    NSDictionary* classDump = [NSDictionary dictionaryWithObjectsAndKeys:
                               ivarArray, @"ivars",
                               propertyArray, @"properties",
                               methodArray, @"methods",
                               nil];
    
    NSLog(@"%@", classDump);
}

-(void) yx_addMethodWithSel: (SEL)sel withImp: (IMP)imp withTypes:(char*)types withOnceToken:(dispatch_once_t*) onceToken
{
    // create the method
    dispatch_once(onceToken, ^{
        Class class = [self class];
        NSAssert(class_addMethod(class, sel, imp, types), nil);
    });
}

-(void) yx_addMethodWithSel: (SEL)sel withBlock:(id)block withTypes:(char*)types withOnceToken:(dispatch_once_t*) onceToken{
    IMP blockIMP = imp_implementationWithBlock(block);
    class_addMethod([self class], sel, blockIMP, types);
}

-(void) yx_addMethodWithSel: (SEL)blockSel LikeSel: (SEL)origSel withBlock:(id)block withOnceToken:(dispatch_once_t*) onceToken{
    IMP blockIMP = imp_implementationWithBlock(block);
    Method origSelMethod = class_getInstanceMethod([self class], origSel);
    const char* origSelMethodArgs = method_getTypeEncoding(origSelMethod);
    class_addMethod([self class], blockSel, blockIMP, origSelMethodArgs);
}


-(void) yx_safePerformSelector:(SEL)sel{
    if ([self respondsToSelector:sel]) {
        [self performSelector:sel];
    }
}

-(void) yx_safePerformSelector:(SEL)sel withObject:(id)obj{
    if ([self respondsToSelector:sel]) {
        [self performSelector:sel withObject:obj];
    }
}

-(void) yx_safePerformSelector:(SEL)sel withCGRect:(CGRect)frame{
    NSMethodSignature *methodSig = [NSMethodSignature signatureWithObjCTypes:"v@:{CGRect={CGPoint=dd}{CGSize=dd}}"];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
    [invocation setSelector:sel];
    [invocation setTarget:self];
    [invocation setArgument:&frame atIndex:2];
    [invocation performSelector:@selector(invoke)];
}


- (BOOL)yx_swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ error:(NSError**)error_{
    return [[self class] jr_swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ error:error_];
}

@end
