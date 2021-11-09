//
//  LoginViewController.swift
//  FacebookFriends
//
//  Created by macbook on 3.11.2021.
//

import UIKit


class LoginViewController : UIViewController, UITextFieldDelegate
{
    
    private let userNameTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter User Name"
        textField.font = UIFont.systemFont(ofSize: 16.0)
        textField.keyboardAppearance = .dark
        textField.textAlignment = .center
        return textField
    }()
    
    private let passwordTextField : UITextField = {
       let textField = UITextField()
        textField.placeholder = "Enter Password"
        textField.font = UIFont.systemFont(ofSize: 16.0)
        textField.keyboardAppearance = .dark
        textField.textAlignment = .center
        textField.isSecureTextEntry = true
       return textField
    }()
    
    private let signInButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "LOG IN"
        view.backgroundColor = .systemBackground
        setUpViews()
        setUpLayouts()
        userNameTextField.becomeFirstResponder()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        userNameTextField.setBottomLine(borderColor: UIColor.systemBlue)
        passwordTextField.setBottomLine(borderColor: UIColor.systemBlue)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func didTapSignIn(){
        
        if((userNameTextField.text?.isEmpty) ?? true){
            let alert = UIAlertController(title: "Alert", message: "Please Enter your User Name", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if(passwordTextField.text?.isEmpty ?? true){
            let alert = UIAlertController(title: "Alert", message: "Please Enter your Password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if(userNameTextField.text == "brownpeacock226" && passwordTextField.text == "hayabusa")
        {
            let vc  = FriendListViewController()
            vc.navigationItem.largeTitleDisplayMode = .never
            vc.navigationItem.hidesBackButton = true
            vc.navigationItem.title = "Friend List"
            navigationController?.pushViewController(vc, animated: true)
            
        }else{
            let alert = UIAlertController(title: "Alert", message: "Your User Name or Password is incorrect!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if(textField == userNameTextField)
        {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        }else
        {
            textField.resignFirstResponder()
            didTapSignIn()
        }

        return true
    }
    
    private func setUpViews()
    {
        view.addSubview(userNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
    }
    
    private func setUpLayouts()
    {
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
        userNameTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        userNameTextField.centerYAnchor.constraint(lessThanOrEqualTo: self.view.centerYAnchor, constant: -150).isActive = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: userNameTextField.centerYAnchor, constant: 100).isActive = true
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        signInButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor, constant: 100).isActive = true
        signInButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.25).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
}
