//
//  TeamBrain.swift
//  SelectionWheel
//
//  Created by Emre Tuğ on 19.01.2024.
//

import Foundation
struct TeamBrain{
   
    func getTeamsById(Id leagueId:Int) -> [Team] {
        switch leagueId{
        case 0:
            return eliteATeams
        case 1:
            return eliteBTeams
        case 2:
            return nationalTeams
        case 3:
            return mixedTeams
        default:
            return mixedTeams
        }
    }
    private let eliteATeams = [
        // Premier League
        Team(name: "M. United", logo: "manUnitedLogo", color: #colorLiteral(red: 0.7333333333, green: 0.0666666667, blue: 0.1960784314, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Liverpool", logo: "liverpoolLogo", color: #colorLiteral(red: 0.9098039216, green: 0.1137254902, blue: 0.2078431373, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "M. City", logo: "manCityLogo", color: #colorLiteral(red: 0.1176470588, green: 0.5647058824, blue: 1, alpha: 1), textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),
        Team(name: "Chelsea", logo: "chelseaLogo", color: #colorLiteral(red: 0.0823529412, green: 0.3960784314, blue: 0.7529411765, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Tottenham", logo: "tottenhamLogo", color: #colorLiteral(red: 0.0431372549, green: 0.2862745098, blue: 0.4980392157, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        
        // La Liga
        Team(name: "R. Madrid", logo: "realMadridLogo", color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),
        Team(name: "Barcelona", logo: "barcelonaLogo", color: #colorLiteral(red: 0.8509803922, green: 0.1176470588, blue: 0.2784313725, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "A. Madrid", logo: "atleticoMadridLogo", color: #colorLiteral(red: 0.8901960784, green: 0.1921568627, blue: 0.2039215686, alpha: 1), textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),
        
        // Serie A
        Team(name: "Juventus", logo: "juventusLogo", color: #colorLiteral(red: 0.6392156863, green: 0.0705882353, blue: 0.2078431373, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        
        // Bundesliga
        Team(name: "B. Munich", logo: "bayernMunichLogo", color: #colorLiteral(red: 0.7921568627, green: 0.0980392157, blue: 0.1254901961, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        
        // Ligue 1
        Team(name: "PSG", logo: "psgLogo", color: #colorLiteral(red: 0, green: 0.2078431373, blue: 0.5333333333, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
    ]
    private let eliteBTeams = [
        
        
        
        // Serie A
        Team(name: "AC Milan", logo: "acMilanLogo", color: #colorLiteral(red: 0.9019607843, green: 0.1764705882, blue: 0.1764705882, alpha: 1), textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),
        Team(name: "Inter Milan", logo: "interMilanLogo", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Napoli", logo: "napoliLogo", color: #colorLiteral(red: 0.0078431373, green: 0.137254902, blue: 0.2784313725, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        
        // Bundesliga
        Team(name: "B. Dortmund", logo: "borussiaDortmundLogo", color: #colorLiteral(red: 1, green: 0.6745098039, blue: 0.2078431373, alpha: 1), textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),
        Team(name: "RB Leipzig", logo: "rbLeipzigLogo", color: #colorLiteral(red: 0.8823529412, green: 0.1921568627, blue: 0.2509803922, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "B. Leverkusen", logo: "bayerLeverkusenLogo", color: #colorLiteral(red: 0.0078431373, green: 0.1647058824, blue: 0.3725490196, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        
        // Ligue 1
        Team(name: "O. Marseille", logo: "marseilleLogo", color: #colorLiteral(red: 0, green: 0.137254902, blue: 0.2784313725, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Lyon", logo: "lyonLogo", color: #colorLiteral(red: 0.8, green: 0.2, blue: 0.2, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "AS Monaco", logo: "asMonacoLogo", color: #colorLiteral(red: 0.0039215686, green: 0.3490196078, blue: 0.6470588235, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        
        // Süper Lig
        Team(name: "Galatasaray", logo: "galatasarayLogo", color: #colorLiteral(red: 1, green: 0.368627451, blue: 0.1490196078, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Fenerbahce", logo: "fenerbahceLogo", color: #colorLiteral(red: 1, green: 0.8039215686, blue: 0, alpha: 1), textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),
        Team(name: "Besiktas", logo: "besiktasLogo", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Trabzonspor", logo: "trabzonsporLogo", color: #colorLiteral(red: 0.3529411765, green: 0.6274509804, blue: 0.2823529412, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
    ]
    private let mixedTeams  = [
        // Premier League
        Team(name: "Manchester United", logo: "manUnitedLogo", color: #colorLiteral(red: 0.7333333333, green: 0.0666666667, blue: 0.1960784314, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Liverpool", logo: "liverpoolLogo", color: #colorLiteral(red: 0.9098039216, green: 0.1137254902, blue: 0.2078431373, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Manchester City", logo: "manCityLogo", color: #colorLiteral(red: 0.1176470588, green: 0.5647058824, blue: 1, alpha: 1), textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),
        Team(name: "Chelsea", logo: "chelseaLogo", color: #colorLiteral(red: 0.0823529412, green: 0.3960784314, blue: 0.7529411765, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Tottenham Hotspur", logo: "tottenhamLogo", color: #colorLiteral(red: 0.0431372549, green: 0.2862745098, blue: 0.4980392157, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        
        // La Liga
        Team(name: "Real Madrid", logo: "realMadridLogo", color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),
        Team(name: "Barcelona", logo: "barcelonaLogo", color: #colorLiteral(red: 0.8509803922, green: 0.1176470588, blue: 0.2784313725, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Atletico Madrid", logo: "atleticoMadridLogo", color: #colorLiteral(red: 0.8901960784, green: 0.1921568627, blue: 0.2039215686, alpha: 1), textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),
        Team(name: "Real Betis", logo: "realBetisLogo", color: #colorLiteral(red: 0.1098039216, green: 0.1960784314, blue: 0.262745098, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Valencia", logo: "valenciaLogo", color: #colorLiteral(red: 0.8, green: 0.2, blue: 0.2, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        
        // Serie A
        Team(name: "Juventus", logo: "juventusLogo", color: #colorLiteral(red: 0.6392156863, green: 0.0705882353, blue: 0.2078431373, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "AC Milan", logo: "acMilanLogo", color: #colorLiteral(red: 0.9019607843, green: 0.1764705882, blue: 0.1764705882, alpha: 1), textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),
        Team(name: "Inter Milan", logo: "interMilanLogo", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "AS Roma", logo: "asRomaLogo", color: #colorLiteral(red: 0.8, green: 0.2, blue: 0.2, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Napoli", logo: "napoliLogo", color: #colorLiteral(red: 0.0078431373, green: 0.137254902, blue: 0.2784313725, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        
        // Bundesliga
        Team(name: "Bayern Munich", logo: "bayernMunichLogo", color: #colorLiteral(red: 0.7921568627, green: 0.0980392157, blue: 0.1254901961, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Borussia Dortmund", logo: "borussiaDortmundLogo", color: #colorLiteral(red: 1, green: 0.6745098039, blue: 0.2078431373, alpha: 1), textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),
        Team(name: "RB Leipzig", logo: "rbLeipzigLogo", color: #colorLiteral(red: 0.8823529412, green: 0.1921568627, blue: 0.2509803922, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Bayer Leverkusen", logo: "bayerLeverkusenLogo", color: #colorLiteral(red: 0.0078431373, green: 0.1647058824, blue: 0.3725490196, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Schalke 04", logo: "schalkeLogo", color: #colorLiteral(red: 0.0078431373, green: 0.137254902, blue: 0.2784313725, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        
        // Ligue 1
        Team(name: "Paris Saint-Germain", logo: "psgLogo", color: #colorLiteral(red: 0, green: 0.2078431373, blue: 0.5333333333, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Olympique Marseille", logo: "marseilleLogo", color: #colorLiteral(red: 0, green: 0.137254902, blue: 0.2784313725, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Lyon", logo: "lyonLogo", color: #colorLiteral(red: 0.8, green: 0.2, blue: 0.2, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "AS Monaco", logo: "asMonacoLogo", color: #colorLiteral(red: 0.0039215686, green: 0.3490196078, blue: 0.6470588235, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Lille", logo: "lilleLogo", color: #colorLiteral(red: 0.7921568627, green: 0.0823529412, blue: 0.1254901961, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        
        // Süper Lig
        Team(name: "Galatasaray", logo: "galatasarayLogo", color: #colorLiteral(red: 1, green: 0.368627451, blue: 0.1490196078, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Fenerbahce", logo: "fenerbahceLogo", color: #colorLiteral(red: 1, green: 0.8039215686, blue: 0, alpha: 1), textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),
        Team(name: "Besiktas", logo: "besiktasLogo", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Trabzonspor", logo: "trabzonsporLogo", color: #colorLiteral(red: 0.3529411765, green: 0.6274509804, blue: 0.2823529412, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
    ]
    private let nationalTeams = [
        // 1-5
        Team(name: "Brazil", logo: "brazilLogo", color: #colorLiteral(red: 0.0039215686, green: 0.2509803922, blue: 0.5058823529, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Germany", logo: "germanyLogo", color: #colorLiteral(red: 0.000000, green: 0.341176, blue: 0.639216, alpha: 1.000000), textColor: #colorLiteral(red: 1.000000, green: 1.000000, blue: 1.000000, alpha: 1.000000)),
        Team(name: "Argentina", logo: "argentinaLogo", color: #colorLiteral(red: 0.8666666667, green: 0.3215686275, blue: 0.231372549, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Portugal", logo: "portugalLogo", color: #colorLiteral(red: 0.0078431373, green: 0.1019607843, blue: 0.3176470588, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Belgium", logo: "belgiumLogo", color: #colorLiteral(red: 0.9019607843, green: 0.1607843137, blue: 0.1294117647, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        
        // 6-10
        Team(name: "Spain", logo: "spainLogo", color: #colorLiteral(red: 0.9019607843, green: 0.1607843137, blue: 0.1294117647, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "France", logo: "franceLogo", color: #colorLiteral(red: 0.6980392157, green: 0.1607843137, blue: 0.1921568627, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Netherlands", logo: "netherlandsLogo", color: #colorLiteral(red: 0.0078431373, green: 0.1019607843, blue: 0.3176470588, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Uruguay", logo: "uruguayLogo", color: #colorLiteral(red: 0.8666666667, green: 0.3215686275, blue: 0.231372549, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "England", logo: "englandLogo", color: #colorLiteral(red: 0.0039215686, green: 0.2509803922, blue: 0.5058823529, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        
        // 11-15
        Team(name: "Italy", logo: "italyLogo", color: #colorLiteral(red: 0.0078431373, green: 0.1019607843, blue: 0.3176470588, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team(name: "Croatia", logo: "croatiaLogo", color: #colorLiteral(red: 0.9019607843, green: 0.1607843137, blue: 0.1294117647, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team (name: "Denmark", logo: "denmarkLogo", color: #colorLiteral(red: 0.0039215686, green: 0.2509803922, blue: 0.5058823529, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        
        // 16-20
        Team (name: "Colombia", logo: "colombiaLogo", color: #colorLiteral(red: 0.9019607843, green: 0.1607843137, blue: 0.1294117647, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team (name: "Mexico", logo: "mexicoLogo", color: #colorLiteral(red: 0.0078431373, green: 0.1019607843, blue: 0.3176470588, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team (name: "Chile", logo: "chileLogo", color: #colorLiteral(red: 0.8666666667, green: 0.3215686275, blue: 0.231372549, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team (name: "Poland", logo: "polandLogo", color: #colorLiteral(red: 0.0039215686, green: 0.2509803922, blue: 0.5058823529, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team (name: "Switzerland", logo: "switzerlandLogo", color: #colorLiteral(red: 0.9019607843, green: 0.1607843137, blue: 0.1294117647, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        
        // 21-25
        Team (name: "Sweden", logo: "swedenLogo", color: #colorLiteral(red: 0.0039215686, green: 0.1019607843, blue: 0.3176470588, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team (name: "Austria", logo: "austriaLogo", color: #colorLiteral(red: 0.8666666667, green: 0.3215686275, blue: 0.231372549, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team (name: "Norway", logo: "norwayLogo", color: #colorLiteral(red: 0.9019607843, green: 0.1607843137, blue: 0.1294117647, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team (name: "Ukraine", logo: "ukraineLogo", color: #colorLiteral(red: 0.0039215686, green: 0.2509803922, blue: 0.5058823529, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Team (name: "Wales", logo: "walesLogo", color: #colorLiteral(red: 0.0078431373, green: 0.1019607843, blue: 0.3176470588, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        
        // 26-30
        Team (name: "Turkey", logo: "turkeyLogo", color: #colorLiteral(red: 0.0039215686, green: 0.2509803922, blue: 0.5058823529, alpha: 1), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        // Diğer takımları buraya ekleyebilirsiniz.
    ]

}
