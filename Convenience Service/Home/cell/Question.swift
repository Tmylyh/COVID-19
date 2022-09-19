//
//  Question.swift
//  Question
//
//  Created by 李跃行 on 2022.
//

import Foundation

//model
class Question{
    var text: String
    var answer: Bool
    init(text: String, answer: Bool) {
        self.text = text
        self.answer = answer
    }
}

//let arr: [Int] = [1,2,3]
let questions = [
    Question(text: "新冠疫情从2019年开始", answer: true),
    Question(text: "新冠疫情最早发生在中国武汉", answer: true),
    Question(text: "中国确诊新冠病毒人数超过一千万", answer: false),
    Question(text: "经呼吸道传播和密切接触传播是新冠病毒传播的主要途径", answer: true),
    Question(text: "新冠潜伏期为一年", answer: false),
    Question(text: "出门在外需要戴口罩", answer: true),
    Question(text: "感染新冠应该采取隔离措施", answer: true),
    Question(text: "感染新冠最常见症状是发热", answer: true),
    Question(text: "口罩可以重复使用", answer: false),
    Question(text: "在家可以使用酒精消毒", answer: true),
    Question(text: "洗热水澡可以预防新冠肺炎", answer: false),
    Question(text: "疑似病例指已经感染新冠病毒并且核酸检测为阳性的病例", answer: false),
    Question(text: "目前已经开发出了治疗新冠病毒的特效药", answer: false)
]

