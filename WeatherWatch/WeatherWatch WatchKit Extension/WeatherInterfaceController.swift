//
//  WeatherInterfaceController.swift
//  WeatherWatch WatchKit Extension
//
//  Created by Joseph Storer on 5/28/19.
//  Copyright © 2019 Joseph Storer. All rights reserved.
//

import WatchKit
import Foundation


class WeatherInterfaceController: WKInterfaceController {

    var weatherData: Weather!
    @IBOutlet weak var temperatureLabel: WKInterfaceLabel!
    @IBOutlet weak var temperatureImage: WKInterfaceImage!
    
    @IBOutlet weak var humidityLabel: WKInterfaceLabel!
    @IBOutlet weak var pressureLabel: WKInterfaceLabel!
    @IBOutlet weak var windspeedLabel: WKInterfaceLabel!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
    
        guard let weather = context as? Weather else{
            print("Error getting context data")
            return
        }
        weatherData = weather
        updateWeatherTemperature()
        updateWeatherDetails()
        updateWeatherImage()
    }
    
    func updateWeatherDetails(){
        // Humidity
        humidityLabel.setText("Humidity: \(weatherData.humidity!)%")
        // Pressure
        pressureLabel.setText("Pressure: \(weatherData.pressure!)")
        // Windspeed
        windspeedLabel.setText("Windspeed: \(weatherData.windspeed!) m/s")
    }
    
    func updateWeatherTemperature(){
        //(°C × 9/5) + 32 = 37.4°F
        let temperatureF = (weatherData.temperature! * 9/5) + 32
        temperatureLabel.setText("\(temperatureF)")
    }

    func updateWeatherImage(){
        
        guard let imageurl = Bundle.main.url(forResource: weatherData.icon!, withExtension: "png", subdirectory: "Icons") else{
            fatalError("Error getting image")
        }
        do{
            let imageData = try Data(contentsOf: imageurl)
            temperatureImage.setImageData(imageData)
        }catch{
            print("Error setting image data")
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
