use_frameworks!
inhibit_all_warnings!

# monkey patching the target() method to automatically include test targets
@original_target = self.method(:target)
def target(name, options = nil)
  @original_target.call(name, options) do
    yield if block_given?
    @original_target.call(name + 'Tests') do
      inherit! :search_paths
    end
  end
end

target 'UmbrellaAnswers' do
  platform :ios, '8.0'
  pod 'Answers'
end

target 'UmbrellaFirebase' do
  platform :ios, '8.0'
  pod 'Firebase/Analytics'
end

target 'UmbrellaFlurry' do
  platform :ios, '8.0'
  pod 'Flurry-iOS-SDK/FlurrySDK'
end

target 'UmbrellaMixpanel' do
  platform :ios, '8.0'
  pod 'Mixpanel'
end
