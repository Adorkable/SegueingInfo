Pod::Spec.new do |s|

  s.name         = "SegueingInfo"
  s.version      = "1.1.0"
  s.summary      = "Simple way to pass data between segueing View Controllers."

  s.description  = <<-DESC
**SegueingInfo** provides a simple interface, category, and class for passing data between segueing *UIViewController*s in iOS *UIStoryboard*s using the `sender` parameter of the `performSegueWithIdentifier:sender:` selector.
                   DESC

  s.homepage     = "https://github.com/adorkable/SegueingInfo"

  s.license      = "MIT"
  
  s.author             = { "Ian G" => "yo.ian.g@gmail.com" }

  s.ios.deployment_target = "6.0"
  s.osx.deployment_target = "10.10"

  s.source       = { :git => "https://github.com/adorkable/SegueingInfo.git", :tag => "1.1.0" }

  s.source_files  = "SegueingInfo/SegueingInfo.h", "SegueingInfo/SegueingInfo.m"

  s.requires_arc = true

  s.documentation_url = "https://github.com/yoiang/ColorMapView/blob/master/README.md"

end
