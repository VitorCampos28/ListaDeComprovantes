//
//  ComprovantesModel.swift
//  DesafioItau
//
//  Created by Vitor Campos on 26/02/25.
//

import Foundation

struct PaymentProof: Decodable {
    let title: String
    let receiptId: String
    let name: String
    let receiverName: String
    let amount: String
    let control: String
    let date: String
}

struct PaymentProofList: Decodable {
    let paymentProofList: [PaymentProof]
    
    enum CodingKeys: String, CodingKey {
        case paymentProofList = "receipts"
    }
}

struct PaymentProofModel: Decodable {
    let updateData: PaymentProofList
    
    enum CodingKeys: String, CodingKey {
        case updateData = "data"
    }
}
