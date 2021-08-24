//
//  ViewController.swift
//  TheBenzaRPG
//
//  Created by Guilherme Martins on 2020/07/25.
//  Copyright © 2020 com.martins.dev. All rights reserved.
//

import UIKit
import WebKit
import GCDWebServer
import AVKit
import AVFoundation

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {

    var webServer:GCDWebServer?
    var openingMovie:AVPlayerViewController?
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.preferences.javaScriptEnabled = true
        webConfiguration.mediaTypesRequiringUserActionForPlayback = []
        webConfiguration.allowsInlineMediaPlayback = true
        webConfiguration.allowsPictureInPictureMediaPlayback = true
        webConfiguration.setValue(true, forKey: "_allowUniversalAccessFromFileURLs")
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    lazy var instructions: UIImageView = {
        let image = UIImage(named: "instructions.png")
        let instructions = UIImageView(frame: UIScreen.main.bounds)
        instructions.image = image
        instructions.contentMode = .scaleAspectFit
        instructions.clipsToBounds = false
        instructions.isUserInteractionEnabled = true
        instructions.translatesAutoresizingMaskIntoConstraints = false
        return instructions
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.checkControlsOnStartup()
    }
    
    func checkControlsOnStartup(){
        showContorlsOnStartup()
        /*
        if UserDefaults.standard.object(forKey: "showControlsOnStartup") == nil{
            showContorlsOnStartup()
        }else{
            startGame()
        }*/
    }
    
    func showContorlsOnStartup() {
        setupInstructionImage()
    }
    
    @objc func instructionsTapped(_ sender: UITapGestureRecognizer){
        UserDefaults.standard.set(true, forKey: "showControlsOnStartup")
        self.instructions.removeFromSuperview()
        startGame()
    }
    
    func startGame(){
        setupUI()        
        self.webView.translatesAutoresizingMaskIntoConstraints = false
        self.webView.navigationDelegate = self
        self.webView.scrollView.isScrollEnabled = false
        self.webView.scrollView.bounces = false
        self.webView.scrollView.bouncesZoom = false
        self.webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        _ = self.loadDefaultIndexFile()
        self.webView.load(URLRequest(url: URL(string: "http://localhost:3000/")!))
        self.webView.sizeToFit()
    }
    
    func setupUI() {
        self.view.backgroundColor = .black
        self.view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.topAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            webView.leftAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            webView.bottomAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            webView.rightAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
        ])
    }
    
    func setupInstructionImage() {
        self.view.backgroundColor = .black
        self.view.addSubview(instructions)
        instructions.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.instructionsTapped(_:))))
        NSLayoutConstraint.activate([
            instructions.topAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            instructions.leftAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            instructions.bottomAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            instructions.rightAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
        ])
    }
    
    func loadGameLocal(){
        if let indexURL = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "www") {
            self.webView.loadFileURL(indexURL, allowingReadAccessTo: indexURL)
        }
    }
    
    private func loadDefaultIndexFile() -> URL? {
        self.webServer = GCDWebServer()
        let mainBundle = Bundle.main
        let folderPath = mainBundle.path(forResource: "www", ofType: nil)
        
        self.webServer?.addGETHandler(forBasePath: "/", directoryPath: folderPath!, indexFilename: "index.html", cacheAge: 0, allowRangeRequests: false)
        
        do {
            try self.webServer?.start(options: [
                "Port": 3000,
                "BindToLocalhost": true
                ]);
        }catch{
            print(error)
        }
        return self.webServer?.serverURL
    }
    
    @objc func playerDidFinishPlaying(note: NSNotification) {
        self.openingMovie!.view.removeFromSuperview()
        self.startGame()
    }
    
    func checkIfMovieHasPlayed(){
        if UserDefaults.standard.object(forKey: "openingMovie") != nil{
            startGame()
        }else{
            startGame()
        }
    }
    
    func playMovie(){
        let path = Bundle.main.path(forResource: "opening_movie", ofType:"mp4")
        let player = AVPlayer(url: URL(fileURLWithPath: path!))
        
        self.openingMovie = AVPlayerViewController()
        self.openingMovie!.player = player
         
        self.addChild(openingMovie!)
        self.view.addSubview(openingMovie!.view)
        self.openingMovie!.view.frame = self.view.frame
        
        self.openingMovie!.player?.play()

        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: nil)
    }
}
