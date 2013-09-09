//
//  NSDictionary+CPAdditions.m
//  YCubesaleAlpha
//
//  Created by Sriram Varadarajan on 9/6/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\vsriram. All rights reserved.
//

#import "NSDictionary+CPAdditions.h"

@implementation NSDictionary (CPAdditions)

- (id)objectOrNilForKey:(id)key {
    id object = [self objectForKey:key];
    
    if ((NSNull *) object == [NSNull null] || [object isEqual:@"<null>"]) {
        return nil;
    }
    
    return object;
}

- (id)valueOrNilForKeyPath:(id)keyPath {
    id object = [self valueForKeyPath:keyPath];
    if ((NSNull *)object == [NSNull null] || [object isEqual:@"<null>"]) {
        return nil;
    }
    return object;
}


- (NSString *)stringValueForKeyPath:(id)keyPath {
    id object = [self valueForKeyPath:keyPath];
    if ((NSNull *)object == [NSNull null] || [object isEqual:@"<null>"]) {
        return @"";
    }
    return (NSString *)object;
}

@end
