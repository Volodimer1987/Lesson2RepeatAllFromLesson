//
//  ViewController.swift
//  Lesson2RepeatAllFromLesson
//
//  Created by vladimir gennadievich on 04.01.2021.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var switchLabel: UILabel!
    @IBOutlet var switchOnOffOutlet: UISwitch!
    @IBOutlet var scrollViewOutlet: UIScrollView!
    @IBOutlet var datePickerOutlet: UIDatePicker!
    
    @IBOutlet var doneButtonOutlet: UIButton!
    @IBOutlet var textFieldOutlet: UITextField!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var segmentControlOutlet: UISegmentedControl!
    @IBOutlet var sliderOutlet: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Setup Main label
        mainLabel.font = mainLabel.font.withSize(30)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
        //Setup segment control
        segmentControlOutlet.insertSegment(withTitle: "Three", at: 2, animated: false)
        
        //Setup slider
        sliderOutlet.value = 1
        sliderOutlet.minimumValue = 0
        sliderOutlet.maximumValue = 1
        sliderOutlet.minimumTrackTintColor = .yellow
        sliderOutlet.maximumTrackTintColor = .red
        sliderOutlet.thumbTintColor = .blue
        
        mainLabel.text = String(Int(sliderOutlet.value))
       
        
        //Setup date picker
        datePickerOutlet.locale = Locale(identifier: "ru_RU")
        
        
        // локализация
//        datePickerOutlet.locale = Locale.current
        
        switchOnOffOutlet.onTintColor = .red
        
        switchLabel.text = nil
        
    }
    

    
    @IBAction func changeSegmentInController() {
        switch segmentControlOutlet.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .blue
        case 2:
            mainLabel.text = "The thierd  segment is selected"
            mainLabel.textColor = .orange
        default:
            break
        }
    }
    
    @IBAction func sliderAction() {
        let backGroundColor = scrollViewOutlet.backgroundColor
        scrollViewOutlet.backgroundColor = backGroundColor?.withAlphaComponent(CGFloat(sliderOutlet.value))
            
        mainLabel.font = mainLabel.font.withSize(30)
        mainLabel.text = "\(Int(sliderOutlet.value))"
    }
    

    @IBAction func doneButtonPressed() {
        guard let text = textFieldOutlet.text,textFieldOutlet.text != "" else {return}
        if Double(text) != nil {
            print("Wrong Format")
            showAlert(title: "Wrong Format", message: "Please enter your name ")

        } else {
            mainLabel.text = text
            textFieldOutlet.text = nil
        }
    }
    
    @IBAction func changeDate() {
        let data = DateFormatter()
        data.dateStyle = .medium
        data.locale = Locale(identifier: "ru_RU")
        
        let dateValue = data.string(from: datePickerOutlet.date)
        mainLabel.text = dateValue
    }
    
    @IBAction func SwitchOnOfAction() {
        segmentControlOutlet.isHidden.toggle()
        datePickerOutlet.isHidden.toggle()
        mainLabel.isHidden.toggle()
        textFieldOutlet.isHidden.toggle()
        doneButtonOutlet.isHidden.toggle()
        sliderOutlet.isHidden.toggle()
        
        switchLabel.text = switchOnOffOutlet.isOn ? "Hide all elements" : "Show all elements "
  
        
        
    }
    
    
}

extension ViewController {
    private func showAlert(title:String,message:String) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Change", style: .default, handler: {_ in
            self.textFieldOutlet.text = nil
        })
        
        alertController.addAction(alertAction)
        
        present(alertController, animated: true)
    }
}
