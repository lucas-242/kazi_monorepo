import 'package:equatable/equatable.dart';

class ServiceType extends Equatable {
  const ServiceType({
    required this.id,
    required this.name,
    required this.userId,
    required this.defaultValue,
    required this.discountPercent,
  });

  final int id;
  final String name;
  final double defaultValue;
  final double discountPercent;
  final int userId;

  ServiceType copyWith({
    int? id,
    String? name,
    double? defaultValue,
    double? discountPercent,
    int? userId,
  }) {
    return ServiceType(
      id: id ?? this.id,
      name: name ?? this.name,
      defaultValue: defaultValue ?? this.defaultValue,
      discountPercent: discountPercent ?? this.discountPercent,
      userId: userId ?? this.userId,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        defaultValue,
        discountPercent,
        userId,
      ];
}
