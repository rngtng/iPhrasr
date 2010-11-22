//
//  main.m
//  iPhrasr
//
//  Created by Tobias Bielohlawek on 22.11.10.
//  Copyright 2010 SoundCloud. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[])
{    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, nil);
    [pool release];
    return retVal;

    /*                                                             Retain count
        Alloziieren: NSString *test = [[NSString alloc] init];     +1
           Retainen: NSString *myTest = [test retain];             +2
            Release: [test release];                               +1
        Autorelease: [myTest autorelease];                         +1 (-1 autorelease)

     Standardmäßig werden autoreleasede Objekte im Run-Loop released.

     Retain count auf 0: Aufruf von [obj dealloc]

       Paare: alloc - dealloc (Speicherallokation)
              alloc/init, copy, new, retain ODER retain/copy-property <-> release, autorelease

     http://aspirement.com/2009/09/mastering-cocoa-memory-management-on-the-iphone/
     */
}
