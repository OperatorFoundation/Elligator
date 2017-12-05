//
//  Elligator.m
//  Elligator
//
//  Created by Brandon Wiley on 11/14/17.
//  Copyright © 2017 Operator Foundation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ElligatorObjC.h"
#import "celligator.hpp"

@implementation ElligatorObjC
+ (NSArray *)ScalarBaseMult:(NSData *)privateKey {
    uint8_t prv[32]={0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    const uint8_t *bytes = (const uint8_t*)[privateKey bytes];
    memcpy(&prv, bytes, 32);
    
    uint8_t rep[32]={0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    uint8_t pub[32]={0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    int ret=elligator::ScalarBaseMult(pub, rep, prv);
    if(ret==0) {
        return nil;
    } else {
        NSData *repData=[[NSData alloc] initWithBytes:rep length:32];
        NSData *pubData=[[NSData alloc] initWithBytes:pub length:32];
        return [NSArray arrayWithObjects:repData, pubData, nil];
    }
}

+ (NSData *)PublicKeyFromRepresentative:(NSData *)representative {
    uint8_t rep[32]={0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    const uint8_t *bytes = (const uint8_t*)[representative bytes];
    memcpy(&rep, bytes, 32);
    
    uint8_t pub[32]={0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    
    elligator::RepresentativeToPublicKey(pub, rep);
    
    return [[NSData alloc] initWithBytes:pub length:32];
}
@end
