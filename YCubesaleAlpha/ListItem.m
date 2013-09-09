//
//  ListItem.m
//  YCubesaleAlpha
//
//  Created by Sriram Varadarajan on 9/5/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\vsriram. All rights reserved.
//

#import "ListItem.h"

@implementation ListItem

- (NSString *)sdesc {
    return [self.data stringValueForKeyPath:@"sdesc"];
}

- (NSString *)fdesc {
    return [self.data stringValueForKeyPath:@"fdesc"];
}

- (NSString *)ynick {
    return [self.data stringValueForKeyPath:@"ynick"];
}

- (NSString *)ctime {
    return [self.data stringValueForKeyPath:@"ctime"];
}

- (NSString *)cat {
    return [self.data stringValueForKeyPath:@"cat"];
}

- (NSString *)loc {
    return [self.data stringValueForKeyPath:@"loc"];
}

- (NSString *)cube {
    return [self.data stringValueForKeyPath:@"cube"];
}

- (NSString *)image {
    return [self.data stringValueForKeyPath:@"image"];
}

- (NSString *)fprice {
    return [self.data stringValueForKeyPath:@"fprice"];
}

+ (NSMutableArray *)listItemsWithArray:(NSArray *)array {
    NSMutableArray *listItems = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [listItems addObject:[[ListItem alloc] initWithDictionary:params]];
    }
    return listItems;
}

@end
