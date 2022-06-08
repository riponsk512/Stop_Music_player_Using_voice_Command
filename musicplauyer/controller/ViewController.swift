//
//  ViewController.swift
//  musicplauyer
//
//  Created by Ripon sk on 04/05/22.
//

import UIKit

//import InstantSearchVoiceOverlay
class ViewController: UIViewController {
   
    var song = [Song]()
    @IBOutlet weak var playa: UIButton!
    //   @IBOutlet weak var lbl: UILabel!
    //var controller = VoiceOverlayController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    func configure(){
        song.append(Song(name: "brown", artistname: "ripon", albumname: "brown munde"))
        song.append(Song(name: "daru", artistname: "ripn", albumname: "ripon"))
    }
    
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return song.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell", for: indexPath)
        let idx = song[indexPath.row]
        cell.textLabel?.text = idx.name
        cell.detailTextLabel?.text = idx.artistname
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let position = indexPath.row
        guard let  vc = storyboard?.instantiateViewController(withIdentifier: "ViewVontroller2") as? ViewController2 else{
            
            return
        }
        vc.arr = song
        vc.position = position
        vc.str = song[indexPath.row].albumname!.description
        present(vc, animated: true, completion: nil)
    }
    
}
struct Song{
    var name:String?
    var artistname:String?
    var albumname:String?
    
}
