//
//  DataObject.swift
//  MyBanjir
//
//  Created by Wazir on 09/02/2017.
//  Copyright © 2017 Wazir. All rights reserved.
//

import Foundation

class BanjirEntry: NSObject {
    
    let parasAir: String
    let namaLaluan: String
    let daerah: String
    let negeri: String
    let dikemaskini : String
    let status: String
    let googleMapsUrl: String
    
    init(parasAir: String, namaLaluan: String, daerah: String, negeri: String, dikemaskini: String, status: String, googleMapsUrl: String) {
        self.parasAir = parasAir
        self.namaLaluan = namaLaluan
        self.daerah = daerah
        self.negeri = negeri
        self.dikemaskini = dikemaskini
        self.status = status
        self.googleMapsUrl = googleMapsUrl
    }
    
    class func from(json: [String: Any]) -> BanjirEntry? {
        guard let parasAir = json["paras_air"] as? String,
            let namaLaluan = json["nama_laluan"] as? String,
            let daerah = json["daerah"] as? String,
            let negeri = json["negeri"] as? String,
            let dikemaskini = json["dikemaskini"] as? String,
            let status = json["status"] as? String,
            let googleMapsUrl = json["google_maps_url"] as? String else {
                return nil
        }
        
            let parasAirWithSuffix = "\(parasAir)m"
        return BanjirEntry(parasAir: parasAirWithSuffix, namaLaluan: namaLaluan, daerah: daerah, negeri: negeri, dikemaskini: dikemaskini, status: status, googleMapsUrl: googleMapsUrl)
        
    }
    
}
