//
//  bouncesaverView.h
//  bouncesaver
//
//  Created by Brian Tracy on 5/13/18.
//  Copyright © 2018 Brian Tracy. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>

@interface bouncesaverView : ScreenSaverView
@property NSImage * dvdLogo;
@property NSColor * dvdColor;
@property NSRect dirtyRect;

@property int dvdWidth, dvdHeight;
@property int x, y;
@property int xSpeed, ySpeed;
@end
