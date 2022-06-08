//
//  ViewController2.swift
//  musicplauyer
//
//  Created by Ripon sk on 04/05/22.
//

import UIKit
import AVKit
import InstantSearchVoiceOverlay
class ViewController2: UIViewController {
    var controller = VoiceOverlayController()
   
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    var str = " "
    
    weak var vc:ViewController?
    var player:AVAudioPlayer?
    public var position :Int = 0
    var arr = [Song]()
    @IBOutlet var holder:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl.text = str
       playmusic()
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let plays = player{
            plays.stop()
        }
    }
   
    
    func playmusic(){
        let songs = arr[position]
        guard let path = Bundle.main.path(forResource: songs.name, ofType: "mp3") else{
            fatalError("cant find the song")
            return
        }
        do{
            try AVAudioSession.sharedInstance().setMode(.default)
           try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            player = try? AVAudioPlayer(data: data)
            guard let player = player else{
                fatalError("nil music")
                return
            }
            player.play()
        }
        catch{
            
        }
        
    }
    
    @IBAction func change(_ sender: Any) {
        DispatchQueue.main.async { [self] in
            controller.start(on: self) { [self] (txt, bool, _) in
                
                if txt == "Stop"{
                    player?.stop()
                }
                else if txt == "Play"{
                    player?.play()
                }
              
                
            } errorHandler: { (err) in
                print(err?.localizedDescription)
            }        }
        

    }
}
