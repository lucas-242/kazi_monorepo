import 'package:equatable/equatable.dart';

class Address extends Equatable {
  const Address({
    required this.id,
    required this.postalCode,
    required this.street,
    this.number,
    required this.neighborhood,
    required this.city,
    required this.state,
    this.complement,
  });

  final int id;
  final String postalCode;
  final String street;
  final int? number;
  final String neighborhood;
  final String city;
  final String state;
  final String? complement;

  /// Returns a normalized string - 'street, number - neighborhood'
  String get normalizedAddress => '$street, $number - $neighborhood';

  /// Returns a normalized string - 'city - state'
  String get normalizedCity => '$city - $state';

  @override
  List<Object?> get props => [
        id,
        postalCode,
        street,
        number,
        neighborhood,
        city,
        state,
        complement,
      ];
}
