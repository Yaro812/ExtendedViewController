//
//  Rotating.swift
//
//  Created by Thorax on 16/07/2019.
//

import UIKit

protocol Rotating: UIView {
    func rotate90(duration: TimeInterval)
    func rotate180(duration: TimeInterval)
    func rotate270(duration: TimeInterval)
    func identity(duration: TimeInterval)
    func rotate(angle: Double, duration: TimeInterval)
}

extension Rotating {
    func rotate90(duration: TimeInterval = 0.3) {
        rotate(angle: 90, duration: duration)
    }
    
    func rotate180(duration: TimeInterval = 0.3) {
        rotate(angle: 180, duration: duration)
    }
    
    func rotate270(duration: TimeInterval = 0.3) {
        rotate(angle: 270, duration: duration)
    }
    
    func rotate(angle: Double, duration: TimeInterval = 0.3) {
        let angle = Measurement(value: angle, unit: UnitAngle.degrees)
        rotate(angle: angle, duration: duration)
    }
    
    func identity(duration: TimeInterval = 0.3) {
        let block = {
            self.transform = .identity
        }
        if duration.isZero {
            block()
        } else {
            UIView.animate(withDuration: duration, animations: block)
        }
    }
    
    func rotate(angle: Measurement<UnitAngle>, duration: TimeInterval) {
        let radians = angle.converted(to: .radians).value
        let block = {
            self.transform = CGAffineTransform(rotationAngle: CGFloat(radians))
        }
        if duration.isZero {
            block()
        } else {
            UIView.animate(withDuration: duration, animations: block)
        }
    }
}
