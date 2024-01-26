//
//  WheelViewController.swift
//  SelectionWheel
//
//  Created by Emre Tuğ on 19.01.2024.
//

import UIKit
import SnapKit
import SwiftFortuneWheel
import GoogleMobileAds
class WheelViewController: UIViewController ,GADBannerViewDelegate{
    // MARK: - Fields
    var footballTeams : [Team]?
    var selectedTeams : [Team]?
    var isRemoved : Bool = false
    var isRotate : Bool = true
    var finishIndex: Int?
    var bannerView: GADBannerView!

    // MARK: - Slices
    lazy var slices: [Slice] = {
        var slices: [Slice] = []
        if var teamList = self.footballTeams{
            teamList.shuffle()
            if teamList.count > 15{
                teamList = Array(teamList.prefix(15))
            }
            selectedTeams = teamList
            for team in Array(teamList)
            {
                let sliceContent = [Slice.ContentType.assetImage(name: team.logo, preferences: .variousWheelPodiumImage),
                                    Slice.ContentType.text(text: team.name, preferences: .variousWheelPodiumText(textColor: team.textColor))]
                var slice = Slice(contents: sliceContent, backgroundColor: team.color)
                slices.append(slice)
            }
            
        }
        return slices
    }()
    
    

    
    // MARK: - Whell Control
    lazy var wheelControl: SwiftFortuneWheel = {
        let frame = CGRect(x: 0, y: 0, width: 310, height: 310)
        let fortuneWheel = SwiftFortuneWheel(frame: frame, slices: slices, configuration: .withoutStoryboardExampleConfiguration)
        fortuneWheel.transform = CGAffineTransform(rotationAngle: .pi/2)
        return fortuneWheel
    }()
    
    
    // MARK: - Whell Stack
    
    
    // MARK: - CircleImage
    lazy var circleImage : UIImageView = {
        var image = UIImageView(image: UIImage(named: "circleGradient"))
        return image
    }()
    
    
    // MARK: - Right Pin
    lazy var rightPin : UIImageView = {
        var image = UIImageView(image: UIImage(named: "darkBlueRightPinImage"))
        return image
    }()
    
    
    // MARK: - Spin Button
    lazy var spinButton : GradientButton = {
        var btn = GradientButton()
        btn.tag = 0
        let fontSize: CGFloat = 28.0
        let font = UIFont.boldSystemFont(ofSize: fontSize)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.goldStart
        ]
        
        let attributedText = NSAttributedString(string: "Spin", attributes: attributes)
        btn.setAttributedTitle(attributedText, for: .normal)
        btn.addTarget(self, action: #selector(spinButtonTapped(_:)), for: .touchUpInside)
        btn.startColor = .red
        btn.endColor = .yellow
        return btn
    }()
    
    // UILabel nesnesi
    let teamLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    
    
