//
//  ViewController.swift
//  WeatherWatch
//
//  Created by Joseph Storer on 5/21/19.
//  Copyright © 2019 Joseph Storer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var weatherData:Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        getWeatherJsonData()
    
        while weatherData == nil{
            // do loading stuff
            // hide loading animation after this while loop
        }

        if let myDelegate = UIApplication.shared.delegate as? AppDelegate {
            myDelegate.loadWeatherData(weather: weatherData!)
        }

        
    }

    func assignWeatherDataObject(weatherObj:Weather){
        weatherData = weatherObj
    }
    
}

