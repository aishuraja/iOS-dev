//
//  CraveTests.swift
//  CraveTests
//
//  Created by Aishwarya Raja on 1/13/25.
//

import XCTest
@testable import Crave

@MainActor
final class CraveTests: XCTestCase {
    func testFetchRecipesSuccess() async {
            let viewModel = RecipeViewModel()

            // Simulate fetch
            await viewModel.fetchRecipes()

            // Verify recipes were loaded
            XCTAssertFalse(viewModel.recipes.isEmpty)
        }

        func testFetchRecipesError() async {
            let viewModel = RecipeViewModel()

            // Modify URL to simulate failure
            await viewModel.fetchRecipes()

            // Verify error message is set
            XCTAssertNotNil(viewModel.errorMessage)
        }
    }


//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//
//}
