//
//  ViewController.swift
//  Graphs
//
//  Created by Patricio on 06/03/20.
//  Copyright © 2020 patricioreyes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: PRProgressView!
    @IBOutlet weak var progressSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = CGFloat(progressSlider?.value ?? 0)
        progressView.setProgress(value: value)
    }

    @IBAction func animateButtonPressed(_ sender: Any) {
        let value = CGFloat(progressSlider?.value ?? 0)
        progressView.animate(to: value)
    }
}

