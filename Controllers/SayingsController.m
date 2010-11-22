    //
//  SayingsController.m
//  iPhrasr
//
//  Created by Tobias Bielohlawek on 22.11.10.
//  Copyright 2010 SoundCloud. All rights reserved.
//

#import "SayingsController.h"


@implementation SayingsController

@synthesize leftSentenceLabel = _leftSentenceLabel;
@synthesize rightSentenceLabel = _rightSentenceLabel;

// Kann man noch überschreiben

- (UILabel *)leftSentenceLabel
{
    return _leftSentenceLabel;
}
 
- (void)setLeftSentenceLabel:(UILabel *)label
{
    // autorelease:
    // für den Fall, dass _leftSentenceLabel == label
    // sonst würde release das gleiche Ergebnis haben

    [_leftSentenceLabel autorelease];
    _leftSentenceLabel = [label retain]; // => Ich bin jetzt Owner, ich brauche ein passendes release

    // Auf nil kann man alles aufrufen!
    // [nil release]; // hat keine Wirkung

    // Alle Member werden standardmäßig initialisiert mit nil oder 0.
}


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.leftSentenceLabel.text = @"Ein erster Test,";   // NSString-Objekt
    self.rightSentenceLabel.text = @"der funktioniert.";  // NSString-Objekt
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    // hier passende releases
    [_leftSentenceLabel release];
    [_rightSentenceLabel release];

     [super dealloc];
}


@end
