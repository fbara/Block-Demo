//
//  BLCustomActionSheet.h
//  BlockDemo
//
//  Created by Frank Bara on 3/2/16.
//  Copyright © 2016 BaraLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface BLCustomActionSheet : NSObject <UIActionSheetDelegate>

- (id)initWithTitle:(NSString *)title delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;

- (void)showInView:(UIView *)view withCompletionHandler:(void (^)(NSString *buttonTitle, NSInteger buttonIndex))handler;

@end
