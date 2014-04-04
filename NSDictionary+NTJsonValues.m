//
//  NSDictionary+NTJsonValues.h
//  NTTryGetSample
//
//  Created by Ethan Nagel on 2/12/14.
//  Copyright (c) 2014 Nagel Technologies, Inc. All rights reserved.
//

#import "NSDictionary+NTJsonValues.h"


@implementation NSDictionary (NTJsonValues)


-(id)objectForKeyPath:(NSString *)keyPath defaultValue:(id)defaultValue
{
    // If we find a path, "x.y", parse the element and call ourselves recursively...
    
    int dotPos = [keyPath rangeOfString:@"."].location;
    
    if ( dotPos != NSNotFound)
    {
        NSString *key = [keyPath substringToIndex:dotPos];
        NSString *remainingKeyPath = [keyPath substringFromIndex:dotPos+1];
        
        NSDictionary *value = [self objectForKey:key];
        
        if ( !value || ![value isKindOfClass:[NSDictionary class]] )
            return defaultValue; // key path not found
        
        return [value objectForKeyPath:remainingKeyPath defaultValue:defaultValue];   // recursive
    }
    
    // If we get here, it's a simple key...
    
    id value = [self objectForKey:keyPath];
    
    return (value) ? value : defaultValue;
}


-(id)objectForKeyPath:(NSString *)keyPath
{
    return [self objectForKeyPath:keyPath defaultValue:nil];
}


-(id)objectForKeyPath:(NSString *)keyPath class:(Class)class defaultValue:(id)defaultValue
{
    id value = [self objectForKeyPath:keyPath defaultValue:nil];
    
    return [value isKindOfClass:class] ? value : defaultValue;
}


-(id)objectForKeyPath:(NSString *)keyPath class:(Class)class
{
    return [self objectForKeyPath:keyPath class:class defaultValue:nil];
}


-(NSDictionary *)dictionaryForKeyPath:(NSString *)keyPath defaultValue:(NSDictionary *)defaultValue
{
    return [self objectForKeyPath:keyPath class:[NSDictionary class] defaultValue:defaultValue];
}


-(NSDictionary *)dictionaryForKeyPath:(NSString *)keyPath
{
    return [self dictionaryForKeyPath:keyPath defaultValue:nil];
}


-(NSArray *)arrayForKeyPath:(NSString *)keyPath defaultValue:(NSArray *)defaultValue
{
    return [self objectForKeyPath:keyPath class:[NSArray class] defaultValue:defaultValue];
}


-(NSArray *)arrayForKeyPath:(NSString *)keyPath
{
    return [self arrayForKeyPath:keyPath defaultValue:nil];
}


-(NSString *)stringForKeyPath:(NSString *)keyPath defaultValue:(NSString *)defaultValue
{
    id value = [self objectForKeyPath:keyPath];
    
    if ( [value isKindOfClass:[NSNumber class]] )
        value = [value stringValue];

    return [value isKindOfClass:[NSString class]] ? value : defaultValue;
}


-(NSString *)stringForKeyPath:(NSString *)keyPath
{
    return [self stringForKeyPath:keyPath defaultValue:nil];
}


-(int)intForKeyPath:(NSString *)keyPath defaultValue:(int)defaultValue
{
    id value = [self objectForKeyPath:keyPath];
    
    return [value respondsToSelector:@selector(intValue)] ? [value intValue] : defaultValue;
}


-(int)intForKeyPath:(NSString *)keyPath
{
    return [self intForKeyPath:keyPath defaultValue:0];
}


-(long long)longForKeyPath:(NSString *)keyPath defaultValue:(long long)defaultValue
{
    id value = [self objectForKeyPath:keyPath];
    
    return [value respondsToSelector:@selector(longLongValue)] ? [value longLongValue] : defaultValue;
}


-(long long)longForKeyPath:(NSString *)keyPath
{
    return [self longForKeyPath:keyPath defaultValue:0];
}


-(BOOL)boolForKeyPath:(NSString *)keyPath defaultValue:(BOOL)defaultValue
{
    id value = [self objectForKeyPath:keyPath];
    
    if ( [value isKindOfClass:[NSString class]] )
        return [value boolValue];
    
    if ( [value isKindOfClass:[NSNumber class]] )
        return [value boolValue];
    
    return defaultValue;
}


-(BOOL)boolForKeyPath:(NSString *)keyPath
{
    return [self boolForKeyPath:keyPath defaultValue:NO];
}


-(float)floatForKeyPath:(NSString *)keyPath defaultValue:(float)defaultValue
{
    id value = [self objectForKeyPath:keyPath];
    
    if ( [value isKindOfClass:[NSString class]] )
        return [value floatValue];
    
    if ( [value isKindOfClass:[NSNumber class]] )
        return [value floatValue];
    
    return defaultValue;
}


-(float)floatForKeyPath:(NSString *)keyPath
{
    return [self floatForKeyPath:keyPath defaultValue:0];
}


-(double)doubleForKeyPath:(NSString *)keyPath defaultValue:(double)defaultValue
{
    id value = [self objectForKeyPath:keyPath];
    
    if ( [value isKindOfClass:[NSString class]] )
        return [value doubleValue];
    
    if ( [value isKindOfClass:[NSNumber class]] )
        return [value doubleValue];
    
    return defaultValue;
}


-(double)doubleForKeyPath:(NSString *)keyPath
{
    return [self doubleForKeyPath:keyPath defaultValue:0];
}


-(NSDate *)dateForKeyPath:(NSString *)keyPath defaultValue:(NSDate *)defaultValue
{
    id value = [self objectForKeyPath:keyPath];
    
    // if we have a string that looks like an integer, convert it to an NSNumber...
    
    if ( [value isKindOfClass:[NSString class]] )
    {
        NSScanner *sc = [NSScanner scannerWithString:value];
        
        int intValue;
        
        if ( [sc scanInt:&intValue] && [sc isAtEnd] )
            value = [NSNumber numberWithInt:intValue];
    }
    
    // Attempt to parse a serial date...
    
    if ( [value isKindOfClass:[NSNumber class]] )
    {
        long long serial = [value longLongValue];
        
        if ( serial == 0 )  // 0 == default
            return defaultValue;
        
        if ( serial > 9999999999 )
            serial /= 1000; // MS accuracy
        
        return [NSDate dateWithTimeIntervalSince1970:serial];
    }
    
    // Attempt to parse a string date (ISO 8601 formatted)
    
    if ( [value isKindOfClass:[NSString class]] )
    {
        // Assume ISO8601 formatted date, ie
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat: @"yyyy-MM-dd'T'HH:mm:ss'Z'"];
        
        NSDate *date = [dateFormat dateFromString:(NSString *)value];

        if ( date )
            return date;
    }
    
    // We weren't able to convert, return default value...

    return defaultValue;
}


-(NSDate *)dateForKeyPath:(NSString *)keyPath
{
    return [self dateForKeyPath:keyPath defaultValue:nil];
}


@end
