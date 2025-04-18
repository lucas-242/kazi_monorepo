import 'package:flutter/material.dart';
import 'package:kazi_core/kazi_core.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return KaziSafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                KaziLocalizations.current.services,
                style: KaziTextStyles.headlineMd,
              ),
              KaziCircularButton(
                child: const Icon(Icons.add),
                onTap: () {},
              ),
            ],
          ),
          Expanded(
            child: KaziCalendar(
              services: [
                Service.toCreate(
                  description: 'Unha de Gel',
                  value: 100,
                  scheduledToStartAt: DateTime(2025, 4, 23, 13),
                  scheduledToEndAt: DateTime(2025, 4, 23, 16, 30),
                  serviceType: const ServiceType(
                    id: 1,
                    name: 'Unha de Gel',
                    userId: 1,
                    defaultValue: 100,
                    discountPercent: 10,
                    color: 'FF6AC3B1',
                  ),
                  employeeId: 1,
                ),
                Service.toCreate(
                  description: 'Lash Lift',
                  value: 100,
                  scheduledToStartAt: DateTime(2025, 4, 23, 09, 30),
                  scheduledToEndAt: DateTime(2025, 4, 23, 11, 30),
                  serviceType: const ServiceType(
                    id: 1,
                    name: 'Lash Lift',
                    userId: 1,
                    defaultValue: 100,
                    discountPercent: 10,
                    color: 'FF5786FF',
                  ),
                  employeeId: 1,
                ),
                Service.toCreate(
                  description: 'Design de Sobrancelhas',
                  value: 100,
                  scheduledToStartAt: DateTime(2025, 4, 22, 10, 30),
                  scheduledToEndAt: DateTime(2025, 4, 22, 11),
                  serviceType: const ServiceType(
                    id: 1,
                    name: 'Design de Sobrancelhas',
                    userId: 1,
                    defaultValue: 100,
                    discountPercent: 10,
                    color: 'FFFE8B58',
                  ),
                  employeeId: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
