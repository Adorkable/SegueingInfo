SegueingInfo
============

[![Pod Version](http://img.shields.io/cocoapods/v/SegueingInfo.svg?style=flat)](http://cocoadocs.org/docsets/SegueingInfo/)
[![Pod Platform](http://img.shields.io/cocoapods/p/SegueingInfo.svg?style=flat)](http://cocoadocs.org/docsets/SegueingInfo/)
[![Pod License](http://img.shields.io/cocoapods/l/SegueingInfo.svg?style=flat)](http://cocoadocs.org/docsets/SegueingInfo/)
[![Build Status](http://img.shields.io/travis/Adorkable/SegueingInfo.svg?branch=master&style=flat)](https://travis-ci.org/Adorkable/SegueingInfo)


**SegueingInfo** provides a simple interface, category, and class for passing data between segueing *UIViewController*s in iOS and OSX *UIStoryboard*s using the `sender` parameter of the `performSegueWithIdentifier:sender:` selector. You should use this to enforce a formal, declarative interface that encourages modularity and weak dependancy.

Installation
---
**SegueingInfo** is available through **[cocoapods](http://cocoapods.org)**, to install simple add the following line to your `PodFile`:

``` ruby
  pod "SegueingInfo"
```

Alternatively you can clone the **[github repo](https://github.com/Adorkable/SegueingInfo)**.

Setup
---

Once installed you'll first want to import the main header file:

``` Objective-C
#import <SegueingInfo/SeguingInfo.h>
```

Next your destination *UIViewController* subclass must conform to the protocol `SegueingInfoViewController`, it will receive the information you pass, typically before `viewDidLoad`, through the selector

``` Objective-C
- (void)destinationPrepareForSegue:(UIStoryboardSegue *)segue info:(id)info
{
	...
}
```

Finally you have two options:

1. You can change your source *UIViewController*'s parent class to `SegueingInfoViewController` to have it automatically forward your information on segue.
2. The `*UIViewController* **(SegueingInfo)**` category provides the class selector `prepareDestinationViewControllerForSegue:withInfo:` for forwarding your info on to the destination *UIViewController* manually. Typically you'll be calling this from your *UIViewController*'s `prepareForSegue:sender:`.

To pass information simply call the appropriate `performSegueWithIdentifier:sender:` call and pass your information into the sender parameter:

``` Objective-C
...
[self performSegueWithIdentifier:"Next" sender:someObjectWithInfo];
...
```

Contributing
---
If you have any ideas, suggestions or bugs to report please [create an issue](https://github.com/Adorkable/SegueingInfo/issues/new) labeled *feature* or *bug* (check to see if the issue exists first please!). Or suggest a pull request!