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
    
    @IBOutlet weak var loadingImage: UIImageView!
    var animationImages: [UIImage]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadImages()
        loadingImage.animationImages = animationImages
        loadingImage.animationDuration = TimeInterval.init(exactly: 2.0)!
        loadingImage.animationRepeatCount = 0
        loadingImage.startAnimating()
        
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
        print("Completed")
        weatherData = weatherObj
        // finished loading
        performSegue(withIdentifier: "loadedSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? LoadedViewController {
            destination.weatherData = self.weatherData!
        }
    }
    
    
    func loadImages(){

    }
}

