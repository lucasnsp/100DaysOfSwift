//
//  ViewController.swift
//  Memory Match
//
//  Created by Lucas Neves dos santos pompeu on 07/08/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flipsLabel: UILabel!
    
    
    //MARK: - Properties
       var cards = [Card]() {
           didSet{
               collectionView.reloadData()
           }
       }
       
       var flips = 0 {
           didSet {
               flipsLabel.text = "Flips: \(flips)"
           }
       }
       
       private let reuseIdentifier = "cardCell"
       var counter = 0
       var firstCardIndexPath: IndexPath?
       
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           title = "Memory Match"
           collectionView.delegate = self
           collectionView.dataSource = self
           fetchCards()
       }
       
       //MARK: - Helper Methods
         private func fetchCards(){
             cards = CardController.fetchCards()
             counter = CardController.fetchCards().count
         }
         
         private func checkForMatch(secondCardIndex: IndexPath) {
             guard let firstCardPath = firstCardIndexPath else { return }
             let firstCell = collectionView.cellForItem(at: firstCardPath) as? CardCollectionViewCell
             let secondCell = collectionView.cellForItem(at: secondCardIndex) as? CardCollectionViewCell
             
             let firstCard = cards[firstCardPath.row]
             let secondCard = cards[secondCardIndex.row]
             
             if firstCard.name == secondCard.name {
                 
                 firstCard.isMatch = true
                 secondCard.isMatch = true
                 
                 firstCell?.clearCards()
                 secondCell?.clearCards()
                 counter -= 2
                 checkGameOver()
             } else {
                 firstCard.isFlipped = false
                 secondCard.isFlipped = false
                 
                 firstCell?.flipBack()
                 secondCell?.flipBack()
             }
             
             firstCardIndexPath = nil
             
         }
         
         private func checkGameOver(){
             if counter == 0{
                 presentAlert()
             }
         }
         
       private func presentAlert(){
           let alertController = UIAlertController(title: "Complete!", message: "Ready for another?", preferredStyle: .alert)
           alertController.addAction(UIAlertAction(title: "Reset", style: .default, handler: { [weak self] (_) in
               self?.cards.removeAll()
               self?.flips = 0
               self?.fetchCards()
           }))
           alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
           
           present(alertController, animated: true)
       }
       
       @IBAction func newGameButtonTapped(_ sender: Any) {
           cards.removeAll()
           flips = 0
           fetchCards()
       }
       
   }


   extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
           // MARK: UICollectionViewDataSource
       
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return cards.count
       }
       
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CardCollectionViewCell else { return UICollectionViewCell() }
           let card = cards[indexPath.row]
           cell.card = card
           return cell
       }
       
       // MARK: UICollectionViewDelegate
       
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           
           let cardCell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
           let card = cards[indexPath.row]
           
           if !card.isFlipped && !card.isMatch  {
               cardCell.flip()
               card.isFlipped = true
               
               if firstCardIndexPath != nil {
                   checkForMatch(secondCardIndex: indexPath)
               } else {
                   firstCardIndexPath = indexPath
               }
               flips += 1
           }
       }
       
     
   }


