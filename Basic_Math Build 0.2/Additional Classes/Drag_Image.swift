//
//  Drag_Image.swift
//  Basic_Math
//
//  Created by jf13abl on 16/02/2017.
//  Copyright © 2017 jf13abl. All rights reserved.
//

import UIKit

class Drag_Image: UIImageView {

    var startLocation: CGPoint?
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        startLocation = touches.first?.locationInView(self)
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let currentLocation = touches.first?.locationInView(self)
        let dx = currentLocation!.x - startLocation!.x
        let dy = currentLocation!.y - startLocation!.y
        
        self.center = CGPointMake(self.center.x+dx, self.center.y+dy)
    }

}
