//
//  OA04ArchiveViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 14/12/24.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

#import "OA04ArchiveViewController.h"

#include "OA04ArchivedObject.h"

@interface OA04ArchiveViewController ()

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *inputTextFields;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (nonatomic, strong) OA04ArchivedObject *object;
@property (nonatomic, strong) NSData *archivedData;

@end

@implementation OA04ArchiveViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createObjectFromScratch];
}

- (void)createObjectFromScratch
{
    self.object = [[OA04ArchivedObject alloc] initWithName:@"李辉" school:@"中国石油大学" birthday:NSTimeIntervalSince1970 age:27 headImageData:UIImageJPEGRepresentation([UIImage imageNamed:@"qq"], 1)];
    NSLog(@"%@", self.object);
}

- (IBAction)didTapOnReadButton:(id)sender {
    if (self.archivedData) {
//        NSLog(@"\n\nunarchive之后：%@", object);

        OA04ArchivedObject *objectFromFile = [NSKeyedUnarchiver unarchiveObjectWithFile:@"happy.birthday"];
        NSLog(@"\n\n从文件读取成功！%@", objectFromFile);
    }
}

- (IBAction)didTapOnWriteButton:(id)sender {
    if (self.object) {
        NSURL *url = [NSURL new];
        [url setResourceValue:[NSNumber numberWithBool:YES] forKey:NSURLIsExcludedFromBackupKey error:nil];
        self.archivedData = [NSKeyedArchiver archivedDataWithRootObject:self.object];
//        NSLog(@"\n\narchive之后：%@", self.archivedData);

        if ([NSKeyedArchiver archiveRootObject:self.object toFile:@"happy.birthday"]) {
            NSLog(@"\n\narchive到文件成功！");
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
