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
    return [self.data valueOrNilForKeyPath:@"sdesc"];
}

- (NSString *)ctime {
    return [self.data valueOrNilForKeyPath:@"ctime"];
}

+ (NSMutableArray *)listItemsWithArray:(NSArray *)array {
    NSMutableArray *listItems = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [listItems addObject:[[ListItem alloc] initWithDictionary:params]];
    }
    return listItems;
}

@end
