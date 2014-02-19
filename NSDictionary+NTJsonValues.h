//
//  NSDictionary+NTJsonValues.h
//  NTTryGetSample
//
//  Created by Ethan Nagel on 2/12/14.
//  Copyright (c) 2014 Nagel Technologies, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (NTJsonValues)

/**
 * returns the object at the key path or defaultValue of the object is not found.
 * @param the key path or a distinct key value.
 * @return the object at the key path or defaultValue if not found.
 */
-(id)objectForKeyPath:(NSString *)keyPath defaultValue:(id)defaultValue;

/**
 * returns the object at the key path or nil of the object is not found.
 * @param the key path or a distinct key value.
 * @return the object at the key path or nil if not found.
 */
-(id)objectForKeyPath:(NSString *)keyPath;

/**
 * returns the object of type class at the key path or defaultValue of the object is not found or is not type class.
 * @param the key path or a distinct key value.
 * @param class the class type to validate
 * @param defaultValue the default to return if keyPath is not found
 * @return the object of type class at the key path or defaultValue
 */
-(id)objectForKeyPath:(NSString *)keyPath class:(Class)class defaultValue:(id)defaultValue;

/**
 * returns the object of type class at the key path or nil of the object is not found or is not type class.
 * @param the key path or a distinct key value.
 * @param class the class type to validate
 * @return the NSDictionary at keyPath or defaultValue
 */
-(id)objectForKeyPath:(NSString *)keyPath class:(Class)class;

/**
 * returns the NSDictionary at keyPath or defaultValue if the value is not found or is not an NSDictionary.
 * @param the key path or a distinct key value.
 * @param defaultValue the default to return if keyPath is not found
 * @return the NSDictionary at keyPath or defaultValue
 */
-(NSDictionary *)dictionaryForKeyPath:(NSString *)keyPath defaultValue:(NSDictionary *)defaultValue;

/**
 * returns the NSDictionary at keyPath or nil if the value is not found or is not an NSDictionary.
 * @param the key path or a distinct key value.
 * @return the NSDictionary at keyPath or nil
 */
-(NSDictionary *)dictionaryForKeyPath:(NSString *)keyPath;

/**
 * returns the NSArray at keyPath or defaultValue if the value is not found or is not an NSArray.
 * @param the key path or a distinct key value.
 * @param defaultValue the default to return if keyPath is not found
 * @return the NSArray at keyPath or defaultValue
 */
-(NSArray *)arrayForKeyPath:(NSString *)keyPath defaultValue:(NSArray *)defaultValue;

/**
 * returns the NSArray at keyPath or nil if the value is not found or is not an NSArray.
 * @param the key path or a distinct key value.
 * @return the NSArray at keyPath or nil
 */
-(NSArray *)arrayForKeyPath:(NSString *)keyPath;

/**
 * returns the string at keyPath or defaultValue if the value is not found. Will convert
 * numeric values to strings.
 * @param the key path or a distinct key value.
 * @param defaultValue the default to return if keyPath is not found
 * @return the string at keyPath or defaultValue
 */
-(NSString *)stringForKeyPath:(NSString *)keyPath defaultValue:(NSString *)defaultValue;

/**
 * returns the string at keyPath or nil if the value is not found. Will convert
 * numeric values to strings.
 * @param the key path or a distinct key value.
 * @return the string at keyPath or nil
 */
-(NSString *)stringForKeyPath:(NSString *)keyPath;

/**
 * returns the int at keyPath or defaultValue if the value is not found or is not a number. Will attempt to convert
 * strings to ints.
 * @param the key path or a distinct key value.
 * @param defaultValue the default to return if keyPath is not found
 * @return the int at keyPath or defaultValue
 */
-(int)intForKeyPath:(NSString *)keyPath defaultValue:(int)defaultValue;

/**
 * returns the int at keyPath or 0 if the value is not found or is not a number. Will attempt to convert
 * strings to ints.
 * @param the key path or a distinct key value.
 * @return the int at keyPath or 0
 */
-(int)intForKeyPath:(NSString *)keyPath;

/**
 * returns the long at keyPath or defaultValue if the value is not found or is not a number. Will attempt to convert
 * strings to longs.
 * @param the key path or a distinct key value.
 * @param defaultValue the default to return if keyPath is not found
 * @return the int at keyPath or defaultValue
 */
-(long long)longForKeyPath:(NSString *)keyPath defaultValue:(long long)defaultValue;

/**
 * returns the long at keyPath or 0 if the value is not found or is not a number. Will attempt to convert
 * strings to longs.
 * @param the key path or a distinct key value.
 * @return the long at keyPath or 0
 */
-(long long)longForKeyPath:(NSString *)keyPath;


/**
 * returns the BOOL at keyPath or defaultValue if the value is not found or is not a bool. Will attempt to convert
 * strings or  numeric values to bools.
 * @param the key path or a distinct key value.
 * @param defaultValue the default to return if keyPath is not found
 * @return the BOOL at keyPath or defaultValue
 */
-(BOOL)boolForKeyPath:(NSString *)keyPath defaultValue:(BOOL)defaultValue;

/**
 * returns the BOOL at keyPath or NO if the value is not found or is not a bool. Will attempt to convert
 * strings or  numeric values to bools.
 * @param the key path or a distinct key value.
 * @return the BOOL at keyPath or NO
 */
-(BOOL)boolForKeyPath:(NSString *)keyPath;

/**
 * returns the float at keyPath or defaultValue if the value is not found or is not a number. Will attempt to convert
 * strings to floats.
 * @param the key path or a distinct key value.
 * @param defaultValue the default to return if keyPath is not found
 * @return the double at keyPath or defaultValue
 */
-(float)floatForKeyPath:(NSString *)keyPath defaultValue:(float)defaultValue;

/**
 * returns the float at keyPath or 0 if the value is not found or is not a number. Will attempt to convert
 * strings to float.
 * @param the key path or a distinct key value.
 * @return the float at keyPath or 0
 */
-(float)floatForKeyPath:(NSString *)keyPath;


/**
 * returns the double at keyPath or defaultValue if the value is not found or is not a number. Will attempt to convert
 * strings to doubles.
 * @param the key path or a distinct key value.
 * @param defaultValue the default to return if keyPath is not found
 * @return the double at keyPath or defaultValue
 */
-(double)doubleForKeyPath:(NSString *)keyPath defaultValue:(double)defaultValue;

/**
 * returns the float at keyPath or 0 if the value is not found or is not a number. Will attempt to convert
 * strings to float.
 * @param the key path or a distinct key value.
 * @return the double at keyPath or 0
 */
-(double)doubleForKeyPath:(NSString *)keyPath;


/**
 * returns the NSDate at keyPath or defaultValue if the value is not found or cannot be converted to a date. Will attempt to convert
 * numeric values to dates as unix epoc's (if they are very large it will assume m accuracy and be truncated to seconds) Strings will be converted to dates if they conform to ISO 8601.
 * @param the key path or a distinct key value.
 * @param defaultValue the default to return if keyPath is not found
 * @return the NSDate at keyPath or defaultValue
 */
-(NSDate *)dateForKeyPath:(NSString *)keyPath defaultValue:(NSDate *)defaultValue;

/**
 * returns the NSDate at keyPath or nil if the value is not found or cannot be converted to a date. Will attempt to convert
 * numeric values to dates as unix epoc's (if they are very large it will assume ms accuracy and be truncated to seconds) Strings will be converted to dates if they conform to ISO 8601.
 * @param the key path or a distinct key value.
 * @return the NSDate at keyPath or nil
 */
-(NSDate *)dateForKeyPath:(NSString *)keyPath;


@end
