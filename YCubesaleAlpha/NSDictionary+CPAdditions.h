//
//  NSDictionary+CPAdditions.h
//  YCubesaleAlpha
//
//  Created by Sriram Varadarajan on 9/6/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\vsriram. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (CPAdditions)

- (id)objectOrNilForKey:(id)key;
- (id)valueOrNilForKeyPath:(id)keyPath;
- (NSString *)stringValueForKeyPath:(id)keyPath;

@end


