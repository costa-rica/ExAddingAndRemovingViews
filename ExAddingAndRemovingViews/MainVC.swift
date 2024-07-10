//
//  MainVC.swift
//  ExAddingAndRemovingViews
//
//  Created by Nick Rodriguez on 10/07/2024.
//

import UIKit

class MainVC: UIViewController{
    
    let lblTitle = UILabel()
    let btnMainVcStatus = UIButton()
    
    let lblOptionalView01 = UILabel()
    let swtchOptionalView01 = UISwitch()
    var constraintsOptionalView01 = [NSLayoutConstraint]()
    let vwOptionalView01 = OptinalView01()
    
    let lblOptionalView02 = UILabel()
    let swtchOptionalView02 = UISwitch()
    var constraintsOptionalView02 = [NSLayoutConstraint]()
    let vwOptionalView02 = OptinalView02()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(" in MainVC -")
        setup_views()
        
        constraintsOptionalView01 = [
            vwOptionalView01.topAnchor.constraint(equalTo: swtchOptionalView01.bottomAnchor, constant: heightFromPct(percent: 5)),
            vwOptionalView01.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vwOptionalView01.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        constraintsOptionalView02 = [
            vwOptionalView02.topAnchor.constraint(equalTo: vwOptionalView01.bottomAnchor, constant: heightFromPct(percent: 5)),
            vwOptionalView02.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vwOptionalView02.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
    }
    
    func setup_views(){
        lblTitle.text = "Main VC"
        lblTitle.font = UIFont(name: "ArialRoundedMTBold", size: 45)
        lblTitle.numberOfLines = 0
        lblTitle.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(lblTitle)
        lblTitle.accessibilityIdentifier="lblTitle"
        
        btnMainVcStatus.accessibilityIdentifier = "btnMainVcStatus"
        btnMainVcStatus.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(btnMainVcStatus)
        btnMainVcStatus.setTitle("Status", for: .normal)
        btnMainVcStatus.layer.borderColor = UIColor.systemBlue.cgColor
        btnMainVcStatus.layer.borderWidth = 2
        btnMainVcStatus.backgroundColor = .systemBlue
        btnMainVcStatus.layer.cornerRadius = 10
        
        //        btnOptionalView01.addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
        btnMainVcStatus.addTarget(self, action: #selector(touchUpInside_status(_:)), for: .touchUpInside)
        
        lblOptionalView01.text = "Optional View 01: "
        lblOptionalView01.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(lblOptionalView01)
        lblOptionalView01.accessibilityIdentifier="lblOptionalView01"
        
        
        swtchOptionalView01.accessibilityIdentifier = "swtchOptionalView01"
        swtchOptionalView01.translatesAutoresizingMaskIntoConstraints = false
        swtchOptionalView01.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        view.addSubview(swtchOptionalView01)
        
        lblOptionalView02.text = "Optional View 02: "
        lblOptionalView02.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(lblOptionalView02)
        lblOptionalView02.accessibilityIdentifier="lblOptionalView02"
        
        
        swtchOptionalView02.accessibilityIdentifier = "swtchOptionalView02"
        swtchOptionalView02.translatesAutoresizingMaskIntoConstraints = false
        swtchOptionalView02.addTarget(self, action: #selector(switchValueChanged_02(_:)), for: .valueChanged)
        view.addSubview(swtchOptionalView02)
        
        
        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            lblTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lblTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            btnMainVcStatus.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant:40),
            btnMainVcStatus.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            btnMainVcStatus.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            lblOptionalView01.topAnchor.constraint(equalTo: btnMainVcStatus.bottomAnchor, constant: 50),
            lblOptionalView01.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            
            swtchOptionalView01.centerYAnchor.constraint(equalTo: lblOptionalView01.centerYAnchor),
            swtchOptionalView01.leadingAnchor.constraint(equalTo: lblOptionalView01.trailingAnchor, constant: 5),
            
            lblOptionalView02.topAnchor.constraint(equalTo: lblOptionalView01.bottomAnchor, constant: 20),
            lblOptionalView02.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            
            swtchOptionalView02.centerYAnchor.constraint(equalTo: lblOptionalView02.centerYAnchor),
            swtchOptionalView02.leadingAnchor.constraint(equalTo: lblOptionalView02.trailingAnchor, constant: 5),

        ])
    }
    
    
    /* Objc Methods*/
    @objc private func switchValueChanged(_ sender: UISwitch) {
        
        if sender.isOn {
            print("- Switch is ON")
            setup_vwOptionalView01()
        } else {
            print("Swithc is OFF")
            remove_vwOptionalView01()
        }
    }
    @objc private func switchValueChanged_02(_ sender: UISwitch) {
        
        if sender.isOn {
            print("- Switch is ON")
            setup_vwOptionalView02()
        } else {
            print("Swithc is OFF")
            remove_vwOptionalView02()
        }
    }
    
    
    
    
}

