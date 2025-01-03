#  PocketPlan 

 ## Objective:
 
 PocketPlan is a SwiftUI-based expense tracking app designed to help users manage their personal and business finances effortlessly. This app enables users to add, categorize, and track expenses in an intuitive and user-friendly interface.

## Features:

1. Track Expenses -  Users can add expenses, specify their type (Personal or Business), and the corresponding amount.
2. Categorization - Expenses are categorized as either "Personal" or "Business," making it easier to organize and analyze spending.
3. Persistent Storage - All expense data is stored persistently using UserDefaults with the help of Codable. Data is automatically saved and retrieved upon app launch.
4. Dynamic Expense Management
    - Add new expenses using a modal form
    - Delete expenses directly from the list
5. Currency Display - The app displays amounts in USD with currency formatting.

## File Breakdown:

    ### ContentView.swift :
    
    Purpose: Displays the main interface of the app, showing the list of tracked expenses.
    Key Features:

        - Displays a list of expenses using SwiftUI's List view.
        - Provides a button to add new expenses, which opens a modal view (AddView).
        - Implements swipe-to-delete functionality for managing expenses.
        
    Key Components:

        - ExpenseTrack: An observable class that tracks the array of expenses and saves them persistently using UserDefaults.
        - Expenses: A Codable struct that models an expense item with properties for name, amount, and type.


    ### AddView.swift:
    
    Purpose: A modal view that allows users to input new expense details.
    Key Features:
    - Provides a Form for users to enter the name, type, and amount of an expense.
    - Uses a Picker to select the type of expense (Personal or Business).
    - Automatically appends the new expense to the shared ExpenseTrack instance upon saving.
    
## SwiftUI Concepts Used:

State Management:

    - @State for managing local view states.
    - @Observable for sharing the ExpenseTrack instance between views.

Persistence:

    - Data encoding/decoding using Codable and JSONEncoder/JSONDecoder.
    - Persistent storage with UserDefaults.
    
Navigation and modal

    - NavigationStack for structuring navigation
    - .sheet for presenting the modal AddView
    
Dynamic UI:

    - List and ForEach for displaying dynamic content
    - Picker for selecting expense types
    
## Future Enhancements:

Analytics: Add charts or graphs to analyze spending habits
Export Data: Provide options to export expense data as a CSV or PDF
Enhanced Security: Add biometric authentication (Face ID) for data protection







 

