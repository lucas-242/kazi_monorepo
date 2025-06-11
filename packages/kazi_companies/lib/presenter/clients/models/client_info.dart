import 'package:kazi_core/kazi_core.dart';

class ClientInfo {
  ClientInfo({
    required this.user,
    required this.lastServiceName,
    required this.lastServiceDate,
    required this.mostUsedServices,
    this.isBirthday = false,
  });
  final User user;
  final String lastServiceName;
  final DateTime lastServiceDate;
  final Map<String, int> mostUsedServices;
  final bool isBirthday;

  bool get isLastServiceLate =>
      DateTime.now().difference(lastServiceDate).inDays >= 20;
  int get daysSinceLastService =>
      DateTime.now().difference(lastServiceDate).inDays;
  String get lastServiceDateFormatted =>
      '${lastServiceDate.day.toString().padLeft(2, '0')}/${lastServiceDate.month.toString().padLeft(2, '0')}/${lastServiceDate.year}';
}
