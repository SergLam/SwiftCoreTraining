//
//  GCDViewModel.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 1/27/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

final class GCDViewModel {
    
    func loadImagesConcurently() {
        let url = "https://picsum.photos/300/300/?image="
        
        var imagesURL: [String] = []
        var images: [UIImage] = []
        
        for i in 0..<10 {
            imagesURL.append(url + "\(i)")
        }
        
        let group = DispatchGroup()
        
        for (index, image) in imagesURL.enumerated() {
            group.enter()
            DispatchQueue.global().async(group: group){
                guard let url = URL(string: image) else {
                    group.leave()
                    return
                }
                URLSession(configuration: .default).dataTask(with: url, completionHandler: { data, response, error in
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
    
    func task2() {
        let queue = DispatchQueue.main
        print(0)
        queue.async {
            sleep(5)
            print(1)
            queue.async {
                sleep(5)
                print(2)
            }
            sleep(10)
            print(3)
        }
        print(4)
    }
    
    func task3_priority() -> [DispatchQueue] {
        // https://developer.apple.com/library/archive/documentation/Performance/Conceptual/EnergyGuide-iOS/PrioritizeWorkWithQoS.html
        let highest = DispatchQueue.global(qos: .userInteractive)
        let high = DispatchQueue.global(qos: .userInitiated)
        let medium = DispatchQueue.global(qos: .default) // Should not be used for priority classification by developers
        let low = DispatchQueue.global(qos: .utility)
        let lowest = DispatchQueue.global(qos: .background)
        return [highest, high, medium, low, lowest]
    }
    
    func task1() {
        // https://www.reddit.com/r/iOSProgramming/comments/6x24xl/interesting_interview_question_about_gcd_could/
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
    
    func task3() {
        
        DispatchQueue.main.async {
            debugPrint("1")
        }
        
        DispatchQueue.main.sync {
            debugPrint("2")
            
            DispatchQueue.main.async {
                debugPrint("3")
            }
        }
    }
    
}
