//
//  L2SecondSegue.swift
//  MyOwnApp
//
//  Created by Aditya Shirodkar  on 4/17/21.
//  Copyright © 2021 Aditya Shirodkar . All rights reserved.
//

import UIKit

class L2SecondSegue: UIStoryboardSegue {

    override func perform() {
        let src = self.source
        let dst = self.destination

        src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
        dst.view.transform = CGAffineTransform(translationX: src.view.frame.size.width, y: 0)

        UIView.animate(withDuration: 0.25,
               delay: 0.0,
               options: UIView.AnimationOptions.curveEaseInOut,
               animations: {
                    dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
            },
                   completion: { finished in
                    src.present(dst, animated: false, completion: nil)
        })
    }
}
