//
//  ResultViewController.swift
//  PersonalQquiz
//
//  Created by Максим Евграфов on 29.05.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    var results: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        findMostFrequentElement(in: results)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}

// MARK: - Private Methods
private extension ResultViewController {
    func findMostFrequentElement(in answers: [Answer]) {
        var frequencyDict: [Animal: Int] = [:]
        
        for answer in answers {
            if let animalCount = frequencyDict[answer.animal] {
                frequencyDict.updateValue(animalCount + 1, forKey: answer.animal)
            } else {
                frequencyDict[answer.animal] = 1
            }
        }
        print(frequencyDict)
    }
}
