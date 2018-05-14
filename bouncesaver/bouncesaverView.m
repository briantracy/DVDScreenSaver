//
//  bouncesaverView.m
//  bouncesaver
//
//  Created by Brian Tracy on 5/13/18.
//  Copyright © 2018 Brian Tracy. All rights reserved.
//

#import "bouncesaverView.h"
#define WIDTH ([NSScreen mainScreen].frame.size.width)
#define HEIGHT ([NSScreen mainScreen].frame.size.height)

// d = r * t
// r = d / t
// r = width / 10 seconds. 

@implementation bouncesaverView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];

        
        const int speed = 2;
       
        self.dvdWidth = 512;
        self.dvdHeight = 256;
        self.x = WIDTH / 2.0 - self.dvdWidth / 2.0;
        self.y = HEIGHT / 2.0 - self.dvdHeight / 2.0;
        self.xSpeed = speed * (arc4random() % 2 == 0 ? 1 : -1);
        self.ySpeed = speed * (arc4random() % 2 == 0 ? 1 : -1);
        //self.dvdLogo = [[NSImage alloc] initWithContentsOfFile:@"/Users/briantracy/Desktop/Projects/bouncesaver/dvdlogo.png"];
        
        NSString * dvdPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"dvdlogo" ofType:@"png"];
        
        
        self.dvdLogo = [[NSImage alloc] initWithContentsOfFile:dvdPath];
        [self hitWall];
        //self.path = [NSBezierPath bezierPathWithOvalInRect:<#(NSRect)#>]
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}



- (void)drawRect:(NSRect)rectParam
{
    const float g = 48.0f/255.0f;
    [[NSColor colorWithRed:g green:g blue:g alpha:1.0f] setFill];
    NSRectFill(rectParam);
    NSRect rect;
    NSSize size;

    
    size = [self bounds].size;
    
    rect.size = NSMakeSize(self.dvdWidth, self.dvdHeight);
    
    self.x += self.xSpeed;
    self.y += self.ySpeed;
    rect.origin = CGPointMake(self.x, self.y);
    
    
    //self.path = [NSBezierPath bezierPathWithOvalInRect:rect];
    
    


    //[self.path fill];
    
    
    [self.dvdLogo drawInRect:rect];
    
    CGPoint center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    
    
    
    if (center.x + self.dvdWidth / 2 >= WIDTH || center.x - self.dvdWidth / 2 <= 0) {
        self.xSpeed *= -1;
        [self hitWall];
    }
    
    if (center.y + self.dvdHeight / 2 >= HEIGHT || center.y - self.dvdHeight / 2 <= 0) {
        self.ySpeed *= -1;
        [self hitWall];
    }

}

- (void)hitWall
{
    
    
    NSArray * colors = @[[NSColor redColor],
                         [NSColor blueColor],
                         [NSColor yellowColor],
                         [NSColor cyanColor],
                         [NSColor orangeColor],
                         [NSColor magentaColor],
                         [NSColor greenColor]
                         ];
    
    self.dvdColor = colors[arc4random() % [colors count]];
    
    [self.dvdLogo lockFocus];
    [self.dvdColor set];
    NSRect imageRect = {NSZeroPoint, [self.dvdLogo size]};
    NSRectFillUsingOperation(imageRect, NSCompositingOperationSourceAtop);
    [self.dvdLogo unlockFocus];
}

- (void)animateOneFrame
{
    [self setNeedsDisplay:true];
    return;
}



- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
