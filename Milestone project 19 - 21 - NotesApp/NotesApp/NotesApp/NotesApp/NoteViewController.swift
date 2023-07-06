//
//  NoteViewController.swift
//  NotesApp
//
//  Created by Lucas Neves dos santos pompeu on 06/07/23.
//

import UIKit

class NoteViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var noteLabel: UITextView!
    
    public var noteTitle: String = ""
    public var note: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = noteTitle
        noteLabel.text = note
    }
    
}
