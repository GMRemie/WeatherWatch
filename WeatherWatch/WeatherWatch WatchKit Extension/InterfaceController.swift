//
//  InterfaceController.swift
//  WeatherWatch WatchKit Extension
//
//  Created by Joseph Storer on 5/21/19.
//  Copyright © 2019 Joseph Storer. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController,WCSessionDelegate {
    
    var weatherData:Weather?
    
    @available(watchOS 2.2, *)
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?){
        
    }
    fileprivate let session: WCSession? = WCSession.isSupported() ? WCSession.default:nil
    
    override init() {
        super.init()
        session?.delegate = self
        session?.activate()
        getWeatherData()
   }
    
    func getWeatherData(){
        print("Get data")
       let myValues:[String:Any] = ["getWeather":true]
        if let session = session, session.isReachable{
            session.sendMessage(myValues, replyHandler: {
                replyData in
                DispatchQueue.main.async {
                    if let data = replyData["newWeather"] as? Data{
                        NSKeyedUnarchiver.setClass(Weather.self, forClassName: "Weather")
                        do {
                            guard let weatherObject = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Weather else {
                                fatalError("Can't get fruit array")
                            }
                            
                            self.weatherData = weatherObject
                            
                            // hide whateer loading UI here
                            print("WEATHER \(self.weatherData?.city) \(self.weatherData?.quality)" )
                            
                            
                        } catch {
                            fatalError(error as! String)
                        }
                        
                    }
                }
            }, errorHandler: nil)
        }
    }
    
    func session(_ session: WCSession, didReceiveMessageData messageData: Data) {
        print("Received Message!")
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
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
