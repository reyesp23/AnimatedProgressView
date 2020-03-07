//
//  ViewController.swift
//  Graphs
//
//  Created by Patricio on 06/03/20.
//  Copyright © 2020 patricioreyes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: PRProgressView!{
        didSet{
            progressView.strokeColor = UIColor(red:0.88, green:0.01, blue:0.10, alpha:1.0)
            progressView.baseColor = UIColor(red:0.88, green:0.01, blue:0.10, alpha: 0.15)
        }
    }
    
    @IBOutlet weak var middleProgressView: PRProgressView!{
        didSet{
            middleProgressView.strokeColor = UIColor(red:0.27, green:0.88, blue:0.04, alpha:1.0)
            middleProgressView.baseColor = UIColor(red:0.27, green:0.88, blue:0.04, alpha:0.15)
        }
    }
    
    @IBOutlet weak var insideProgressView: PRProgressView!{
        didSet{
            insideProgressView.strokeColor = UIColor(red:0.17, green:0.75, blue:0.88, alpha:1.0)
            insideProgressView.baseColor = UIColor(red:0.17, green:0.75, blue:0.88, alpha:0.15)
        }
    }
    
    @IBOutlet weak var progressSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialState()
    }

    @IBAction func animateButtonPressed(_ sender: Any) {
        setInitialState()
        progressView.animate(to: 70)
        middleProgressView.animate(to: 60)
        insideProgressView.animate(to: 40)
    }
    
    func setInitialState(){
        progressView.setProgress(value: 3)
        middleProgressView.setProgress(value: 5)
        insideProgressView.setProgress(value: 1)
    }
}
