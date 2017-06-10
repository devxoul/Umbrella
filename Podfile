use_frameworks!
inhibit_all_warnings!

def test_target(name)
  target name do
    inherit! :search_paths
  end
end

target 'UmbrellaFirebase' do
  platform :ios, '8.0'
  pod 'Firebase/Analytics'
  test_target 'UmbrellaFirebaseTests'
end
