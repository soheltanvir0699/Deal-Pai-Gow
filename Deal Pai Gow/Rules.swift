//
//  Rules.swift
//  Pai Gow
//
//  Created by Aaron Fleming on 5/21/21.
//

import Foundation

import UIKit

class Rules: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var label = [("NO PAIR : Use second and third highest ranked cards for the low hand."), ("ONE PAIR : Put pair in back, highest two other cards in front."),("TWO PAIRS : Aces and any other pair - Always split. / Face card pair and pair 7's or higher - Always split. / Any two pair 6's and under - Never split. / With any other two pair, split unless the hand contains an Ace - Then play Ace in low hand."),("THREE PAIRS : Put high pair in front."),("THREE OF A KIND : Always play in the high hand. * EXCEPTION : When having three aces, use pair of aces in the high hand and an ace and the next highest card in the low hand."),("TWO THREE OF A KIND : Put pair from the highest set in low hand."),("ALL STRAIGHTS AND FLUSHES : Put two highest cards in front, leave any complete hand in back. * NOTE : A,2,3,4,5 is the second highest ranking straight or straight flush."), ("STRAIGHTS AND FLUSHES : WITH ONE PAIR : Put two highest cards in front, leave any complete hand in back. Maintain the straight or flush. WITH TWO PAIRS : Only use two pair rule to break up straight or flush if you can put an ace or pair in the low hand. WITH THREE OF A KIND : Put complete hand in back, pair in the front. 6 CARD COMPLETE HAND : Play highest card of complete hand in the front. WITH NO PAIR : Play the combination that results in the highest low hand."),("WITH FULL HOUSE : Play full house rule."),("THREE OF A KIND AND PAIR ( FULL HOUSE RULE ) Break the full house, use pair for low hand. * EXCEPTION : Pair when the three of a kind is 2's and you have an ace and a king. Play the ace and the king in the low hand and use the full house for the high hand."),("THREE OF A KIND AND TWO PAIRS : Use the highest pair for the low hand."),("FOUR OF A KIND : Play according to the rank of the four of a kind. 2 through 6, Always keep together. 7 through 10, Split unless a pair or ace can be played in the low hand. Jack through Ace, Split unless hand also contains a pair of 7's or higher."),("STRAIGHT FLUSH : Keep as high hand and play next highest cards in low hand. Six card straight flush, play whichever gives you the highest low hand. Break up straight flush under the following circumstances : Two pair 7's and higher, or a pair of aces and any other pair. Any other two pair with ace - Play the two pair as high and the ace in the low hand. Play a straight or flush instead of straight flush if it causes a picture card or higher to be played in the low hand."),("ROYAL FLUSH : Keep as high hand unless you have two pairs, then split the pairs. Only split royal flush if an ace or pair can be played in the low hand while retaining straight or flush in high hand."),("FIVE ACES : Always split. * EXCEPTION : With a pair of kings, play kings in the low hand."),("JOKER : Counts as an ace by itself. It can complete a straight or a flush.")]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0);
        self.tableView.rowHeight = 135.0

    }
    override func viewWillAppear(_ animated: Bool) {
            navigationItem.title = "RULES"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return label.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! TableViewCell
        cell.rulesLabel.text = self.label[indexPath.row]
        return cell
    }
}

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var rulesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

