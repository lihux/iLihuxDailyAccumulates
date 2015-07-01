//
//  OA05GCDViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 15/1/8.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "OA05GCDViewController.h"

#import "OA05CustomOperation.h"
#import "OA05Task.h"

const CGFloat kAnimationDuration = 0.25;

@interface OA05GCDViewController () <UITableViewDataSource, UITableViewDelegate, OA05CustomOperationDelegate>

@property (weak, nonatomic) IBOutlet UIButton *trashButton;
@property (weak, nonatomic) IBOutlet UIButton *indexButton;
@property (weak, nonatomic) IBOutlet UIButton *runButton;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UITextView *souceTextView;
@property (weak, nonatomic) IBOutlet UITextView *resultTextView;

@property (weak, nonatomic) IBOutlet UIView *indexContainerView;
@property (weak, nonatomic) IBOutlet UIView *textContainerView;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *indexViewTopConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *indexViewTrailingConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *indexViewBottomConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *textContainerViewBottomConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *textContainerViewLeadingConstraint;
@property (nonatomic, assign) CGFloat indexViewBottomConstraintConstant;
@property (nonatomic, strong) UIColor* indexButtonOriginColor;
@property (nonatomic, strong) NSArray *chapters;
@property (nonatomic, strong) NSArray *texts;
@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation OA05GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customUI];
    [self loadChaptersFromPlistFile];
    [self.tableview reloadData];
}

- (void)customUI
{
    self.indexViewBottomConstraintConstant = self.indexViewBottomConstraint.constant;
    self.indexButtonOriginColor = self.indexButton.backgroundColor;
    [self.textContainerView.superview removeConstraint:self.textContainerViewBottomConstraint];
    [self.textContainerView.superview removeConstraint:self.textContainerViewLeadingConstraint];
    UIImage *trashImage = [UIImage imageNamed:@"trash"];
    trashImage = [trashImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.trashButton setImage:trashImage forState:UIControlStateNormal];
}

- (void)loadChaptersFromPlistFile
{
    self.chapters = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"OA05GCD" ofType:@"plist"]];
    self.texts = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"OA05Text" ofType:@"plist"]];
}

- (IBAction)didTapOnTrashButton:(id)sender
{
    self.resultTextView.text = @"";
}


- (IBAction)didTapOnIndexButton:(id)sender
{
    if (self.runButton.tag == 6 && self.timer) {
        dispatch_source_cancel(self.timer);
    }
    self.runButton.tag = NSIntegerMax;
    if (self.indexButton.tag == 1) {
        self.indexButton.tag = 0;
        [self animatedShowIndexView];
    } else {
        self.indexButton.tag = 1;
        self.resultTextView.text = @"";
        self.souceTextView.text = @"";
        [self animatedHideIndexView];
    }
}

- (void)animatedShowIndexView
{
    [self.indexContainerView.superview addConstraint:self.indexViewTopConstraint];
    [self.indexContainerView.superview addConstraint:self.indexViewTrailingConstraint];
    [self.textContainerView.superview removeConstraint:self.textContainerViewBottomConstraint];
    [self.textContainerView.superview removeConstraint:self.textContainerViewLeadingConstraint];
    self.indexViewBottomConstraint.constant = self.indexViewBottomConstraintConstant;
    self.indexButton.enabled = NO;
    [self didTapOnTrashButton:self.trashButton];
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.indexButton.backgroundColor = self.indexButtonOriginColor;
        self.indexContainerView.layer.cornerRadius = 4;
        self.tableview.alpha = 1;
        self.runButton.alpha = 0;
        self.trashButton.alpha = 0;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.indexButton.enabled = YES;
    }];
}

- (void)animatedHideIndexView
{
    [self.indexContainerView.superview removeConstraint:self.indexViewTopConstraint];
    [self.indexContainerView.superview removeConstraint:self.indexViewTrailingConstraint];
    [self.textContainerView.superview addConstraint:self.textContainerViewBottomConstraint];
    [self.textContainerView.superview addConstraint:self.textContainerViewLeadingConstraint];
    self.indexViewBottomConstraint.constant = - self.indexButton.bounds.size.height;
    self.indexButton.enabled = NO;
    [self.view setNeedsUpdateConstraints];
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.indexButton.backgroundColor = [UIColor clearColor];
        self.indexContainerView.layer.cornerRadius = 22;
        self.tableview.alpha = 0;
        self.runButton.alpha = 1;
        self.trashButton.alpha = 1;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.indexButton.enabled = YES;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.chapters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableview dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.chapters[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self didTapOnIndexButton:self.indexButton];
    [self loadTaskStringWithIndex:indexPath.row];
    [self.tableview deselectRowAtIndexPath:indexPath animated:true];
}

- (void)appendStringToResultTextViewWithString:(NSString *)string
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *text = self.resultTextView.text;
        self.resultTextView.text = [NSString stringWithFormat:@"%@\n%@", text, string];
        NSRange bottom = NSMakeRange(self.resultTextView.text.length - 1, 1);
        [self.resultTextView scrollRangeToVisible:bottom];
    });
}

#pragma mark - NSOperation and Dispatch Queue Test Cases

