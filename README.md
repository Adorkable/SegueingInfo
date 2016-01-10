SegueingInfo
============

[![Build Status](http://img.shields.io/travis/Adorkable/SegueingInfo.svg?branch=master&style=flat)](https://travis-ci.org/Adorkable/SegueingInfo)
[![Pod Platform](http://img.shields.io/cocoapods/p/SegueingInfo.svg?style=flat)](http://cocoadocs.org/docsets/SegueingInfo/)
[![Pod License](http://img.shields.io/cocoapods/l/SegueingInfo.svg?style=flat)](http://cocoadocs.org/docsets/SegueingInfo/)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Pod Version](http://img.shields.io/cocoapods/v/SegueingInfo.svg?style=flat)](http://cocoadocs.org/docsets/SegueingInfo/)


**SegueingInfo** provides a few simple ways to passs data between segueing View Controller's in both iOS and OSX *UIStoryboard*s in a formal, declarative interface which enforcing modularity and weak dependancy between your View Controller implementations. 

**SegueingInfo** requires minimal code to get up and running and using the `sender` parameter of your `performSegueWithIdentifier(identifier:, sender:)` function call (`performSegueWithIdentifier:sender:` selector in ObjC).

Installation
---
**SegueingInfo** is available through **[Carthage](https://github.com/Carthage/Carthage)**, to install simply add the following to your `Cartfile`:
```Ruby
github "Adorkable/SegueingInfo"
```

 
**SegueingInfo** is also available through **[Cocoapods](http://cocoapods.org)**, to install simply add the following line to your `PodFile`:
```Ruby
  pod "SegueingInfo"
```

Alternatively you can clone the **[github repo](https://github.com/Adorkable/SegueingInfo)**.

Setup
---

Once installed you'll first want to import library:

Swift
```Swift
import SegueingInfo
```

ObjC
```Objective-C
#import <SegueingInfo/SeguingInfo.h>
```

Once set up, to pass information simply call the appropriate `performSegueWithIdentifier`, `popViewController`, etc. call and pass your information into the sender parameter:

Swift
```swift
...
self.performSegueWithIdentifier("Next", sender: someObjectWithInfo)
...
```
ObjC
``` Objective-C
...
[self performSegueWithIdentifier:"Next" sender:someObjectWithInfo];
...
```
	
Next your destination *UIViewController* subclass must conform to the protocol `SegueingInfoDestination`, it will receive the information you pass, through the selector

Swift
```Swift
func destinationPrepareForSegue(segue : UIStoryboardSegue?, info: AnyObject) {
	...
}
```

ObjC
```Objective-C
- (void)destinationPrepareForSegue:(UIStoryboardSegue *)segue info:(id)info
{
	...
}
```

Please note: there is no guarantee as to when your destination View Controller will receive the information relative to `viewDidLoad`. If you plan on using the passed information to populate your interface make sure you use it when `viewDidLoad` has been called and store it off when it hasn't yet.

**Note**: there are plans to provide a more guaranteed handling of this.

Finally you have two options:

1. You can change your source *UIViewController*'s parent class to `SegueingInfoViewController` to have it automatically forward your information on segue.

2. The *UIViewController* **(SegueingInfo)** category provides the class selector `prepareDestinationViewControllerForSegue` for forwarding your info on to the destination *UIViewController* manually. Typically you'll be calling this from your *UIViewController*'s `prepareForSegue`:
	
    Swift
    ```Swift
    override func prepareForSegue(segue : UIStoryboardSegue, sender : AnyObject?) {
    	super.prepareForSegue(segue, sender: sender)
        
        self.prepareDestinationViewControlleForSegue(segue, sender: sender)
    }
    ```
    
    ObjC
	```Objective-C
	- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender 
	{
    	[super prepareForSegue:segue sender:sender];
        
        [self prepareDestinationViewControllerForSegue:segue withInfo:sender];
    }
    ```

Contributing
---
If you have any ideas, suggestions or bugs to report please [create an issue](https://github.com/Adorkable/SegueingInfo/issues/new) labeled *feature* or *bug* (check to see if the issue exists first please!). Or suggest a pull request!

[![waffle.io](https://badge.waffle.io/adorkable/segueinginfo.png?label=ready&title=waffle.io)](https://waffle.io/adorkable/segueinginfo)
