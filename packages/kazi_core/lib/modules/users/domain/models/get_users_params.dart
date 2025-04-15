import 'package:kazi_core/shared/enums/user_type.dart';

class GetUsersParams {
  GetUsersParams({
    this.id,
    this.name,
    this.userType,
    this.limit = 10,
    this.offset = 1,
  });

  final int? id;
  final String? name;
  final UserType? userType;
  final int limit;
  final int offset;
}
