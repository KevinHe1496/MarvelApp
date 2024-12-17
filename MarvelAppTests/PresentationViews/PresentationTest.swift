//
//  PresentationTest.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 16/12/24.
//
import Testing
import SwiftUI
import ViewInspector
@testable import MarvelApp

@Suite("Presentation testing", .serialized) struct PresentationTest{
            
            @Test("Heros View")
            @MainActor
            func viewHerosListViewTest() throws {
                @State var appState = AppStateVM(herosUseCase: HerosUseCase(repo: DefaultHerosRepositoryMock()))
                #expect(appState != nil)
                
                //Instancio la vista
                let sut = HeroListView()
                    .environment(appState)
                
                let nStack = try sut.inspect().implicitAnyView().navigationStack()
                #expect(nStack.count == 1)
    

            }
            
            @Test("Heros Row View")
            @MainActor
            func viewHerosRowViewTest() throws {

                
                let hero = HerosRes(name: "3-D Man", id: 1011334, thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: Extension.jpg))
                
                let sut = HerosRowView(hero: hero)
                    
                
                let zStack = try sut.inspect().implicitAnyView().zStack()
                #expect(zStack.count == 2)
                
                let heroName = try sut.inspect().find(text: hero.name).string()
                #expect(heroName == "3-D Man")
     
            }
            
            @Test("Splash View")
            @MainActor
            func viewSplashViewTest() throws {
                @State var appState = AppStateVM(herosUseCase: HerosUseCase(repo: DefaultHerosRepositoryMock()))
                #expect(appState != nil)
                
                //Instancio la vista
                let sut = SplashView()
                    .environment(appState)
                
                let zStack = try sut.inspect().implicitAnyView().zStack()
                #expect(zStack.count == 2)

            }
            
            @Test("Error View")
            @MainActor
            func viewErrorViewTest() throws {

                
                //Instancio la vista
                let sut = ErrorView(textError: "Error")
                    
                
                let zStack = try sut.inspect().implicitAnyView().zStack()
                #expect(zStack.count == 2)
                
                let vStack = try zStack.vStack(1)
                #expect(vStack != nil)
                
                let opsText = try vStack.text(1).string()
                #expect(opsText == "OOOOPS!")
                
            }
            
            @Test("Loader View")
            @MainActor
            func viewLoaderViewTest() throws {
                
                //Instancio la vista
                let sut = LoaderView()
                    
                let vStack = try sut.inspect().implicitAnyView().vStack()
                #expect(vStack.count == 2)
 
            }
            
            
            @Test("Detail View")
            @MainActor
            func viewDetailViewTest() throws {
                
                let hero = HerosRes(name: "3-D Man", id: 1011334, thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: Extension.jpg))
                #expect(hero != nil)
                
                let sut = HeroDetailView(hero: hero)
                    
                let scrollView = try sut.inspect().implicitAnyView().scrollView()
                #expect(scrollView != nil)
                
 
            }
            
        }