- (IBAction)didTapOnRunButton:(id)sender
{
    dispatch_after(kAnimationDuration, dispatch_get_main_queue(), ^{
        switch (self.runButton.tag) {
            case 0:
                [self taskForLearningNSInvocationOperation];
                break;
            case 1:
                [self taskForLearningNSBlockOperation];
                break;
            case 2:
                [self taskForLearningNSOperation];
                break;
            case 3:
                [self taskForLearningNSOperationDepedency];
                break;
            case 4:
                [self taskForLearningDispatchQueue];
                break;
            case 5:
                [self taskForLearningDispatchGroup];
                break;
            case 6:
                [self taskForLearningDispatchSource];
                break;
            case 7:
                [self taskForLearningIdleTimeNofitication];
                break;

            default:
                break;
        }
    });
}

- (void)loadTaskStringWithIndex:(NSInteger)index
{
    self.runButton.tag = index;
    self.souceTextView.text = self.texts[index];
}

//1.NSInvocationOperation 的基本使用学习

- (void)taskForLearningNSInvocationOperation
{
    NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invocationOperationMethod:) object:@"天苍苍，野茫茫，风吹草低见牛羊"];
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    [operationQueue addOperation:invocationOperation];
}

- (void)invocationOperationMethod:(NSString *)result
{
    //更新UI的操作必须dispatch到主线程中执行，否则程序异常、退出：
    dispatch_async(dispatch_get_main_queue(), ^{
        [self appendStringToResultTextViewWithString:result];
    });
}

//2.NSBlockOperation 的基本使用学习

- (void)taskForLearningNSBlockOperation
{
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self appendStringToResultTextViewWithString:@"天苍苍，野茫茫，风吹草低见牛羊"];
        });
    }];
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    [operationQueue addOperation:blockOperation];
}


//3.自己定制的NSOperation基本使用学习

- (void)taskForLearningNSOperation
{
    OA05CustomOperation *operaton = [[OA05CustomOperation alloc] initWithName:@"定制的operation"];
    operaton.delegate = self;
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    [operationQueue addOperation:operaton];
}

//4. NSOperation 综合使用（依赖关系等）

- (void)taskForLearningNSOperationDepedency
{
    OA05CustomOperation *smallOperation = [[OA05CustomOperation alloc] initWithName:@"一开始我是小学生啊"];
    OA05CustomOperation *middleOperation = [[OA05CustomOperation alloc] initWithName:@"现在我成了中学生"];
    OA05CustomOperation *bigOperation = [[OA05CustomOperation alloc] initWithName:@"哈哈，我终于成了大学生"];
    smallOperation.delegate = self;
    middleOperation.delegate = self;
    bigOperation.delegate = self;
    [bigOperation addDependency:middleOperation];
    [middleOperation addDependency:smallOperation];
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    [operationQueue addOperation:bigOperation];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1ull * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [operationQueue addOperation:smallOperation];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2ull * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [operationQueue addOperation:middleOperation];
    });
}

#pragma mark - OA05CustomOperationDelegate

- (void)finishWork:(NSString *)name
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self appendStringToResultTextViewWithString:name];
    });
}

//5. dispatch_queue的基本使用

- (void)taskForLearningDispatchQueue
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self longTimeTaskWithName:@"后台子线程" seconds:3];
    });
}

- (void)longTimeTaskWithName:(NSString *)name seconds:(NSInteger)seconds
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self appendStringToResultTextViewWithString:[NSString stringWithFormat:@"%@ 开始干活啦！", name]];
    });
    NSInteger total = NSIntegerMax;
    for (int i = 0; i < 1000 * seconds; i ++) {
        for (int j = 0; j < 10000; j ++) {
            total = total / 1.9;
        }
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [self appendStringToResultTextViewWithString:[NSString stringWithFormat:@"OMG,终于干完了，累死我了(%@)", name]];
    });
}

//6. dispatch_group的基本使用

- (void)taskForLearningDispatchGroup
{
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_async(group, queue, ^{
        [self longTimeTaskWithName:@"小作文2秒" seconds:2];
    });
    dispatch_group_async(group, queue, ^{
        [self longTimeTaskWithName:@"大作文10秒" seconds:10];
    });
    dispatch_group_async(group, queue, ^{
        [self longTimeTaskWithName:@"阅读理解20秒" seconds:20];
    });
    // sysn ways:
    //    dispatch_wait(group, DISPATCH_TIME_FOREVER);
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [self appendStringToResultTextViewWithString:@"OMG,全组同学终于干完了，累死我了！"];
    });
}

//7. dispatch_source的基本使用

- (void)taskForLearningDispatchSource
{
    // 使用self强持有timer，否则其在当前函数执行完后就被释放了，无法运行：
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    dispatch_source_set_timer(self.timer, dispatch_walltime(NULL, 0), 1 * NSEC_PER_SEC, 0.2 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(self.timer, ^{
        [self appendStringToResultTextViewWithString:@"啊，时间去哪儿了呢！"];
    });
    dispatch_resume(self.timer);
}

//8. idle-time notifications
- (void)taskForLearningIdleTimeNofitication
{
    NSNotificationQueue *queue = [NSNotificationQueue defaultQueue];
    [queue enqueueNotification:[NSNotification notificationWithName:@"kLihuxIdleTimeNotification" object:nil userInfo:@{@"kgod": @"小强，你妈喊你回家吃饭了！"}] postingStyle:NSPostASAP];
}

- (void)receiveIdleTimeNotification:(NSNotification *)notification
{
    [self appendStringToResultTextViewWithString:[NSString stringWithFormat:@"闲时通知到达了，传递的信息是：%@", notification.userInfo]];
}

@end
