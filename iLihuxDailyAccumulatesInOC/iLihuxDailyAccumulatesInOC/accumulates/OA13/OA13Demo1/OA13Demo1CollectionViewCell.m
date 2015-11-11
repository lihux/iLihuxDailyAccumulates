//
//  OA13Demo1CollectionViewCell.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/11/11.
//  Copyright © 2015年 lihux. All rights reserved.
//

#import "OA13Demo1CollectionViewCell.h"

#import "OA13StoryObject.h"
#import "UIImage+ImageEffects.h"

@interface OA13Demo1CollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation OA13Demo1CollectionViewCell

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.titleLabel.text = @"";
    self.contentLabel.text = @"";
    self.backgroundImageView.image = nil;
    self.contentImageView.image = nil;
}

- (void)configCellWithStoryObject:(OA13StoryObject *)storyObject
{
    self.titleLabel.text = storyObject.title;
    self.contentLabel.text = storyObject.content;
    UIImage *originalImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", storyObject.backgroundImageName]];
    self.backgroundImageView.image = [originalImage applyBlurWithRadius:15 tintColor:[UIColor colorWithWhite:0.5 alpha:0.3] saturationDeltaFactor:1.8 maskImage:nil];
    self.contentImageView.image = originalImage;
}

@end
