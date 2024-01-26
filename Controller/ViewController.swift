import UIKit
import SwiftFortuneWheel

class ViewController: UIViewController {
    
    @IBOutlet weak var teamLabel: UILabel!
    
    @IBOutlet weak var wheelControl: SwiftFortuneWheel! {
        didSet {
            wheelControl.configuration = .variousWheelPodiumConfiguration
            wheelControl.slices = slices
            wheelControl.spinImage = "darkBlueCenterImage"
            wheelControl.isSpinEnabled = false
        }
    }
    var footballTeams:[Team]?
    var selectedTeams : [Team]?
    var isRemoved : Bool = false
    var isRotate : Bool = true

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    var finishIndex: Int?
    
    @IBAction func rotateTap(_ sender: Any) {
        
        if isRotate{
            isRotate = false
            finishIndex =  Int.random(in: 0..<wheelControl.slices.count)
            if let index = finishIndex{
                
                wheelControl.startRotationAnimation(finishIndex: index, continuousRotationTime: 1) { (finished) in
                    print(finished)
                    self.teamLabel.textColor = .white
                    self.teamLabel.text = self.selectedTeams?[index].name
                    self.isRemoved = true
                    self.isRotate = true
                }
            }
        }
        
    }
    @IBAction func eleminateTap(_ sender: Any) {
        if let index = finishIndex{
            if isRemoved{
                self.wheelControl.slices.remove(at: index)
                selectedTeams?.remove(at: index)
                isRemoved = false
            }
            
        }
        
    }
}
