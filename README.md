MSSPopMasonry
===========

Use [Masonry](https://github.com/cloudkite/Masonry/) with the [Facebook Pop](https://github.com/facebook/pop/) animation framework.

MSSPopMasonry is the marriage between Pop and Masonry. Here's an example of how to animate a Masonry layout constraint:

```objective-c
[myView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);

        self.leftSideConstraint = make.left.equalTo(self.view).offset(0);
    }];

newOffset = 100;
POPBasicAnimation *leftSideAnimation = [POPBasicAnimation new];
leftSideAnimation = @(newOffset);
leftSideAnimation.property = [POPAnimatableProperty mas_offsetProperty];

[self.leftSideConstraint pop_addAnimation:leftWidthAnimation forKey:@"offset"];
```
