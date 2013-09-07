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

- (NSString *)fdesc {
    return [self.data valueOrNilForKeyPath:@"fdesc"];
}

- (NSString *)ynick {
    return [self.data valueOrNilForKeyPath:@"ynick"];
}

- (NSString *)ctime {
    return [self.data valueOrNilForKeyPath:@"ctime"];
}

- (NSString *)cat {
    return [self.data valueOrNilForKeyPath:@"cat"];
}

- (NSString *)loc {
    return [self.data valueOrNilForKeyPath:@"loc"];
}

- (NSString *)cube {
    return [self.data valueOrNilForKeyPath:@"cube"];
}

- (NSString *)image {
    return [self.data valueOrNilForKeyPath:@"image"];
}

- (NSString *)price {
    return [self.data valueOrNilForKeyPath:@"price"];
}

+ (NSMutableArray *)listItemsWithArray:(NSArray *)array {
    NSMutableArray *listItems = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [listItems addObject:[[ListItem alloc] initWithDictionary:params]];
    }
    return listItems;
}

@end
