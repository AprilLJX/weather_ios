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
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var windLable: UILabel!
    
    @IBOutlet weak var weatherIma: UIImageView!
    
    @IBOutlet weak var cityLabel: UILabel!
    

//    var urlLoc : URL = URL(string:"https://restapi.amap.com/v3/weather/weatherInfo?city=110115&key=41f720eb49677e9be60175b738426469")!
    
    var urlBasic : String =  "https://free-api.heweather.net/s6/weather/now?key=c8cabd5f858e4463a95139327638f66a&location="
    
    var urlLoc : String = ""
    var newUrl : String = ""
    
    var city : String = "大兴"
    var temperature : String = ""
    var weatherText : String = ""
    var wind : String = ""
    
     // 声明一个全局变量
    var locationManager:CLLocationManager!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //updateData()
        //getWeatherDate()
        print(urlLoc)

        
//         locationManager = CLLocationManager()
//        // 设置定位的精确度
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//
//        // 设置定位变化的最小距离 距离过滤器
//        locationManager.distanceFilter = 50
//
//        // 设置请求定位的状态
//        if #available(iOS 8.0, *) {
//            locationManager.requestWhenInUseAuthorization()
//        } else {
//            // Fallback on earlier versions
//                print("hello")
//        }//这个是在ios8之后才有的
//
//        // 设置代理为当前对象
//        locationManager.delegate = self;
//
//        if CLLocationManager.locationServicesEnabled(){
//        // 开启定位服务
//        locationManager.startUpdatingLocation()
//        }else{
//            print("没有定位服务")
//        }
        
        updateURL()
        updateWeather()
    }
    
//    // 定位失败调用的代理方法
//    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
//            print(error)
//    }
//   // 定位更新地理信息调用的代理方法
//    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if locations.count > 0
//        {
//            let locationInfo = locations.last!
//            let alert:UIAlertView = UIAlertView(title: "获取的地理坐标",
//                                                message: "经度是：\(locationInfo.coordinate.longitude)，维度是：\(locationInfo.coordinate.latitude)",
//                delegate: nil, cancelButtonTitle: "是的")
//            alert.show()
//        }
//    }
//
//    let clGeoCoder = CLGeocoder()
//    //这里是传值是经纬度
//            let cl = CLLocation(latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
//            clGeoCoder.reverseGeocodeLocation(cl, completionHandler: { (placemarks, error) in
//                if placemarks != nil {
//                    let placeMark = placemarks?.last
//                    let addressDic:NSDictionary = placeMark!.addressDictionary as! [String:AnyObject] as NSDictionary
//                    let state = addressDic.object(forKey: "State")//省会
//                    let City = addressDic.object(forKey: "City")//城市

//    })
//
//    func setTImer(){
//        //每隔一分钟执行一次打印
//        // GCD定时器
//        static dispatch_source_t _timer;
//        //设置时间间隔
//        NSTimeInterval period = 60.f;
//        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//        _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//        dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0);
//        // 事件回调
//        dispatch_source_set_event_handler(_timer, ^{
//            dispatch_async(dispatch_get_main_queue(), ^{
//                NSLog(@"Count");
//                //网络请求 doSomeThing...
//            });
//        });
//            
//        // 开启定时器
//        dispatch_resume(_timer);
//            
//        // 关闭定时器
//        // dispatch_source_cancel(_timer);
//    }
    
    func updateURL(){
        urlLoc = urlBasic + city
        print(urlLoc)
        var charSet = CharacterSet.urlQueryAllowed
        charSet.insert(charactersIn: "#")
        newUrl = urlLoc.addingPercentEncoding(withAllowedCharacters: charSet)!
        
        print(newUrl)
    
    }
    
    func updateWeather(){
        Alamofire.request(newUrl).validate().responseJSON{response in
            switch response.result.isSuccess{
            case true:
                if let value = response.result.value{
                    let json = JSON(value)
                    //print(json)
                    //print(json["HeWeather6"][0]["now"]["tmp"])
                    if let temperature = json["HeWeather6"][0]["now"]["tmp"].string{
                        self.temperatureLabel.text = temperature
                
                    }
                    if let weather = json["HeWeather6"][0]["now"]["cond_txt"].string{
                        self.weatherLabel.text = weather
                    }

                    self.cityLabel.text = self.city
                    
                    if let wind = json["HeWeather6"][0]["now"]["wind_dir"].string{
                        self.windLable.text = wind
                    }
                }
            case false:
                print(response.result.error)
            }
            
        }
    }
    
    
//    func updateUrl(city : String,citycode : String){
//        if(city == "大兴"){
//            cityCode = "110115"
//            urlLoc = //URL(string:"https://restapi.amap.com/v3/weather/weatherInfo?city=\(cityCode)&key=41f720eb49677e9be60175b738426469")!
//        }
//    }
    
//    func getWeatherDate(){
//    Alamofire.request(urlLoc).validate().responseJSON{ response in
//        switch response.result.isSuccess{
//        case true:
//            if let value = response.result.value{
//                let json = JSON(value)
//                if let temperature = json["lives"][0]["temperature"].string{
//
//                   // print("1温度！！！！！！：",temperature)
//                    //self.temperatureDaxing = temperature
//                    self.temperatureLabel.text = temperature
//                   // print("2温度！！！！！！：",self.temperatureDaxing)
//                }
//                if let weather = json["lives"][0]["weather"].string{
//
//                    print("3天气！！！！！！：",weather)
//                    //self.weatherNameDaxing = weather
//                    self.weatherLabel.text = weather
//                }
//                if let city = json["lives"][0]["city"].string{
//                    self.cityLabel.text = city
//                }
//                if let wind = json["lives"][0]["winddirection"].string{
//                    self.windLable.text = wind + "风"
//                }
//
//            }
//
//        case false:
//            print(response.result.error)
//        }
//
//    }
//
//}

}

