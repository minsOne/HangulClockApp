import ProjectDescription

extension Project {

    public static func app(name: String, platform: Platform, dependencies: [TargetDependency] = []) -> Project {
        return self.project(name: name, product: .app, platform: platform, dependencies: dependencies, infoPlist: [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1"
        ])
    }

    public static func staticFramework(name: String,
                                       packages: [Package] = [],
                                       platform: Platform,
                                       dependencies: [TargetDependency] = [],
                                       settings: Settings? = nil) -> Project {
        return self.project(name: name,
                            packages: packages,
                            product: .staticFramework,
                            platform: platform,
                            dependencies: dependencies)
    }

    public static func project(name: String,
                               packages: [Package] = [],
                               product: Product,
                               platform: Platform,
                               dependencies: [TargetDependency] = [],
                               infoPlist: [String: InfoPlist.Value] = [:],
                               settings: Settings? = nil) -> Project {
        return Project(name: name,
                       packages: packages,
                       targets: [
                        Target(name: name,
                                platform: platform,
                                product: product,
                                bundleId: "kr.minsOne.Labs.Hangul.\(name)",
                                infoPlist: .extendingDefault(with: infoPlist),
                                sources: ["Sources/**"],
                                resources: [],
                                dependencies: dependencies,
                                settings: settings),
                        Target(name: "\(name)Tests",
                                platform: platform,
                                product: .unitTests,
                                bundleId: "kr.minsOne.Labs.Hangul.\(name)Tests",
                                infoPlist: .default,
                                sources: "Tests/**",
                                dependencies: [
                                    .target(name: "\(name)")
                                ])
                      ])
    }

}
