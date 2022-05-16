//
//  ViewController.swift
//  MemeMaker
//
//  Created by Aluno01 on 26/04/22.
//  Copyright © 2022 Eldorado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //saídas da tela do App
    @IBOutlet weak var topSegmentControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    //vetores que representam as opções de escolha da parte superior e inferior
    var topChoices = [CaptionOption]()
    var bottomChoices = [CaptionOption]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let chooseLook = CaptionOption(emoji: "👀", subtitle: "Eu vejo")
        let think = CaptionOption(emoji: "💭", subtitle: "Eu pensando em")
        let happy = CaptionOption(emoji: "😄", subtitle: "Sabe o que me deixa feliz?")
        
        topChoices = [chooseLook, think, happy]
        topSegmentControl.removeAllSegments()
        
        for choice in topChoices {
            topSegmentControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        topSegmentControl.selectedSegmentIndex = 0
        
        
        let deth = CaptionOption(emoji: "☠️", subtitle: "gente morta")
        let cat = CaptionOption(emoji: "🐈", subtitle: "Um gatinho")
        let science = CaptionOption(emoji: "🔬", subtitle: "Ciência em toda a parte")
        
        bottomChoices = [deth, cat, science]
        bottomSegmentControl.removeAllSegments()
        
        for choice in bottomChoices {
            bottomSegmentControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        bottomSegmentControl.selectedSegmentIndex = 0
        
        updateLabels()
    }

    // Ação segmento superior
    @IBAction func choose(_ sender: Any) {
        updateLabels()
        
    }
    
    func updateLabels() {
        let topIndex = topSegmentControl.selectedSegmentIndex
        let bottomIndex = bottomSegmentControl.selectedSegmentIndex
        
        let topChoice = topChoices[topIndex]
        let bottomChoice = bottomChoices[bottomIndex]
        
        topCaptionLabel.text = topChoice.subtitle
        bottomCaptionLabel.text = bottomChoice.subtitle
    }
    
    
    @IBAction func choiceSelected(_ sender: Any) {
        
        updateLabels()
    }
    
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
        
    }
    
    
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        
         if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
        }
    }
    
    
    
}

