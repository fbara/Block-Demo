//
//  BLCustomActionSheet.m
//  BlockDemo
//
//  Created by Frank Bara on 3/2/16.
//  Copyright © 2016 BaraLabs. All rights reserved.
//

#import "BLCustomActionSheet.h"

@interface BLCustomActionSheet ()
@property (nonatomic, strong)UIActionSheet *actionSheet;
@property (nonatomic, strong)void(^completionHandler)(NSString *, NSInteger);

@end

@implementation BLCustomActionSheet

- (id)initWithTitle:(NSString *)title delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...{
    
    self = [super init];
    if (self) {
        _actionSheet = [[UIActionSheet alloc] initWithTitle:title
                                                   delegate:self
                                          cancelButtonTitle:nil
                                     destructiveButtonTitle:destructiveButtonTitle
                                          otherButtonTitles:nil];
        //It’s actually a pointer to a list that contains a variable number of objects (usually called 'arguments').
        va_list arguments;
        //It initializes the va_list pointer, making it point to the first argument of the list.
        va_start(arguments, otherButtonTitles);
        NSString *currentButtonTitle = otherButtonTitles;
        while (currentButtonTitle != nil) {
            //Add all button titles one by one.
            [_actionSheet addButtonWithTitle:currentButtonTitle];
            //It gets the next object of the list (to make it more clear, the next button title in our case).
            //The second argument is always the type of the argument, because this function needs to know how many bytes should extract.
            currentButtonTitle = va_arg(arguments, NSString *);
        }
        //It just releases any allocated memory required for accessing the list and extracting all arguments.
        va_end(arguments);
        
        //After all button titles, add the Cancel button as the last button
        [_actionSheet addButtonWithTitle:cancelButtonTitle];
        [_actionSheet setCancelButtonIndex:_actionSheet.numberOfButtons - 1];
    }
    
    return self;
    
}

- (void)showInView:(UIView *)view withCompletionHandler:(void (^)(NSString *, NSInteger))handler {
    //In our class member variable 'completionHandler' we assign the 'handler' block object passed as a parameter to the method.
    //That way, we keep a reference to it even after the method has exited.
    _completionHandler = handler;
    [_actionSheet showInView:view];
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //The tapped button’s title is assigned to a NSString variable
    NSString *buttonTitle = [_actionSheet buttonTitleAtIndex:buttonIndex];
    
    _completionHandler(buttonTitle, buttonIndex);
}

@end
