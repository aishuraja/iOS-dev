#  Crave

## Recipe App

## Objective:
Crave is a sleek and user-friendly iOS app that makes discovering recipes from different cuisines easy and enjoyable. Whether you're searching for your favorite dish or exploring detailed recipes with images and videos, Crave is your go-to guide for all things food. 

## Summary:

### Demo video: [![here]](./Crave.mp4)

Crave is a feature-rich application with a clean and intuitive interface. Here are the key highlights of the app:

1. **Search Bar**: A dynamic search bar enables users to quickly filter recipes by name or cuisine.
2. **Featured Recipes**: A carousel displays highlighted recipes, offering users inspiration for their next meal.
3. **Recipe List**: A scrolling list of all recipes with small images and concise details.
4. **Recipe Detail View**: Users can view a recipe's image, name,cuisine type, and watch a related YouTube video if available.
5. **Efficient Image Caching**: The app intelligently caches images to improve performance and offline availability.
6. **Error Handling**: Friendly error messages guide users in case of network or data issues.

## Focus Area:

I focused more on the following topics:

    1. User Experience : UI is the first thing which everyone experiences in the app. I was very sure to make the app prioritize a smooth and intuitive user experience. From the navigation flow to the visual aesthetics, every element has been designed to ensure users feel comfortable and engaged while exploring recipes.

    2. Performance Optimization: Given the image heavy nature of recipe apps, efficient caching was a major focus. By implementing a custom `ImageCache` class, the app avoids redundant network calls, speeds up load times, and ensures images are accessible even offline.

    3.  Asynchronous Programming: To ensure the app remains responsive while fetching data, the app leverages Swift's `async/await` for asynchronous network requests. This prevents blocking the main thread and ensures a seamless experience.
    
    4. Scalability: The app structure is modular and scalable. Components like `RecipeRow`, `FeaturedRecipeCard`, and `RecipeDetailView` are reusable, making it easy to add new features or update existing ones.
    

## Time Spend:

Approximately 25–30 hours

**Time Allocation:**

- **Feature Planning (5 hours):**  
  Outlined the app's core features and designed its structure.
  
- **Core Development (10 hours):**  
  Built the main functionality, including search, featured recipes, and detail views.

- **UI/UX Design (8 hours):**  
  Focused on creating a visually appealing and responsive design. Added paddings, corner radii, and styled the navigation bar.

- **Testing and Debugging (5 hours):**  
  Ensured that the app handled errors gracefully, optimized the loading of images, and confirmed the search functionality worked as intended.

- **Documentation and Presentation (2 hours):**  
  Wrote this README and prepared the app for presentation.


## Trade-offs and Decisions:

### Trade-offs:

1. Dependent on External API:
The app relies on an external JSON API to fetch recipe data, meaning it depends on the API’s uptime and stability. Building a custom backend was avoided to focus on front-end features and reduce development complexity.

2. Search Functionality:
The app allows users to search by recipe name or cuisine but does not support advanced filtering (e.g., by ingredients or cooking time). This decision was made to focus on delivering a functional and clean search experience within the given time constraints.

### Decisions:

1. Custom Image Cache Implementation:
Decided to create a custom ImageCache class to efficiently store and retrieve images locally, improving app performance and reducing unnecessary network requests.

2. Simple and Intuitive UI:
Opted for a clean, minimalistic design with SwiftUI, ensuring the app is easy to navigate and visually appealing, even at the cost of limiting complex animations or highly customized layouts.

3. Reusable and Modular Design:
Structured the app into reusable SwiftUI components like RecipeRow, FeaturedRecipeCard, and RecipeDetailView. This decision supports scalability, making it easier to extend functionality in the future.


## Weakest Part of the Project:

1. **Error Handling**:  
While the app provides basic error feedback (e.g., "Failed to load the recipes"), the lack of detailed error information or retry mechanisms might leave users in the dark during issues.

2. **Offline Functionality**:  
Aside from cached images, the app doesn't provide full offline functionality, such as saving recipes locally for later access.

##Additional Information:

### Insights Gained:
This project helped me learn SwiftUI and asynchronous programming while highlighting the importance of efficient data handling and modular design.

### Constraints:
Focused on core features due to time limits and relied on an external API with fixed data.
