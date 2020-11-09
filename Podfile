# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

install! 'cocoapods', :disable_input_output_paths => true, :warn_for_unused_master_specs_repo => false

use_frameworks!
inhibit_all_warnings!

# https://github.com/strongself/Generamba/wiki/Rambafile-Structure
# https://github.com/strongself/Generamba

target 'SwiftCoreTraining' do
  
  use_frameworks!
  inhibit_all_warnings!
  
  # UI
  pod 'Eureka', '~> 5.3'
  pod 'DZNEmptyDataSet', '~> 1.8.1'
  pod 'SnapKit', '~> 5.0.1'
  pod 'R.swift', '~> 5.0'
  pod 'Closures', '~> 0.7'
  pod 'SVProgressHUD', '~> 2.2.5'
  
  # Networking
  pod 'Moya', '~> 13.0.1'
  pod 'ReachabilitySwift', '~> 4.3.1'
  pod 'Kingfisher', '~> 5.9.0'
  
  # Social auth - Facebook
  pod 'FacebookCore', '~> 0.9.0'
  pod 'FacebookLogin', '~> 0.9.0'
  pod 'FacebookShare', '~> 0.9.0'
  
  # Social auth - Google
  pod 'GoogleSignIn', '~> 5.0.2'
  
  # Firebase
  pod 'FirebaseCore'#, '~> 6.13.0'
  pod 'Firebase/Auth'#, '~> 6.4.1'
  pod 'Firebase/Analytics'#, '~> 6.1.6'
  
  # Database
  pod 'RealmSwift', '~> 5.3.6'
  
  # WebSockets
  pod 'Starscream', '~> 3.1'
  pod 'Socket.IO-Client-Swift', '~> 15.2.0'
  
  # HTML Parsing
  pod 'Kanna', '~> 5.2.3'
  
  #Objc Pods
  pod 'Masonry', '~> 1.1.0'
  pod 'SDWebImage', '~> 4.0'

  target 'SwiftCoreTrainingTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SwiftCoreTrainingUITests' do
    inherit! :search_paths
    # Pods for testing
  end

  post_install do |installer|
     installer.pods_project.targets.each do |target|
           target.build_configurations.each do |config|
               config.build_settings['ENABLE_BITCODE'] = 'NO'
               config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
               if config.name == 'Debug' || config.name == 'Debug-MockAPI'
                 config.build_settings['OTHER_SWIFT_FLAGS'] = ['$(inherited)', '-Onone']
                 config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
               end
       end
     end
   end
  
end
