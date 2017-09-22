//
//  StoryPartPageViewController.m
//  AVStoryBook
//
//  Created by Jaison Bhatti on 2017-09-22.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import "StoryPartPageViewController.h"

@interface StoryPartPageViewController () <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@end

@implementation StoryPartPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = self;
    self.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
