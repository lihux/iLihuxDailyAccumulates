//
//  OA13Demo2CollectionViewCell.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/11/11.
//  Copyright © 2015年 lihux. All rights reserved.
//

#import "OA13Demo2CollectionViewCell.h"

#import "OA13StoryObject.h"
#import "UIImage+ImageEffects.h"

#import "AsyncDisplayKit.h"

@interface OA13Demo2CollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (nonatomic, strong) ASImageNode *backgroundImageNode;
@property (nonatomic, strong) ASImageNode *contentImageNode;

@end

@implementation OA13Demo2CollectionViewCell

- (void)awakeFromNib
{
    CGFloat cellWidth = [UIScreen mainScreen].bounds.size.width / 2;
    [super awakeFromNib];
    self.backgroundImageNode = [[ASImageNode alloc] init];
    self.backgroundImageNode.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubnode:self.backgroundImageNode];
    self.backgroundImageNode.frame = CGRectMake(0, 0, cellWidth, cellWidth * 2);
    self.contentImageNode = [[ASImageNode alloc] init];
    self.contentImageNode.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubnode:self.contentImageNode];
    self.contentImageNode.frame = CGRectMake(0, 0, cellWidth, cellWidth);
    [self.contentView bringSubviewToFront:self.titleLabel];
    [self.contentView bringSubviewToFront:self.contentLabel];
    self.titleLabel.frame = CGRectMake(10, cellWidth + 5, cellWidth - 20, 15);
    self.contentLabel.frame = CGRectMake(10, cellWidth + 25, cellWidth - 20, 100);
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.titleLabel.text = @"";
    self.contentLabel.text = @"";
}

- (void)configCellWithStoryObject:(OA13StoryObject *)storyObject
{
    self.titleLabel.text = storyObject.title;
    self.contentLabel.text = storyObject.content;
    UIImage *originalImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", storyObject.backgroundImageName]];
    self.contentImageNode.image = originalImage;
    self.backgroundImageNode.image = originalImage;
    self.backgroundImageNode.imageModificationBlock = ^(UIImage *image) {
        return [originalImage applyBlurWithRadius:15 tintColor:[UIColor colorWithWhite:0.5 alpha:0.3] saturationDeltaFactor:1.8 maskImage:nil];
    };
}

@end
