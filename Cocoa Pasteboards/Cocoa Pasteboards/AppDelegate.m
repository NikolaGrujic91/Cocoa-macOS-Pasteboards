//
//  AppDelegate.m
//  Cocoa Pasteboards
//
//  Created by Nikola Grujic on 21/01/2020.
//  Copyright © 2020 Mac Developers. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)writeToPasteboard:(NSPasteboard*)pasteboard
                    value:(NSString*)string
{
    [pasteboard clearContents];
    [pasteboard writeObjects:[NSArray arrayWithObject:string]];
}

- (BOOL)readFromPasteboard:(NSPasteboard*)pasteboard
{
    NSArray* classes = [NSArray arrayWithObject:[NSString class]];
    NSArray* objects = [pasteboard readObjectsForClasses:classes options:nil];
    
    if ([objects count] == 0)
    {
        return NO;
    }
    
    NSString* value = [objects objectAtIndex:0];
    [_textFieldCopyTo setStringValue:value];
    return YES;
}

#pragma mark Action methods

- (IBAction)cut:(id)sender
{
    [self copy:sender];
    [_textFieldCopyFrom setStringValue:@""];
}

- (IBAction)copy:(id)sender
{
    NSPasteboard* pasteboard = [NSPasteboard generalPasteboard];
    [self writeToPasteboard:pasteboard value:[_textFieldCopyFrom stringValue]];
}

- (IBAction)paste:(id)sender
{
    NSPasteboard* pasteboard = [NSPasteboard generalPasteboard];
    [self readFromPasteboard:pasteboard];
}

@end
