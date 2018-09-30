//
//  NSObject+inspectable.h
//  Trader
//
//  Created by xuwenquan on 2018/9/17.
//  Copyright © 2018年 Guangzhou QiaoBangZhu Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (inspectable)

-(void) yx_addMethodWithSel: (SEL)sel withBlock:(id)block withTypes:(char*)types withOnceToken:(dispatch_once_t*) onceToken;
-(void) yx_addMethodWithSel: (SEL)sel LikeSel: (SEL)origSel withBlock:(id)block withOnceToken:(dispatch_once_t*) onceToken;
-(void) yx_addMethodWithSel: (SEL)blockSel withImp: (IMP)imp withTypes:(char*)types withOnceToken:(dispatch_once_t*) onceToken;
-(BOOL) yx_swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ error:(NSError**)error_;
-(void) yx_safePerformSelector:(SEL)sel;
-(void) yx_safePerformSelector:(SEL)sel withObject:(id)obj;
-(void) yx_safePerformSelector:(SEL)sel withCGRect:(CGRect) frame;

@end
