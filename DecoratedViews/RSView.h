//
//  RSView.h
//  DecoratedViews
//
//  Created by Mark Williams on 06/06/2014.
//  Copyright (c) 2014 Mark Williams. All rights reserved.
//

#import <UIKit/UIKit.h>

//
// Create interface for the operation we want wrap with alternate behaviours
//
@protocol RSViewBuilder <NSObject>

// This is operation we want to wrap with behavior modifiers
- (void)buildView:(UIView *)view;

@end




//
// This is the main class that will typically do most of the work
// In this case we're piggybacking UIView
//
@interface RSView : UIView <RSViewBuilder>
@end




//
// Decorator base. This class is typically abstract. It
// isn't in this case but we no-one should be creating
// instances of it
//
@interface RSViewBuilderDecorator : RSView
@property(nonatomic, strong) id<RSViewBuilder> decoratedView;
// Decoration is typically done in the constructor of the abstract decorator
// but this example is deliberately avoiding that.
- (id<RSViewBuilder>)decorateView:(id<RSViewBuilder>)decoratedView;
@end




//
// Concrete decorator 1
//
@interface RSLabelViewBuilderDecorator : RSViewBuilderDecorator
@end




//
// Concrete decorator 2
//
@interface RSColouredViewBuilderDecorator : RSViewBuilderDecorator
@end
