import 'package:flutter/material.dart';
import 'package:kazi_core/kazi_core.dart';
import 'package:kazi_core/shared/components/calendar/models/calendar_models.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class KaziCalendar extends StatefulWidget {
  const KaziCalendar({
    super.key,
    required this.services,
    this.minDate,
    this.onTap,
  });

  final List<Service> services;
  final DateTime? minDate;
  final Function(KaziCalendarTapDetails)? onTap;

  @override
  State<KaziCalendar> createState() => _KaziCalendarState();
}

class _KaziCalendarState extends State<KaziCalendar> {
  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      allowedViews: const [
        CalendarView.day,
        CalendarView.week,
        CalendarView.month,
        CalendarView.schedule,
        CalendarView.timelineDay,
        CalendarView.timelineWeek,
        CalendarView.timelineMonth,
        CalendarView.workWeek,
      ],
      headerStyle: CalendarHeaderStyle(
        textStyle: KaziTextStyles.titleSm,
        backgroundColor: Colors.transparent,
      ),
      viewHeaderStyle: ViewHeaderStyle(
        dayTextStyle: KaziTextStyles.titleSm,
      ),
      dataSource: ServiceCalendarDataSource(widget.services),
      showNavigationArrow: true,
      allowViewNavigation: true,
      monthViewSettings: const MonthViewSettings(
        appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
      ),
      minDate: widget.minDate,
      onTap: widget.onTap,
      showDatePickerButton: true,
      showTodayButton: true,
    );
  }
}
