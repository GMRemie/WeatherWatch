//
//  LoadedViewController.swift
//  WeatherWatch
//
//  Created by Joseph Storer on 6/2/19.
//  Copyright © 2019 Joseph Storer. All rights reserved.
//

import UIKit

class LoadedViewController: UIViewController {

    var weatherData: Weather!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperatureImage: UIImageView!
    
    @IBOutlet weak var qualityColor: UIView!
    @IBOutlet weak var qualityLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //curve view
        qualityColor.layer.cornerRadius = 8.0
        
        //random background
        randomBackground()
        
        // air quality
        updateAirQuality(quality: weatherData.quality!)
        
        //temperature label
        updateWeatherTemperature()
        
        //temperature image
        updateWeatherImage()
        
        // Do any additional setup after loading the view.
        print("Final test \(weatherData.temperature!)")
    }
    
    

    func randomBackground(){
        
        let backgrounds = [UIImage.init(named: "bg1"),UIImage.init(named: "bg2"),UIImage.init(named: "bg3"),UIImage.init(named: "bg4"),UIImage.init(named: "bg5")]
        
        backgroundImage.image = backgrounds.randomElement() as? UIImage
    }
    
    func updateWeatherTemperature(){
        //(°C × 9/5) + 32 = 37.4°F
        let temperatureF = (weatherData.temperature! * 9/5) + 32
        temperatureLabel.text = "\(temperatureF)"
    }
    
    func updateWeatherImage(){
        
        guard let imageurl = Bundle.main.url(forResource: weatherData.icon!, withExtension: "png", subdirectory: "Icons") else{
            fatalError("Error getting image")
        }
        do{
            let imageData = try Data(contentsOf: imageurl)
            temperatureImage.image = UIImage.init(data: imageData)
        }catch{
            print("Error setting image data")
        }
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
        qualityColor.backgroundColor = color!
        qualityLabel.text = String(quality)
        qualityLabel.textColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.4)
    }
    
    
}
