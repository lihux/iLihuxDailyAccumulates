//
//  OA13Demo3CollectionViewCellNode.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/11/11.
//  Copyright © 2015年 lihux. All rights reserved.
//

#import "OA13Demo3CollectionViewCellNode.h"

#import "OA13StoryObject.h"
#import "UIImage+ImageEffects.h"

@interface OA13Demo3CollectionViewCellNode ()

@property (nonatomic, strong) ASTextNode *titleTextNode;
@property (nonatomic, strong) ASTextNode *contentTextNode;
@property (nonatomic, strong) ASImageNode *backgroundImageNode;
@property (nonatomic, strong) ASImageNode *contentImageNode;

@end

@implementation OA13Demo3CollectionViewCellNode

- (id)init
{
    if (self = [super init]) {
        self.titleTextNode = [[ASTextNode alloc] init];
        self.titleTextNode.backgroundColor = [UIColor clearColor];
        self.contentTextNode = [[ASTextNode alloc] init];
        self.contentTextNode.backgroundColor = [UIColor clearColor];
        self.backgroundImageNode = [[ASImageNode alloc] init];
        self.contentImageNode = [[ASImageNode alloc] init];
        [self addSubnode:self.backgroundImageNode];
        [self addSubnode:self.contentImageNode];
        [self addSubnode:self.titleTextNode];
        [self addSubnode:self.contentTextNode];

        CGFloat cellWidth = [UIScreen mainScreen].bounds.size.width / 2;
        self.backgroundImageNode.frame = CGRectMake(0, 0, cellWidth, cellWidth * 2);
        self.contentImageNode.frame = CGRectMake(0, 0, cellWidth, cellWidth);
        self.titleTextNode.frame = CGRectMake(10, cellWidth + 5, cellWidth - 20, 15);
        self.contentTextNode.frame = CGRectMake(10, cellWidth + 25, cellWidth - 20, 100);
    }
    return self;
}

- (void)configCellWithStoryObject:(OA13StoryObject *)storyObject
{
    NSDictionary *titleAttributesDic = @{
                                         NSForegroundColorAttributeName: [UIColor whiteColor],
                                         NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:15]
                                         };
    NSDictionary *contentAttributesDic =  @{
                                            NSForegroundColorAttributeName: [UIColor whiteColor],
                                            NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:10]
                                            };
    self.titleTextNode.attributedString = [[NSAttributedString alloc] initWithString:storyObject.title attributes:titleAttributesDic];
    self.contentTextNode.attributedString = [[NSAttributedString alloc] initWithString:storyObject.content attributes:contentAttributesDic];
    UIImage *originalImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", storyObject.backgroundImageName]];
    self.contentImageNode.image = originalImage;
    self.backgroundImageNode.image = originalImage;
    self.backgroundImageNode.imageModificationBlock = ^(UIImage *image) {
        return [originalImage applyBlurWithRadius:15 tintColor:[UIColor colorWithWhite:0.5 alpha:0.3] saturationDeltaFactor:1.8 maskImage:nil];
    };
}

- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width / 2 - 1, [UIScreen mainScreen].bounds.size.width);
}

@end
