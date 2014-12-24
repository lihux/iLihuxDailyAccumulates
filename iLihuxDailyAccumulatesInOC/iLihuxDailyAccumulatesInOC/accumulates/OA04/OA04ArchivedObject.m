//
//  OA04ArchivedObject.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 14/12/24.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

#import "OA04ArchivedObject.h"

@interface OA04ArchivedObject () <NSCoding>

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* school;
@property (nonatomic, assign) NSTimeInterval birthday;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, strong) NSData *headImageData;

@end

@implementation OA04ArchivedObject

- (instancetype)initWithName:(NSString *)name school:(NSString *)school birthday:(NSTimeInterval)birthday age:(NSInteger)age headImageData:(NSData *)headImageData
{
    self = [super init];
    if (self) {
        self.name = name;
        self.school = school;
        self.birthday = birthday;
        self.age = age;
        self.headImageData = headImageData;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.school = [aDecoder decodeObjectForKey:@"school"];
        self.birthday = [aDecoder decodeDoubleForKey:@"birthday"];
        self.age = [aDecoder decodeIntegerForKey:@"age"];
        self.headImageData = [aDecoder decodeObjectForKey:@"headImageData"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.school forKey:@"school"];
    [aCoder encodeDouble:self.birthday forKey:@"birthday"];
    [aCoder encodeInteger:self.age forKey:@"age"];
    [aCoder encodeObject:self.headImageData forKey:@"headImageData"];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@\n\nname = %@\nschool = %@\nbirthday = %f\nage = %ld\nheadImageData = %@", [super description], self.name, self.school, self.birthday, (long)self.age, self.headImageData];
}

@end
