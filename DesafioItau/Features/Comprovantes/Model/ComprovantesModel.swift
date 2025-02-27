//
//  ComprovantesModel.swift
//  DesafioItau
//
//  Created by Vitor Campos on 26/02/25.
//

import Foundation

struct Comprovante: Decodable {
    let title: String
    let receiptId: String
    let name: String
    let receiverName: String
    let amount: String
    let control: String
    let date: String
    
    
}

struct Comprovantes: Decodable {
    let comprovantes: [Comprovante]
    
    enum CodingKeys: String, CodingKey {
        case comprovantes = "receipts"
    }
}

struct ComprovantesModel: Decodable {
    let atualizacaoDeDados: Comprovantes
    
    enum CodingKeys: String, CodingKey {
        case atualizacaoDeDados = "data"
    }
}
