import 'package:flutter/widgets.dart';
import 'package:kazi_core/kazi_core.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

typedef KaziCalendarTapDetails = CalendarTapDetails;

class ServiceCalendarDataSource extends CalendarDataSource {
  ServiceCalendarDataSource(List<Service> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) => _getService(index).scheduledToStartAt;

  @override
  DateTime getEndTime(int index) => _getService(index).scheduledToEndAt;

  @override
  String getSubject(int index) => _getService(index).serviceType?.name ?? '';

  @override
  Color getColor(int index) =>
      _getService(index).serviceType?.colorAs ?? KaziColors.primary;

  @override
  bool isAllDay(int index) => false;

  Service _getService(int index) {
    final dynamic service = appointments![index];
    late final Service serviceData;

    if (service is Service) {
      serviceData = service;
    }

    return serviceData;
  }
}
