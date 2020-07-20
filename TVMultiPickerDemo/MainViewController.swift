//
//  ViewController.swift
//  TVMultiPickerDemo
//
//  Created by Filip Dujmušić on 18/08/2017.
//  Copyright © 2017 Ingemark. All rights reserved.
//

import UIKit
import TVMultiPicker

class MainViewController: UIViewController {
    
    var openPickerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Pick date!", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .primaryActionTriggered)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton()
    }
    
    private func addButton() {
        view.addSubview(openPickerButton)
        openPickerButton.translatesAutoresizingMaskIntoConstraints = false
        openPickerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        openPickerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc
    private func buttonTapped() {
//        let picker = MultiPicker.datePicker { date, picker in
//            self.dismiss(animated: true, completion: nil)
//            guard
//                let date = date
//                else { return }
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "MMM d, yyyy"
//
//            self.openPickerButton.setTitle(dateFormatter.string(from: date), for: .normal)
//        }
//        present(picker, animated: true, completion: nil)
        
        let pickerVC = MultiPickerViewController<String>(
            [
                PickerDefinition(
                    data: ["Thailand","United State","Guam"],
                    cellWidth: nil,
                    initialValueIndex: 0,
                    remembersLastFocusedElement: true
                )
            ],
            initialPickerIndex: 0,                  // Initially focused picker will be gender picker
            configuration: .bugabooInterPickerConfig,          // UI configuration set to default red/black style
            processDataAction: { pickedValues in
                return pickedValues[0].value
            },
            valuePickedAction: { finalValue, picker in
                picker.dismiss(animated: true, completion: nil)
                self.openPickerButton.setTitle(finalValue, for: .normal)
                print("picker: "+finalValue!)
            }
        )
        present(pickerVC, animated: true, completion: nil)
    }
    
}



