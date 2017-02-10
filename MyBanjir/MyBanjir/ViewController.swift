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
import YXWaveView

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

        self.animateWave()
        
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
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func animateWave() {
        let frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 400)
        let blueWaterColor = UIColor(red: (98/255), green: (143/255), blue: (193/255), alpha: 1.0)
        let waterView = YXWaveView(frame: frame, color: blueWaterColor)
        
//        waterView.backgroundColor = UIColor(red: 248/255, green: 64/255, blue: 87/255, alpha: 1)
        waterView.backgroundColor =  UIColor(red: (53/255), green: (80/255), blue: (121/255), alpha: 1.0)
        self.view.insertSubview(waterView, at: 1)

        waterView.addOverView(self.arasAirLabel)
        
        waterView.start()
        
    }

}

