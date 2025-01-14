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



