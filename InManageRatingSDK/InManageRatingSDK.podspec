#
#  Be sure to run `pod spec lint SamEPTools.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "InManageRatingSDK"
  spec.version      = "0.0.1"
  spec.summary      = "this is the tools for useing ep sdk conatains all the apis and libraries that samepsdk and samvpnsdk needs"
  spec.description  = "this is the tools for useing ep sdk conatains all the apis and libraries that samepsdk and samvpnsdk needs"

  spec.homepage     = "https://securingsam.com/"
  spec.license = { :type => 'MIT', :text => <<-LICENSE
   Copyright 2012
   Permission is granted to...
   LICENSE
 }
 spec.author             = { "omer cohen" => "omerm@inmanage.net }

 spec.source       = { :git => "git@github.com:securingsam/SamEpTools.git", :branch => "main" }

 spec.swift_version = "5.0"

 spec.platform = :ios

 spec.ios.deployment_target = '13.0'
 spec.public_header_files = "InManageRatingSDK.xcframework/Headers/*.h"
 spec.source_files = "InManageRatingSDK.xcframework/Headers/*.h"
 spec.vendored_frameworks = "InManageRatingSDK.xcframework"
 spec.static_framework = true 
 spec.dependency 'Alamofire' 

end
