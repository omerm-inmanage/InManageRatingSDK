


rm -rf archives

rm -rf build

#First archive for iphone

xcodebuild archive \
-workspace InManageRatingSDKExamplespace.xcworkspace \
-scheme InManageRatingSDK \
-archivePath archives/InManageRatingSDK-iphone-arm64.xcarchive \
-sdk iphoneos \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

#archive for iphone simulator

xcodebuild archive \
-workspace InManageRatingSDKExamplespace.xcworkspace \
-scheme InManageRatingSDK \
-archivePath archives/InManageRatingSDK-iphonesimulator-arm64.xcarchive \
-sdk iphonesimulator \
-arch arm64 \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

#archive for iphone simulator m1

xcodebuild archive \
-workspace InManageRatingSDKExamplespace.xcworkspace \
-scheme InManageRatingSDK \
-archivePath archives/InManageRatingSDK-iphonesimulator-x86_64.xcarchive \
-sdk iphonesimulator \
-arch x86_64 \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

#create universal-simulator folder

xcodebuild archive \
-workspace InManageRatingSDKExamplespace.xcworkspace \
-scheme InManageRatingSDK \
-archivePath archives/universal-simulator/InManageRatingSDK-universal-simulator.xcarchive \
-sdk iphonesimulator \
-arch x86_64 \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

#open universal-simulator folder
cd archives
cd mkdir archives/universal-simulator


#go to the archive folder universal-simulator "InManageRatingSDK-universal-simulator" -> open the archive tap on show package contanet. product --> library --> frameworks --> copy InManageRatingSDK framework and paste it in archive's folder.
 
cd archives/InManageRatingSDK.framework

# delete the InManageRatingSDK binary

rm -rf InManageRatingSDK
cd ..
cd ..

#merge the simultor and m1 simulator

lipo -create -output archives/InManageRatingSDK.framework/InManageRatingSDK \
archives/InManageRatingSDK-iphonesimulator-x86_64.xcarchive/Products/Library/Frameworks/InManageRatingSDK.framework/InManageRatingSDK \
archives/InManageRatingSDK-iphonesimulator-arm64.xcarchive/Products/Library/Frameworks/InManageRatingSDK.framework/InManageRatingSDK

#Building an XCFramework(Pass the path of the frameworks and output)
xcodebuild -create-xcframework \
-framework archives/InManageRatingSDK-iphone-arm64.xcarchive/Products/Library/Frameworks/InManageRatingSDK.framework \
-framework archives/InManageRatingSDK.framework \
-output build/InManageRatingSDK.xcframework



#How to trunk MeshulamSDK to cocoapods:
#Uploading a new version of cocoapods will be done by the following steps:

# 1 Update version in podspec file - s.version to the new version.
# 2 Merge your local branch into Master.
# 3 Add a tag that is identical to the version in podspec and push - ‘git push origin <Tag>’
# 4 Navigate directory to folder terminal.
# 5 Run ‘pod spec link’ to check for errors - optional
# 6 Run ‘pod trunk push <podspecPath> --allow-warnings --use-libraries’
#
#Example of a successful upload:
#--------------------------------------------------------------------------------
#   Congrats
#   MeshulamSDK (0.0.1) successfully published
#   October 25th, 14:59
#   https://cocoapods.org/pods/InManageRatingSDK
#   Tell your friends!

