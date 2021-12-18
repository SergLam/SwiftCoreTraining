//
//  SharedTypeAliases.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 4/13/21.
//  Copyright © 2021 serglam. All rights reserved.
//

import CoreLocation
import MapKit
import UIKit

typealias Storyboard = UIStoryboard

typealias TypeClosure<T> = (T) -> Void

typealias VoidClosure = () -> Void
typealias VoidResultClosure = (Swift.Result<Void, Error>) -> Void

typealias TypeResult<T> = Swift.Result<T, Error>
typealias TypeResultClosure<T> = (Swift.Result<T, Error>) -> Void

typealias GeocoderCompletion = ((Swift.Result<[CLPlacemark], Error>) -> Void)
typealias PlaceSearchCompletion = ((Swift.Result<[MKMapItem], Error>) -> Void)

public typealias DataUpdateInfo = [String: [String: Any]]
