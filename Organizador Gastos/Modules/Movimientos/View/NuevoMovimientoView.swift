//
//  NuevoMovimientoView.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez Cedillo on 11/02/21.
//

import UIKit

class NuevoMovimientoView: UIView {
    
    // MARK: - Varibales públicas
    let descripcionField: UIToolbarTextField = UIToolbarTextField()
    let montoField: UIToolbarTextField = CurrencyTextField()
    let fechaField: UIDatePicker = UIDatePicker()
    
    // MARK: - Variables privadas
    
    // MARK: - Métodos públicos
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configurar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Métodos privados
    private func configurar() {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let scrollContentView = UIView()
        scrollContentView.translatesAutoresizingMaskIntoConstraints = false
        scrollContentView.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
        
        let fieldsStack = UIStackView(arrangedSubviews: [
            descripcionField,
            montoField,
            fechaField,
        ])
        fieldsStack.axis = .vertical
        fieldsStack.translatesAutoresizingMaskIntoConstraints = false
        fieldsStack.spacing = 24
        
        addSubview(contentView)
        
        contentView.addSubview(scrollView)
        
        scrollView.addSubview(scrollContentView)
        
        scrollContentView.addSubview(fieldsStack)
        
        configurarDescripcionField()
        configurarMontoField()
        configurarFechaField()
        
        let scrollContentHeightConstraint = scrollContentView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor)
        scrollContentHeightConstraint.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            scrollContentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            scrollContentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            scrollContentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            scrollContentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            scrollContentHeightConstraint,
            scrollContentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            
            fieldsStack.topAnchor.constraint(equalTo: scrollContentView.layoutMarginsGuide.topAnchor),
            fieldsStack.bottomAnchor.constraint(equalTo: scrollContentView.layoutMarginsGuide.bottomAnchor),
            fieldsStack.leadingAnchor.constraint(equalTo: scrollContentView.layoutMarginsGuide.leadingAnchor),
            fieldsStack.trailingAnchor.constraint(equalTo: scrollContentView.layoutMarginsGuide.trailingAnchor),
            
        ])
    }
    
    private func configurarDescripcionField() {
        descripcionField.translatesAutoresizingMaskIntoConstraints = false
        descripcionField.bottomLine = true
        descripcionField.font = UIFont.systemFont(ofSize: 15)
        descripcionField.placeholder = "Descripción"
        
        NSLayoutConstraint.activate([
            descripcionField.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    private func configurarMontoField() {
        montoField.translatesAutoresizingMaskIntoConstraints = false
        montoField.bottomLine = true
        montoField.font = UIFont.systemFont(ofSize: 15)
        montoField.placeholder = "Monto"
        
        NSLayoutConstraint.activate([
            montoField.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    private func configurarFechaField() {
        fechaField.translatesAutoresizingMaskIntoConstraints = false
        fechaField.preferredDatePickerStyle = .inline
    }
    
}
