//
//  WeatherClient.swift
//  ProjectSunshine
//
//  Created by Mehdi Salemi on 2016-03-25.
//  Copyright © 2016 MxMd. All rights reserved.
//

import Foundation

class WeatherClient : NSObject {
    
    private static var sharedInstance = WeatherClient()
    
    class func sharedClient() -> WeatherClient {
        return sharedInstance
    }
    
    override init(){
        super.init()
    }
    
    func getWeatherData(cityName:String, countryCode:String){
        print("Starting Request")
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: buildUrlRequest(cityName, countryCode: countryCode))
        let request = NSURLRequest(URL: url!)
        print(url!)
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) in
            
            guard let data = data else {
                print("No data was returned by the request!")
                return
            }
            
            let parsedResult: AnyObject!
            do {
                parsedResult = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                
            } catch {
                print("Could not parse the data as JSON: '\(data)'")
                return
            }
            
            guard let weatherList = parsedResult["list"] as? [[String:AnyObject]] else {
                print("Error Making the Weather List")
                return
            }
            var count = 1
            for item in weatherList {
                print("Weather Item : \(count)")
                let current_date = item["dt_txt"]! as! String
                
                let windConditions = item["wind"] as! [String:AnyObject]
                let wind_speed = windConditions["speed"]
                
                let mainWeatherConditions = item["main"] as? [String:AnyObject]
                let sea_level = (mainWeatherConditions!["sea_level"])
                let current_temp = mainWeatherConditions!["temp"]
                let air_pressure = mainWeatherConditions!["pressure"]
                count += 1
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                // handler(photoArray: photos, cordinates: cord, page: photosDictionary["pages"] as! Int)
            }
        }
        task.resume()

        
    }

    func buildUrlRequest(cityName:String, countryCode:String) -> String{
        //return "api.openweathermap.org/data/2.5/forecast/daily?q=London&mode=json&units=metric&cnt=7"
        
        return "http://api.openweathermap.org/data/2.5/forecast/city?q=Toronto,2&cnt=2&APPID=b1fa8d1d009b5054a4044f0f2695a717"
    }
}
