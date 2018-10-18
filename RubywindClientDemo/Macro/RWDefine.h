//
//  RWDefine.h
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#ifndef RWDefine_h
#define RWDefine_h

#define UserDefaults                        [NSUserDefaults standardUserDefaults]

#define RW_HOST_BASE @"http://localhost:3000/api/"

#define ALERT(title, msg)                   [[[UIAlertView alloc] initWithTitle:title\
                                                                        message:msg\
                                                                        delegate:nil\
                                                                        cancelButtonTitle:@"确定"\
                                                                        otherButtonTitles:nil] show]

#pragma mark - Logging
///---------------------------------------------------------------------------
/// @name Logging Messages to the Console
///---------------------------------------------------------------------------

#ifdef DEBUG

/**
 A simple wrapper for `NSLog()` that is automatically removed from release builds.
 */
#define DLOG(...) NSLog(__VA_ARGS__)

/**
 More detailed loogging. Logs the function name and line number after the log message.
 */
#define DLOGEXT(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

/**
 Logs a method call's class and selector.
 */
#define DLOGCALL DLOG(@"[%@ %@]", NSStringFromClass([self class]), NSStringFromSelector(_cmd))

#define XLog_DEBUG(format, ...)    NSLog(@"[DEBUG] {%s,%d} " format, __FUNCTION__, __LINE__, ##__VA_ARGS__)
#define XLog_INFO(format, ...)     NSLog(@"[INFO] {%s,%d} " format, __FUNCTION__, __LINE__,##__VA_ARGS__)
#define XLog_WARNING(format, ...)  NSLog(@"[WARNING] {%s,%d} " format, __FUNCTION__, __LINE__, ##__VA_ARGS__)
#define XLog_ERROR(format, ...)    NSLog(@"[ERROR] {%s,%d} " format, __FUNCTION__, __LINE__, ##__VA_ARGS__)

#else

#define DLOG(...) /* */
#define DLOGEXT(...) /* */
#define DLOGCALL /* */

#define XLog_DEBUG(format,...)
#define XLog_INFO(format,...)
#define XLog_ERROR(format,...)
#define XLog_WARNING(format,...)

#define NSLog(...);

#endif


//http://holko.pl/2015/05/31/weakify-strongify/
#define weakify(var) __weak typeof(var) AHKWeak_##var = var;

#define strongify(var) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
__strong typeof(var) var = AHKWeak_##var; \
_Pragma("clang diagnostic pop")


#endif /* RWDefine_h */
