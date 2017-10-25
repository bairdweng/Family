//
//  FYJson.m
//  Family
//
//  Created by Baird-weng on 2017/10/25.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "FYJson.h"
@implementation FYJson
- (id)toArrayOrNSDictionary:(NSString*)jsonStrig
{
    NSError *error = nil;
    NSData* jsonData = [jsonStrig dataUsingEncoding:NSUTF8StringEncoding];
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:NSJSONReadingAllowFragments
                                                      error:nil];
    if (jsonObject != nil && error == nil){
        return jsonObject;
    }else{
        // 解析错误
        return nil;
    }
}
- (NSString *)toJSONData:(id)theData{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if ([jsonData length] > 0 && error == nil){
        NSString* jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return jsonString;
    }else{
        return nil;
    }
}
@end
