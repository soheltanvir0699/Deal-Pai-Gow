import UIKit

private struct Payout{
    
    let hands: String
    let tripBonus: String
    
    init(hands: String, bonus: String) {
        
        self.hands = hands
        self.tripBonus = bonus
    }
    
}

class PayoutsCell: UITableViewCell{

    static let identifier: String = "PayoutsCell"
    
    let fontTitle: UIFont = {
        if UIScreen.main.bounds.size.height > 700 {
            return UIFont.systemFont(ofSize: 26.0)
        } else if UIScreen.main.bounds.size.height < 500 {
            return UIFont.systemFont(ofSize: 14.0)
        } else {
            return UIFont.systemFont(ofSize: 20.0)
        }
    }()
    
    let fontNormal: UIFont = {
        if UIScreen.main.bounds.size.height > 700 {
            return UIFont.systemFont(ofSize: 14.0)
        } else if UIScreen.main.bounds.size.height < 500 {
            return UIFont.systemFont(ofSize: 10.0)
        } else {
            return UIFont.systemFont(ofSize: 12.0)
        }
    }()
    
    @IBOutlet weak var labelHands: UILabel!
    @IBOutlet weak var labelTrips: UILabel!
    
    fileprivate func configure(payout: Payout, index: Int){
        
        self.labelHands.text = payout.hands
        self.labelTrips.text = payout.tripBonus
        
        if index == 0 {
            labelHands.font = fontTitle
            labelTrips.font = fontTitle
        } else {
            labelHands.font = fontNormal
            labelTrips.font = fontNormal
        }
        
    }
    
}

class Fortune: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    self.navigationController?.navigationBar.tintColor = .white
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Courier", size: 20)!], for: UIControl.State.normal)
    tabBarController?.tabBar.barTintColor = UIColor.black
    tabBarController?.tabBar.tintColor = UIColor.white
    }

    @IBOutlet weak var tableView: UITableView!
    
    private let payouts: [Payout] = [
    
        .init(hands: "Hands", bonus: "Pay"),
        .init(hands: "7 Card Straight Flush - No Joker ", bonus: "2,500 To 1"),
        .init(hands: "Royal Flush + Royal Match ( K-Q Suited )", bonus: "1,000 To 1"),
        .init(hands: "7 Card Straight Flush W/Joker", bonus: "750 To 1"),
        .init(hands: "5 Aces", bonus: "250 To 1"),
        .init(hands: "Royal Flush", bonus: "125 To 1"),
        .init(hands: "Straight Flush", bonus: "50 To 1"),
        .init(hands: "4 Of A Kind", bonus: "25 To 1"),
        .init(hands: "Full House", bonus: "5 To 1"),
        .init(hands: "Flush", bonus: "4 To 1"),
        .init(hands: "3 Of A Kind", bonus: "3 To 1"),
        .init(hands: "Straight", bonus: "2 To 1"),
    ]

    
    
    
}


extension Fortune: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.payouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PayoutsCell.identifier, for: indexPath) as? PayoutsCell else {fatalError("Developer Error!")}
        
        cell.configure(payout: self.payouts[indexPath.row], index: indexPath.row)
        
        cell.selectionStyle = .none
        return cell
    }
}

extension Fortune: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    private class HeaderView: UIView{
        
        init(hands: String, bonus: String) {
            
            super.init(frame: .zero)
            
            self.backgroundColor = .black
            
            self.labelHands.text = hands
            self.labelTrips.text = bonus
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private lazy var labelHands: Label = {
           
            let label = Label(rootView: self)
            NSLayoutConstraint.activate([
            
                label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 120),
            ])
            
            return label
            
        }()
        
        private lazy var labelTrips: Label = {
           
            let label = Label(rootView: self)
            NSLayoutConstraint.activate([
            
                label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -25),
            ])
            
            return label
            
        }()
      
        
        private class Label: UILabel{
 
            init(rootView: UIView) {
                
                super.init(frame: .zero)
                
                self.textColor = .white
                self.font = UIFont.systemFont(ofSize: 26)
                self.textAlignment = .center
                rootView.addSubview(self)
                self.translatesAutoresizingMaskIntoConstraints = false
                
                self.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
                
                self.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 8).isActive = true
            }
            
            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
        }
    }
    
}
