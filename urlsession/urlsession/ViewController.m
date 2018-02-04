//
//  ViewController.m
//  urlsession
//
//  Created by Artem Lomov on 01/02/2018.
//  Copyright © 2018 Artem Lomov. All rights reserved.
//

#import "ViewController.h"
#import "NetworkService.h"

#define FIRST_STEP 0
#define SECOND_STEP 0
#define THIRD_STEP 1

const CGFloat imageOffset = 100;

@interface ViewController () <NetworkServiceOutputProtocol>

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, strong) NetworkService *networkService;
@property (nonatomic, strong) UIButton *cancelDownloadButton;
@property (nonatomic, strong) UIButton *resumeDownloadButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#if FISRT_STEP
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://itunes.apple.com/search?term=apple&media=software"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
        {
            if(!error)
            {
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"%@", json);
            }
            else
            {
                NSLog(@"Error");
            }
        }];
    
    [dataTask resume];
#endif
    
#if SECOND_STEP
    [self prepareUI];
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:nil];
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:[NSURL URLWithString:@"https://upload.wikimedia.org/wikipedia/commons/4/4e/Pleiades_large.jpg"]];
    //http://is1.mzstatic.com/image/thumb/Purple2/v4/91/59/e1/9159e1b3-f67c-6c05-0324-d56f4aee156a/source/100x100bb.jpg
    [downloadTask resume];
#endif
    
#if THIRD_STEP
    [self prepareUI];
    self.networkService = [NetworkService new];
    self.networkService.output = self;
    [self.networkService configureUrlSessionParams:nil];
    [self.networkService startImageLoading];
#endif
}

- (void)prepareUI
{
    self.imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    self.imageView.contentMode = UIViewContentModeCenter;
    [self.view addSubview:self.imageView];
    
    self.progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    self.progressView.frame = CGRectMake(imageOffset, self.view.center.y - imageOffset/2, CGRectGetWidth(self.view.frame) - imageOffset*2, imageOffset);
    [self.view addSubview:self.progressView];
    
    self.cancelDownloadButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame)/3, 50)];
    [self.cancelDownloadButton setTitle:@"Cancel" forState:UIControlStateNormal];
    self.cancelDownloadButton.backgroundColor = [UIColor grayColor];
    [self.cancelDownloadButton addTarget:self action:@selector(suspendDownloadMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.cancelDownloadButton];
    
    self.resumeDownloadButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)*2/3, 0, CGRectGetWidth(self.view.frame)/3, 50)];
    [self.resumeDownloadButton setTitle:@"Resume" forState:UIControlStateNormal];
    self.resumeDownloadButton.backgroundColor = [UIColor grayColor];
    [self.resumeDownloadButton addTarget:self action:@selector(resumeDownloadMethod) forControlEvents:UIControlEventTouchUpInside];
    self.resumeDownloadButton.hidden = YES;
    [self.view addSubview:self.resumeDownloadButton];
    
    
}

- (void)resumeDownloadMethod
{
    if ([self.networkService resumeNetworkLoading])
    {
        self.resumeDownloadButton.hidden = YES;
        self.cancelDownloadButton.hidden = NO;
    }
}

- (void)suspendDownloadMethod
{
    [self.networkService suspendNetworkLoading];
    self.resumeDownloadButton.hidden = NO;
    self.cancelDownloadButton.hidden = YES;
}

#pragma mark - NSURLSessionDelegate

//method will be called right after the download finished
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
    didFinishDownloadingToURL:(NSURL *)location
{
    NSData *data = [NSData dataWithContentsOfURL:location];
    
    //т.к. отрисовка ui должна проходить на главное потоке желательно, а все с url происходит на побочном
    dispatch_async(dispatch_get_main_queue(), ^{
        self.progressView.hidden = YES;
        self.imageView.image = [UIImage imageWithData:data];
    });
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
    didWriteData:(int64_t)bytesWritten
    totalBytesWritten:(int64_t)totalBytesWritten
    totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    float progress = (double)totalBytesWritten / (double)totalBytesExpectedToWrite;
    dispatch_async(dispatch_get_main_queue(), ^{
        self.progressView.progress = progress;
    });
}

#pragma mark - NetworkServiceOutput

- (void)loadingContinuesWithProgress:(double)progress
{
    self.progressView.progress = progress;
}

- (void)loadingIsDoneWithDataRecieved:(NSData *)dataRecieved
{
    self.progressView.hidden = YES;
    self.imageView.image = [UIImage imageWithData:dataRecieved];
}

@end
