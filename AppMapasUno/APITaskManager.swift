//
//  APITaskManager.swift
//  AppMapasUno
//
//  Created by formador on 22/2/17.
//  Copyright © 2017 formador. All rights reserved.
//

import Foundation
import UIKit

class APITaskManager {
    
    let pref = UserDefaults.standard
    static let shared = APITaskManager()
    
    var longitud : [diccionario] = [[:]]
    var latitud : [diccionario] = [[:]]
    
    func salvarDatos(){
        pref.set(latitud, forKey: "latitud")
        pref.set(longitud, forKey: "longitud")
    }
    
    func cargarDatos(){
        if let myArraLat = pref.array(forKey: "latitud") as? [diccionario]{
            latitud = myArraLat
        }
        if let myArrayLong = pref.array(forKey: "longitud") as? [diccionario]{
            longitud = myArrayLong
        }
    }
}
