//
//  XMLParserVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 3/23/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

final class XMLParserVC: BaseViewController {
    
    var parser = XMLParser()
    var parseResult: [String] = []
    
    var currentParsedElement = String()
    var weAreInsideAnItem = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        findTagInHtml()
//        debugPrint(parseResult)
    }
    
}

extension XMLParserVC: XMLParserDelegate {
    
    private func loadLocalDocumentData() -> Data? {
        guard let path = Bundle.main.path(forResource: "page", ofType: "html") else { return nil }
        guard let data = NSData(contentsOfFile: path) else { return nil }
        return Data(referencing: data)
    }
    
    private func findTagInHtml() {
       
        guard let data = loadLocalDocumentData() else {
            assert(false, "File not found")
            return
        }
        
        parser = XMLParser(data: data)
        parser.delegate = self
        parser.parse()
    }
    
    // MARK: Delegate methods
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String: String] = [:]) {
        debugPrint("Did start element: \(elementName)")
        debugPrint(String(describing: namespaceURI))
        debugPrint(String(describing: qName))
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        debugPrint("Did end element: \(elementName)")
        debugPrint(String(describing: namespaceURI))
        debugPrint(String(describing: qName))
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        debugPrint("Found characters: \(string)")
    }
    
    func parser(_ parser: XMLParser,
                foundIgnorableWhitespace whitespaceString: String) {
         debugPrint("foundIgnorableWhitespace: \(whitespaceString)")
    }
    
    func parser(_ parser: XMLParser,
                foundComment comment: String) {
        debugPrint("foundComment: \(comment)")
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        
        AlertPresenter.showErrorAlert(at: self, error: parseError.localizedDescription)
    }
    
}

#if DEBUG
#if targetEnvironment(simulator)
import SwiftUI

@available(iOS 13.0, *)
struct XMLParserVC_Previews: PreviewProvider {
    
    static var devices = AppConstants.previewDevices
    
    static var platform: PreviewPlatform? {
        return SwiftUI.PreviewPlatform.iOS
    }
    
    static var previews: some SwiftUI.View {
        
        ForEach(devices, id: \.self) { deviceName in
            Group {
                
                UIViewControllerPreview {
                    let vc = XMLParserVC()
                    let navVC = UINavigationController(rootViewController: vc)
                    return navVC
                }
                
            }.previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
        
    }
}
#endif
#endif
