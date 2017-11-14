Pod::Spec.new do |s|

  s.name         = "SLCycleImageView"
  s.version      = "1.0.0"
  s.summary      = "图片轮播,SLCycleImageView,ScrollView,ScrollImage,Cycle,Scroll"
  
  s.description  = <<-DESC
  		   图片轮播,SLCycleImageView,ScrollView,ScrollImage,Cycle,Scroll
  		 DESC
  
  s.homepage     = "https://github.com/Sanchew/SLCycleImageView"
  
  s.license      = { :type => "MIT", :file => "LICENSE" }
  
  s.author       = { "sanchew" => "sanchew@mail.com" }
  
  s.platform     = :ios, "8.0"
  
  s.source       = { :git => "https://github.com/sanchew/SLCycleImageView.git", :tag => s.version}
  
  s.source_files = "SLCycleImageView/Lib/SLCycleImageView/**/*.swift"
  
  s.requires_arc = true
  
  s.dependency 'Kingfisher', '~> 4.2'
  s.dependency 'DACircularProgress', '~> 2.3'
  
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
 
  s.frameworks   = "UIKit"

end
