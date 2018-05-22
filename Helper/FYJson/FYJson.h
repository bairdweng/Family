//
//  FYJson.h
//  Family
//
//  Created by Baird-weng on 2017/10/25.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FYJson : NSObject
- (id)toArrayOrNSDictionary:(NSString*)jsonStrig;
- (NSString*)toJSONData:(id)theData;
@end
