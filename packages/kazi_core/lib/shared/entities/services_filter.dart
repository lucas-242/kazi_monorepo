import 'package:equatable/equatable.dart';
import 'package:kazi_core/shared/enums/order_by.dart';

class ServicesFilter extends Equatable {
  const ServicesFilter({
    this.scheduledToStartAt,
    this.scheduledToEndAt,
    this.orderBy = OrderBy.dateDesc,
    this.isActive = true,
    this.pageSize = 10,
    this.pageNumber = 0,
  });

  final DateTime? scheduledToStartAt;
  final DateTime? scheduledToEndAt;
  final OrderBy? orderBy;
  final bool? isActive;
  final int pageSize;
  final int pageNumber;

  @override
  List<Object?> get props => [
        scheduledToStartAt,
        scheduledToEndAt,
        orderBy,
        isActive,
        pageSize,
        pageNumber,
      ];
}
