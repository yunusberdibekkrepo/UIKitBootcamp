//
//  ViewController1.swift
//  PushNotifications
//
//  Created by Yunus Emre Berdibek on 24.01.2024.
//

import UIKit
import UserNotifications

/*
 Local push notifications.
 */

final class PushNotification: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UNUserNotificationCenter.current().delegate = self // Bildirimi önplanda göstermek için.
        checkForPermission()
    }

    func checkForPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                self.sendNotification()
            case .denied:
                return
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound]) { didAllow, _ in
                    if didAllow {
                        self.sendNotification()
                    }
                }
            default:
                return
            }
        }
    }

    func sendNotification() {
        let identifier = "my_morning_notification"
        let title = "Time to work out!"
        let body = "Don't be a lazy little butt!"
        let hour = 18
        let minute = 08
        let isDaily = true

        let notificationCenter = UNUserNotificationCenter.current()

        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.badge = 1
        content.sound = .default

        let calendar = Calendar.current
        var dateComponents = DateComponents(calendar: calendar, timeZone: .current)
        dateComponents.hour = hour
        dateComponents.minute = minute

        // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: isDaily)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        notificationCenter.add(request)
    }
}

// Bildirimin uygulama açık iken ön planda çalıştırılması.
extension PushNotification: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let app = UIApplication.shared
        if app.applicationState == .active {
            print("Önplandayken bildirime tıklandı.")
        }
        completionHandler([.banner, .sound, .badge])
    }
}
