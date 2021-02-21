import ProjectDescription
import ProjectDescriptionHelpers

let project: Project =
    .staticFramework(name: "AnalyticsKit",
                     platform: .iOS,
                     dependencies: [
                        .framework(path: .relativeToRoot("Module/AnalyticsKit/Vender/FIRAnalyticsConnector.framework")),
                        .framework(path: .relativeToRoot("Module/AnalyticsKit/Vender/Firebase.framework")),
                        .framework(path: .relativeToRoot("Module/AnalyticsKit/Vender/FirebaseAnalytics.framework")),
                        .framework(path: .relativeToRoot("Module/AnalyticsKit/Vender/FirebaseCore.framework")),
                        .framework(path: .relativeToRoot("Module/AnalyticsKit/Vender/FirebaseCoreDiagnostics.framework")),
                        .framework(path: .relativeToRoot("Module/AnalyticsKit/Vender/FirebaseInstallations.framework")),
                        .framework(path: .relativeToRoot("Module/AnalyticsKit/Vender/FirebaseInstanceID.framework")),
                        .framework(path: .relativeToRoot("Module/AnalyticsKit/Vender/GoogleAppMeasurement.framework")),
                        .framework(path: .relativeToRoot("Module/AnalyticsKit/Vender/GoogleDataTransport.framework")),
                        .framework(path: .relativeToRoot("Module/AnalyticsKit/Vender/GoogleDataTransportCCTSupport.framework")),
                        .framework(path: .relativeToRoot("Module/AnalyticsKit/Vender/GoogleUtilities.framework")),
                        .framework(path: .relativeToRoot("Module/AnalyticsKit/Vender/nanopb.framework")),
                        .framework(path: .relativeToRoot("Module/AnalyticsKit/Vender/PromisesObjC.framework")),
                        .sdk(name: "libsqlite3.tbd"),
                        .sdk(name: "StoreKit.framework")
                     ], settings: Settings(base: ["ENABLE_BITCODE": "NO"]))

