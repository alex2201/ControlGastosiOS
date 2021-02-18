//
//  Loadable.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez Cedillo on 18/02/21.
//

import UIKit

protocol Loadable: UIViewController {
    var loadingVC: LoadingVC { get }
    
    func presentLoadingIndicator(completion: (() -> Void)?)
    func dismissLoadingIndicator(completion: (() -> Void)?)
}

extension Loadable {
    func presentLoadingIndicator(completion: (() -> Void)? = nil) {
        present(loadingVC, animated: true, completion: completion)
    }
    
    func dismissLoadingIndicator(completion: (() -> Void)? = nil) {
        loadingVC.dismiss(animated: true, completion: completion)
    }
}
