//
//  POPAnimatableProperty+Masonry.m
//
//  Created by Mikkel Selsøe Sørensen on 30/05/14.
//

#import "POPAnimatableProperty+Masonry.h"

@implementation POPAnimatableProperty (Masonry)

+ (POPAnimatableProperty*) mas_offsetProperty {
    return [POPAnimatableProperty propertyWithName:@"offset" initializer:^(POPMutableAnimatableProperty *prop) {
        prop.readBlock = ^(MASConstraint *constraint, CGFloat values[]) {
            values[0] = (CGFloat)[[constraint valueForKey:@"layoutConstant"] floatValue];
        };
        
        prop.writeBlock = ^(MASConstraint *constraint, const CGFloat values[]) {
            [constraint setOffset:values[0]];
        };
    }];
}

@end
