//
//  ChatsImages.swift
//  TerraAppNew
//
//  Created by Natali on 05.08.2022.
//

import UIKit

import UIKit

class ChatsImages {

  var chatsImages = [UIImage]()

        var chatsDescriptions = [String]()

    func addChatsImages() {
        chatsImages.append(addChatsImage(name: "schoolOfManagement"))
        chatsDescriptions.append("Школа управления")
        chatsImages.append(addChatsImage(name: "managementBattle"))
        chatsDescriptions.append("Управленческие поединки")
        chatsImages.append(addChatsImage(name: "start"))
        chatsDescriptions.append("Запуск")
        chatsImages.append(addChatsImage(name: "breakthrough"))
        chatsDescriptions.append("Прорыв")
        chatsImages.append(addChatsImage(name: "english"))
        chatsDescriptions.append("Английский")
        chatsImages.append(addChatsImage(name: "mastermind"))
        chatsDescriptions.append("Мастермайнд")
        chatsImages.append(addChatsImage(name: "mafia"))
        chatsDescriptions.append("Мафия")
        chatsImages.append(addChatsImage(name: "onlineSchool"))
        chatsDescriptions.append("Онлайн-школа")
        chatsImages.append(addChatsImage(name: "marketPlaces"))
        chatsDescriptions.append("MarketPlaces")

    }
    
    func addChatsImage(name: String) -> UIImage {

        let chatImage = UIImage(named: name) ?? UIImage()
        return chatImage
    }

    init (){
        addChatsImages()
    }
}

