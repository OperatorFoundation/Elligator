#ifndef OBJC_ELLIGATOR_ELLIGATOR_H__
#define OBJC_ELLIGATOR_ELLIGATOR_H__

#import <Foundation/Foundation.h>

@interface ElligatorObjC : NSObject
+ (NSArray *)ScalarBaseMult:(NSData *)privateKey;
+ (NSData *)PublicKeyFromRepresentative:(NSData *)representative;
@end

#endif
