//
//  AppDelegate.h
//  Cocoa Pasteboards
//
//  Created by Nikola Grujic on 21/01/2020.
//  Copyright © 2020 Mac Developers. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *textFieldCopyFrom;
@property (weak) IBOutlet NSTextField *textFieldCopyTo;

- (void)writeToPasteboard:(NSPasteboard*)pasteboard
                    value:(NSString*)string;
- (BOOL)readFromPasteboard:(NSPasteboard*)pasteboard;

- (IBAction)cut:(id)sender;
- (IBAction)copy:(id)sender;
- (IBAction)paste:(id)sender;

@end

