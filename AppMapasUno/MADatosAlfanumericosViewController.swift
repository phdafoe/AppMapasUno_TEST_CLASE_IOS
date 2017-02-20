//
//  MADatosAlfanumericosViewController.swift
//  AppMapasUno
//
//  Created by formador on 15/2/17.
//  Copyright © 2017 formador. All rights reserved.
//

import UIKit
import CoreLocation

class MADatosAlfanumericosViewController: UIViewController {
    
    //MARK: - Variables locales
    var locationManager = CLLocationManager()
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var myLatitudLBL: UILabel!
    @IBOutlet weak var myLongitudLBL: UILabel!
    @IBOutlet weak var myRumboLBL: UILabel!
    @IBOutlet weak var myVelocidadLBL: UILabel!
    @IBOutlet weak var myAltitudLBL: UILabel!
    @IBOutlet weak var myDireccionCercanaLBL: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension MADatosAlfanumericosViewController : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let userLocation = locations.first{
            //Actualizamos nuesta localizacion
            myLatitudLBL.text = "\(userLocation.coordinate.latitude)"
            myLongitudLBL.text = "\(userLocation.coordinate.longitude)"
            myRumboLBL.text = "\(userLocation.course)"
            myVelocidadLBL.text = "\(userLocation.speed)"
            myAltitudLBL.text = "\(userLocation.altitude)"
            
            //grupo de Geocodificacion Inversa
            CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: { (placemarks, error) in
                if error == nil{
                    if let placemarkData = placemarks?[0]{
                        var direccion = ""
                        direccion += self.addInfoIfExist(placemarkData.thoroughfare)
                        direccion += self.addInfoIfExist(placemarkData.subThoroughfare)
                        direccion += self.addInfoIfExist(placemarkData.subLocality)
                        direccion += self.addInfoIfExist(placemarkData.subAdministrativeArea)
                        direccion += self.addInfoIfExist(placemarkData.postalCode)
                        direccion += self.addInfoIfExist(placemarkData.country)
                        direccion += self.addInfoIfExist(placemarkData.locality)
                        self.myDireccionCercanaLBL.text = direccion
                        //info@andresocampo.com
                    }else{
                        
                    }
                }else{
                    print(error?.localizedDescription as Any)
                }
            })
        }
    }
    
    
    //Creamos una funcion para trabajar mejor la gestion de datos
    func addInfoIfExist(_ info : String?) -> String{
        if info != nil{
            return "\(info!) \n"
        }else{
            return ""
        }
    }
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}














