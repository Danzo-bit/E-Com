import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product(
      {required this.name,
      required this.category,
      required this.imageUrl,
      required this.price,
      required this.isRecommended,
      required this.isPopular});

  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isRecommended, isPopular];

  static List<Product> products = [
    const Product(
        name: 'Product #1',
        category: 'Shoes',
        imageUrl:
            'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXN8ZW58MHx8MHx8&w=1000&q=80',
        price: 2.45,
        isRecommended: true,
        isPopular: true),
    const Product(
        name: 'Product #2',
        category: 'Bags',
        imageUrl:
        'https://media.istockphoto.com/photos/yellow-open-backpack-picture-id1141208525?k=20&m=1141208525&s=612x612&w=0&h=cOu7gNKtDi4FuGAzSDvn-Bm9PbB8tvWVgi7xY9lhcRw=',
        price: 5.45,
        isRecommended: false,
        isPopular: true),
    const Product(
        name: 'Product #3',
        category: 'House',
        imageUrl:
        'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        price: 175.34,
        isRecommended: true,
        isPopular: false),
    const Product(
        name: 'Product #4',
        category: 'Shoes',
        imageUrl:
        'https://img.freepik.com/free-photo/fashion-shoes-sneakers_1203-7529.jpg?w=2000',
        price: 9.45,
        isRecommended: true,
        isPopular: true),
    const Product(
        name: 'Product #5',
        category: 'Foods',
        imageUrl:
        'https://media.istockphoto.com/photos/delicious-meal-picture-id1295387240?b=1&k=20&m=1295387240&s=170667a&w=0&h=KtWYFjSBgpNgVkE3P-WKZ2F6V-VxyUBBtJIP_k8IANM=',
        price: 10.45,
        isRecommended: false,
        isPopular: false),
    const Product(
        name: 'Product #6',
        category: 'Foods',
        imageUrl:
        'https://assets1.cbsnewsstatic.com/hub/i/2015/07/01/0b059f60-344d-4ada-baae-e683aff3650a/istock000044051102large.jpg',
        price: 5.00,
        isRecommended: true,
        isPopular: true),
  ];
}
