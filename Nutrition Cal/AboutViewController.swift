//
//  AboutViewController.swift
//  Nutrition Cal
//
//  Created by Galina Petrova on 03/25/16.
//  Copyright © 2015 Galina Petrova. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
	
	@IBOutlet weak var aboutTextView: UITextView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		aboutTextView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
		
	}
	
}
