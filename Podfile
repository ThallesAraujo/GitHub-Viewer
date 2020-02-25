# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'
use_frameworks!

def common_pods
  pod 'Alamofire', '~> 4.3'
  pod 'ObjectMapper', '3.4.2'
  pod 'Kingfisher', '~> 4.0'
end

target 'repo-search' do
  common_pods
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if ['Alamofire', 'ObjectMapper'].include? target.name
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '4.2'
      end
    end
  end
end
