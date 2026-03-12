class StoreTemplate {
  final String storeType;
  final List<CategoryTemplate> categories;

  const StoreTemplate({
    required this.storeType,
    required this.categories,
  });
}

class CategoryTemplate {
  final String name;
  final List<ProductTemplate> products;

  const CategoryTemplate({
    required this.name,
    required this.products,
  });
}

class ProductTemplate {
  final String name;
  final String unit;

  const ProductTemplate({
    required this.name,
    required this.unit,
  });
}

const groceryTemplate = StoreTemplate(
  storeType: "Grocery",
  categories: [

    CategoryTemplate(
      name: "Grains",
      products: [
        ProductTemplate(name: "Rice", unit: "kg"),
        ProductTemplate(name: "Wheat Flour", unit: "kg"),
        ProductTemplate(name: "Dal", unit: "kg"),
      ],
    ),

    CategoryTemplate(
      name: "Dairy",
      products: [
        ProductTemplate(name: "Milk", unit: "liter"),
        ProductTemplate(name: "Curd", unit: "kg"),
        ProductTemplate(name: "Butter", unit: "kg"),
      ],
    ),

    CategoryTemplate(
      name: "Snacks",
      products: [
        ProductTemplate(name: "Biscuits", unit: "pcs"),
        ProductTemplate(name: "Chips", unit: "pcs"),
        ProductTemplate(name: "Namkeen", unit: "kg"),
      ],
    ),

    CategoryTemplate(
      name: "Cooking Oil",
      products: [
        ProductTemplate(name: "Mustard Oil", unit: "liter"),
        ProductTemplate(name: "Sunflower Oil", unit: "liter"),
      ],
    ),
  ],
);