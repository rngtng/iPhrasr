//
//  SayingsController.h
//  iPhrasr
//
//  Created by Tobias Bielohlawek on 22.11.10.
//  Copyright 2010 SoundCloud. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SayingsController : UIViewController
{
    UILabel *_leftSentenceLabel;
    UILabel *_rightSentenceLabel;
}

/*
    Properties:
    im Header:
    - @property - Definition
    - passender Member
    im Implementation File:
    - @synthesize - Direktive oder selbst Getter/Setter schreiben
 
 */

// Keywords: assign, retain, copy (Speichermanagement)
// nonatomic: kein Threading-Code
// default: atomic (Overhead)
@property (nonatomic, retain) IBOutlet UILabel *leftSentenceLabel;
@property (nonatomic, retain) IBOutlet UILabel *rightSentenceLabel;

/* =>
 
 - (UILabel *)leftSentenceLabel;                    // getter
 - (void)setLeftSentenceLabel:(UILabel *)label;     // setter
 
 // Dot-Syntax:
 // nur mit @properties

 label = myInstance.leftSentenceLabel;
 myInstance.leftSentenceLabel = nil;

 // in der Klasse (.m File):
 self.leftSentenceLabel
 _leftSentenceLabel
 
*/

@end
