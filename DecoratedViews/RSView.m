//
//  RSView.m
//  DecoratedViews
//
//  Created by Mark Williams on 06/06/2014.
//  Copyright (c) 2014 Mark Williams. All rights reserved.
//

#import "RSView.h"

@implementation RSViewBuilderDecorator

// This is where we decorate our objects. Although subclasses can
// override this they really shouldn't be doing.
- (id<RSViewBuilder>)decorateView:(RSView *)decoratedView
{
	NSLog(@"Decorating %@ with %@", [decoratedView class], [self class]);
	self.decoratedView = decoratedView;
	return self;
}

// Chain calls to buildView
// Derived classes should be calling this
- (void)buildView:(UIView *)view
{
	[self.decoratedView buildView:view];
	NSLog(@"RSViewBuilderDecorator buildView");
}

@end





@implementation RSLabelViewBuilderDecorator

// Customised behavior
- (void)buildView:(UIView *)view
{
	// Always call base implementation
	[super buildView:view];

	UILabel *label = [[UILabel alloc] initWithFrame:view.frame];
	[view addSubview:label];
	label.text = @"Label View";
	label.textColor = [UIColor whiteColor];
	label.textAlignment = NSTextAlignmentCenter;
	NSLog(@"RSLabelViewBuilderDecorator buildView");
}

@end





@implementation RSColouredViewBuilderDecorator

// Customised behavior
- (void)buildView:(UIView *)view
{
	// Always call base implementation
	[super buildView:view];

	view.backgroundColor = [UIColor redColor];
	NSLog(@"RSColouredViewBuilderDecorator buildView");
}

@end





@implementation RSView

- (void)buildView:(UIView *)view
{
	CGRect rect = view.frame;
	CGRect smallRect = CGRectInset(rect, 10, 20);
	view.frame = smallRect;
	NSLog(@"RSView buildView");
}

- (id<RSViewBuilder>)decorateView:(id<RSViewBuilder>)decoratedView
{
	// Implemented for clarity.
	// The base object should never be decorating anything.
	assert(NO);
	return nil;
}

@end
