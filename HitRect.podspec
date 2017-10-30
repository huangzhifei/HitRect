Pod::Spec.new do |s|


  s.name         = "HitRect"
  s.version      = "0.0.1"
  s.summary      = "UIButton\UILabel\UIImageView change touch area"

  s.description  = <<-DESC
  使用分类方便的更改其点击区域
                   DESC

  s.homepage     = "https://github.com/huangzhifei/HitRect.git"
  s.license      = "MIT"
  s.author             = { "huangzhifei" => "huangzhifei2009@126.com" }
  s.platform     = :ios
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/huangzhifei/HitRect.git", :tag => "0.0.1" }
  s.source_files  = "HitRect/HitRect/*.{h,m}"
  s.frameworks = "UIKit"
  s.requires_arc = true

end