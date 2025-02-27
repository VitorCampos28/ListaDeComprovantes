//
//  ComprovantesViewModel.swift
//  DesafioItau
//
//  Created by Vitor Campos on 26/02/25.
//

import Foundation

protocol ComprovantesViewModelProtocol {
    var comprovantes: [Comprovante]? { get }
    
    func atualizarComprovantes(completion: @escaping () -> Void)
}

class ComprovantesViewModel: ComprovantesViewModelProtocol {
    var comprovantes: [Comprovante]?
    let service: ServicoDeComprovantesProtocol
    
    init (service: ServicoDeComprovantesProtocol = ServicoDeComprovantesMock()) {
        self.service = service
    }
    
    func atualizarComprovantes(completion: @escaping () -> Void) {
        Task {
            do {
                let data = try await self.service.atualizarComprovantes()
                
                if let comprovantesModel = try? JSONDecoder().decode(ComprovantesModel.self, from: data) {
                    self.comprovantes = comprovantesModel.atualizacaoDeDados.comprovantes
                    completion()
                }
            } catch {
                // Call Error Flow
            }
        }
    }
}