extension MainVC {
    @objc func touchUpInside_status(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseInOut], animations: {
            sender.transform = .identity
        }, completion: nil)
        print(" Current Status ")
        print("Selected viewController: \(type(of: self))")
        print("Subviews in MainVC: \(self.view.subviews.count)")
    }
    
    func setup_vwOptionalView01(){
        vwOptionalView01.accessibilityIdentifier = "vwOptionalView01"
        vwOptionalView01.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vwOptionalView01)
        NSLayoutConstraint.activate(constraintsOptionalView01)
    }
    
    func remove_vwOptionalView01(){
        NSLayoutConstraint.deactivate(constraintsOptionalView01)
        vwOptionalView01.removeFromSuperview()
    }
    
    
    func setup_vwOptionalView02(){
        vwOptionalView02.accessibilityIdentifier = "vwOptionalView02"
        vwOptionalView02.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vwOptionalView02)
        NSLayoutConstraint.activate(constraintsOptionalView02)
    }
    
    func remove_vwOptionalView02(){
        NSLayoutConstraint.deactivate(constraintsOptionalView02)
        vwOptionalView02.removeFromSuperview()
    }
}


class OptinalView01: UIView {
    
    
    let lblTitle = UILabel()
    let lblDescription = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // This triggers as soon as the app starts
        setup_labels()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup_labels()
    }
    func setup_labels(){
        self.backgroundColor = .green
        lblTitle.accessibilityIdentifier="lblTitle-UserVcFindAppleHealthPermissionsView"
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.text = "OPtional View 01 "
        lblTitle.font = UIFont(name: "ArialRoundedMTBold", size: 25)
        lblTitle.numberOfLines=0
        self.addSubview(lblTitle)
        
        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: heightFromPct(percent: 3)),
            lblTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: widthFromPct(percent: -2)),
            lblTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: widthFromPct(percent: 2)),
            lblTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: heightFromPct(percent: -3))
        ])
    }
    
}


class OptinalView02: UIView {
    
    
    let lblTitle = UILabel()
    let lblDescription = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // This triggers as soon as the app starts
        setup_labels()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup_labels()
    }
    func setup_labels(){
        
        self.backgroundColor = .purple
        lblTitle.accessibilityIdentifier="lblTitle-UserVcFindAppleHealthPermissionsView"
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.text = "OPtional View 02 "
        lblTitle.font = UIFont(name: "ArialRoundedMTBold", size: 25)
        lblTitle.numberOfLines=0
        self.addSubview(lblTitle)
        
        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: heightFromPct(percent: 3)),
            lblTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: widthFromPct(percent: -2)),
            lblTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: widthFromPct(percent: 2)),
            lblTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: heightFromPct(percent: -3))
        ])
    }
    
}




func widthFromPct(percent:Float) -> CGFloat {
    let screenWidth = UIScreen.main.bounds.width
    let width = screenWidth * CGFloat(percent/100)
    return width
}

func heightFromPct(percent:Float) -> CGFloat {
    let screenHeight = UIScreen.main.bounds.height
    let height = screenHeight * CGFloat(percent/100)
    return height
}

