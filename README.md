MSSPopMasonry
===========

Use [Masonry](https://github.com/cloudkite/Masonry/) with the [Facebook Pop](https://github.com/facebook/pop/) animation framework.

MSSPopMasonry is the marriage between Pop and Masonry. It is a category on `POPAnimatableProperty` that lets you easily create `POPAnimatableProperty` objects that works great with Masonry. Here's an example of how to animate a Masonry layout constraint using the offset property:

```objective-c
[myView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);

        self.leftSideConstraint = make.left.equalTo(self.view).offset(0);
    }];

newOffset = 100;
POPBasicAnimation *leftSideAnimation = [POPBasicAnimation new];
leftSideAnimation.toValue = @(newOffset);
leftSideAnimation.property = [POPAnimatableProperty mas_offsetProperty];

[self.leftSideConstraint pop_addAnimation:leftSideAnimation forKey:@"offset"];
```

The MASConstraint properties supported currently:
- `offset`
- `sizeOffset`
- `centerOffset`
- `multipliedBy`
- `dividedBy`

Support for `insets` is pending Pop supporting `UIEdgeInsets` in `NSValue` objects when passed to an animation object's `toValue` property.

## Installation
You can import the MSSPopMasonry files as is or through Cocoapods. If you want to use MSSPopMasonry with the latest versions of Pop and Masonry, all you have to do is specify
```
pod 'MSSPopMasonry' 
```
in your `Podfile` and both Pop and Masonry will be included in your project along with MSSPopMasonry.

