//
//  User.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 2/15/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import Foundation

final class User {
    
    let userId = "MP6uxlnIDcYky6AydRL0IObGwjV2"
    let email = "test@example.com"
    private(set) var firstName = "John"
    private(set) var lastName = "AppleSeed"
    var fullName: String {
        return firstName + " " + lastName
    }
    private(set) var username: String = "testuser"
    private(set) var bio: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ac dapibus lacus, vitae auctor odio. Sed id quam vitae est ornare suscipit et ac odio. Fusce viverra sagittis purus, sed ultricies nunc vulputate vel. Aliquam eros diam, dapibus in interdum nec, pulvinar a justo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque non magna pellentesque, ultricies justo sit amet, lacinia mi. Ut viverra feugiat mattis. Vestibulum ante justo, accumsan id felis eget, pretium efficitur eros. Nam pretium placerat mi, eget condimentum ligula auctor eu. Donec vestibulum nibh eget sapien ultrices, id lobortis est sodales. Praesent rutrum, lacus eu tempor mattis, odio lectus pellentesque diam, id posuere diam purus in velit. Nulla facilisi. Nulla lacinia eleifend tortor blandit tempor. Suspendisse vitae venenatis nisi, consectetur laoreet justo. Praesent at velit a dolor tristique pellentesque ut et massa. Aenean et sapien turpis."
    private(set) var website: String = "https://www.google.com"
    var followings: [String] = [
        "24zdYsmCqjTj3Cl6ZkZxuUd56F32",
        "2VCno0UoFcUciu5SlUkntqOHqPE3",
        "2ZF8iREwlzbbxKC2TlL2iQbThJY2",
        "3CwWEsIwgjWdm6DwUmdPqrxXurG2",
        "24zdYsmCqjTj3Cl6ZkZxuUd56F32",
        "2VCno0UoFcUciu5SlUkntqOHqPE3",
        "2ZF8iREwlzbbxKC2TlL2iQbThJY2",
        "3CwWEsIwgjWdm6DwUmdPqrxXurG2",
        "24zdYsmCqjTj3Cl6ZkZxuUd56F32",
        "2VCno0UoFcUciu5SlUkntqOHqPE3",
        "2ZF8iREwlzbbxKC2TlL2iQbThJY2",
        "3CwWEsIwgjWdm6DwUmdPqrxXurG2",
        "24zdYsmCqjTj3Cl6ZkZxuUd56F32",
        "2VCno0UoFcUciu5SlUkntqOHqPE3",
        "2ZF8iREwlzbbxKC2TlL2iQbThJY2",
        "3CwWEsIwgjWdm6DwUmdPqrxXurG2",
        "24zdYsmCqjTj3Cl6ZkZxuUd56F32",
        "2VCno0UoFcUciu5SlUkntqOHqPE3",
        "2ZF8iREwlzbbxKC2TlL2iQbThJY2",
        "3CwWEsIwgjWdm6DwUmdPqrxXurG2",
        "24zdYsmCqjTj3Cl6ZkZxuUd56F32",
        "2VCno0UoFcUciu5SlUkntqOHqPE3",
        "2ZF8iREwlzbbxKC2TlL2iQbThJY2",
        "3CwWEsIwgjWdm6DwUmdPqrxXurG2"
    ]
    var followers: [String] = [
        "24zdYsmCqjTj3Cl6ZkZxuUd56F32",
        "2VCno0UoFcUciu5SlUkntqOHqPE3",
        "2ZF8iREwlzbbxKC2TlL2iQbThJY2",
        "3CwWEsIwgjWdm6DwUmdPqrxXurG2",
        "24zdYsmCqjTj3Cl6ZkZxuUd56F32",
        "2VCno0UoFcUciu5SlUkntqOHqPE3",
        "2ZF8iREwlzbbxKC2TlL2iQbThJY2",
        "3CwWEsIwgjWdm6DwUmdPqrxXurG2",
        "24zdYsmCqjTj3Cl6ZkZxuUd56F32",
        "2VCno0UoFcUciu5SlUkntqOHqPE3",
        "2ZF8iREwlzbbxKC2TlL2iQbThJY2",
        "3CwWEsIwgjWdm6DwUmdPqrxXurG2",
        "24zdYsmCqjTj3Cl6ZkZxuUd56F32",
        "2VCno0UoFcUciu5SlUkntqOHqPE3",
        "2ZF8iREwlzbbxKC2TlL2iQbThJY2",
        "3CwWEsIwgjWdm6DwUmdPqrxXurG2",
        "24zdYsmCqjTj3Cl6ZkZxuUd56F32",
        "2VCno0UoFcUciu5SlUkntqOHqPE3",
        "2ZF8iREwlzbbxKC2TlL2iQbThJY2",
        "3CwWEsIwgjWdm6DwUmdPqrxXurG2",
        "24zdYsmCqjTj3Cl6ZkZxuUd56F32",
        "2VCno0UoFcUciu5SlUkntqOHqPE3",
        "2ZF8iREwlzbbxKC2TlL2iQbThJY2",
        "3CwWEsIwgjWdm6DwUmdPqrxXurG2"
    ]
    
    init() {
        
    }
    
}

// MARK: - Equatable
extension User: Equatable {
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.userId == rhs.userId
    }
    
}

// MARK: - Hashable
extension User: Hashable {
    
    func hash(into hasher: inout Hasher) {
        
        hasher.combine(userId)
    }
    
}
