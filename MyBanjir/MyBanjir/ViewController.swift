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

    @IBOutlet weak var daerahLabel: UILabel!
    @IBOutlet weak var negeriLabel: UILabel!
    @IBOutlet weak var arasAirLabel: UILabel!
    @IBOutlet weak var jalanLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    var data = [] as [BanjirEntry]
//    var data = []()
    
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
                
                self.daerahLabel.text = self.data[0].daerah.uppercased()
                self.negeriLabel.text = self.data[0].negeri.uppercased()
                self.arasAirLabel.text = self.data[0].parasAir
                self.jalanLabel.text = self.data[0].namaLaluan
                self.statusLabel.text = self.data[0].status
                
            case .failure(let error):
                print(error)
            }
        }
 
        
        /*
        Alamofire.request(apiURL, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

