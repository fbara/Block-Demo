//
//  ViewController.m
//  BlockDemo
//
//  Created by Frank Bara on 3/2/16.
//  Copyright © 2016 BaraLabs. All rights reserved.
//

#import "ViewController.h"
#import "BLCustomActionSheet.h"

@interface ViewController ()

@property (nonatomic, strong)BLCustomActionSheet *customActionSheet;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

-(void)showActionSheet:(id)sender {
    _customActionSheet = [[BLCustomActionSheet alloc] initWithTitle:@"ActionSheet"
                                                           delegate:nil
                                                  cancelButtonTitle:@"Cancel"
                                             destructiveButtonTitle:nil
                                                  otherButtonTitles:@"Option 1", @"Option 2", @"Option 3", nil];
    
    [_customActionSheet showInView:self.view withCompletionHandler:^(NSString *buttonTitle, NSInteger buttonIndex) {
        NSLog(@"You tapped the button in index: %ld", (long)buttonIndex);
        NSLog(@"Your selection is: %@", buttonTitle);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
