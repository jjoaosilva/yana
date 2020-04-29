//
//  TagsViewController.swift
//  Yana
//
//  Created by Ronaldo Gomes on 28/04/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

class TagsViewController: UIViewController {

    
    @IBOutlet weak var modalButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func modalButton(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "makePost", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as? UINavigationController
        let controller =  destination!.topViewController! as? MakePostViewController
        
        
    }
    
}
