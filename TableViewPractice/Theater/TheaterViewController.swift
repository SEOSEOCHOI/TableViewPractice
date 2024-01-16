//
//  TheaterViewController.swift
//  TableViewPractice
//
//  Created by 최서경 on 1/15/24.
//

import UIKit
import MapKit

enum TheaterType: Int, CaseIterable {
    case 롯데시네마
    case 메가박스
    case CGV
    
    var typeString: String {
        switch self {
        case .롯데시네마:
            return "롯데시네마"
        case .메가박스:
            return "메가박스"
        case .CGV:
            return "스타벅스"
        }
    }
    
}


class TheaterViewController: UIViewController {
    
    @IBOutlet var tyepSegment: UISegmentedControl!
    @IBOutlet var mapView: MKMapView!
    let theater: [Theater] = TheaterList.mapAnnotations
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        segment()
        
        
        
        let coordinate = CLLocationCoordinate2D(latitude: theater[1].latitude, longitude: theater[1].longitude)
        
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 500, longitudinalMeters: 500) // center와 축적
        mapView.setRegion(region, animated: true) // 역순으로 추론 시 타입은 어려워도 타입 추론에 대한 이해 가능
        
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = theater[1].location
        mapView.addAnnotation(annotation)
        
    }
    
}

// MARK: Segment
extension TheaterViewController {
    func segment() {
        
        var theaterString: [String] = []

        for count in 0 ... TheaterType.allCases.count - 1 {
            theaterString.append(TheaterType.allCases[count].typeString)
        }
        
        print(tyepSegment.numberOfSegments)
        
        let segmentControl = UISegmentedControl(items: theaterString)
        print(segmentControl.numberOfSegments)
        
        //tyepSegment(item: )


        
        
         //tyepSegment = segmentControl
       // segmentControl.s
        //segmentControl.
        
        //tyepSegment.
    }
    
}
