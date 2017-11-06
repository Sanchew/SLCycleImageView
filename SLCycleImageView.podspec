Pod::Spec.new do |s|


s.name         = "OOCycleImageView"
s.version      = "1.0.0"
s.summary      = "图片轮播"

s.homepage     = "https://github.com/Sanchew/SLCycleImageView"

s.license      = "MIT"

s.author       = { "sanchew" => "sanchew@mail.com" }

s.platform     = :ios
s.platform     = :ios, "8.0"

s.source       = { :git => "https://github.com/sanchew/SLCycleImageView.git", :tag => s.version}


s.source_files  = "SLCycleImageView/Lib/SLCycleImageView/**/*.swift"


s.requires_arc = true

s.dependency 'SDWebImage', '~> 4.2'
s.dependency 'DACircularProgress', '~> 2.3'

end
