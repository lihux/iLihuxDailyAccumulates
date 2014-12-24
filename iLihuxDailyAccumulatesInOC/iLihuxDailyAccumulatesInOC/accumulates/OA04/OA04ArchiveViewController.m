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

@end

@implementation OA04ArchiveViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self test];
}

- (void)test
{
    OA04ArchivedObject *object = [OA04ArchivedObject new];
    NSLog(@"%@", object);
}

- (IBAction)didTapOnReadButton:(id)sender {
}

- (IBAction)didTapOnWriteButton:(id)sender {
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
