import 'package:equatable/equatable.dart';

class Category extends Equatable{
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl
});

  @override
  List<Object?> get props => [name, imageUrl];

  static List<Category> categories =
      [
        Category(name: 'Nike Shoe', imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXN8ZW58MHx8MHx8&w=1000&q=80'),
        Category(name: 'Italian Leather', imageUrl: 'https://media.istockphoto.com/photos/elegant-black-leather-shoes-picture-id172417586?k=20&m=172417586&s=612x612&w=0&h=DDjvQhRgSYcH2F5rVt8iohGvkqCIteYuTCq3wpJuUi4='),
        Category(name: 'Addidas Fit', imageUrl: 'https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/8c7fcb9d65c143b4a3c8ad7800ac1820_9366/ultraboost-22-shoes.jpg'),
        Category(name: 'Soft Shoe', imageUrl: 'https://img.freepik.com/free-photo/fashion-shoes-sneakers_1203-7529.jpg?w=2000'),
        Category(name: 'CK shoe', imageUrl: 'https://images.unsplash.com/photo-1561808843-7adeb9606939?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb24lMjBzaG9lc3xlbnwwfHwwfHw%3D&w=1000&q=80'),
      ];

}