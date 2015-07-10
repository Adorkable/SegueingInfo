Pod::Spec.new do |s|

  s.name         = "SegueingInfo"
  s.version      = "1.5.0"
  s.summary      = "Simple way to pass data between segueing View Controllers."

  s.description  = <<-DESC
**SegueingInfo** provides a simple interface, category, and class for passing data between segueing *UIViewController*s in iOS and OSX *UIStoryboard*s using the `sender` parameter of the `performSegueWithIdentifier:sender:` selector.
                   DESC

  s.homepage     = "https://github.com/Adorkable/SegueingInfo"

  s.license      = "MIT"
  
  s.author             = { "Ian G" => "yo.ian.g@gmail.com" }

  s.ios.deployment_target = "6.0"
  s.osx.deployment_target = "10.10"

  s.source       = { :git => "https://github.com/Adorkable/SegueingInfo.git", :tag => s.version.to_s }

  s.source_files  = "SegueingInfo/SegueingInfo.h", "SegueingInfo/SegueingInfo.m"

  s.requires_arc = true

  s.subspec 'Swizzling' do |swizzling|
    swizzling.dependency 'RSSwizzle'
    swizzling.prefix_header_contents = "#define USE_SWIZZLING 1"
  end

end
