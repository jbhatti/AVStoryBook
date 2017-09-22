//
//  Model.h
//  AVStoryBook
//
//  Created by Jaison Bhatti on 2017-09-22.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Model : NSObject

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic,strong) NSURL *audioFileURL;
@property (nonatomic,strong) AVAudioRecorder *recorder;
@property (nonatomic,strong) AVAudioPlayer *player;

@end
