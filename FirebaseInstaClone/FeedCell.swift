//
//  FeedCell.swift
//  FirebaseInstaClone
//
//  Created by Habil Demirci on 9.12.2024.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage
import OneSignalExtension
import OneSignalNotifications

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var userEmailLabel: UILabel!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var likeLabel: UILabel!
    
    @IBOutlet weak var documentIdLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func likeButtonClicked(_ sender: Any) {
        
        let fireStoreDatabase = Firestore.firestore()
        
        if let likeCount = Int(likeLabel.text!) {
            
            let likeStore = ["likes" : likeCount + 1] as [String : Any]
            
            fireStoreDatabase.collection("Posts").document(documentIdLabel.text!).setData(likeStore, merge: true)
            
        }
        /*
        let userEmail = userEmailLabel.text!
         
        fireStoreDatabase.collection("PlayerId").whereField("email", isEqualTo: userEmail).getdocuments { (snapshot, error) in
            if error == nil {
                if snapshot?.isEmpty == false && snapshot != nil {
                    
                    for document in snapshot!.documents {
                        if let playerId = document.get("player_id") as? String {
                            //PUSH NOTIFICATION
                            OneSignal.postNotification(["contents": ["\(Auth.auth().currentUser!.email!) liked your post"], "include_player_ids":["\(playerId)"]])
                        }
                    }
                }
            }
        } */
    }
}
