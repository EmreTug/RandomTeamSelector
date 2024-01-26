//
//  LeagueSelectionViewController.swift
//  SelectionWheel
//
//  Created by Emre Tuğ on 18.01.2024.
//

import UIKit
import SnapKit
import GoogleMobileAds
class LeagueSelectionViewController: UIViewController ,GADBannerViewDelegate {
    // MARK: - Fields
    let teamBrain = TeamBrain()
    let leagueBrain = LeagueBrain()
    var leagueId:Int?
    var bannerView: GADBannerView!
    // MARK: - Elite A Button
    private lazy var eliteAButton : GradientButton = {
        var button = GradientButton()
        button.layer.borderWidth = 1.0
        button.tag = 0
        button.layer.borderColor = UIColor(white: 1.0, alpha: 0.7).cgColor
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Elite B Button
    private lazy var eliteBButton : GradientButton = {
        var button = GradientButton()
        button.tag = 1
        button.startColor = .goldStart
        button.endColor = .goldFinish
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor(white: 1.0, alpha: 0.7).cgColor
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - National Team Button
    private lazy var nationalTeamButton : UIButton = {
        var button = UIButton()
        button.tag = 2
        let fontSize: CGFloat = 28.0
        let font = UIFont.boldSystemFont(ofSize: fontSize)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.goldStart
        ]

        let attributedText = NSAttributedString(string: "National Team", attributes: attributes)
        button.setAttributedTitle(attributedText, for: .normal)
//        let image = UIImage(named: "deneme") as UIImage?
//        button.setBackgroundImage(image, for: .normal)
        button.backgroundColor =  UIColor.red.withAlphaComponent(0.6)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor(white: 1.0, alpha: 0.7).cgColor
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Mixed Button
    private lazy var mixedButton : UIButton = {
        var button = UIButton()
        button.tag = 3
        let fontSize: CGFloat = 28.0
        let font = UIFont.boldSystemFont(ofSize: fontSize)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.goldStart
        ]

        let attributedText = NSAttributedString(string: "Mixed", attributes: attributes)
        button.setAttributedTitle(attributedText, for: .normal)
//        let image = UIImage(named: "deneme") as UIImage?
//        button.setBackgroundImage(image, for: .normal)
        button.backgroundColor =  UIColor.orange.withAlphaComponent(0.6)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor(white: 1.0, alpha: 0.7).cgColor
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Elite A Stack
    private lazy var eliteAStack: UIStackView = {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        
        var stack = UIStackView(arrangedSubviews: [
            UIImageView(image: UIImage(systemName: "star.fill",withConfiguration: largeConfig)?.withTintColor(.goldStart, renderingMode: .alwaysOriginal)),
            UIImageView(image: UIImage(systemName: "star.fill",withConfiguration: largeConfig)?.withTintColor(.goldStart, renderingMode: .alwaysOriginal)),
            UIImageView(image: UIImage(systemName: "star.fill",withConfiguration: largeConfig)?.withTintColor(.goldStart, renderingMode: .alwaysOriginal)),
            UIImageView(image: UIImage(systemName: "star.fill",withConfiguration: largeConfig)?.withTintColor(.goldStart, renderingMode: .alwaysOriginal)),
            UIImageView(image: UIImage(systemName: "star.fill",withConfiguration: largeConfig)?.withTintColor(.goldStart, renderingMode: .alwaysOriginal)),
        ])
        for case let imageView as UIImageView in stackView.arrangedSubviews {
            imageView.backgroundColor = .white
            imageView.tintColor = .white
        }
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 10
        stack.axis = .horizontal
        return stack
    }()
    
    
    // MARK: - Elite B Stack
    private lazy var eliteBStack: UIStackView = {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        var stack = UIStackView(arrangedSubviews: [
            UIImageView(image: UIImage(systemName: "star.fill",withConfiguration: largeConfig)?.withTintColor(.red, renderingMode: .alwaysOriginal)),
            UIImageView(image: UIImage(systemName: "star.fill",withConfiguration: largeConfig)?.withTintColor(.red, renderingMode: .alwaysOriginal)),
            UIImageView(image: UIImage(systemName: "star.fill",withConfiguration: largeConfig)?.withTintColor(.red, renderingMode: .alwaysOriginal)),
            UIImageView(image: UIImage(systemName: "star.fill",withConfiguration: largeConfig)?.withTintColor(.red, renderingMode: .alwaysOriginal)),
        ])
        
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 10
        stack.axis = .horizontal
        return stack
    }()
    
    
    // MARK: - StackView
    private lazy var stackView : UIStackView = {
        var stack = UIStackView()
        return stack
    }()
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        //        tableView.dataSource = self
        //        tableView.delegate = self
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-6544171000174072/3505211689"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bgmain")
        backgroundImage.contentMode =  .scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        view.addSubview(stackView)
        stackView.addSubview(eliteAButton)
        eliteAButton.addSubview(eliteAStack)
        stackView.addSubview(eliteBButton)
        eliteBButton.addSubview(eliteBStack)
        stackView.addSubview(nationalTeamButton)
        stackView.addSubview(mixedButton)
   
        
        
        
        
        stackView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()

        }
        eliteAButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
            make.height.equalTo(90)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        eliteBButton.snp.makeConstraints { make in
            make.top.equalTo(eliteAButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(90)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        nationalTeamButton.snp.makeConstraints { make in
            make.top.equalTo(eliteBButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(90)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
      
        mixedButton.snp.makeConstraints { make in
            make.top.equalTo(nationalTeamButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(90)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
    
        eliteAStack.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        eliteBStack.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
      
        
    }
    
    
    // MARK: - Button Clicked Function
    @objc func buttonTapped(_ sender: UIButton) {
 
        let wheellVC = WheelViewController()
        wheellVC.footballTeams = teamBrain.getTeamsById(Id:sender.tag)
        navigationController?.pushViewController(wheellVC, animated: true)
    }
    
    
    // MARK: - Prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="goToWheel"{
            let wheelVC = segue.destination as! ViewController
            if let id = leagueId{
                wheelVC.footballTeams = teamBrain.getTeamsById(Id:id)
            }
            
        }
    }
    
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
      bannerView.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(bannerView)
      view.addConstraints(
        [NSLayoutConstraint(item: bannerView,
                            attribute: .bottom,
                            relatedBy: .equal,
                            toItem: view.safeAreaLayoutGuide,
                            attribute: .bottom,
                            multiplier: 1,
                            constant: 0),
         NSLayoutConstraint(item: bannerView,
                            attribute: .centerX,
                            relatedBy: .equal,
                            toItem: view,
                            attribute: .centerX,
                            multiplier: 1,
                            constant: 0)
        ])
     }
}

extension LeagueSelectionViewController{
    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
      print("bannerViewDidReceiveAd")
    }

    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
      print("bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }

    func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
      print("bannerViewDidRecordImpression")
    }

    func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
      print("bannerViewWillPresentScreen")
    }

    func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
      print("bannerViewWillDIsmissScreen")
    }

    func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
      print("bannerViewDidDismissScreen")
    }
}

#Preview {
    LeagueSelectionViewController()
}

// MARK: - TableViewFunction
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return leagueBrain.getLeagueList().count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = LeaugeCell(style: .default, reuseIdentifier: "cellIdentifier")
//        cell.backgroundColor = .white
//        cell.textLabel?.textColor = .black
//        cell.textLabel?.text = leagueBrain.getLeagueList()[indexPath.row].name
//        return cell
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let cell = tableView.cellForRow(at: indexPath) {
//            cell.setSelected(false, animated: true)
//           }
//        leagueId = indexPath.row
//        self.performSegue(withIdentifier: "goToWheel", sender: self)
//
//    }
//    private lazy var tableView: UITableView = {
//        var tableView = UITableView()
//        tableView.backgroundColor = .white
//        tableView.estimatedRowHeight = 44 // Tahmini hücre yüksekliği
//        tableView.rowHeight = UITableView.automaticDimension // Otomatik yükseklik
//       return tableView
//    }()
