//
//  LoadedInterfaceController.swift
//  WeatherWatch WatchKit Extension
//
//  Created by Joseph Storer on 5/25/19.
//  Copyright © 2019 Joseph Storer. All rights reserved.
//

import WatchKit
import Foundation


class LoadedInterfaceController: WKInterfaceController {

    var weatherData: Weather!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        guard let weather = context as? Weather else{
            print("Error passing weather")
            return
        }
        weatherData = weather
        
        print(weatherData.city!)
        
        
        
        
        
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    
}
