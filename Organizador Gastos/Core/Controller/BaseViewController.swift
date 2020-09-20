//
//  BaseViewController.swift
//  Cupra
//
//  Created by Mauricio Guerrero Vega on 01/08/20.
//  Copyright © 2020 Mauricio Guerrero Vega. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
        
    var managedContext = (UIApplication.shared.delegate! as! AppDelegate).persistentContainer.viewContext
    var keyboardScrollView: UIScrollView? {
        didSet {
            setupKeyboardScrollView()
        }
    }
	
	private let loadingVC: LoadingVC = {
        let vc = LoadingVC()
        vc.modalPresentationStyle = .overCurrentContext
        return vc
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
	// MARK: - Lifecycle
    override func viewDidLoad() {
        hideKeyboardWhenTappedAround()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
	// MARK: - TextField Keyboard Event Functions
    private func setupKeyboardScrollView() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification){
        guard let scrollView = self.keyboardScrollView else { return }
        scrollView.isScrollEnabled = true
        let userInfo = notification.userInfo!
        let keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue

        var contentInset:UIEdgeInsets = scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        scrollView.contentInset = contentInset
	}
	
	@objc func keyboardWillHide(notification: NSNotification){
		guard let scrollView = self.keyboardScrollView else { return }
		
		//                scrollView.isScrollEnabled = false
		//        scrollView.scrollToTop()
		let contentInset:UIEdgeInsets = UIEdgeInsets.zero
		scrollView.contentInset = contentInset
		
		
	}
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
	}
	
	func hideKeyboardWhenTappedAround() {
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
		tap.cancelsTouchesInView = false
		view.addGestureRecognizer(tap)
	}
	
	// MARK: - Loading Indicator Functions
	func presentLoadingIndicator(animated: Bool = false) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.present(self.loadingVC, animated: animated)
        }
    }
    
    func dismissLoadingIndicator(animated: Bool = false) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.loadingVC.dismiss(animated: animated, completion: nil)
        }
    }
    
}
