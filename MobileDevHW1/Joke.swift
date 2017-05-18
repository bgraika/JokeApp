//
//  Joke.swift
//  MobileDevHW1
//
//  Created by braedon graika on 1/22/17.
//  Copyright © 2017 braedon graika. All rights reserved.
//

import Foundation

class Joke
{
    var firstLine = String();
    var secondLine = String();
    var thirdLine = String();
    var answerLine = String();
    var rating = Int();
    
    //Initialize all joke lines to given input or "" by default
    init(FirstLine: String = "", SecondLine: String = "", ThirdLine: String = "", AnswerLine: String = "")
    {
        firstLine = FirstLine;
        secondLine = SecondLine;
        thirdLine = ThirdLine;
        answerLine = AnswerLine;
        rating = 0;
    }
}
