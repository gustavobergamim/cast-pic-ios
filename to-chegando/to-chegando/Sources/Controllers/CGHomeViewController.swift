//
//  CGHomeViewController.swift
//  to-chegando
//
//  Created by Gustavo Bergamim on 15/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit

class CGHomeViewController: UIViewController, CGLoginDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "abrirLogin")
        {
            let loginController = segue.destination as! CGLoginViewController;
            loginController.delegate = self;
        }
    }
    
    func sucesso() {
        self.performSegue(withIdentifier: "teste", sender: nil);
    }
}
