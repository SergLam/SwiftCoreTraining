//
//  ViewController.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 1/26/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        loadImagesConcurently()
//        task1()
    }
    
    private func loadImagesConcurently() {
        let url = "https://picsum.photos/300/300/?image="
        
        var imagesURL: [String] = []
        var images: [UIImage] = []
        
        for i in 0..<10 {
            imagesURL.append(url+"\(i)")
        }
        
        let group = DispatchGroup()
        
        for (index, image) in imagesURL.enumerated() {
            group.enter()
            DispatchQueue.global().async(group: group){
                let url = URL(string: image)!
                URLSession(configuration: .default).dataTask(with: url, completionHandler: { (data, response, error) in
                    guard
                        let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                        let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                        let data = data, error == nil else {
                            print("Failed to load image \(index)")
                            return
                    }
                    if let image = UIImage(data: data) {
                        print("Downloaded image \(index)")
                        DispatchQueue.main.async {
                            images.append(image)
                        }
                    }
                    group.leave()
                }).resume()
            }
        }
        
        group.notify(queue: .main) {
            print("Finished all requests.")
            print(images.count)
            print(images[0].size)
        }
    }
    
    private func task1() {
        print("A")
        
        DispatchQueue.main.async {
            print("B")
            
            DispatchQueue.main.async {
                print("C")
                
                DispatchQueue.main.async {
                    print("D")
                    
                    DispatchQueue.main.sync {
                        print("E")
                    }
                }
            }
            
            DispatchQueue.global().sync {
                print("F")
                
                DispatchQueue.main.sync {
                    print("G")
                }
            }
            
            print("H")
        }
        
        print("I")
    }
    
    
}

