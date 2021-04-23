//
//  DebugScreenTableSection.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 4/22/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

enum DebugScreenTableSection: Int, CaseIterable {
    
    case viper = 0
    case closures
    case memoryManagment
    case kwoKvc
    case coreData
    case gcd
    case ui
    case swiftBasics
    case dataStructuresAndAlgorightms
    case objcFeatures
    case algorithms
    case xmlParsing
    
    var title: String {
        switch self {
        case .viper:
            return "VIPER Architecture in iOS"
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
        case .dataStructuresAndAlgorightms:
            return "Data structures and algorightms"
        case .objcFeatures:
            return "Objc features!"
        case .algorithms:
            return "Algorithms"
        case .xmlParsing:
            return "XML Parsing"
        }
    }
    
    var sectionRowsTitles: [String] {
        switch self {
        case .viper:
            return ["Viper VC"]
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
        case .dataStructuresAndAlgorightms:
            return ["Array-Set convertions"]
        case .objcFeatures:
            return ["ObjC example view controller",
                    "Objc_associatedKeyValues"]
        case .algorithms:
            return ["Algorithms",
                    "RecursiveAlgorithms VC"]
        case .xmlParsing:
            return ["XMLParser VC"]
        }
    }
    
    var viewControllers: [UIViewController] {
        switch self {
        case .viper:
            return [ViperRouter.createModule()]
        case .closures:
            return [ClosuresVC()]
        case .memoryManagment:
            return [MemoryManagmentVC()]
        case .kwoKvc:
            return [KVO_VC(),
                    KVC_VC()]
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
        case .dataStructuresAndAlgorightms:
            return [ArraySetVC()]
        case .objcFeatures:
            
            // NOTE: - Fucking bazel -
//            Undefined symbols for architecture x86_64:
//              "_OBJC_CLASS_$_ExampleVC", referenced from:
//                  objc-class-ref in libSwiftCoreTraining_Swift.a(DebugScreenTableSection.swift.o)
//            ld: symbol(s) not found for architecture x86_64
            
            return [/*ExampleVC()*/DebugVC(),
                    DebugVC()]
        case .algorithms:
            return [AlgorhitmsVC(),
                    RecursiveAlgorithmsVC()]
        case .xmlParsing:
            return [XMLParserVC()]
        }
    }
    
}
