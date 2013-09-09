//
//  ListItem.h
//  YCubesaleAlpha
//
//  Created by Sriram Varadarajan on 9/5/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\vsriram. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListItem : RestObject

@property (nonatomic, strong, readonly) NSString *sdesc;
@property (nonatomic, strong, readonly) NSString *fdesc;
@property (nonatomic, strong, readonly) NSString *ynick;
@property (nonatomic, strong, readonly) NSString *ctime;
@property (nonatomic, strong, readonly) NSString *cat;
@property (nonatomic, strong, readonly) NSString *loc;
@property (nonatomic, strong, readonly) NSString *cube;
@property (nonatomic, strong, readonly) NSString *fprice;
@property (nonatomic, strong, readonly) NSString *image;

+ (NSMutableArray *)listItemsWithArray:(NSArray *)array;

@end
