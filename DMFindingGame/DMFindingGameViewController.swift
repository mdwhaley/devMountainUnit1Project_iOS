//
//  DMFindingGameViewController.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 2/19/23.
//

import UIKit

/**
 1.1 Create the user interface in the `Main` file. See the provided screenshot for how the UI should look. Feel free to customize the colors, font, etc.
 */
class DMFindingGameViewController: UIViewController {
    
    /**
     2.1 Create IBOutlets for the target letter label and the score label.
     2.2 Create an IBOutlet collection for the letter buttons.
     */
    @IBOutlet weak var targetLetterLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
   
    
//        calculateNewScore(selectedLetter: sender.currentTitle!)
//        newRound()
    
    
    /**
     These variables will help us with the gameplay. You do not need to modify this code.
     */
    var targetLetter = ""
    var randomLetters = [String]()
    var score = 0
    let letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    
    /**
     We're starting a new round as soon as the screen loads. You do not need to modify this code.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    /**
     3.1 Assign the `targetLetter` variable to a random letter from the `letters` array.
     3.2 Call the `generateRandomLetters` function and assign the result to the `randomLetters` variable. Hint: We want the number of letters to be the number of letters buttons that we have.
     3.3 Call the `updateTargetLetterLabel` and `updateLetterButtons` functions.
     */
    func newRound() {
        targetLetter = letters.randomElement()!
        randomLetters = generateRandomLetters(numLetters: 12)
        updateTargetLetterLabel()
        updateLetterButtons()
    }
    
    /**
     4.1 Return an array of letters. There should be as many letters as `numLetters`.
     The array should include the target letter. The rest of the letters should be random. A letter should show up in the array only once. The order of the letters should be random.
     
     This is a tricky function, but feel free to run the provided test in `DMFindingGameTests` to know if your code is correct. Let your Tech Lead know if you need help. :)
     */
    func generateRandomLetters(numLetters: Int) -> [String] {
        randomLetters = [String]()
        var randomArray = letters
        if let index = randomArray.firstIndex(of: targetLetter) {
            randomArray.remove(at: index)
        }
        for _ in 1..<numLetters {
            let i = Int.random(in: 0..<randomArray.count)
            randomLetters.append(randomArray[i])
            randomArray.remove(at: i)
        }
        randomLetters.insert(targetLetter, at: Int.random(in: 0..<numLetters))
        return randomLetters
    }
    
    /**
     5.1 Check if the `selectedLetter` is equal to the `targetLetter` and update the `score` variable accordingly.
     Feel free to run the provided test in `DMFindingGameTests` to know if your code is correct.
     */
    func calculateNewScore(selectedLetter: String) {
        if selectedLetter == targetLetter {
            score += 1
        }
    }
    
    /**
     6.1 Create an IBAction that gets run when the user taps on a letter button.
     6.2 Call the `calculateNewScore` function and pass in the selected letter. Hint: You can get access to the selected letter using the `sender`'s `titleLabel`.
     6.3 Call the `newRound` function to start a new round.
     */
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        calculateNewScore(selectedLetter: sender.currentTitle!)
        updateScoreLabel()
        newRound()
    }
    /**
     7.1 Update the `targetLetterLabel`'s text to be the `targetLetter`.
     */
    func updateTargetLetterLabel() {
        targetLetterLabel.text = targetLetter
    }
    /**
     8.1 Update the `scoreLabel`'s text to be the `score`.
     */
    func updateScoreLabel() {
        let scoreString = String(score)
        scoreLabel.text = scoreString
    }
    
    /**
     9.1 Update the title of each button in the IBOutlet collection to be the random letter at the corresponding index in the `randomLetters` array.
     Hint: `UIButton`s have a `setTitle` function.
     */
    func updateLetterButtons() {
//        let titleArray: Array<UIButton> = [f, i, r, s, t, a, b, c, d, e, g, h]
//        for (index, element) in titleArray.enumerated() {
//            element.setTitle(randomLetters[index], for: .normal)
//        }
        for (index, buttons) in letterButtons.enumerated() {
            buttons.setTitle(randomLetters[index], for: .normal)
        }
    }
}
