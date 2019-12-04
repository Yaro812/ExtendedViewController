//
//  Attachable.swift
//
//  Created by Thorax on 28/03/2019.
//

import UIKit

protocol Attachable: UIViewController {
    /// add a child view controller to be presented in container view
    func attach(to parent: UIViewController, in view: UIView?)
    func detach() -> Self
}

extension Attachable {
    func attach(to parent: UIViewController, in view: UIView?) {
        let view: UIView = view ?? parent.view
        
        self.view.frame = view.bounds
        view.addSubview(self.view)
        let constraints = [
        self.view.topAnchor.constraint(equalTo: view.topAnchor),
        self.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        self.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        self.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        parent.addChild(self)
        didMove(toParent: parent)
    }
    
    @discardableResult
    func detach() -> Self {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
        return self
    }
    
    static func attached(to parent: UIViewController, in view: UIView?) -> Self {
        let vc = Self(nibName: nil, bundle: nil)
        vc.attach(to: parent, in: view)
        return vc
    }
}

extension Attachable where Self: Storyboarded {
    static func attached(to parent: UIViewController, in view: UIView?) -> Self {
        let vc = Self.instantiate()
        vc.attach(to: parent, in: view)
        return vc
    }
}

extension Attachable where Self: UICollectionViewController {
    static func attached(to parent: UIViewController, in view: UIView?) -> Self {
        let vc = Self(collectionViewLayout: UICollectionViewFlowLayout())
        vc.attach(to: parent, in: view)
        return vc
    }
}
