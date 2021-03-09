
import ProjectDescription
import ProjectDescriptionHelpers

let project: Project =
    .staticFramework(name: "UmbrellaSwiftPM",
                     packages: [.ribs,
                                .pure_swift_ui,
                                .pure_swift_ui_tools],
                     platform: .iOS,
                     dependencies: [.RIBs, .RxSwift, .RxCocoa, .RxRelay, .PureSwiftUI, .PureSwiftUITools])
