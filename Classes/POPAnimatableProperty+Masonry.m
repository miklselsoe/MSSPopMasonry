//
//  POPAnimatableProperty+Masonry.m
//
//  Created by Mikkel Selsøe Sørensen on 30/05/14.
//

#import "POPAnimatableProperty+Masonry.h"
#import "Masonry.h"

CGFloat getLayoutConstant(MASConstraint* constraint) {
    return (CGFloat)[[constraint valueForKey:@"layoutConstant"] floatValue];
}

CGFloat getLayoutMultiplier(MASConstraint* constraint) {
    return (CGFloat)[[constraint valueForKey:@"layoutMultiplier"] floatValue];
}

void setLayoutMultiplier(MASConstraint* constraint, CGFloat multiplier) {
    [constraint setValue:@(multiplier) forKey:@"layoutMultiplier"];
}

NSArray* getChildren(MASCompositeConstraint* constraint)  {
    return [constraint valueForKey:@"childConstraints"];
}

@implementation POPAnimatableProperty (Masonry)

#pragma mark - Constants

+ (POPAnimatableProperty*) mas_offsetProperty {
    return [POPAnimatableProperty propertyWithName:@"offset" initializer:^(POPMutableAnimatableProperty *prop) {
        prop.readBlock = ^(MASConstraint *constraint, CGFloat values[]) {
            values[0] = getLayoutConstant(constraint);
        };
        
        prop.writeBlock = ^(MASConstraint *constraint, const CGFloat values[]) {
            [constraint setOffset:values[0]];
        };
    }];
}

#pragma mark Structs

+ (POPAnimatableProperty*) mas_sizeOffsetProperty {
    return [POPAnimatableProperty propertyWithName:@"sizeOffset" initializer:^(POPMutableAnimatableProperty *prop) {
        prop.readBlock = ^(MASCompositeConstraint *constraint, CGFloat values[]) {
            CGSize size = CGSizeZero;
            NSArray *childConstraints = getChildren(constraint);
            
            for (MASViewConstraint *childConstraint in childConstraints) {
                NSLayoutAttribute layoutAttribute = childConstraint.firstViewAttribute.layoutAttribute;
                switch (layoutAttribute) {
                    case NSLayoutAttributeWidth:
                        size.width = getLayoutConstant(childConstraint);
                        break;
                    case NSLayoutAttributeHeight:
                        size.height = getLayoutConstant(childConstraint);
                        break;
                    default:
                        break;
                }
            }
            
            values[0] = size.width;
            values[1] = size.height;
        };
        
        prop.writeBlock = ^(MASConstraint *constraint, const CGFloat values[]) {
            CGSize size = CGSizeMake(values[0], values[1]);
            [constraint setSizeOffset:size];
        };
    }];
}

+ (POPAnimatableProperty*) mas_centerOffsetProperty {
    return [POPAnimatableProperty propertyWithName:@"centerOffset" initializer:^(POPMutableAnimatableProperty *prop) {
        prop.readBlock = ^(MASCompositeConstraint *constraint, CGFloat values[]) {
            CGPoint offset = CGPointZero;
            NSArray *childConstraints = getChildren(constraint);
            
            for (MASViewConstraint *childConstraint in childConstraints) {
                NSLayoutAttribute layoutAttribute = childConstraint.firstViewAttribute.layoutAttribute;
                switch (layoutAttribute) {
                    case NSLayoutAttributeCenterX:
                        offset.x = getLayoutConstant(childConstraint);
                        break;
                    case NSLayoutAttributeCenterY:
                        offset.y = getLayoutConstant(childConstraint);
                        break;
                    default:
                        break;
                }
            }
            
            values[0] = offset.x;
            values[1] = offset.y;
        };
        
        prop.writeBlock = ^(MASConstraint *constraint, const CGFloat values[]) {
            CGPoint offset = CGPointMake(values[0], values[1]);
            [constraint setCenterOffset:offset];
        };
    }];
}

//+ (POPAnimatableProperty*) mas_insetsProperty {
//    return [POPAnimatableProperty propertyWithName:@"insets" initializer:^(POPMutableAnimatableProperty *prop) {
//        prop.readBlock = ^(MASCompositeConstraint *constraint, CGFloat values[]) {
//            MASEdgeInsets insets;
//            NSArray *childConstraints = getChildren(constraint);
//
//            for (MASViewConstraint *childConstraint in childConstraints) {
//                NSLayoutAttribute layoutAttribute = childConstraint.firstViewAttribute.layoutAttribute;
//                switch (layoutAttribute) {
//                    case NSLayoutAttributeLeft:
//                        insets.left = getLayoutConstant(childConstraint);
//                        break;
//                    case NSLayoutAttributeTop:
//                        insets.top = getLayoutConstant(childConstraint);
//                        break;
//                    case NSLayoutAttributeBottom:
//                        insets.bottom = -getLayoutConstant(childConstraint);
//                        break;
//                    case NSLayoutAttributeRight:
//                        insets.right = -getLayoutConstant(childConstraint);
//                        break;
//                    default:
//                        break;
//                }
//            }
//
//            values[0] = insets.top;
//            values[1] = insets.left;
//            values[2] = insets.bottom;
//            values[3] = insets.right;
//        };
//
//        prop.writeBlock = ^(MASConstraint *constraint, const CGFloat values[]) {
//            MASEdgeInsets insets = (MASEdgeInsets){values[0], values[1], values[2], values[3]};
//            [constraint setInsets:insets];
//        };
//    }];
//}

#pragma mark - Multipliers

+ (POPAnimatableProperty*) mas_multipliedByProperty {
    return [POPAnimatableProperty propertyWithName:@"multiplier" initializer:^(POPMutableAnimatableProperty *prop) {
        prop.readBlock = ^(MASConstraint *constraint, CGFloat values[]) {
            values[0] = getLayoutMultiplier(constraint);
        };
        
        prop.writeBlock = ^(MASConstraint *constraint, const CGFloat values[]) {
            setLayoutMultiplier(constraint, values[0]);
        };
    }];
}

+ (POPAnimatableProperty*) mas_dividedByProperty {
    return [POPAnimatableProperty propertyWithName:@"divider" initializer:^(POPMutableAnimatableProperty *prop) {
        prop.readBlock = ^(MASConstraint *constraint, CGFloat values[]) {
            values[0] = getLayoutMultiplier(constraint);
        };
        
        prop.writeBlock = ^(MASConstraint *constraint, const CGFloat values[]) {
            setLayoutMultiplier(constraint, 1.0/values[0]);
        };
    }];
}

@end
