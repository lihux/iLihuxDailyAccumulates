//
//  LHTouchEventTableViewCell.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 14/12/15.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

#import "LHTouchEventTableViewCell.h"

#import "LHTextView.h"

@interface LHTouchEventTableViewCell ()

@property (weak, nonatomic) IBOutlet LHTextView *textView;

@end

@implementation LHTouchEventTableViewCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configCell
{
    NSString * content= @"习近平";
    NSString *name = @"近日在江苏调研时强调，要全面贯彻党的十八大和十八届三中、四中全会精神，落实中央经济工作会议精神，主动把握和积极适应经济发展新常态，协调推进全面建成小康社会";
    UIFont *textFont = [UIFont fontWithName:@"STHeitiSC-Medium" size:14];
    NSMutableAttributedString* attributeName = [[NSMutableAttributedString alloc] initWithString:name attributes:@{NSFontAttributeName: textFont, NSForegroundColorAttributeName: [UIColor redColor]}];
    [attributeName addAttribute:@"fuck" value:@"you" range:NSMakeRange(0, name.length)];
    NSAttributedString *attributeContent = [[NSAttributedString alloc] initWithString:content attributes:@{NSFontAttributeName: textFont, NSForegroundColorAttributeName: [UIColor blackColor]}];
    [attributeName appendAttributedString:attributeContent];
    self.textView.attributedText = attributeName;
}


@end