    let teamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }()
    let centerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "soccer-ball")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    //    // MARK: - Button Stack
    //    lazy var buttonStack : UIStackView = {
    //    var stack = UIStackView()
    //        stack.axis = .horizontal
    //
    //        return stack
    //    }()
    //
    
    
    //     MARK: - Eliminate Button
    lazy var eliminateButton : GradientButton = {
        var btn = GradientButton()
        btn.tag = 1
        let fontSize: CGFloat = 28.0
        let font = UIFont.boldSystemFont(ofSize: fontSize)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.goldStart
        ]
        
        let attributedText = NSAttributedString(string: "Eliminate", attributes: attributes)
        btn.setAttributedTitle(attributedText, for: .normal)
        btn.addTarget(self, action: #selector(eliminateButtonTapped(_:)), for: .touchUpInside)
        btn.startColor = .red
        btn.endColor = .orange
        return btn
    }()
    
    
    
    
    // MARK: - Spin Button Clicked Function
    @objc func spinButtonTapped(_ sender: UIButton) {
        self.teamLabel.isHidden = true
        self.teamImageView.isHidden = true
        
        self.teamLabel.snp.updateConstraints { make in
            make.top.equalTo(self.view.snp.top).offset(-50)
        }
        
        self.teamImageView.snp.updateConstraints { make in
            make.top.equalTo(self.view.snp.top).offset(-200)
        }
        if let safeTeams = selectedTeams{
            if safeTeams.isEmpty{
                 var slices: [Slice] = {
                    var slices: [Slice] = []
                    if var teamList = self.footballTeams{
                        teamList.shuffle()
                        if teamList.count > 15{
                            teamList = Array(teamList.prefix(15))
                        }
                        selectedTeams = teamList
                        for team in Array(teamList)
                        {
                            let sliceContent = [Slice.ContentType.assetImage(name: team.logo, preferences: .variousWheelPodiumImage),
                                                Slice.ContentType.text(text: team.name, preferences: .variousWheelPodiumText(textColor: team.textColor))]
                            var slice = Slice(contents: sliceContent, backgroundColor: team.color)
                            slices.append(slice)
                        }
                        
                    }
                    return slices
                }()
                wheelControl.slices = slices
                
            }
        }
      
        
        if isRotate{
            isRotate = false
            finishIndex =  Int.random(in: 0..<wheelControl.slices.count)
            if let index = finishIndex{
                
                wheelControl.startRotationAnimation(finishIndex: index, continuousRotationTime: 1) { (finished) in
                    print(finished)
                    if let teams = self.selectedTeams{
                        let fontSize: CGFloat = 28.0
                        let font = UIFont.boldSystemFont(ofSize: fontSize)
                        let attributes: [NSAttributedString.Key: Any] = [
                            .font: font,
                            .foregroundColor: UIColor.goldStart
                        ]
                        let attributedText = NSAttributedString(string:teams[index].name, attributes: attributes)
                        self.teamLabel.attributedText = attributedText
                        self.teamImageView.image = UIImage(named: teams[index].logo)
                        
                    }
                    self.isRemoved = true
                    self.isRotate = true
                    self.teamLabel.isHidden = false
                    UIView.animate(withDuration: 0.5, animations: {
                        self.teamLabel.snp.updateConstraints { make in
                            make.top.equalTo(self.view.snp.top).offset(170)
                        }
                        self.view.layoutIfNeeded()
                    }) { _ in
                        self.teamImageView.isHidden = false
                        UIView.animate(withDuration: 0.5) {
                            self.teamImageView.snp.updateConstraints { make in
                                make.top.equalTo(self.view.snp.top).offset(70)
                            }
                            self.view.layoutIfNeeded()
                        }
                    }
                }
            }
            
        }
        
    }
    @objc func eliminateButtonTapped(_ sender: UIButton) {
        self.teamLabel.isHidden = true
        self.teamImageView.isHidden = true
        
        self.teamLabel.snp.updateConstraints { make in
            make.top.equalTo(self.view.snp.top).offset(-50)
        }
        
        self.teamImageView.snp.updateConstraints { make in
            make.top.equalTo(self.view.snp.top).offset(-200)
        }
        
        if let index = finishIndex{
            if isRemoved{
                self.wheelControl.slices.remove(at: index)
                selectedTeams?.remove(at: index)
                isRemoved = false
            }
            
        }
        
    }
   
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-6544171000174072/3505211689"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        // Custom geri butonunu oluşturun
        let customBackButton = UIButton(type: .custom)
        var image = UIImage(systemName: "arrowshape.backward.fill")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 50, weight: .regular))
        
        customBackButton.setImage(image, for: .normal)
        customBackButton.tintColor = .white
        customBackButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        // BarButtonItem'ı özelleştirilmiş geri butonuyla oluşturun
        let customBackButtonItem = UIBarButtonItem(customView: customBackButton)

        // navigationItem'ı güncelleyerek özelleştirilmiş geri butonunu ayarlayın
        navigationItem.leftBarButtonItem = customBackButtonItem

        
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bgmain")
        backgroundImage.contentMode =  .scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        //        view.addSubview(buttonStack)
        view.addSubview(spinButton)
        view.addSubview(eliminateButton)
        view.addSubview(circleImage)
        circleImage.addSubview(wheelControl)
        view.addSubview(rightPin)
        view.addSubview(teamLabel)
        view.addSubview(teamImageView)
        wheelControl.addSubview(centerImageView)
        teamLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(-50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
        teamImageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(-200)
            make.centerX.equalToSuperview()
            make.width.equalTo(100) // Fotoğraf genişliği
            make.height.equalTo(100) // Fotoğraf yüksekliği
        }
       
        
        circleImage.snp.makeConstraints { make in
            make.height.equalTo(370)
            make.width.equalTo(370)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        wheelControl.snp.makeConstraints { make in
            make.height.equalTo(343)
            make.width.equalTo(343)
            make.center.equalToSuperview()
        }
        rightPin.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.width.equalTo(50)
            make.trailing.equalTo(view).offset(-10)
            make.centerY.equalTo(circleImage)
        }
        //        buttonStack.snp.makeConstraints { make in
        //            make.centerX.equalToSuperview()
        //            make.top.equalTo(circleImage.snp.bottom).offset(20)
        //            make.leading.equalToSuperview()
        //            make.trailing.equalToSuperview()
        //            make.width.equalToSuperview()
        //        }
        spinButton.snp.makeConstraints { make in
            make.top.equalTo(circleImage.snp.bottom).offset(30)
            make.width.equalTo(140)
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(30)
        }
        eliminateButton.snp.makeConstraints { make in
            make.top.equalTo(circleImage.snp.bottom).offset(30)
            make.width.equalTo(140)
            make.height.equalTo(50)
            make.trailing.equalToSuperview().offset(-30)
            
        }
        centerImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
    }
    @objc func backButtonTapped() {
        // Geri butonuna tıklanıldığında yapılacak işlemleri buraya ekleyin
        navigationController?.popViewController(animated: true)
    }

    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)

        bannerView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalTo(view.snp.centerX)
        }

     }
    // MARK: - Preview
}
extension WheelViewController{
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
#Preview{
    WheelViewController()
}
