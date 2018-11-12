//
//  RegisterViewControler.swift
//  Pi
//
//  Created by Louay Baccary on 11/11/18.
//  Copyright © 2018 Louay Baccary. All rights reserved.
//

import Alamofire
import UIKit

class RegisterViewController: UIViewController {
    
    //Defined a constant that holds the URL for our web service
    let URL_USER_REGISTER = "http://192.168.137.1:8080/pi/register.php"
    let URL_USER_LOGIN = "http://http://192.168.137.1:8080/pi/login.php"
    
    let defaultValues = UserDefaults.standard
    
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var uern: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var tun: UITextField!
    @IBOutlet weak var f: UITextField!
    
    //Button action
    @IBAction func buttonRegister(_ sender: UIButton) {
        
        //creating parameters for the post request
        let parameters: Parameters=[
            "username":uern.text!,
            "password":pass.text!,
            "name":tun.text!,
            "email":email.text!,
            "phone":f.text!
        ]
        
        //Sending http post request
        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
            {
                response in
                print(response)
                if let result = response.result.value {
                    let jsonData = result as! NSDictionary
                    self.labelMessage.text = jsonData.value(forKey: "message") as! String?
                    if(!(jsonData.value(forKey: "error") as! Bool)){
                        let parameters: Parameters=[
                            "email":self.email.text!,
                            "password":self.pass.text!
                        ]
                        Alamofire.request(self.URL_USER_LOGIN, method: .post, parameters: parameters).responseJSON
                            {
                                response in
                                print(response)
                                if let result = response.result.value {
                                    let jsonData = result as! NSDictionary
                                    if(!(jsonData.value(forKey: "error") as! Bool)){
                                        let user = jsonData.value(forKey: "user") as! NSDictionary
                                        let userId = user.value(forKey: "id") as! Int
                                        let userName = user.value(forKey: "username") as! String
                                        let userEmail = user.value(forKey: "email") as! String
                                        let userPhone = user.value(forKey: "phone") as! String
                                        self.defaultValues.set(userId, forKey: "userid")
                                        self.defaultValues.set(userName, forKey: "username")
                                        self.defaultValues.set(userEmail, forKey: "useremail")
                                        self.defaultValues.set(userPhone, forKey: "userphone")
                                        let profileViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewcontroller") as! ProfileViewController
                                        self.navigationController?.pushViewController(profileViewController, animated: true)
                                        
                                        self.dismiss(animated: false, completion: nil)
                                    }
                                }
                            }
                        
                    }
                }
        
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
