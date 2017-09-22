//
//  StoryPartViewController.m
//  AVStoryBook
//
//  Created by Jaison Bhatti on 2017-09-22.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//


#import "StoryPartViewController.h"
@import AVFoundation;

@interface StoryPartViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
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

- (IBAction)playAudio:(UITapGestureRecognizer *)sender {
    if ([self.player isPlaying]) {
        [self.player stop];
        return;
    }
    
    NSError *err = nil;
    self.player = [[AVAudioPlayer alloc]
                   initWithContentsOfURL:self.audioFileURL
                   error:&err];
    if (err != nil) {
        NSLog(@"Error creating player: %@", err.localizedDescription);
        abort();
    }
    
    [self.player play];
}

- (IBAction)pickImage:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
    NSLog(@"Source types: %@", mediaTypes);
    picker.mediaTypes = mediaTypes;
    
    picker.delegate = self;
    
    [self presentViewController:picker animated:YES completion:^{
        
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSLog(@"media info: %@", info);
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    self.imageView.image = image;
    [self dismissViewControllerAnimated:YES completion:^{    }];
}




@end
