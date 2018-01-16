//
//  DynamicHeightViewViewController.swift
//  PanGuestureSlideUpView
//
//  Created by lancewer on 1/16/18.
//  Copyright © 2018 lancewer. All rights reserved.
//

import UIKit

class DynamicHeightViewViewController: UIViewController {
    @IBOutlet weak var midLabel: UILabel!
    var contentString = "Content Label"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        midLabel.text = contentString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func add(_ sender: Any) {
        if var originContentString = midLabel.text {
            originContentString.append(contentString)
            midLabel.text = originContentString
        } else {
            midLabel.text = contentString
        }
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
