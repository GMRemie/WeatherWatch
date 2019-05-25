//
//  AnimationExtension.swift
//  WeatherWatch WatchKit Extension
//
//  Created by Joseph Storer on 5/25/19.
//  Copyright © 2019 Joseph Storer. All rights reserved.
//

import Foundation
import UIKit
extension InterfaceController{
    
    func addLoadingImages(){
        loadingImage.setImageNamed("sun")
        loadingImage.startAnimatingWithImages(in: NSRange(location: 0, length: 49), duration: 4.0, repeatCount: 0)
        
    }
    
    
    
}
