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
            
            let weatherObj:Weather? = nil
            
            
            
            
            if (message["getWeather"] as? Bool) != nil{
                NSKeyedArchiver.setClassName("Weather", for: Weather.self)
                //let arrayOfFruit = Data.init().fruits
                //guard let data = try? //NSKeyedArchiver.archivedData(withRootObject: arrayOfFruit, requiringSecureCoding: false)
                   // else{fatalError("Error")}
                
               // replyHandler(["newWeather": data])
                
                
                
                
            }
        }
    }
}
