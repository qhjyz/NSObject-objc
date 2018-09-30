//
//  NSObject+association.h
//  Trader
//
//  Created by xuwenquan on 2018/9/29.
//  Copyright © 2018年 Guangzhou QiaoBangZhu Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (association)

-(id) associationGetObjectWithKey:(const char*)key;
-(void) assocationSetObject:(id)object withKey:(const char*) key;

@end

NS_ASSUME_NONNULL_END
