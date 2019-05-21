//
//  Weather.swift
//  WeatherWatch
//
//  Created by Joseph Storer on 5/21/19.
//  Copyright © 2019 Joseph Storer. All rights reserved.
//

import Foundation
import WatchConnectivity

class Weather: NSObject,NSCoding {

    // location
    var city: String?
    var state: String?
    var country: String?
    
    // Weather
    var humidity: Int?
    var icon: String?
    var pressure: Int?
    var temperature: Int?
    var windspeed: Int?
    
    // Pollution
    var quality: Int?
    
    
    init(_city: String,_state:String,_country:String,_humidity:Int,_icon:String,_pressure:Int,_temperature:Int,_windspeed:Int,_quality:Int){
        self.city = _city
        self.state = _state
        self.country = _country
        self.humidity = _humidity
        self.icon = _icon
        self.pressure = _pressure
        self.temperature = _temperature
        self.windspeed = _windspeed
        self.quality = _quality
    }
    
    
    
    
    func encode(with aCoder: NSCoder) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
    }
    
}
