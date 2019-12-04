//
//  Storyboarded.swift
//
//  Created by Thorax on 20/03/2019.
//
import UIKit

/// Protocol that helps UIViewControllers instantiate from Storyboard without segues
protocol Storyboarded: AnyObject {
    static var storyboardId: String { get }
    static var storyboardName: String { get }
    
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static var storyboardId: String { return "\(self)" }
    static var storyboardName: String { return "Main" }
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: storyboardId)
        // swiftlint:disable:next force_cast
        return vc as! Self
    }
}
