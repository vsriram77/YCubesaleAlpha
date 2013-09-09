//
//  YCommon.h
//  YCubesaleAlpha
//
//  Created by Sriram Varadarajan on 9/6/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\vsriram. All rights reserved.
//

#ifndef YCubesaleAlpha_YCommon_h
#define YCubesaleAlpha_YCommon_h



// Models
#import "RestObject.h"
#import "ListItem.h"

// Categories
#import "NSDictionary+CPAdditions.h"

#define UIColorFromRGBA(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF000000) >> 24))/255.0 green:((float)((rgbValue & 0xFF0000) >> 16))/255.0 blue:((float)((rgbValue & 0xFF00) >> 8 ))/255.0 alpha:((float)((rgbValue & 0xFF))/255.0)]

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#endif
