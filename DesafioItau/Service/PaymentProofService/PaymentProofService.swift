//
//  ServicoDeComprovantes.swift
//  DesafioItau
//
//  Created by Vitor Campos on 26/02/25.
//

import Foundation

enum AplicationErrors: Error, LocalizedError {
    case unableToRetrieveTheData
    case decodeError
    
    var errorDescription: String? {
        switch self {
        case .unableToRetrieveTheData:
            return "Não foi possivel recuperar os dados."
        case .decodeError:
            return "Erro no decode."
        }
    }
}

protocol PaymentProofServiceProtocol {
    func updatePaymentProof() async throws -> [PaymentProof]?
}

class PaymentProofService: PaymentProofServiceProtocol {
    private let session: URLSession
    private let mock: Bool
    
    init (urlSession: URLSession = .shared, mock: Bool = false) {
        self.session = urlSession
        self.mock = mock
    }
    
    func updatePaymentProof() async throws -> [PaymentProof]? {

        if mock {
            return try await mockDataProvider()
        } else {
            return nil
        }
    }
    
    private func mockDataProvider() async throws -> [PaymentProof] {
        guard let bundle = Bundle.main.url(forResource: "DadosComprovantes", withExtension: "json") else {
            throw AplicationErrors.unableToRetrieveTheData
        }
        
        let data = try Data(contentsOf: bundle)
        if let paymentProofModel = try? JSONDecoder().decode(PaymentProofModel.self, from: data) {
            return paymentProofModel.updateData.paymentProofList
        } else {
            throw AplicationErrors.decodeError
        }
    }
}
