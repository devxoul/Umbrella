Pod::Spec.new do |s|
  s.name             = "Umbrella"
  s.version          = "0.5.0"
  s.summary          = "Analytics abstraction layer for Swift"
  s.homepage         = "https://github.com/devxoul/Umbrella"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Suyeol Jeon" => "devxoul@gmail.com" }
  s.source           = { :git => "https://github.com/devxoul/Umbrella.git",
                         :tag => s.version.to_s }
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.11"
  s.tvos.deployment_target = "9.0"
  s.watchos.deployment_target = "2.0"

  s.default_subspec = "Core"

  s.subspec "Core" do |ss|
    ss.source_files = "Sources/Umbrella/*.swift"
  end

  s.subspec "Answers" do |ss|
    ss.source_files = "Sources/UmbrellaAnswers/*.swift"
    ss.dependency "Umbrella/Core"
  end

  s.subspec "Appboy" do |ss|
    ss.source_files = "Sources/UmbrellaAppboy/*.swift"
    ss.dependency "Umbrella/Core"
  end

  s.subspec "AppsFlyer" do |ss|
    ss.source_files = "Sources/UmbrellaAppsFlyer/*.swift"
    ss.dependency "Umbrella/Core"
  end

  s.subspec "Firebase" do |ss|
    ss.source_files = "Sources/UmbrellaFirebase/*.swift"
    ss.dependency "Umbrella/Core"
  end

  s.subspec "Flurry" do |ss|
    ss.source_files = "Sources/UmbrellaFlurry/*.swift"
    ss.dependency "Umbrella/Core"
  end

  s.subspec "Localytics" do |ss|
    ss.source_files = "Sources/UmbrellaLocalytics/*.swift"
    ss.dependency "Umbrella/Core"
  end

  s.subspec "Mixpanel" do |ss|
    ss.source_files = "Sources/UmbrellaMixpanel/*.swift"
    ss.dependency "Umbrella/Core"
  end
end
