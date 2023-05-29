//
//  ResultViewController.swift
//  PersonalQquiz
//
//  Created by Максим Евграфов on 29.05.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    var results: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        updateResultDate()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    private func updateResultDate() {
        let theMostPopularAnswer = mostFrequentElement(in: results)
        
        if theMostPopularAnswer!.animal == Animal.dog {
            resultLabel.text = "Вы - \(Animal.dog.rawValue)"
            resultDescriptionLabel.text = Animal.dog.definition
            
        } else if theMostPopularAnswer!.animal == Animal.cat {
            resultLabel.text = "Вы - \(Animal.cat.rawValue)"
            resultDescriptionLabel.text = Animal.cat.definition
            
        } else if theMostPopularAnswer!.animal == Animal.rabbit {
            resultLabel.text = "Вы - \(Animal.rabbit.rawValue)"
            resultDescriptionLabel.text = Animal.rabbit.definition
            
        } else if theMostPopularAnswer!.animal == Animal.turtle {
            resultLabel.text = "Вы - \(Animal.turtle.rawValue)"
            resultDescriptionLabel.text = Animal.turtle.definition
        }
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}

// MARK: - Private Methods
private extension ResultViewController {
    func mostFrequentElement(in array: [Answer]) -> Answer? {
        var frequencyDict = [Answer: Int]()
        
        for element in array {
            frequencyDict[element, default: 0] += 1
        }
        
        var maxFrequency = 0
        var mostFrequentElement: Answer?
        
        for (element, frequency) in frequencyDict {
            if frequency > maxFrequency {
                maxFrequency = frequency
                mostFrequentElement = element
            }
        }
        
        return mostFrequentElement
    }
    
    // Пример использования
//    if let mostFrequent = mostFrequentElement(in: results) {
//        print("Наиболее часто встречающийся элемент: \(mostFrequent)")
//    } else {
//        print("Массив пустой")
//    }
}
