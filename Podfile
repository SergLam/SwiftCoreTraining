# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'
deployment_target = '13.0'

install! 'cocoapods', :disable_input_output_paths => true, :warn_for_unused_master_specs_repo => false

use_frameworks!
inhibit_all_warnings!

workspace 'SwiftCoreTraining'

project 'SwiftCoreTraining'

def development_pods
  
  use_frameworks!
  inhibit_all_warnings!
  
  pod 'SwiftLint', '~> 0.45.1'
  
end

abstract_target 'App' do
  
  target 'SwiftCoreTraining' do
    
    project 'SwiftCoreTraining'
    development_pods
    
  end
  
  target 'SwiftCoreTrainingTests' do
    
    project 'SwiftCoreTraining'
    development_pods
    
  end
  
  target 'SwiftCoreTrainingUITests' do
    
    project 'SwiftCoreTraining'
    development_pods
    
  end
  
end

post_install do |installer|
  
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO' # set 'NO' to disable DSYM uploading - usefull for third-party error logging SDK (like Firebase)
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
      if config.name == 'Debug' || config.name == 'Debug-MockAPI'
        config.build_settings['OTHER_SWIFT_FLAGS'] = ['$(inherited)', '-Onone']
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
      end
    end
  end
  
  installer.generated_projects.each do |project|
    project.build_configurations.each do |bc|
      bc.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = deployment_target
    end
  end
  
end
