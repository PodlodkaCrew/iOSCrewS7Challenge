//
//  LoginService.swift
//  AnimateMe
//
//  Created by katleta3000 on 21.11.2021.
//

import Foundation

final class LoginService {

	func login(login: String, password: String, completion: @escaping (Bool) -> Void ) {
		let deadlineTime = DispatchTime.now() + .seconds(3)
		DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
			completion(login == "podlodka" && password == "12345")
		}
	}

}
