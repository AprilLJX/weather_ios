//
//  ViewController.swift
//  weather
//
//  Created by 木子 April on 2019/10/19.
//  Copyright © 2019 liujiaxin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

//    @IBAction func chooseCityBut(_ sender: Any) {
//        self.present(chooseCityController(nibName: "chooseCityController", bundle: ), animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
//    }
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var windLable: UILabel!
    
    @IBOutlet weak var weatherIma: UIImageView!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    var temperature : String = "15"
    var weatherText : String = "晴"
    var wind : String = "北风"
    var cityCode : String = "110115"
    var city : String = "大兴"
    var urlLoc : URL = URL(string:"https://restapi.amap.com/v3/weather/weatherInfo?city=110115&key=41f720eb49677e9be60175b738426469")!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //updateData()
        getWeatherDate()
    }
    
    func updateData(){
        temperatureLabel.text = temperature
        weatherLabel.text = weatherText
        windLable.text = wind
    }
    
    func updateUrl(city : String,citycode : String){
        if(city == "大兴"){
            cityCode = "110115"
            urlLoc = URL(string:"https://restapi.amap.com/v3/weather/weatherInfo?city=\(cityCode)&key=41f720eb49677e9be60175b738426469")!
        }
    }
    
    func getWeatherDate(){
    Alamofire.request(urlLoc).validate().responseJSON{ response in
        switch response.result.isSuccess{
        case true:
            if let value = response.result.value{
                let json = JSON(value)
                if let temperature = json["lives"][0]["temperature"].string{
                    
                   // print("1温度！！！！！！：",temperature)
                    //self.temperatureDaxing = temperature
                    self.temperatureLabel.text = temperature
                   // print("2温度！！！！！！：",self.temperatureDaxing)
                }
                if let weather = json["lives"][0]["weather"].string{
                    
                    print("3天气！！！！！！：",weather)
                    //self.weatherNameDaxing = weather
                    self.weatherLabel.text = weather
                }
                if let city = json["lives"][0]["city"].string{
                    self.cityLabel.text = city
                }
                if let wind = json["lives"][0]["winddirection"].string{
                    self.windLable.text = wind + "风"
                }
                
            }
            
        case false:
            print(response.result.error)
        }
       
    }
    
    func getWeatherInf(){

        // 创建一个会话，这个会话可以复用
        let session = URLSession(configuration : .default)
        // 设置URL
        var UrlRequest = URLRequest(url : urlLoc)
        // 创建一个网络任务
        let task = session.dataTask(with: UrlRequest) {(data, response, error) in
            do {
                // 返回的是一个json，将返回的json转成字典r
                let r = try JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
                print(r)
            } catch {
                // 如果连接失败就...
                print("无法连接到服务器")
                return
            }
        }
        // 运行此任务
        task.resume()
    }

}

}
