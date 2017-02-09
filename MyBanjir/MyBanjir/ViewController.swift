//
//  ViewController.swift
//  MyBanjir
//
//  Created by Wazir on 09/02/2017.
//  Copyright © 2017 Wazir. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    var data = [] as [Any]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let apiURL = "https://banjir-api.herokuapp.com/api/v1/reports.json"
        
        Alamofire.request(apiURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                
                let dict = value as! [String: Any?]
                print(dict)
                
                let sections = dict["data"] as? [[String: Any]]
                
                for section in sections! {
                    
                    let banjirEntry = BanjirEntry.from(json: section)
                    self.data.append(banjirEntry!)
                    
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

