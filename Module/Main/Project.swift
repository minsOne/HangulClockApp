import ProjectDescription
import ProjectDescriptionHelpers

let project: Project =
    .staticFramework(name: "Main",
                     packages: [.resouce],
                     platform: .iOS,
                     dependencies: [.FoundationExtension,
                                    .HangulClockTable,
                                    .UmbrellaSwiftPM,
                                    .Settings
                     ])
