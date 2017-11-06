Pod::Spec.new do |s|


  s.name         = "SLCycleImageView"
  s.version      = "1.0.1"
  s.summary      = ""
  
  s.homepage     = "https://github.com/sanchew/SLCycleImageView"
  
  s.license      = "MIT"
  
  s.author       = { "Sanchew" => "sanchew@mail.com" }
  
  s.platform     = :ios
  s.platform     = :ios, "8.0"
  
  
  s.source       = { :git => "https://github.com/Sanchew/SLCycleImageView.git", :tag => s.version }
  
  
  s.source_files  = "SLCycleScrollView/Lib/SLCycleScrollView/**/*.swift"
  
  
  s.requires_arc = true
  
  s.dependency 'Kingfisher', '~> 4.2'
  s.dependency 'DACircularProgress'
  
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
end
