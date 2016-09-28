//
//  UIView+draggable.m
//  UIView+draggable
//
//  Created by Andrea on 13/03/14.
//  Copyright (c) 2014 Fancy Pixel. All rights reserved.
//

#import "UIView+draggable.h"
#import <objc/runtime.h>

@interface UIView ()

/**-----------------------------------------------------------------------------
 * @name UIView+draggable Properties
 * -----------------------------------------------------------------------------
 */

/** The pan gestures that handles the view dragging
 *
 * @param panGesture The tint color of the blurred view. Set to nil to reset.
 */
@property (nonatomic) UIPanGestureRecognizer *panGesture;

/**
 A caging area such that the view can not be moved outside
 of this frame.
 
 If @c cagingArea is not @c CGRectZero, and @c cagingArea does not contain the
 view's frame then this does nothing (ie. if the bounds of the view extend the
 bounds of @c cagingArea).
 
 Optional. If not set, defaults to @c CGRectZero, which will result
 in no caging behavior.
 */
@property (nonatomic) CGRect cagingArea;

/**
 Restricts the area of the view where the drag action starts.
 
 Optional. If not set, defaults to self.view.
 */
@property (nonatomic) CGRect handle;

/**
 Restricts the movement along the X axis
 */
@property (nonatomic) BOOL shouldMoveAlongX;

/**
 Restricts the movement along the Y axis
 */
@property (nonatomic) BOOL shouldMoveAlongY;

/**
 Notifies when dragging started
 */
@property (nonatomic, copy) void (^draggingStartedBlock)();

/**
 Notifies when dragging ended
 */
@property (nonatomic, copy) void (^draggingEndedBlock)();
@end

@implementation UIView (draggable)

- (void)setPanGesture:(UIPanGestureRecognizer*)panGesture
{
    objc_setAssociatedObject(self, @selector(panGesture), panGesture, OBJC_ASSOCIATION_RETAIN);
}

- (UIPanGestureRecognizer*)panGesture
{
    return objc_getAssociatedObject(self, @selector(panGesture));
}

- (void)setCagingArea:(CGRect)cagingArea
{
    if (CGRectEqualToRect(cagingArea, CGRectZero) ||
        CGRectContainsRect(cagingArea, self.frame)) {
        NSValue *cagingAreaValue = [NSValue valueWithCGRect:cagingArea];
        objc_setAssociatedObject(self, @selector(cagingArea), cagingAreaValue, OBJC_ASSOCIATION_RETAIN);
    }
}

- (CGRect)cagingArea
{
    NSValue *cagingAreaValue = objc_getAssociatedObject(self, @selector(cagingArea));
    return [cagingAreaValue CGRectValue];
}

- (void)setHandle:(CGRect)handle
{
    CGRect relativeFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    if (CGRectContainsRect(relativeFrame, handle)) {
        NSValue *handleValue = [NSValue valueWithCGRect:handle];
        objc_setAssociatedObject(self, @selector(handle), handleValue, OBJC_ASSOCIATION_RETAIN);
    }
}

- (CGRect)handle
{
    NSValue *handleValue = objc_getAssociatedObject(self, @selector(handle));
    return [handleValue CGRectValue];
}

- (void)setShouldMoveAlongY:(BOOL)newShould
{
    NSNumber *shouldMoveAlongYBool = [NSNumber numberWithBool:newShould];
    objc_setAssociatedObject(self, @selector(shouldMoveAlongY), shouldMoveAlongYBool, OBJC_ASSOCIATION_RETAIN );
}

- (BOOL)shouldMoveAlongY
{
    NSNumber *moveAlongY = objc_getAssociatedObject(self, @selector(shouldMoveAlongY));
    return (moveAlongY) ? [moveAlongY boolValue] : YES;
}

- (void)setShouldMoveAlongX:(BOOL)newShould
{
    NSNumber *shouldMoveAlongXBool = [NSNumber numberWithBool:newShould];
    objc_setAssociatedObject(self, @selector(shouldMoveAlongX), shouldMoveAlongXBool, OBJC_ASSOCIATION_RETAIN );
}

