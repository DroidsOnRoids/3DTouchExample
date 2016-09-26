//
//  ViewController.swift
//  3DTouch
//
//  Created by Pawel Chmiel on 20.09.2016.
//  Copyright © 2016 Pawel Chmiel. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var square: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}


//PRAGMA MARK: - 3D Touch support
extension SearchViewController {

    var is3DTouchAvailable: Bool {
        return view.traitCollection.forceTouchCapability == .available
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        if let touch = touches.first {
         
            guard is3DTouchAvailable, square.frame.contains(touch.location(in: view)) else { return }
            
            let maximumForce = touch.maximumPossibleForce
            let force = touch.force
            let normalizedForce = (force / maximumForce) + 1.0;
                
            let animation = CGAffineTransform(scaleX: normalizedForce, y: normalizedForce)
            square.transform = animation
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        square.transform = CGAffineTransform.identity
    }
}

