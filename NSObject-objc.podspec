Pod::Spec.new do |s|
  s.name     = 'NSObject-objc'
  s.version  = '0.0.3'
  s.license  = 'MIT'
  s.summary  = 'a wrraper for objc runtime'
  s.homepage = 'https://github.com/xuwenquan/NSObject-objc'
  s.author   = 'xuwenquan'
  s.source   = { :git => 'https://github.com/xuwenquan/NSObject-objc.git', :tag => "#{s.version}" }
  s.requires_arc = false

  s.description = %{
    wrap up obj runtime code for easy use
  }

  s.source_files = 'NSObject-objc/NSObject-objc/*.{h,m}'

  s.ios.deployment_target = '9.0'
  #s.swift-version = '4.1'
end
