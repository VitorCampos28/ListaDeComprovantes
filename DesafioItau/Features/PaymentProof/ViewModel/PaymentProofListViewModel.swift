//
//  PaymentProofListViewModel.swift
//  DesafioItau
//
//  Created by Vitor Campos on 26/02/25.
//

import Foundation

protocol PaymentProofListViewModelProtocol {
    var paymentProofList: [PaymentProof]? { get }
    var showPopupError: ((String) -> Void)? { get set }
    
    func atualizarComprovantes(completion: @escaping () -> Void)
}

class PaymentProofListViewModel: PaymentProofListViewModelProtocol {
    var showPopupError: ((String) -> Void)?
    var paymentProofList: [PaymentProof]?
    let service: PaymentProofServiceProtocol
    
    init (service: PaymentProofServiceProtocol = PaymentProofService(mock: true)) {
        self.service = service
    }
    
    func atualizarComprovantes(completion: @escaping () -> Void) {
        Task {
            do {
                let data = try await self.service.atualizarComprovantes()
                
                if let paymentProofModel = try? JSONDecoder().decode(PaymentProofModel.self, from: data) {
                    self.paymentProofList = paymentProofModel.updateData.paymentProofList
                    completion()
                } else {
                    throw AplicationErrors.decodeError
                }
            } catch {
                showPopupError?(error.localizedDescription)
            }
        }
    }
}
