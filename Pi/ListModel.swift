//
//  ListModel.swift
//  Pi
//
//  Created by Louay Baccary on 11/11/18.
//  Copyright © 2018 Louay Baccary. All rights reserved.
//

import Foundation

protocol HomeModelProtocol: class {
    
}

class ListModel: NSObject, URLSessionDataDelegate{
    //prop
    weak var delegate: HomeModelProtocol!
    var data = Data()
    let urlPath: String = "http://192.168.137.1:8080/pi/storeApi.php"

    func DownloadItems(){
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        let task = defaultSession.dataTask(with: url){
            (data, response, error ) in
            if error != nil {
                print("ereur")
            }else {
                print("Valide")
                self.parseJSON(data!)
            }
        }
        task.resume()
    }
    func parseJSON(_ data: Data){
        var jsonR = NSArray()
        do{
            jsonR = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)as! NSArray
        }catch let error as NSError {
            print(error)
        }
        
        var jsonElem = NSDictionary()
        let locations = NSMutableArray()
        
        for i in 0 ..< jsonR.count
        {
            jsonElem = jsonR[i] as! NSDictionary
            let loc = LocationModel()
                      if let name = jsonElem["Name"] as? String,
                            let adresse = jsonElem["Adresse"]as? String,
                            let latitude = jsonElem["Lat"]as? String,
                            let longitude = jsonElem["Long"]as? String
                        {
                            loc.Name = name
                            loc.Adresse = adresse
                            loc.Lat = latitude
                            loc.Long = longitude
                        }
            locations.add(loc)
        }
        
        DispatchQueue.main.async (execute: {()-> Void in
            self.delegate.itemsDownloaded(items: locations)
        })
        
    }

}

