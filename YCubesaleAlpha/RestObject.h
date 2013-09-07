//
//  RestObject.h
//  YCubesaleAlpha
//
//  Created by Sriram Varadarajan on 9/6/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\vsriram. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestObject : NSObject

- (id)initWithDictionary:(NSDictionary *)data;

@property (nonatomic, strong) NSDictionary *data;

@end

@interface RestObject (ForwardedMethods)

- (id)objectForKey:(id)key;
- (id)valueOrNilForKeyPath:(NSString *)keyPath;
- (NSString *)JSONString;

@end