- (BOOL)shouldMoveAlongX
{
    NSNumber *moveAlongX = objc_getAssociatedObject(self, @selector(shouldMoveAlongX));
    return (moveAlongX) ? [moveAlongX boolValue] : YES;
}

- (void)setDraggingStartedBlock:(void (^)())draggingStartedBlock
{
    objc_setAssociatedObject(self, @selector(draggingStartedBlock), draggingStartedBlock, OBJC_ASSOCIATION_RETAIN);
}

- (void (^)())draggingStartedBlock
{
    return objc_getAssociatedObject(self, @selector(draggingStartedBlock));
}

- (void)setDraggingEndedBlock:(void (^)())draggingEndedBlock
{
    objc_setAssociatedObject(self, @selector(draggingEndedBlock), draggingEndedBlock, OBJC_ASSOCIATION_RETAIN);
}

- (void (^)())draggingEndedBlock
{
    return objc_getAssociatedObject(self, @selector(draggingEndedBlock));
}

- (void)handlePan:(UIPanGestureRecognizer*)sender
{
    // Check to make you drag from dragging area
    CGPoint locationInView = [sender locationInView:self];
    if (!CGRectContainsPoint(self.handle, locationInView)) {
        return;
    }
    
    [self adjustAnchorPointForGestureRecognizer:sender];
    
    if (sender.state == UIGestureRecognizerStateBegan && self.draggingStartedBlock) {
        self.draggingStartedBlock();
    }
    
    if (sender.state == UIGestureRecognizerStateEnded && self.draggingEndedBlock) {
        self.draggingEndedBlock();
    }
    
    CGPoint translation = [sender translationInView:[self superview]];
    
    CGFloat newXOrigin = CGRectGetMinX(self.frame) + (([self shouldMoveAlongX]) ? translation.x : 0);
    CGFloat newYOrigin = CGRectGetMinY(self.frame) + (([self shouldMoveAlongY]) ? translation.y : 0);
    
    CGRect cagingArea = self.cagingArea;
    
    CGFloat cagingAreaOriginX = CGRectGetMinX(cagingArea);
    CGFloat cagingAreaOriginY = CGRectGetMinY(cagingArea);
    
    CGFloat cagingAreaRightSide = cagingAreaOriginX + CGRectGetWidth(cagingArea);
    CGFloat cagingAreaBottomSide = cagingAreaOriginY + CGRectGetHeight(cagingArea);
    
    if (!CGRectEqualToRect(cagingArea, CGRectZero)) {
        
        // Check to make sure the view is still within the caging area
        if (newXOrigin <= cagingAreaOriginX ||
            newYOrigin <= cagingAreaOriginY ||
            newXOrigin + CGRectGetWidth(self.frame) >= cagingAreaRightSide ||
            newYOrigin + CGRectGetHeight(self.frame) >= cagingAreaBottomSide) {
            
            // Don't move
            newXOrigin = CGRectGetMinX(self.frame);
            newYOrigin = CGRectGetMinY(self.frame);
        }
    }
    
    [self setFrame:CGRectMake(newXOrigin,
                              newYOrigin,
                              CGRectGetWidth(self.frame),
                              CGRectGetHeight(self.frame))];
    
    [sender setTranslation:(CGPoint){0, 0} inView:[self superview]];
}

- (void)adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        UIView *piece = self;
        CGPoint locationInView = [gestureRecognizer locationInView:piece];
        CGPoint locationInSuperview = [gestureRecognizer locationInView:piece.superview];
        
        piece.layer.anchorPoint = CGPointMake(locationInView.x / piece.bounds.size.width, locationInView.y / piece.bounds.size.height);
        piece.center = locationInSuperview;
    }
}

- (void)setDraggable:(BOOL)draggable
{
    [self.panGesture setEnabled:draggable];
}

- (void)enableDragging
{
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.panGesture setMaximumNumberOfTouches:1];
    [self.panGesture setMinimumNumberOfTouches:1];
    [self.panGesture setCancelsTouchesInView:NO];
    [self setHandle:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addGestureRecognizer:self.panGesture];
}

@end
