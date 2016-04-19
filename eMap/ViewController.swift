//
//  ViewController.swift
//  eMap
//
//  Created by Essa on 4/11/16.
//  Copyright © 2016 essa. All rights reserved.
//

import UIKit
import ArcGIS

class ViewController: UIViewController {

    @IBOutlet weak var mapView: AGSMapView!
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer")
        let mapLayer = AGSTiledMapServiceLayer(URL: url)
        //self.mapView.minScale = 500000000.0;
        self.mapView.addMapLayer(mapLayer,withName: "map")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func changeMap(sender: UISegmentedControl) {
        
        
        var mapURL : NSURL?
        
        switch sender.selectedSegmentIndex {
        case 0:
            mapURL = NSURL(string: "http://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer")
        default:
            mapURL = NSURL(string: "http://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer")
        }
        
        self.mapView.removeMapLayerWithName("map")
        
        let mapLayer = AGSTiledMapServiceLayer(URL: mapURL)
        
        
        self.mapView.insertMapLayer(mapLayer, withName: "map", atIndex: 0)
        
        
        
    }

}

