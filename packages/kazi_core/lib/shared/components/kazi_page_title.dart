import 'package:flutter/material.dart';
import 'package:kazi_core/kazi_core.dart';

class KaziPageTitle extends StatelessWidget {
  const KaziPageTitle({
    super.key,
    required this.title,
    required this.searchLabel,
    this.onFilter,
    this.onSearchChanged,
    this.searchController,
  });
  final String title;
  final String searchLabel;
  final VoidCallback? onFilter;
  final ValueChanged<String>? onSearchChanged;
  final TextEditingController? searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: KaziInsets.xLg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: KaziTextStyles.headlineLg,
          ),
          Row(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 280),
                child: KaziTextFormField(
                  labelText: searchLabel,
                  prefixIcon: const Icon(Icons.search),
                  controller: searchController,
                  onChanged: onSearchChanged,
                ),
              ),
              if (onFilter != null)
                Padding(
                  padding: const EdgeInsets.only(left: KaziInsets.md),
                  child: KaziElevatedButton.icon(
                    onTap: onFilter!,
                    icon: const Icon(Icons.filter_alt),
                    label: KaziLocalizations.current.filters,
                    backgroundColor: KaziColors.lightGrey,
                    foregroundColor: KaziColors.darkGrey,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
