import UIKit
import Combine

protocol ErrorDisplay {
    func displayError()
    func hideError()
}

class UIToolbarTextField: DesignableUITextField, ErrorDisplay {
    
    typealias Action = () -> Void
    
    var isValid = false
    private var doneAction: Action!
    private var cancelAction: Action!
    var validator: TextFieldValidator? {
        didSet {
            self.delegate = validator
        }
    }
    override var bounds: CGRect {
        didSet {
            updateErrorLayer()
        }
    }
    var validatedText: String? {
        return isValid ? text : nil
    }
    
    private let errorLayer: CAShapeLayer
    
    override init(frame: CGRect) {
        errorLayer = CAShapeLayer()
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        errorLayer = CAShapeLayer()
        errorLayer.needsDisplayOnBoundsChange = true
        super.init(coder: coder)
        layer.addSublayer(errorLayer)
        setup()
    }
    
    private func setup() {
        self.addDoneCancelToolbar(target: self, doneAction: #selector(donePressed), cancelAction: #selector(cancelPressed))
        doneAction = { [weak self] in
            self?.endEditing(true)
        }
        cancelAction = { [weak self] in
            guard let self = self else { return }
            self.text = ""
            let range = NSRangeFromString("")
            let _ = self.delegate?.textField?(self, shouldChangeCharactersIn: range, replacementString: "")
            self.endEditing(true)
        }
        updateErrorLayer()
    }
    
    func setToolbarActions(doneAction: @escaping Action, cancelAction: @escaping Action) {
        self.doneAction = doneAction
        self.cancelAction = cancelAction
    }
    
    @objc func donePressed(){
        doneAction()
    }
    
    @objc func cancelPressed(){
        cancelAction()
    }
    
    private func updateErrorLayer() {
        // Draw error layer
        let origin = self.bounds.origin
        let size = self.bounds.size
        let offset: CGFloat = 4.0
        let radius: CGFloat = 5.0
        let path = UIBezierPath(roundedRect: CGRect(x: origin.x - offset, y: origin.y - offset, width: size.width + offset * 2, height: size.height + offset * 2), cornerRadius: radius)
        errorLayer.path = path.cgPath
        errorLayer.strokeColor = UIColor.red.cgColor
        errorLayer.lineWidth = 0.0
        errorLayer.fillColor = UIColor.clear.cgColor
        errorLayer.masksToBounds = false
    }
    
    func displayError() {
//        updateErrorLayer()
        errorLayer.lineWidth = 2.0
        isValid = false
    }
    
    func hideError() {
        errorLayer.lineWidth = 0.0
        isValid = true
    }
    
    func makeTextChangedSubscriber<R, T>(to path: ReferenceWritableKeyPath<R, T>, from root: R, mapFunc: @escaping (String?) -> T) -> AnyCancellable {
        return NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .map({ ($0.object as! Self).validatedText})
            .map(mapFunc)
            .assign(to: path, on: root)
    }
}

private extension UIToolbarTextField {
    func addDoneCancelToolbar(target: Any, doneAction: Selector, cancelAction: Selector) {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        let doneButton = UIBarButtonItem(title: "Listo", style: .done, target: target, action: doneAction)
        let cancelButton = UIBarButtonItem(title: "Cancelar", style: .plain, target: target, action: cancelAction)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        self.inputAccessoryView = toolBar
    }
}
