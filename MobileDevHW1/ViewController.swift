//
//  ViewController.swift
//  MobileDevHW1
//
//  Created by braedon graika on 1/12/17.
//  Copyright © 2017 braedon graika. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var answerOutlet: UIButton!
    @IBOutlet weak var punchline: UILabel!
    @IBOutlet weak var firstLine: UILabel!
    @IBOutlet weak var secondLine: UILabel!
    @IBOutlet weak var thirdLine: UILabel!
    @IBOutlet weak var jokeNumberLabel: UILabel!
    @IBOutlet weak var firstStar: UIImageView!
    @IBOutlet weak var secondStar: UIImageView!
    @IBOutlet weak var thirdStar: UIImageView!
    @IBOutlet weak var fourthStar: UIImageView!
    @IBOutlet weak var fifthStar: UIImageView!
    
    var jokes = [Joke]()
    var jokeIndex = 0;
    
    // **** Star tap gesture handler function ****
    @IBAction func handleFirstStarTap (recognizer: UITapGestureRecognizer) {
        jokes[jokeIndex].rating = 1
        setStarValues()
    }
    @IBAction func handleSecondStarTap (recognizer: UITapGestureRecognizer) {
        jokes[jokeIndex].rating = 2
        setStarValues()
    }
    @IBAction func handleThirdStarTap (recognizer: UITapGestureRecognizer) {
        jokes[jokeIndex].rating = 3
        setStarValues()
    }
    @IBAction func handleFourthStarTap (recognizer: UITapGestureRecognizer) {
        jokes[jokeIndex].rating = 4
        setStarValues()
    }
    @IBAction func handleFifthStarTap (recognizer: UITapGestureRecognizer) {
        jokes[jokeIndex].rating = 5
        setStarValues()
    }
    
    // set start images based on rating of joke
    func setStarValues()
    {
        switch jokes[jokeIndex].rating
        {
            case 1:
                firstStar.image = UIImage(named: "goldStar")
                secondStar.image = UIImage(named: "greyStar")
                thirdStar.image = UIImage(named: "greyStar")
                fourthStar.image = UIImage(named: "greyStar")
                fifthStar.image = UIImage(named: "greyStar")
                break
            case 2:
                firstStar.image = UIImage(named: "goldStar")
                secondStar.image = UIImage(named: "goldStar")
                thirdStar.image = UIImage(named: "greyStar")
                fourthStar.image = UIImage(named: "greyStar")
                fifthStar.image = UIImage(named: "greyStar")
                break;
            case 3:
                firstStar.image = UIImage(named: "goldStar")
                secondStar.image = UIImage(named: "goldStar")
                thirdStar.image = UIImage(named: "goldStar")
                fourthStar.image = UIImage(named: "greyStar")
                fifthStar.image = UIImage(named: "greyStar")
                break;
            case 4:
                firstStar.image = UIImage(named: "goldStar")
                secondStar.image = UIImage(named: "goldStar")
                thirdStar.image = UIImage(named: "goldStar")
                fourthStar.image = UIImage(named: "goldStar")
                fifthStar.image = UIImage(named: "greyStar")
                break
            case 5:
                firstStar.image = UIImage(named: "goldStar")
                secondStar.image = UIImage(named: "goldStar")
                thirdStar.image = UIImage(named: "goldStar")
                fourthStar.image = UIImage(named: "goldStar")
                fifthStar.image = UIImage(named: "goldStar")
                break
            default:
                firstStar.image = UIImage(named: "greyStar")
                secondStar.image = UIImage(named: "greyStar")
                thirdStar.image = UIImage(named: "greyStar")
                fourthStar.image = UIImage(named: "greyStar")
                fifthStar.image = UIImage(named: "greyStar")
                break
        }
    }
    
    // changes to new joke based on type of swipe
    @IBAction func swipeDetected (recognizer: UISwipeGestureRecognizer)
    {
        // Go to next joke
        if(recognizer.direction == UISwipeGestureRecognizerDirection.right)
        {
            jokeIndex -= 1
            chooseJoke()
        }
        // Go to previous joke
        else if(recognizer.direction == UISwipeGestureRecognizerDirection.left)
        {
            jokeIndex += 1
            chooseJoke()
        }
        setStarValues()
    }
    
    //function that adds a joke to the jokes array given the 4 lines of the joke
    func addJoke(firstLine: String = "", secondLine: String = "", thirdLine: String = "", answerLine: String = "")
    {
        let joke = Joke(FirstLine: firstLine, SecondLine: secondLine,ThirdLine: thirdLine, AnswerLine: answerLine);
        self.jokes.append(joke);
    }
    
    //function that creates 3 jokes to be put into the jokes array using addJoke
    func initializeJokes()
    {
        addJoke(firstLine: "Why do programmers", secondLine: "always mix up", thirdLine: "Halloween and Christmas?", answerLine: "Because Oct 31 == Dec 25!")
        
        addJoke(firstLine: "A SQL Query goes into", secondLine: "a bar, walks up to", thirdLine: "two tables and asks...", answerLine: "Can I join you?")
        
        addJoke(firstLine: "What do you call", secondLine: "8 hobbits?", answerLine: "A Hobbyte.")
        
        addJoke(firstLine: "There are 10", secondLine: "kinds of people", thirdLine: "in this world:", answerLine: "Those who understand binary and those who don't")
        
    }
    
    //randomly chooses a joke to display from the jokes array
    func chooseJoke()
    {
        // changed negative jokeIndex to its positive equivalent
        if(jokeIndex < 0)
        {
            jokeIndex = jokeIndex + jokes.count
        }
        // go back to first joke in jokes array
        if(jokeIndex >= jokes.count)
        {
            jokeIndex = 0;
        }

        self.firstLine.text = self.jokes[jokeIndex].firstLine
        self.secondLine.text = self.jokes[jokeIndex].secondLine
        self.thirdLine.text = self.jokes[jokeIndex].thirdLine
        self.punchline.text = self.jokes[jokeIndex].answerLine
        self.jokeNumberLabel.text = "Joke # \(jokeIndex + 1)"
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        initializeJokes()
        chooseJoke();

        // Do any additional setup after loading the view, typically from a nib.
        let firstStarTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleFirstStarTap))
        firstStarTapGestureRecognizer.delegate = self
        firstStar.addGestureRecognizer(firstStarTapGestureRecognizer)
        firstStar.isUserInteractionEnabled = true
        
        let secondStarTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleSecondStarTap))
        secondStarTapGestureRecognizer.delegate = self
        secondStar.addGestureRecognizer(secondStarTapGestureRecognizer)
        secondStar.isUserInteractionEnabled = true
        
        let thirdStarTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleThirdStarTap))
        thirdStarTapGestureRecognizer.delegate = self
        thirdStar.addGestureRecognizer(thirdStarTapGestureRecognizer)
        thirdStar.isUserInteractionEnabled = true
        
        let fourthStarTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleFourthStarTap))
        fourthStarTapGestureRecognizer.delegate = self
        fourthStar.addGestureRecognizer(fourthStarTapGestureRecognizer)
        fourthStar.isUserInteractionEnabled = true
        
        let fifthStarTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleFifthStarTap))
        fifthStarTapGestureRecognizer.delegate = self
        fifthStar.addGestureRecognizer(fifthStarTapGestureRecognizer)
        fifthStar.isUserInteractionEnabled = true
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

