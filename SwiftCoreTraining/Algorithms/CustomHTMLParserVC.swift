//
//  CustomHTMLParser.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 3/23/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit
import Kanna

class CustomHTMLParserVC: UIViewController {
    
    var parseResult: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        findTagInHtml()
    }
    
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
        
        if let doc = try? HTML(html: data, encoding: .utf8) {
            debugPrint(String(describing: doc.title))
            
            // Search for nodes by CSS
            for link in doc.css("a, link") {
                debugPrint(String(describing: link.text).replacingOccurrences(of: "\"", with: ""))
                debugPrint(String(describing: link["href"]).replacingOccurrences(of: "\"", with: ""))
            }
            
            // Search for nodes by XPath
            for link in doc.xpath("//a | //link") {
                debugPrint(String(describing: link.text).replacingOccurrences(of: "\"", with: ""))
                debugPrint(String(describing: link["href"]).replacingOccurrences(of: "\"", with: ""))
            }
        }
    }
    
}
