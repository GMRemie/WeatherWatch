//
//  AppDelegate.swift
//  WeatherWatch
//
//  Created by Joseph Storer on 5/21/19.
//  Copyright © 2019 Joseph Storer. All rights reserved.
//

import UIKit
import WatchConnectivity
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var weatherData: Weather?
    
    func loadWeatherData(weather:Weather){
        weatherData = weather
        DispatchQueue.main.async {
            guard let data = try? NSKeyedArchiver.archivedData(withRootObject: self.weatherData!, requiringSecureCoding: false)
             else{fatalError("Error")}
            self.session?.sendMessageData(data,replyHandler: nil,errorHandler: nil)
            print("Message sent")

        }
    }
    

    
    var session: WCSession? {
        didSet{
            if let session = session{
                session.delegate = self
                session.activate()
            }
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if WCSession.isSupported() {
            session = WCSession.default
        }

        return true
    }
}

extension AppDelegate:WCSessionDelegate{
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        DispatchQueue.main.async {
            
            if (message["getWeather"] as? Bool) != nil{
                NSKeyedArchiver.setClassName("Weather", for: Weather.self)
                
                guard let data = try? NSKeyedArchiver.archivedData(withRootObject: self.weatherData!, requiringSecureCoding: false)
                    else{fatalError("Error")}
                
                replyHandler(["newWeather": data])
                self.updateJSONData()

            }
        }
        
    }
}

extension AppDelegate{
    
    func updateJSONData(){
        
        print("Updating Data")
        guard let url = URL(string: "https://api.airvisual.com/v2/nearest_city?key=HMb6tJNuErQoWcD8f") else{
            print("Error constructing URL"); return
        }
        let request = URLRequest.init(url: url)
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (Data, Response, Error) in
            guard Error == nil else{
                print("ERROR " + Error!.localizedDescription);
                return
            }
            
            guard let response = Data else{
                print("no response data")
                return
            }
            do{
                let data = try JSONSerialization.jsonObject(with: response, options: .mutableContainers) as? [String:Any]
                print("parsing data")
                self.parseJsonWeatherData( jsonRaw: data)
            }catch{
                print("Error")
                return
            }
            
            //parse it
        }
        task.resume()
        
    }
    
    func parseJsonWeatherData(jsonRaw:[String:Any]?){
        guard let json = jsonRaw else{
            print("Error unwrapping json object")
            return
        }
        
        let data = json["data"] as! [String:Any]
        // locations
        let city = data["city"] as! String
        
        
        let state = data["state"] as! String
        let country = data["country"] as! String
        
        let current = data["current"] as! [String:Any]
        //weather
        let weather = current["weather"] as! [String:Any]
        let humidity = weather["hu"] as! Int
        let icon = weather["ic"] as! String
        let pressure = weather["pr"] as! Int
        let temp = weather["tp"] as! Int
        let windspeed = weather["ws"] as! Double
        // quality
        let pollution = current["pollution"] as! [String:Any]
        let quality = pollution["aqius"] as! Int
        
        let dataobj = Weather.init(_city: city, _state: state, _country: country, _humidity: humidity, _icon: icon, _pressure: pressure, _temperature: temp, _windspeed: windspeed, _quality: quality)
        
        self.weatherData = dataobj
        
        print("Completed creating weather Object")
    }
}
