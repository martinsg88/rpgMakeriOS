//
//  DummyClass.swift
//  TheBenzaRPG
//
//  Created by Guilherme Martins on 2020/08/03.
//  Copyright © 2020 com.martins.dev. All rights reserved.
//

import UIKit

class DummyClass: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //        self.view.addSubview(upButton)
    //        self.view.addSubview(downButton)
    //        self.view.addSubview(leftButton)
    //        self.view.addSubview(rightButton)
            
    //        upButton.addTarget(self, action: #selector(hitUp), for: .touchUpInside)
    //        downButton.addTarget(self, action: #selector(hitDown), for: .touchUpInside)
    //        leftButton.addTarget(self, action: #selector(hitLeft), for: .touchUpInside)
    //        rightButton.addTarget(self, action: #selector(hitRight), for: .touchUpInside)
    //
    //        NSLayoutConstraint.activate([
    //            upButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
    //            upButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 60)
    //        ])
    //
    //        NSLayoutConstraint.activate([
    //            downButton.topAnchor.constraint(equalTo: upButton.topAnchor, constant: 90),
    //            downButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 60)
    //        ])
    //
    //        NSLayoutConstraint.activate([
    //            leftButton.topAnchor.constraint(equalTo: upButton.topAnchor, constant: 51),
    //            leftButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10)
    //        ])
    //
    //        NSLayoutConstraint.activate([
    //            rightButton.topAnchor.constraint(equalTo: upButton.topAnchor, constant: 51),
    //            rightButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 96)
    //        ])
    
    /*
     
     @objc func hitUp(){
            let script = """
                            console.log("WOW");
                            function upBtn(){
                                document.addEventListener("keydown", handleBackEvent, false);
                                var eventObj = document.createEventObject ?
                                   document.createEventObject() : document.createEvent("Events");

                                if(eventObj.initEvent){
                                 eventObj.initEvent("keydown", true, true);
                                }

                                eventObj.keyCode = 38;
                                eventObj.which = 38;


                                setTimeout(() => {
                                    document.dispatchEvent(eventObj);
                                }, 250);


                                return;
                            }
                            function handleBackEvent(e) {
                                e.preventDefault();
                                e.stopPropagation();
                            }

                            upBtn()

                         """
            webView.evaluateJavaScript(script, completionHandler: nil)
        }
        
        @objc func hitDown(){
            let script = """
                               var eventObj = document.createEventObject ?
                                   document.createEventObject() : document.createEvent("Events");
                             
                               if(eventObj.initEvent){
                                 eventObj.initEvent("keydown", true, true);
                               }
                             
                               eventObj.keyCode = 40;
                               eventObj.which = 40;
                               
                               document.dispatchEvent(eventObj);
                         """
            webView.evaluateJavaScript(script, completionHandler: nil)
        }
        
        @objc func hitLeft(){
            let script = """
                               var eventObj = document.createEventObject ?
                                   document.createEventObject() : document.createEvent("Events");
                             
                               if(eventObj.initEvent){
                                 eventObj.initEvent("keydown", true, true);
                               }
                             
                               eventObj.keyCode = 37;
                               eventObj.which = 37;
                               
                               document.dispatchEvent(eventObj);
                         """
            webView.evaluateJavaScript(script, completionHandler: nil)
        }
        
        @objc func hitRight(){
            let script = """
                               var eventObj = document.createEventObject ?
                                   document.createEventObject() : document.createEvent("Events");
                             
                               if(eventObj.initEvent){
                                 eventObj.initEvent("keydown", true, true);
                               }
                             
                               eventObj.keyCode = 39;
                               eventObj.which = 39;
                               
                               document.dispatchEvent(eventObj);
                         """
            webView.evaluateJavaScript(script, completionHandler: nil)
        }
     
     lazy var upButton: UIButton = {
         let upButton = UIButton()
         upButton.backgroundColor = .clear
         upButton.frame = CGRect.init(x: 0, y: 0, width: 30, height: 45)
         upButton.setImage(UIImage(named: "lineLight01.png"), for: .normal)
         upButton.translatesAutoresizingMaskIntoConstraints = false
         return upButton
     }()
     
     lazy var downButton: UIButton = {
         let downButton = UIButton()
         downButton.backgroundColor = .clear
         downButton.frame = CGRect.init(x: 0, y: 0, width: 30, height: 45)
         downButton.setImage(UIImage(named: "lineLight08.png"), for: .normal)
         downButton.translatesAutoresizingMaskIntoConstraints = false
         return downButton
     }()
     
     lazy var leftButton: UIButton = {
         let leftButton = UIButton()
         leftButton.backgroundColor = .clear
         leftButton.frame = CGRect.init(x: 0, y: 0, width: 30, height: 45)
         leftButton.setImage(UIImage(named: "lineLight03.png"), for: .normal)
         leftButton.translatesAutoresizingMaskIntoConstraints = false
         return leftButton
     }()

     lazy var rightButton: UIButton = {
         let rightButton = UIButton()
         rightButton.backgroundColor = .clear
         rightButton.frame = CGRect.init(x: 0, y: 0, width: 30, height: 45)
         rightButton.setImage(UIImage(named: "lineLight04.png"), for: .normal)
         rightButton.translatesAutoresizingMaskIntoConstraints = false
         return rightButton
     }()
     
     
     
     
     */
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
