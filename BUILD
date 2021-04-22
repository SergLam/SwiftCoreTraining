
load("@build_bazel_rules_apple//apple:ios.bzl",
    "ios_application",
    "ios_framework",
)

load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

load("//build-system/bazel-utils:plist_fragment.bzl",
    "plist_fragment",
)

swift_library(
    name = "SwiftCoreTraining_Swift",
    srcs = glob(["SwiftCoreTraining/**/*.swift"]) ,
    visibility = ["//visibility:public"],
    deps = ["//Vendor/Eureka:Eureka"],
    # //Vendor/Eureka:Eureka
)

ios_framework(
    name = "Eureka",
    bundle_id = "com.serglam.SwiftCoreTraining.Eureka",
    families = [
        "iphone",
        "ipad",
    ],
    infoplists = [
        ":EurekaInfoPlist",
        ":BuildNumberInfoPlist",
        ":VersionInfoPlist",
    ],
    minimum_os_version = "13.0",
    deps = [
        "//Vendor/Eureka:Eureka",
    ],
)

objc_library(
    name = "SwiftCoreTraining_ObjC",
    hdrs = glob(["SwiftCoreTraining/UserStory/ObjcUsageInSwift/*.h"]),
    srcs = glob(["SwiftCoreTraining/UserStory/ObjcUsageInSwift/*.m"]),
    includes = ["SwiftCoreTraining/UserStory/ObjcUsageInSwift/**/"],
    visibility = ["//visibility:public"],
)

ios_application(
    name = "SwiftCoreTraining",
    bundle_id = "com.serglam.SwiftCoreTraining",
    families = [
        "iphone",
        "ipad",
    ],
    frameworks = [
        ":Eureka"
    ],
    minimum_os_version = "13.0",
    infoplists = [":SwiftCoreTraining/BundleFiles/Plist/Info.plist"],
    visibility = ["//visibility:public"],
    deps = [":SwiftCoreTraining_Swift", ":SwiftCoreTraining_ObjC"],
)

plist_fragment(
    name = "EurekaInfoPlist",
    extension = "plist",
    template =
    """
    <key>CFBundleIdentifier</key>
    <string>com.serglam.SwiftCoreTraining.Eureka</string>
    <key>CFBundleDevelopmentRegion</key>
    <string>en</string>
    <key>CFBundleName</key>
    <string>Eureka</string>
    <key>CFBundlePackageType</key>
    <string>FMWK</string>
    """
)

plist_fragment(
    name = "VersionInfoPlist",
    extension = "plist",
    template =
    """
    <key>CFBundleShortVersionString</key>
    <string>1.0</string>
    """
)

plist_fragment(
    name = "AppNameInfoPlist",
    extension = "plist",
    template =
    """
    <key>CFBundleDisplayName</key>
    <string>Swift Core Training</string>
    """
)

plist_fragment(
    name = "BuildNumberInfoPlist",
    extension = "plist",
    template =
    """
    <key>CFBundleVersion</key>
    <string>1</string>
    """
)