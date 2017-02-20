//
//  MAPrimerMapaViewController.swift
//  AppMapasUno
//
//  Created by formador on 13/2/17.
//  Copyright © 2017 formador. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

enum MapType : Int{
    case standard = 0
    case hibrido = 1
    case satelite = 2
}

class MAPrimerMapaViewController: UIViewController {
    
    //MARK: - Variables Locales
    var locationManger = CLLocationManager()
    
    
    
    //MARK: - IBOutlet
    @IBOutlet weak var myPrimerMapView: MKMapView!
    @IBOutlet weak var myInformacionMapLBL: UILabel!
    @IBOutlet weak var mySeleccionTipoMapa: UISegmentedControl!
    
    //MARK: - IBActions
    @IBAction func muestraMapACTION(_ sender: AnyObject) {
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.245412, longitude: -3.776600), span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))
        myPrimerMapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 40.245412, longitude: -3.776600)
        annotation.title = "Esta es mi casa"
        annotation.subtitle = "Estamos estudiando hasta las 3 de la mañana"
        myPrimerMapView.addAnnotation(annotation)
        
    }
    
    
    @IBAction func myTipoMapaCambiadoACTION(_ sender: AnyObject) {
        
       let mapType = MapType(rawValue: mySeleccionTipoMapa.selectedSegmentIndex)
        
        switch mapType! {
        case .standard:
            myPrimerMapView.mapType = .standard
        case .hibrido:
            myPrimerMapView.mapType = .hybrid
        case .satelite:
            myPrimerMapView.mapType = .satellite
        break
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Fase de precision del GPS -> CoreLocation
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.delegate = self
        locationManger.requestWhenInUseAuthorization()
        locationManger.startUpdatingLocation()
        
        
        //gesto de reconocimiento
        let longPressGestureRecognizerCustom = UILongPressGestureRecognizer(target: self, action: #selector(self.actionGestureRecognizer(_:)))
        longPressGestureRecognizerCustom.minimumPressDuration = 2
        myPrimerMapView.addGestureRecognizer(longPressGestureRecognizerCustom)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Utils // info@andresocampo.com
    func actionGestureRecognizer(_ gesture : UIGestureRecognizer){
        
        if gesture.state == UIGestureRecognizerState.began{
            let puntoToquePantalla = gesture.location(in: myPrimerMapView)
            let nuevaCoordenada = myPrimerMapView.convert(puntoToquePantalla, toCoordinateFrom: myPrimerMapView)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = nuevaCoordenada
            annotation.title = "nuevo punto en el mapa"
            annotation.subtitle = "seguimos currando en iOS"
            myPrimerMapView.addAnnotation(annotation)
        }
        
    }


}

extension MAPrimerMapaViewController : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation = locations.first!
        
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        myPrimerMapView.setRegion(region, animated: true)
        myInformacionMapLBL.text = "\(userLocation)"
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = userLocation.coordinate
        annotation.title = "Titulo por defecto"
        annotation.subtitle = "Subtitulo por defecto"
        myPrimerMapView.addAnnotation(annotation)
    }
    
}






















