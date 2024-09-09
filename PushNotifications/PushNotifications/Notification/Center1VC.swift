//
//  ViewController3.swift
//  PushNotifications
//
//  Created by Yunus Emre Berdibek on 24.01.2024.
//

import UIKit

final class Center1VC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addObservers()
    }

    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(button1NotificationAction), name: .button1Notification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(button2NotificationAction(notification:)), name: .button2Notification, object: nil)
    }

    @objc
    private func button1NotificationAction(notification: NSNotification) {
        view.backgroundColor = .yellow
    }

    @objc
    private func button2NotificationAction(notification: NSNotification) {
        let gelenMesaj = notification.userInfo?["gelenMesaj"] as? String
        let gelenTarih = notification.userInfo?["tarih"] as? Date
        print(gelenMesaj ?? "Gelen mesaj boş.")
        print(gelenTarih?.description ?? "Gelen tarih boş")
        view.backgroundColor = .blue
    }
}
