class Category {
  final String title;
  final List<String> selections;

  Category({required this.title, required this.selections});
}

Category mensCategory = Category(title: 'Men', selections: [
  'Shirts',
  'Jeans',
  'Shorts',
]);
Category womensCategory = Category(title: 'Women', selections: [
  'Shirts',
  'Jeans',
]);
Category petsCategory = Category(title: 'Pets', selections: [
  'Toys',
  'Treats',
]);

Category kidsCategory = Category(title: "no comment", selections: []);
