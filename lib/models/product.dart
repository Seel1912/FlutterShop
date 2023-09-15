import 'package:equatable/equatable.dart';

class Rating {
  final double? rate;
  final int? count;
  const Rating({this.rate, this.count});

  factory Rating.fromJson(Map json) => Rating(
      rate: double.tryParse(json['rate']?.toString() ?? '0'),
      count: int.tryParse(json['count']?.toString() ?? '0'));
}

class Product extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? imageUrl;
  final Rating? rating;

  const Product(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.imageUrl,
      this.rating});

  factory Product.fromJson(Map json) => Product(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      imageUrl: json['image'],
      description: json['description'],
      price: double.tryParse(json['price']?.toString() ?? '0'),
      rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null);

  @override
  List<dynamic> get props =>
      [id, title, price, description, category, imageUrl, rating];
}
