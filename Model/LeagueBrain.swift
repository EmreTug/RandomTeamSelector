//
//  LeagueBrain.swift
//  SelectionWheel
//
//  Created by Emre Tuğ on 19.01.2024.
//

struct LeagueBrain{
    private let leagueList = [
        League(id: 0, name: "Elite A"),
        League(id: 1, name: "Elite B"),
        League(id: 3, name: "National Teams"),
        League(id: 4, name: "Mixed"),

    ]
    func getLeagueList() -> [League] {
        return leagueList
    }
}
