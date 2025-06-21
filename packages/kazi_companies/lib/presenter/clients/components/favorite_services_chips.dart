import 'package:flutter/material.dart';
import 'package:kazi_core/kazi_core.dart';

class FavoriteServicesChips extends StatefulWidget {
  const FavoriteServicesChips({
    super.key,
    required this.services,
    required this.initialFavoriteServices,
    required this.onSelectionChanged,
  });

  final List<ServiceType> services;
  final List<String> initialFavoriteServices;
  final ValueChanged<List<String>> onSelectionChanged;

  @override
  State<FavoriteServicesChips> createState() => _FavoriteServicesChipsState();
}

class _FavoriteServicesChipsState extends State<FavoriteServicesChips> {
  late List<String> _selectedServices;

  @override
  void initState() {
    super.initState();
    _selectedServices = List<String>.from(widget.initialFavoriteServices);
  }

  void _onSelectService(bool selected, ServiceType service) {
    setState(() {
      if (selected) {
        _selectedServices.add(service.name);
      } else {
        _selectedServices.remove(service.name);
      }
    });
    widget.onSelectionChanged(_selectedServices);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: KaziInsets.md,
      runSpacing: KaziInsets.md,
      children: widget.services
          .map(
            (service) => ChoiceChip(
              label: Text(service.name),
              selected: _selectedServices.contains(service.name),
              onSelected: (selected) => _onSelectService(selected, service),
            ),
          )
          .toList(),
    );
  }
}
