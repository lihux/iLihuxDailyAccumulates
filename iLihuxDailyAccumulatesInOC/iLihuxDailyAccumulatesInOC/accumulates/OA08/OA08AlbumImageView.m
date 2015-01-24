//
//  OA08AlbumImageView.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 15/1/22.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "OA08AlbumImageView.h"

@implementation OA08AlbumImageView

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self addObserverForImageChange];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self addObserverForImageChange];
    }
    return self;
}

- (void)addObserverForImageChange {
    [self addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == nil) {
        if ([keyPath isEqualToString:@"image"]) {
            [self setValue:[self.image resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 20, 10)] forKey:@"image"];
        }
    }
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"image"];
}
@end
