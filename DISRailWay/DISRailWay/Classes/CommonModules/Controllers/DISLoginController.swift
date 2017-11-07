//
//  DISLoginController.swift
//  DISRailWay
//
//  Created by dis on 2017/10/30.
//  Copyright © 2017年 jp.co.disol. All rights reserved.
//

import UIKit

class DISLoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonClickAction(_ sender: UIButton) {
//        DISLog(Bundle(for: DISLoginController.self))
        let name = "OccupationInfo"
        let infoSB = UIStoryboard(name: name, bundle: nil)
        let infoVC = infoSB.instantiateInitialViewController()!
        self.present(infoVC, animated: true, completion: nil)
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
