import 'package:flutter/material.dart';
import 'package:kazi_core/kazi_core.dart';

class FavoriteServicesChips extends StatefulWidget {
  const FavoriteServicesChips({
    super.key,
    required this.serviceTypes,
    required this.initialFavoriteServices,
    required this.onSelectionChanged,
  });

  final List<ServiceType> serviceTypes;
  final List<ServiceType> initialFavoriteServices;
  final ValueChanged<List<ServiceType>> onSelectionChanged;

  @override
  State<FavoriteServicesChips> createState() => _FavoriteServicesChipsState();
}

class _FavoriteServicesChipsState extends State<FavoriteServicesChips> {
  late List<ServiceType> _selectedServices;

  @override
  void initState() {
    super.initState();
    _selectedServices = List.from(widget.initialFavoriteServices);
  }

  void _onSelectService(bool selected, ServiceType serviceType) {
    setState(() {
      if (selected) {
        _selectedServices.add(serviceType);
      } else {
        _selectedServices.remove(serviceType);
      }
    });
    widget.onSelectionChanged(_selectedServices);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: KaziInsets.md,
      runSpacing: KaziInsets.md,
      children: widget.serviceTypes
          .map(
            (type) => ChoiceChip(
              label: Text(type.name),
              selected: _selectedServices.contains(type),
              onSelected: (selected) => _onSelectService(selected, type),
            ),
          )
          .toList(),
    );
  }
}
