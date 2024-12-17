//
//  ViewModelsTests.swift
//  MarvelAppTests
//
//  Created by Kevin Heredia on 16/12/24.
//

import Testing
@testable import MarvelApp

struct ViewModelsTests {

    @Suite("ViewModels Tests")
    struct ViewModels {
        
        @Suite("ViewModels", .serialized)
        struct HeroViewModelTests {

            @Test("Hero ViewModel")
            func heroViewModelTest() async throws {
                
                let viewModel = HerosViewModel(useCaseHeros: HerosUseCaseMock())
                #expect(viewModel != nil)
                #expect(viewModel.herosData.count == 0)
            }
        }
    }
}
