//
//  chooseCItyController.swift
//  weather
//
//  Created by 木子 April on 2019/10/21.
//  Copyright © 2019 liujiaxin. All rights reserved.
//

import UIKit

class chooseCityController:UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    var city = ["大兴","长沙","济南","香港","南京"]
    
 
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return city.count
    }
        
    func tableView(_ tableView: UITableView!, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
            
            var title = cell.viewWithTag(101) as! UILabel
            title.text = "  " + city[indexPath.row]
            
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print(city[indexPath.row])
        self.dismiss(animated: false)
    }

    
    

}
