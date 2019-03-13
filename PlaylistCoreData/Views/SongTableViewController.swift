//
//  SongTableViewController.swift
//  PlaylistCoreData
//
//  Created by Carson Buckley on 3/13/19.
//  Copyright © 2019 Launch. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    
    
    //Landing Pad
    var playlist: Playlist?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = playlist?.title
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return playlist?.songs?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        guard let playlist = playlist else { return UITableViewCell() }
        if let song = playlist.songs?[indexPath.row] as? Song {
            cell.textLabel?.text = song.title
            cell.detailTextLabel?.text = song.artist
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return playlist?.title ?? "My Playlist"
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let playlist = playlist else { return }
            guard let song = playlist.songs?[indexPath.row] as? Song else { return }
            SongController.delete(song: song)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    // MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        if artistTextField.text == "" || titleTextField.text == "" { return }
        guard let title = titleTextField.text,
         let artist = artistTextField.text,
         let playlist = playlist else { return }
        SongController.create(songWithTitle: title, artist: artist, playlist: playlist)
        artistTextField.text = ""
        titleTextField.text = ""
        tableView.reloadData()
        
    }
}
