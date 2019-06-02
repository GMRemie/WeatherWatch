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
    @IBOutlet weak var airqualityLabel: WKInterfaceLabel!
    @IBOutlet weak var locationLabel: WKInterfaceLabel!
    @IBOutlet weak var countryLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        guard let weather = context as? Weather else{
            print("Error passing weather")
            return
        }
        
        weatherData = weather
        locationLabel.setText("\(weatherData.city!), \(weatherData.state!)")
        updateAirQuality(quality: weatherData.quality!)
        countryLabel.setText(weatherData.country!)
        becomeCurrentPage()
    }
    
    private func updateAirQuality(quality: Int){
        
        var color: UIColor?
        switch(true){
        case quality < 51:
           // Good
            color = UIColor.init(red: 188/255, green: 230/255, blue: 121/255, alpha: 79/100)
            break;
        case (quality > 50 && quality < 101):
            // Moderate
            color = UIColor.init(red: 241/255, green: 196/255, blue: 15/255, alpha: 79/100)
            break;
        case (quality > 100 && quality < 151):
            // Unhealthy for certain
            color = UIColor.init(red: 230/255, green: 126/255, blue: 34/255, alpha: 79/100)
            break;
        case (quality > 150 && quality < 201):
            //Unhealthy
            color = UIColor.init(red: 231/255, green: 76/255, blue: 60/255, alpha: 79/100)
            break;
        case (quality > 200 && quality < 301):
            // Very unhealthy
            color = UIColor.init(red: 155/255, green: 89/255, blue: 182/255, alpha: 79/100)
            break;
        case (quality > 300):
            // Seek help
            color = UIColor.init(red: 142/255, green: 68/255, blue: 173/255, alpha: 79/100)
            break;
        default:
            // lets default to white
            color = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 79/100)
            break;
        }
        airqualityLabel.setTextColor(color!)
        airqualityLabel.setText("\(weatherData.quality!)")
    }

    override func willActivate() {
        super.willActivate()
    }

    
    
    override func didDeactivate() {
        super.didDeactivate()
    }

    
}
