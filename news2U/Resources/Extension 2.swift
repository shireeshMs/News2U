//
//  Extension.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import UIKit

extension NewsApi {
    static func getArticles(url: URL?, completion: @escaping (Headline?) -> Void) {
        url?.get(completion: { (result: Result<Headline, ApiError>) in
            switch result {
            case .success(let headline):
                completion(headline)
            case .error(error: _):
                completion(nil)
            }
        })
    }
}
extension UIView {
    
    public func applyGradient(firstColor: UIColor, secondColor: UIColor) {
        let gradient = CAGradientLayer()
        
        // TODO Change gradient position
        // gradient.startPoint = CGPoint(x: 0, y: 0)
        // gradient.endPoint = CGPoint(x: 0, y: 0)
        gradient.frame = self.bounds
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        
        self.layer.insertSublayer(gradient, at: 0)
    }
    
}

extension Bundle {

    static var nameSpace: String? {
        guard let info = Bundle.main.infoDictionary,
              let projectName = info["CFBundleExecutable"] as? String else { return nil }

        let nameSpace = projectName.replacingOccurrences(of: "-", with: "_")

        return nameSpace
    }

}

// Credits: https://stackoverflow.com/questions/55653187/swift-default-alertviewcontroller-breaking-constraints
extension UIAlertController {
    func fixiOSAlertControllerAutolayoutConstraint() {
        for subView in self.view.subviews {
            for constraint in subView.constraints where constraint.debugDescription.contains("width == - 16") {
                subView.removeConstraint(constraint)
            }
        }
    }
}

// Credits: https://github.com/onodude/OnoKit-iOS
extension UICollectionView {

    convenience init(frame: CGRect, direction: UICollectionView.ScrollDirection, identifiers: [String]) {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = direction
        layout.minimumLineSpacing = 0

        self.init(frame: frame, collectionViewLayout: layout)

        guard let nameSpace = Bundle.nameSpace else { return }

        for identifier in identifiers {
            if let anyClass: AnyClass = NSClassFromString("\(nameSpace).\(identifier)") {
                self.register(anyClass, forCellWithReuseIdentifier: identifier)
            }
        }
    }

}

// Credits: https://github.com/onodude/OnoKit-iOS
extension UITableView {

    convenience init(frame: CGRect, style: UITableView.Style, identifiers: [String]) {
        self.init(frame: frame, style: style)

        guard let nameSpace = Bundle.nameSpace else { return }

        for identifier in identifiers {
            if let anyClass: AnyClass = NSClassFromString("\(nameSpace).\(identifier)") {
                self.register(anyClass, forCellReuseIdentifier: identifier)
            }
        }
    }

}
extension UIDevice {
    public var hasNotch: Bool {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        } else {
            return false
        }
    }
}

extension UIView {
    func addSubviewForAutoLayout(_ view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }

    func addGradient(count: Int, index: UInt32) {
//        print(self.layer.sublayers?.count)

        if self.layer.sublayers == nil {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.bounds
            gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
            self.layer.insertSublayer(gradientLayer, at: index)
            return
        }

        guard self.layer.sublayers?.count == count else { return }

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        self.layer.insertSublayer(gradientLayer, at: index)
    }

}


extension UINavigationController {
    
    public func getFromViewController() -> UIViewController? {
        return self.transitionCoordinator?.viewController(forKey: .from)
    }
    
    public func configureTheme() {
        self.navigationBar.tintColor = .white
        if #available(iOS 11.0, *) {
            self.navigationBar.barTintColor = .black
        }
        navigationBar.barStyle = .black
        self.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "Futura-Bold", size: 17) as Any,
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        if #available(iOS 11.0, *) {
            self.navigationBar.largeTitleTextAttributes = [
                NSAttributedString.Key.font: UIFont(name: "Futura-Bold", size: 34) as Any,
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
        } else {
            // Fallback on earlier versions
        }
    }
    
}
