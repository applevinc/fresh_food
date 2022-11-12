import 'package:flutter_test/flutter_test.dart';
import 'package:fresh_food_ui/src/services/recipe/recipe_service.dart';
import 'package:fresh_food_ui/src/ui/onboarding/controllers/recipe_pref_controller.dart';
import 'package:fresh_food_ui/src/ui/onboarding/models/recipe_pref.dart';
import 'package:mocktail/mocktail.dart';

class MockRecipeService extends Mock implements RecipeService {}

void main() {
  late RecipePrefController sut;
  late MockRecipeService mockRecipeService;

  setUp(() {
    mockRecipeService = MockRecipeService();
    sut = RecipePrefController(recipeService: mockRecipeService);
  });

  group('RecipePrefController', () {
    var recipes = [
      RecipePrefModel(title: "All"),
      RecipePrefModel(title: "Vegan"),
      RecipePrefModel(title: "Vegeterian"),
      RecipePrefModel(title: "Paleo"),
      RecipePrefModel(title: "Keto"),
      RecipePrefModel(title: "Low Carb"),
    ];

    group('.toggle', () {
      test('should select recipe when it is not selected', () {
        // arrange
        var recipe = RecipePrefModel(
          title: "Beans",
          isSelected: false,
        );

        // act
        sut.select(recipe);

        // assert
        expect(recipe.isSelected, true);
      });

      test('should unselect recipe if already selected', () {
        // arrange
        var recipe = RecipePrefModel(
          title: "Beans",
          isSelected: true,
        );

        // act
        sut.select(recipe);

        // assert
        expect(recipe.isSelected, false);
      });
    });
  });
}
