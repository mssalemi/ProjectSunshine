//
//  ViewController.swift
//  ProjectSunshine
//
//  Created by Mehdi Salemi on 2016-03-25.
//  Copyright © 2016 MxMd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        WeatherClient.sharedClient().getWeatherData("Toronto", countryCode: "FUCKOFF")
    }

}

