//
//  ViewController.swift
//  AnimateMe
//
//  Created by katleta3000 on 21.11.2021.
//

import UIKit

final class LoginViewController: UIViewController {
	
	@IBOutlet var username: UITextField! {
		didSet {
			username.layer.borderColor = UIColor(named: "Purple")?.cgColor
			username.layer.borderWidth = 1
		}
	}

	@IBOutlet var password: UITextField! {
		didSet {
			password.layer.borderColor = UIColor(named: "Purple")?.cgColor
			password.layer.borderWidth = 1
		}
	}

	@IBOutlet var login: UIButton! {
		didSet {
			login.backgroundColor = UIColor(named: "Purple")
			login.layer.cornerRadius = 8
		}
	}

	private let loginService = Services.loginService

	@IBAction func clickedLogin() {
		loginService.login(login: username.text ?? "", password: password.text ?? "") { success in
			if success {
				self.performSegue(withIdentifier: "List", sender: nil)
			} else {
				let alert = UIAlertController(
					title: "Error", message: "Not correct login or password", preferredStyle: .alert
				)
				alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
				self.present(alert, animated: false, completion: nil)
			}
		}
	}

}

