//
//  UIViewController+Alerts.swift
//  TerraAppNew
//
//  Created by Тимур Ахметов on 28.07.2022.
//

import UIKit

extension UIViewController {
    
    //FOTOLIBRARY
    
    func alertPhotoOrCamera(completionHandler: @escaping (UIImagePickerController.SourceType) -> Void) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
            let camera = UIImagePickerController.SourceType.camera
            completionHandler(camera)
        }
        
        let photoLibrary = UIAlertAction(title: "Photo Library", style: .default) { _ in
            let photoLibrary = UIImagePickerController.SourceType.photoLibrary
            completionHandler(photoLibrary)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(camera)
        alertController.addAction(photoLibrary)
        alertController.addAction(cancel)
        
        present(alertController, animated: true)
    }
    
    //SimpleAlert
    
    func alertOkCancel(title: String, message: String?, completionHandler: @escaping () -> Void) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { _ in
            completionHandler()
        }
        
        let cancel = UIAlertAction(title: "Отмена", style: .cancel)
        
        alertController.addAction(ok)
        alertController.addAction(cancel)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func alertOk(title: String, message: String?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "ОК", style: .default)
        
        alertController.addAction(ok)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "", message: "Неверное имя пользователя или пароль", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Попробовать снова", style: .default, handler: {  (_) in
        }))
        alert.addAction(UIAlertAction(title: "Зарегистрироваться", style: .default, handler: {  (_) in
            let regVC = RegisterViewController()
            self.navigationController?.pushViewController(regVC, animated: true)
            self.navigationController?.navigationItem.backButtonTitle = "Назад"
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { (_) in
        }))
        self.present(alert, animated: true, completion: {
        })
    }
}

