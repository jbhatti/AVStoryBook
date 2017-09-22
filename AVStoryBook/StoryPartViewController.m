//
//  StoryPartViewController.m
//  AVStoryBook
//
//  Created by Jaison Bhatti on 2017-09-22.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//


#import "StoryPartViewController.h"
@import AVFoundation;

@interface StoryPartViewController ()

@property (nonatomic,strong) NSURL *audioFileURL;
@property (nonatomic,strong) AVAudioRecorder *recorder;
@property (nonatomic,strong) AVAudioPlayer *player;

@end

@implementation StoryPartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    self.audioFileURL = [[NSURL URLWithString:docPath]
                         URLByAppendingPathComponent:@"recording.m4a"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleRecord:(UIButton *)sender {
    if ([self.recorder isRecording]) {
        [self.recorder stop];
        [sender setTitle:@"Record" forState:UIControlStateNormal];
        return;
    }
    [sender setTitle:@"Stop" forState:UIControlStateNormal];
    
    NSError *err = nil;
    self.recorder = [[AVAudioRecorder alloc]
                     initWithURL:self.audioFileURL
                     settings:@{AVFormatIDKey: @(kAudioFormatMPEG4AAC),
                                AVNumberOfChannelsKey: @(2),
                                AVSampleRateKey: @(44100)}
                     error:&err];
    if (err != nil) {
        NSLog(@"Error creating recorder: %@", err.localizedDescription);
        abort();
    }
    [self.recorder record];
}


@end
