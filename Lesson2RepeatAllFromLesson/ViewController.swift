//
//  ViewController.swift
//  Lesson2RepeatAllFromLesson
//
//  Created by vladimir gennadievich on 04.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
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
        let backGroundColor = view.backgroundColor
        view.backgroundColor = backGroundColor?.withAlphaComponent(CGFloat(sliderOutlet.value))
        
        mainLabel.font = mainLabel.font.withSize(30)
        mainLabel.text = "\(Int(sliderOutlet.value))"
    }
    

    @IBAction func doneButtonPressed() {
        guard let text = textFieldOutlet.text,textFieldOutlet.text != "",text.isEmpty else {return}
        mainLabel.text = text
    }
}

extension ViewController:UITextFieldDelegate {
    
}
