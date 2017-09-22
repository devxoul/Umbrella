clean:
	rm -rf Pods

project: clean
	swift package generate-xcodeproj
	ruby -e "require 'xcodeproj'; Xcodeproj::Project.open('Umbrella.xcodeproj').save"
	bundle install
	bundle exec pod install
