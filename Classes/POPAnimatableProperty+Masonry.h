//
//  POPAnimatableProperty+Masonry.h
//
//  Created by Mikkel Selsøe Sørensen on 30/05/14.
//

#import "pop/POPAnimatableProperty.h"

@interface POPAnimatableProperty (Masonry)

+ (POPAnimatableProperty*) mas_offsetProperty;
+ (POPAnimatableProperty*) mas_sizeOffsetProperty;
+ (POPAnimatableProperty*) mas_centerOffsetProperty;
+ (POPAnimatableProperty*) mas_multipliedByProperty;
+ (POPAnimatableProperty*) mas_dividedByProperty;

// POP does not support all value types
//+ (POPAnimatableProperty*) mas_insetsProperty;


@end
