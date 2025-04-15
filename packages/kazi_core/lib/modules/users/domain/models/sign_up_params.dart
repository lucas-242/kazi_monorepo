import 'package:kazi_core/shared/enums/user_type.dart';

class SignUpUseCaseParams {
  SignUpUseCaseParams.employee({
    required this.identifier,
    required this.name,
    required this.email,
    required this.role,
    required this.birthday,
  }) : userType = UserType.employee;

  SignUpUseCaseParams.selfEmployed({
    required this.identifier,
    required this.name,
    required this.email,
    required this.role,
    required this.birthday,
  }) : userType = UserType.selfEmployed;

  SignUpUseCaseParams.client({
    required this.identifier,
    required this.name,
    required this.email,
    required this.role,
    required this.birthday,
  }) : userType = UserType.selfEmployed;

  final String identifier;
  final String name;
  final String email;
  final String role;
  final DateTime birthday;
  final UserType userType;
}
