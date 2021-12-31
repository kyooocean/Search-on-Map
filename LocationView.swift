//
//  LocationView.swift
//  Map
//
//  Created by Kyohei Morinaka on 2021/12/31.
//

import SwiftUI
import MapKit

struct LocationView: UIViewRepresentable {
    let searchKey: String
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        print(searchKey)
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(
            searchKey ,
            completionHandler: { (placemarks, error) in
            //request;outputLocation
            if let unwrapPlacemarks = placemarks ,
               let firstPlacemark = unwrapPlacemarks.first ,
               let location = firstPlacemark.location {
                   //latitude&longitude from location to targetCoordinate
                   let targetCoordinate = location.coordinate
                   
                   print(targetCoordinate)
                   
                   let pin = MKPointAnnotation()
                   
                   pin.coordinate = targetCoordinate
                   pin.title = searchKey
                   uiView.addAnnotation(pin)
                   uiView.region = MKCoordinateRegion(
                       center: targetCoordinate,
                       latitudinalMeters: 500.0,
                       longitudinalMeters: 500.0)
            }
        })
    }
}
