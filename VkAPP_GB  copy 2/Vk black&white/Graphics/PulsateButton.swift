//
//  PulsateButton.swift
//  Vk black&white
//
//  Created by Macbook on 12.12.2020.
//

import Foundation
import UIKit

extension UIButton {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.3
        pulse.fromValue = 0.60
        pulse.toValue = 1
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 1.0
        pulse.damping = 1
        layer.add(pulse, forKey: nil)
        }
}
