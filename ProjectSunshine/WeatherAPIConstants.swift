//
//  WeatherAPIConstants.swift
//  ProjectSunshine
//
//  Created by Mehdi Salemi on 2016-03-25.
//  Copyright © 2016 MxMd. All rights reserved.
//

struct WeatherConstants {
    
    struct ParameterKeys {
        static let base_url = "api.openweathermap.org/data/2.5/forecast/daily"
        static let api_key = "b1fa8d1d009b5054a4044f0f2695a717"
    }
    
}

/*
By city name
Description:

You can search 16 day weather forecast with daily average parameters by city name. All weather data can be obtained in JSON, XML or HTML format.
API call:

api.openweathermap.org/data/2.5/forecast/daily?q={city name},{country code}&cnt={cnt}
Parameters:

q city name and country code divided by comma, use ISO 3166 country codes

cnt number of days returned (from 1 to 16)

Examples of API calls:

Call 7 days forecast by city name in XML format and metric units api.openweathermap.org/data/2.5/forecast/daily?q=London&mode=xml&units=metric&cnt=7
*/


/* P-List App Security Override

<key>NSAppTransportSecurity</key>
<dict>
<key>NSAllowsArbitraryLoads</key>
<true/>
</dict>


*/