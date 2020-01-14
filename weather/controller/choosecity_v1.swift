//
//  chooseCItyController.swift
//  weather
//
//  Created by 木子 April on 2019/10/21.
//  Copyright © 2019 liujiaxin. All rights reserved.
//

import UIKit



class choosecity_v1:UIViewController,UITableViewDataSource,UITableViewDelegate{
    
  
    var city = ["大兴","长沙","济南","香港","南京"]
    var selectCity = ""
    var selectCItyPinyin = ""
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //let data = self.city[section]
        return city.count
    }
        
    func tableView(_ tableView: UITableView!, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "city_table")!
            
            var title = cell.viewWithTag(101) as! UILabel
            title.text = "  " + city[indexPath.row]
        //title.text = "  " + city_model.cityList![indexPath.row]
            
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        selectCity = city[indexPath.row]
        print(selectCity)
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
