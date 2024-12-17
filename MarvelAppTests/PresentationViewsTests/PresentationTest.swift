//
//  PresentationTest.swift
//  MarvelAppTests
//
//  Created by Kevin Heredia on 16/12/24.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import MarvelApp

final class PresentationTest: XCTestCase {

    // MARK: - Test HeroListView
    @MainActor
    func test_HeroListView_InitialState() throws {
        // Configuro el AppStateVM
        let appState = AppStateVM(herosUseCase: HerosUseCase(repo: DefaultHerosRepositoryMock()))
        XCTAssertNotNil(appState)

        // Instancio la vista
        let sut = HeroListView()
            .environment(appState)

        // Inspecciono la vista
        let navigationStack = try sut.inspect().implicitAnyView().navigationStack()
        XCTAssertEqual(navigationStack.count, 1)
    }

    // MARK: - Test HerosRowView
    @MainActor
    func test_HerosRowView_DisplaysCorrectHero() throws {
        // Configuro el objeto hero
        let hero = HerosRes(name: "3-D Man", id: 1011334, thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: Extension.jpg))

        // Instancio la vista
        let sut = HerosRowView(hero: hero)

        // Inspecciono la vista
        let zStack = try sut.inspect().implicitAnyView().zStack()
        XCTAssertEqual(zStack.count, 2)

        let heroName = try sut.inspect().find(text: hero.name).string()
        XCTAssertEqual(heroName, "3-D Man")
    }

    // MARK: - Test SplashView
    @MainActor
    func test_SplashView_InitialState() throws {
        let appState = AppStateVM(herosUseCase: HerosUseCase(repo: DefaultHerosRepositoryMock()))
        XCTAssertNotNil(appState)

        let sut = SplashView()
            .environment(appState)

        let zStack = try sut.inspect().implicitAnyView().zStack()
        XCTAssertEqual(zStack.count, 2)
    }

    // MARK: - Test ErrorView
    @MainActor
    func test_ErrorView_ShowsErrorMessage() throws {
        let sut = ErrorView(textError: "Error")

        let zStack = try sut.inspect().implicitAnyView().zStack()
        XCTAssertEqual(zStack.count, 2)

        let vStack = try zStack.vStack(1)
        XCTAssertNotNil(vStack)

        let opsText = try vStack.text(1).string()
        XCTAssertEqual(opsText, "OOOOPS!")
    }

    // MARK: - Test LoaderView
    @MainActor
    func test_LoaderView_DisplaysLoader() throws {
        let sut = LoaderView()

        let vStack = try sut.inspect().implicitAnyView().vStack()
        XCTAssertEqual(vStack.count, 2)
    }

    // MARK: - Test HeroDetailView
    @MainActor
    func test_HeroDetailView_DisplaysScrollView() throws {
        let hero = HerosRes(name: "3-D Man", id: 1011334, thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: Extension.jpg))

        let sut = HeroDetailView(viewModel: SeriesViewModel(heroesID: hero))

        let scrollView = try sut.inspect().implicitAnyView().scrollView()
        XCTAssertNotNil(scrollView)
    }
}