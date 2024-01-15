import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    
    /// 기본 InfoPlist
    public static let defaultInfoPlist: [String: Plist.Value] = [
        "CFBundleShortVersionString": "1.0.0",
        "CFBundleVersion": "1"
    ]
    
    
    /// Projects 생성
    /// - Parameters:
    ///   - name: 프로젝트 이름
    ///   - destinations: 플랫폼
    ///   - infoPlist: Info.plist
    ///   - additionalTargets: additionalTargets
    ///   - buildAction: 빌드시 실행할 액션
    /// - Returns: [Project]
    public static func makeProject(name: String,
                                   destinations: Destinations = Destinations(arrayLiteral: .iPhone, .iPad),
                                   infoPlist: [String: Plist.Value] = Project.defaultInfoPlist,
                                   additionalTargets: [String] = [],
                                   buildAction: BuildAction = BuildAction(targets: [])) -> Project {
        // Organization 이름
        let organizationName: String = "JunHyeok"
        
        // 프로젝트 번들아이디
        let bundleID: String = "com.junhyeok.TuistMock"
        
        // 배포타겟
        let deploymentTarget: DeploymentTargets = .iOS("13.0")
        
        // .xcconfig 파일들
        let configurations: [Configuration] = [
            .debug(name: "DEBUG", xcconfig: .relativeToRoot("Configurations/TuistMock-Debug.xcconfig")),
            .release(name: "RELEASE", xcconfig: .relativeToRoot("Configurations/TuistMock-Release.xcconfig"))
        ]
        
        // Swift Package
        let packages: [Package] = [
            
        ]
        
        // Project Target
        var targets: [Target] = makeTargets(name: name,
                                            destinations: destinations,
                                            bundleID: bundleID,
                                            infoPlist: infoPlist,
                                            dependencies: additionalTargets.map { TargetDependency.target(name: $0) },
                                            settings: .settings(configurations: configurations))
        
        // Schemes
        let schemes: [Scheme] = makeSchemes(name: name,
                                            buildAction: buildAction)
        
        // Project
        return Project(name: name,
                       organizationName: organizationName,
                       settings: .settings(configurations: configurations),
                       targets: targets,
                       schemes: schemes)
    }
    
    // MARK: - Private
    
    
    /// Targets 생성
    /// - Parameters:
    ///   - name: 타겟 이름
    ///   - destinations: 플랫폼
    ///   - bundleID: 타겟 번들아이디
    ///   - infoPlist: Info.plist
    ///   - dependencies: 의존성 (타겟의 의존성과 테스트의 의존성은 다름)
    ///   - settings: 프로젝트의 Configuration
    /// - Returns: [Target]
    private static func makeTargets(name: String,
                                    destinations: Destinations,
                                    bundleID: String,
                                    infoPlist: [String: Plist.Value],
                                    dependencies: [TargetDependency],
                                    settings: Settings) -> [Target] {
        
        let mainTarget = Target(name: name, // 타겟 이름
                                destinations: destinations,
                                product: .app,
                                bundleId: bundleID,
                                sources: ["Sources/**"],
                                resources: ["Resources/**"],
                                dependencies: dependencies,
                                settings: settings)
        
        let unitTestTarget = Target(name: "\(name)UnitTest",
                                    destinations: destinations,
                                    product: .unitTests,
                                    bundleId: bundleID,
                                    sources: ["UnitTests/**"],
                                    resources: ["Resources/**"],
                                    dependencies: [.target(name: "\(name)")])
        
        let uiTestTarget = Target(name: "\(name)UITests",
                                destinations: destinations,
                                product: .uiTests,
                                bundleId: bundleID,
                                sources: ["UITests/**"],
                                resources: ["Resources/**"],
                                dependencies: [.target(name: "\(name)")])
        
        return [mainTarget, unitTestTarget, uiTestTarget]
    }
    
    
    /// Schemes 생성
    /// - Parameters:
    ///   - name: 스키마 이름 "{name}-{schmeName}"
    ///   - buildAction: 빌드시 실행할 액션
    /// - Returns: [Scheme]
    private static func makeSchemes(name: String,
                                    buildAction: BuildAction) -> [Scheme] {
        
        let debugScheme = Scheme(name: "\(name)-Debug",
                                 shared: true,
                                 buildAction: buildAction)
        
        let releaseScheme = Scheme(name: "\(name)-Release",
                                   shared: true,
                                   buildAction: buildAction)
        
        return [debugScheme, releaseScheme]
    }
    
    
    /// Framework Targets 생성
    /// - Parameters:
    ///   - name: 프레임워크 이름
    ///   - destinations: 플랫폼
    ///   - infoPlist: Info.plist
    ///   - dependencies: 의존성
    ///   - settings: 프로젝트의 Configuration
    /// - Returns: [Target]
    private static func makeFrameworkTargets(name: String,
                                             destinations: Destinations,
                                             infoPlist: [String: Plist.Value],
                                             dependencies: [TargetDependency],
                                             settings: Settings) -> [Target] {
        return makeTargets(name: name,
                           destinations: destinations,
                           bundleID: "com.junhyeok.\(name)Framework",
                           infoPlist: infoPlist,
                           dependencies: dependencies,
                           settings: settings)
    }
}
