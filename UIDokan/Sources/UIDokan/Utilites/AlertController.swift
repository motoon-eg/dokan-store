//
//  File.swift
//  
//
//  Created by ziad on 24/06/2022.
//

import UIKit

extension UIViewController {
    
     func showAlert(message:String, from controller: UIViewController) {
         let alert = UIAlertController(title: "Dokan", message: message, preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "OK", style: .default ,handler: { action in
             alert.dismiss(animated: true, completion: nil)
         }))
        controller.show(alert, sender: nil)

     }
    
     func showAlertWithTitle(message:String, title:String , from controller: UIViewController) {
         let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "OK", style: .default ,handler: { action in
             alert.dismiss(animated: true, completion: nil)
         }))
        controller.show(alert, sender: nil)
     }
    
     func showAlertWithOkay(message:String, from controller: UIViewController) {
         let alert = UIAlertController(title: "Dokan", message: message, preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "OK", style: .default ,handler: { action in
             alert.dismiss(animated: true, completion: nil)
         }))
        controller.show(alert, sender: nil)
     }
    
     func showAlertWithOpen(message:String,from controller: UIViewController , completion : @escaping (_ success : Bool) -> Void) {
            let alert = UIAlertController(title: "Dokan", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default ,handler: { action in
                alert.dismiss(animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: "Preview", style: .default ,handler: { action in completion(true)
                 alert.dismiss(animated: true, completion: nil)
            
            }))
        controller.show(alert, sender: nil)
        }
    
     func showAlertWithCompletion(message:String , from controller: UIViewController, completion : @escaping (_ success : Bool) -> Void) {
         let alert = UIAlertController(title: "Dokan", message: message, preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "Yes", style: .default ,handler: { action in
            completion(true)
             alert.dismiss(animated: true, completion: nil)
            
         }))
        alert.addAction(UIAlertAction(title: "No", style: .default ,handler: { action in
           completion(false)
            alert.dismiss(animated: true, completion: nil)
           
        }))
        controller.show(alert, sender: nil)
     }
    
     func showOKAlertWithCompletion(message:String , from controller: UIViewController ,completion : @escaping (_ success : Bool) -> Void) {
            let alert = UIAlertController(title: "Dokan", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default ,handler: { action in
               completion(true)
                alert.dismiss(animated: true, completion: nil)
               
            }))
          
        controller.show(alert, sender: nil)
        }
    
     func showAlertWithTitleAndMessageCompletion(title: String, message:String ,from controller: UIViewController, completion : @escaping (_ success : Bool) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default ,handler: { action in
           completion(true)
            alert.dismiss(animated: true, completion: nil)
           
        }))
        controller.show(alert, sender: nil)
    }
    
    
}
