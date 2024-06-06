//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Veronika Iskandarova on 4.05.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultAnimal: UILabel!
    @IBOutlet var resultDescription: UILabel!
    
    var answers: [Answer]!
    var animal: Animal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        animal = mostCommonAnimal(in: answers)
        resultAnimal.text = "Вы - \(animal.rawValue)"
        resultDescription.text = animal.definition
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been dealocated")
    }
    
    private func mostCommonAnimal(in answers: [Answer]) -> Animal? {
        var animalCounts: [Animal: Int] = [:]
        
        for answer in answers {
            let animal = answer.animal
            if let count = animalCounts[animal] {
                animalCounts[animal] = count + 1
            } else {
                animalCounts[animal] = 1
            }
        }
        
        if let mostCommonAnimal = animalCounts.max(by: { $0.value < $1.value }) {
            return mostCommonAnimal.key
        } else {
            return nil
        }
    }
}
