//
//  ViewController.swift
//  WeatherWatch
//
//  Created by Joseph Storer on 5/21/19.
//  Copyright © 2019 Joseph Storer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var t = Weather.init()
        APIRequest.init().getWeatherJsonData(_weather: t)
        
        print("this was ran")
        
    }


}

