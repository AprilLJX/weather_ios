////
////  chooseCItyController.swift
////  weather
////
////  Created by 木子 April on 2019/10/21.
////  Copyright © 2019 liujiaxin. All rights reserved.
////
//
//import UIKit
//
//
//enum LocationType {
//    case State
//    case City
//    case Area
//}
//
//protocol LocationSelectorDelegate {
//    func locationSelected(location: String)
//}
//
//class chooseCity_v2:UIViewController,UITableViewDataSource,UITableViewDelegate{
//    
//  
//    let TAG_LABEL_CERLL = 101
////    var city = ["大兴","长沙","济南","香港","南京"]
////    var selectCity = ""
//    
//    var locationType = LocationType.State
//    var locations: NSArray!
//    
//    var selectCity = ""
//    var locationName = ""
//    var locationPath = ""
//    
//    var delegate: LocationSelectorDelegate?
//    
//    
//    //var cityDic : NSDictionary? = nil
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
////        cityDic = NSDictionary(contentsOfFile:Bundle.main.path(forResource: "city", ofType: "plist")!)
//        if locationType == .State {
//            locations = NSArray(contentsOfFile:Bundle.main.path(forResource: "city", ofType: "plist")!)
//        }
////            var list : Array<Any>
////            for (key, value) in cityDic! {
////            print("\(key) is:")
////                list = value as! Array<Any>
////                for i in list{
////                    print(i)
////                }
//        //}
//
//
//        //print(cityDic!.count)
//    }
//    
//    
//
//     func numberOfSections(in tableView: UITableView) -> Int {
////           return cityDic!.count
//        if locationType == .State {
//            return 2
//        }
//        return 1
//       }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        //let data = self.city[section]
////        print((cityDic!.allValues[section] as! NSArray).count)
//       // return (cityDic!.allValues[section] as! NSArray).count
////        return city.count
//        if locationType == .State && section == 0 {
//            return 1
//        }
//        
//        return locations.count
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        //print(cityDic?.allKeys[section] as! String)
//       // return cityDic?.allKeys[section] as! String
//        if locationType == .State {
//            switch section {
//            case 0: return "当前地区"
//            case 1: return "全国"
//            default: break
//            }
//        }
//        
//        return nil
//    }
//        
//    func tableView(_ tableView: UITableView!, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
////        let cell = tableView.dequeueReusableCell(withIdentifier: "city_table")!
////
////            var title = cell.viewWithTag(101) as! UILabel
////            //title.text = "  " + city[indexPath.row]
////       title.text = (cityDic?.allValues[indexPath.section] as! NSArray).object(at: indexPath.row) as! String
////
////
////            return cell as UITableViewCell
//        
//        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "city_table") as? UITableViewCell
//        
//        if cell == nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "locationCell")
//        }
//        var title = cell.viewWithTag(101) as! UILabel
//        switch locationType {
//        case .State:
//            if indexPath.section == 0 {
//                title.text = "正在定位..."
//            } else {
//                title.text = (self.locations[indexPath.row] as! NSDictionary)["state"] as? String
//            }
//        case .City:
//            title.text = (self.locations[indexPath.row] as! NSDictionary)["city"] as? String
//        case .Area:
//            title.text = self.locations[indexPath.row] as? String
//        default: break
//        }
//        
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: NSIndexPath){
////        selectCity = (cityDic?.allValues[indexPath.section] as! NSArray).object(at: indexPath.row) as! Strin
////        let nextLocationSelector = chooseCityController()
////        nextLocationSelector.delegate = self.delegate
////        let currentLocation = tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text
////        nextLocationSelector.locationPath = "\(locationPath) \(currentLocation!)"
////        print(selectCity)
//        let nextChooseCityController = chooseCityController()
//        nextChooseCityController.delegate = self.delegate
//        let currentLocation = tableView.cellForRow(at: indexPath as IndexPath)?.textLabel?.text
//        nextChooseCityController.locationPath = "\(locationPath) \(currentLocation!)"
//        switch locationType {
//        case .State:
//            if indexPath.section == 0{
//                tableView.deselectRow(at: indexPath as IndexPath, animated: true)
//                if !locationName.isEmpty{
//                    self.delegate?.locationSelected(location: locationName)
//                    return
//                }
//            }
//            nextChooseCityController.locations = (self.locations[indexPath.row] as! NSDictionary)["cities"] as! NSArray
//            nextChooseCityController.locationType = .City
//        case .City:
//            nextChooseCityController.locations = (self.locations[indexPath.row] as! NSDictionary)["areas"] as! NSArray
//            nextChooseCityController.locationType = .Area
//        default:
//            nextChooseCityController.locations = []
//            break
//        }
//        //transCIty(nextStory : "showWeatherStoryBoard")
//        if (nextChooseCityController.locations.count > 0) {
//            navigationController?.pushViewController(nextChooseCityController, animated: true)
//        } else {
//            let currentLocation = tableView.cellForRow(at: indexPath as IndexPath)?.textLabel?.text
//            self.delegate?.locationSelected(location: "\(locationPath) \(currentLocation!)")
//        }
//    }
////页面跳转加传值。nextsStory传入的是storyboard的id
////https://blog.csdn.net/angcyo/article/details/52196550
//    
//    func  transCIty(nextStory : String) {
//        if let nextStory = self.storyboard?.instantiateViewController(withIdentifier: "showWeatherStoryBoard") {
//            let vc = nextStory as! ViewController
//            vc.modalTransitionStyle = .crossDissolve // 选择过渡效果
//            vc.city = selectCity // 参数赋值
//
//            self.present(vc, animated: true, completion: nil)
//    
//    }
//
//}
//}
