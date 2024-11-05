import 'package:moneymanagement/models/category/category_model.dart';

abstract class CategoryDbFunctions{
 List<CategoryModel> getCategories();
 Future<void> insertCategory(CategoryModel value);
}