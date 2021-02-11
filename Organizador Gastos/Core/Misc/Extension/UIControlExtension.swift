//
//  UIControlExtension.swift
//  appSeat
//
//  Created by Alexander Lopez Cedillo on 26/01/21.
//

import UIKit
import Combine

extension UIControl: CombineCompatible { }

extension CombineCompatible where Self: UIControl {
    func publisher(for events: UIControl.Event) -> UIControlPublisher<Self> {
        return UIControlPublisher(control: self, events: events)
    }
}
