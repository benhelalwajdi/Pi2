//
//  LocationModel.swift
//  Pi
//
//  Created by Louay Baccary on 11/11/18.
//  Copyright © 2018 Louay Baccary. All rights reserved.
//

import Foundation
class LocationModel: NSObject
{
    //properties
    var Name: String?
    var Adresse: String?
    var Lat: String?
    var Long: String?
    
    //Un Const Vide
    override init() {
        
    }
    
    //const avec @name, @address, @lat et @long
    init (Name: String, Adresse: String, Lat: String, Long: String){
        self.Name = Name
        self.Adresse = Adresse
        self.Lat = Lat
        self.Long = Long
    }
    
    //Affiche cette obj
    override var description: String{
        return "Name: \(Name), Adresse: \(Adresse), Lat: \(Lat), \(Long)"
    }
    
}
