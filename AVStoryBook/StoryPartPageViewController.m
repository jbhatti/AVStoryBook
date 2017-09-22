//
//  StoryPartPageViewController.m
//  AVStoryBook
//
//  Created by Jaison Bhatti on 2017-09-22.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import "StoryPartPageViewController.h"
#import "StoryPartViewController.h"

@interface StoryPartPageViewController () <UIPageViewControllerDelegate, UIPageViewControllerDataSource>
@property (nonatomic) NSArray* myPhotos;

@end

@implementation StoryPartPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = self;
    self.delegate = self;
    // Do any additional setup after loading the view.
    self.myPhotos = @[@"Page1", @"Page2", @"Page3", @"Page4", @"Page5"];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    StoryPartViewController *storyPartViewController = [storyboard instantiateViewControllerWithIdentifier:@"StoryPartViewController"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    return nil;
}


- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    return nil;
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
