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
    
    
    
    
    func encode(with a: NSCoder) {
        a.encode(city, forKey: "dataCity")
        a.encode(state, forKey: "dataState")
        a.encode(country, forKey: "dataCountry")
        a.encode(humidity, forKey: "dataHumidity")
        a.encode(icon, forKey: "dataIcon")
        a.encode(pressure, forKey: "dataPressure")
        a.encode(temperature, forKey: "dataTemperature")
        a.encode(windspeed, forKey: "dataWindspeed")
        a.encode(quality, forKey: "dataQuality")
        
    }
    
    required convenience init?(coder a: NSCoder) {
        self.init(_city: "error", _state: "error", _country: "error", _humidity: 0, _icon: "error", _pressure: 0, _temperature: 0, _windspeed: 0, _quality: 0)
        
        city = a.decodeObject(forKey: "dataCity") as? String
        state = a.decodeObject(forKey: "dataState") as? String
        country = a.decodeObject(forKey: "dataCountry") as? String
        humidity = a.decodeObject(forKey: "dataHumidity") as? Int
        icon = a.decodeObject(forKey: "dataIcon") as? String
        pressure = a.decodeObject(forKey: "dataPressure") as? Int
        temperature = a.decodeObject(forKey: "dataTemperature") as? Int
        windspeed = a.decodeObject(forKey: "dataWindspeed") as? Int
        quality = a.decodeObject(forKey: "dataQuality") as? Int
        
    }
    
}
