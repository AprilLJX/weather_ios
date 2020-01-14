//
//  chooseCItyController.swift
//  weather
//
//  Created by 木子 April on 2019/10/21.
//  Copyright © 2019 liujiaxin. All rights reserved.
//

import UIKit



class chooseCityController:UIViewController,UITableViewDataSource,UITableViewDelegate{
    
  
    let TAG_LABEL_CERLL = 101
    var city = ["大兴","长沙","济南","香港","南京"]
    var selectCity = ""
    var historyCIty = [String]()
    
    var cityDic : NSDictionary? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cityDic = NSDictionary(contentsOfFile:Bundle.main.path(forResource: "area", ofType: "plist")!)
//            var list : Array<Any>
//            for (key, value) in cityDic! {
//            print("\(key) is:")
//                list = value as! Array<Any>
//                for i in list{
//                    print(i)
//                }
        //}


        //print(cityDic!.count)
    }
    
    

     func numberOfSections(in tableView: UITableView) -> Int {
           return cityDic!.count
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //let data = self.city[section]
//        print((cityDic!.allValues[section] as! NSArray).count)
        return (cityDic!.allValues[section] as! NSArray).count
//        return city.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //print(cityDic?.allKeys[section] as! String)
        return cityDic?.allKeys[section] as! String
    }
        
    func tableView(_ tableView: UITableView!, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "city_table")!

            var title = cell.viewWithTag(101) as! UILabel
            //title.text = "  " + city[indexPath.row]
       title.text = (cityDic?.allValues[indexPath.section] as! NSArray).object(at: indexPath.row) as! String
        
            
            return cell as UITableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        selectCity = (cityDic?.allValues[indexPath.section] as! NSArray).object(at: indexPath.row) as! String
        print(selectCity)
        historyCIty.append(selectCity)
        print(historyCIty.count)
        for i in historyCIty{
            print(i)
        }
        
        transCIty(nextStory : "showWeatherStoryBoard")
 
    }
//页面跳转加传值。nextsStory传入的是storyboard的id
//https://blog.csdn.net/angcyo/article/details/52196550
    
    func  transCIty(nextStory : String) {
        if let nextStory = self.storyboard?.instantiateViewController(withIdentifier: "showWeatherStoryBoard") {
            let vc = nextStory as! ViewController
            vc.modalTransitionStyle = .crossDissolve // 选择过渡效果
            vc.city = selectCity // 参数赋值

            self.present(vc, animated: true, completion: nil)
    
    }

}
}
