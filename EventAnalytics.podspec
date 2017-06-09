Pod::Spec.new do |s|
  s.name             = "EventAnalytics"
  s.version          = "0.1.0"
  s.summary          = "Analytics abstraction layer for Swift"
  s.homepage         = "https://github.com/devxoul/EventAnalytics"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Suyeol Jeon" => "devxoul@gmail.com" }
  s.source           = { :git => "https://github.com/devxoul/EventAnalytics.git",
                         :tag => s.version.to_s }
  s.source_files = "Sources/EventAnalytics/*.swift"

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.11"
  s.tvos.deployment_target = "9.0"
  s.watchos.deployment_target = "2.0"
end
