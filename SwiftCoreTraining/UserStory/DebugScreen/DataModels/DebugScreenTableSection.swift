//
//  DebugScreenTableSection.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 4/22/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import SwiftUI
import UIKit

/// Debug screen sections titles
enum DebugScreenTableSection: Int, CaseIterable {
    
    case swiftUI = 0
    case combine
    case viper
    case inheritance
    case closures
    case memoryManagment
    case kwoKvc
    case coreData
    case gcd
    case ui
    case swiftBasics
    case dataStructures
    case objcFeatures
    case algorithms
    case xmlParsing
    case protocolExtension
    
    var title: String {
        switch self {
        case .swiftUI:
            return "SwiftUI + Concurrency"
        case .combine:
            return "Combine Framework"
        case .viper:
            return "VIPER Architecture in iOS"
        case .inheritance:
            return "Inheritance"
        case .closures:
            return "Closures"
        case .memoryManagment:
            return "Memory Managment"
        case .kwoKvc:
            return "KVO_KVC"
        case .coreData:
            return "Core Data"
        case .gcd:
            return "GCD"
        case .ui:
            return "UI"
        case .swiftBasics:
            return "Swift Basics"
        case .dataStructures:
            return "Data structures"
        case .objcFeatures:
            return "Objc features!"
        case .algorithms:
            return "Algorithms"
        case .xmlParsing:
            return "XML Parsing"
        case .protocolExtension:
            return "Protocol Extension"
        }
    }
    
    var sectionRowsTitles: [String] {
        switch self {
        case .swiftUI:
            return ["SwiftUI VC"]
        case .combine:
            return ["Combine VC"]
        case .viper:
            return ["Viper VC"]
        case .inheritance:
            return ["Inheritance VC"]
        case .closures:
            return ["ClosuresVC"]
        case .memoryManagment:
            return ["MemoryManagmentVC"]
        case .kwoKvc:
            return ["KVO_View_Controller", "KVC_View_Controller"]
        case .coreData:
            return ["Core Data VC"]
        case .gcd:
            return ["GCDVC"]
        case .ui:
            return ["Accordion table view",
                    "SizeClasses (Orientation adaptive layout)",
                    "CustomTransitions (Animations)",
                    "SystemTransitions"]
        case .swiftBasics:
            return ["SubclassingVC"]
        case .dataStructures:
            return ["Array-Set convertions", "Array-Copy-On-Write"]
        case .objcFeatures:
            return ["ObjC example view controller",
                    "Objc_associatedKeyValues"]
        case .algorithms:
            return ["Algorithms",
                    "RecursiveAlgorithms VC"]
        case .xmlParsing:
            return ["XMLParser VC"]
        case .protocolExtension:
            return ["Protocol Extension VC"]
        }
    }
    
    var viewControllers: [UIViewController] {
        switch self {
        case .swiftUI:
            return [UIHostingController(rootView: SwiftUIConcurrencyView())]
        case .combine:
            return [CombineVC()]
        case .viper:
            return [ViperRouter.createModule()]
        case .inheritance:
            return [InheritanceVC()]
        case .closures:
            return [ClosuresVC()]
        case .memoryManagment:
            return [MemoryManagmentVC()]
        case .kwoKvc:
            return [KVOVC(),
                    KVCVC()]
        case .coreData:
            return [CoreDataVC()]
        case .gcd:
            return [GCDVC()]
        case .ui:
            return [PrivacyPolicyVC(),
                    SizeClassesVC(),
                    CustomTransitionsVC(),
                    SystemTransitionRootVC()]
        case .swiftBasics:
            return [SubclassingVC()]
        case .dataStructures:
            return [ArraySetVC(), SwiftArrayVC()]
        case .objcFeatures:
            
            return [ExampleVC(),
                    DebugVC()]
        case .algorithms:
            return [AlgorhitmsVC(),
                    RecursiveAlgorithmsVC()]
        case .xmlParsing:
            return [XMLParserVC()]
        case .protocolExtension:
            return [ProtocolExtensionVC()]
        }
    }
    
}
