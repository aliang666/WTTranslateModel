Pod::Spec.new do |s|
  s.name         = "WTTranslateModel"
  s.version      = "0.0.5"
  s.summary      = "WTTranslateModel个人中心模块"

  s.homepage     = "https://github.com/aliang666/WTTranslateModel"

  s.license      = "MIT"
  s.author             = { "jienliang000" => "jienliang000@163.com" }

  s.platform     = :ios
  s.platform     = :ios, "8.0"
  s.requires_arc = true

  s.source       = { :git => "https://github.com/aliang666/WTTranslateModel.git", :tag => "#{s.version}" }
  s.source_files  = "WTTranslateModel/*.{h,m}"

end
