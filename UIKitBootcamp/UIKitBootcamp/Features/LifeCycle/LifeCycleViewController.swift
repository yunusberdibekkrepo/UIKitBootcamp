//
//  LifeCycleViewController.swift
//  UIKitBootcamp
//
//  Created by Yunus Emre Berdibek on 4.01.2024.
//

import UIKit

final class LifeCycleViewController: UIViewController {
    /*
     Sınıfın başlatıcı metodudur.
     super.init(nibName: nil, bundle: nil) ile üst sınıfın başlatıcısını çağırır.
     init?(coder: NSCoder):
     Bu metot sınıfın NSCoder ile başlatılmasını sağlar.
     Bu örnekte, fatalError("init(coder:) has not been implemented") ile kullanımı devre dışı bırakılmıştır.
     */
    init() {
        super.init(nibName: nil, bundle: nil)
        print("Init")
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    override func loadView() {
//        loadView():
//        View yüklenirken çağrılan metottur.
//        Bu örnekte, boş bir implementasyonu vardır, yani özel bir view yüklenmemiştir.
//    }

    /*
     View yüklendikten sonra çağrılan metottur. Yaşam döngüsünde sadece 1 defa çalışır.
     super.viewDidLoad() çağrısı ardından view'in arka plan rengini kırmızı olarak ayarlar.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        print("View did load")
    }

    /*
     View görünecekken çağrılan metottur.
     Bu örnekte, boş bir implementasyonu vardır.
     */
    override func viewWillAppear(_ animated: Bool) {
        print("View will appear")
    }

    /*
     View göründükten sonra çağrılan metottur.
     Bu örnekte, boş bir implementasyonu vardır.
     */
    override func viewDidAppear(_ animated: Bool) {
        print("View did appear")
    }

    /*
     View kaybolmadan önce çağrılan metottur.
     Bu örnekte, boş bir implementasyonu vardır.
     */
    override func viewWillDisappear(_ animated: Bool) {
        print("View will disappear")
    }

    /*
     View kaybolduktan sonra çağrılan metottur.
     Bu örnekte, boş bir implementasyonu vardır.
     */
    override func viewDidDisappear(_ animated: Bool) {
        print("View did disappear")
    }
}
