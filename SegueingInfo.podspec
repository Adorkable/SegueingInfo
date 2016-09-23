Pod::Spec.new do |s|

  s.name         = "SegueingInfo"
  s.version      = "2.1.0"
  s.summary      = "Simple way to pass data between segueing View Controllers."

  s.description  = <<-DESC
**SegueingInfo** provides a simple interface, category, and class for passing data between segueing *UIViewController*s in iOS and OSX *UIStoryboard*s using the `sender` parameter of the `performSegueWithIdentifier:sender:` selector.
                   DESC

  s.homepage     = "https://github.com/Adorkable/SegueingInfo"

  s.license      = "MIT"
  
  s.author             = { "Ian G" => "yo.ian.g@gmail.com" }

  s.ios.deployment_target = "9.1"
  s.osx.deployment_target = "10.11"

  s.source       = { :git => "https://github.com/Adorkable/SegueingInfo.git", :tag => s.version.to_s }

  s.requires_arc = true

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '2.3' }

  s.default_subspec = 'Core'
  s.subspec 'Core' do |core|
    core.source_files  = "Sources/**/*.swift"
  end

end
