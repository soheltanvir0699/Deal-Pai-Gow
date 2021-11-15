import UIKit

private struct Payout2{
    
    let hands: String
    let tripBonus: String
    
    init(hands: String, bonus: String) {
        
        self.hands = hands
        self.tripBonus = bonus
    }
    
}

class PayoutsCell2: UITableViewCell{

    static let identifier: String = "PayoutsCell2"
    
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
    
    fileprivate func configure(payout2: Payout2, index: Int){
        
        self.labelHands.text = payout2.hands
        self.labelTrips.text = payout2.tripBonus
        
        if index == 0 {
            labelHands.font = fontTitle
            labelTrips.font = fontTitle
        } else {
            labelHands.font = fontNormal
            labelTrips.font = fontNormal
        }
        
    }
    
}

class Envy: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    self.navigationController?.navigationBar.tintColor = .white
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Courier", size: 20)!], for: UIControl.State.normal)
    tabBarController?.tabBar.barTintColor = UIColor.black
    tabBarController?.tabBar.tintColor = UIColor.white
    }

    @IBOutlet weak var tableView: UITableView!
    
    private let payouts2: [Payout2] = [
        .init(hands: "Hands", bonus: "Pay"),
        .init(hands: "7 Card Straight Flush - No Joker", bonus: "1,000"),
        .init(hands: "Royal Flush + Royal Match ( K-Q Suited )", bonus: "750"),
        .init(hands: "7 Card Straight Flush W/Joker", bonus: "250"),
        .init(hands: "5 Aces", bonus: "100"),
        .init(hands: "Royal Flush", bonus: "50"),
        .init(hands: "Straight Flush", bonus: "20"),
        .init(hands: "4 Of A Kind", bonus: "5"),
        .init(hands: "Full House", bonus: "-"),
        .init(hands: "Flush", bonus: "-"),
        .init(hands: "3 Of A Kind", bonus: "-"),
        .init(hands: "Straight", bonus: "-"),
    ]

}


extension Envy: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.payouts2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PayoutsCell2.identifier, for: indexPath) as? PayoutsCell2 else {fatalError("Developer Error!")}
        
        cell.configure(payout2: self.payouts2[indexPath.row], index: indexPath.row)
        
        cell.selectionStyle = .none
        return cell
    }
}

extension Envy: UITableViewDelegate{
    
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
