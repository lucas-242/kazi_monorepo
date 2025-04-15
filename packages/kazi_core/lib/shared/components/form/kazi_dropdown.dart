import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:kazi_core/shared/components/form/dropdown_item.dart';
import 'package:kazi_core/shared/themes/themes.dart';

class KaziDropdown extends StatelessWidget {
  const KaziDropdown({
    super.key,
    required this.label,
    required this.hint,
    this.selectedItem,
    required this.items,
    this.validator,
    this.onChanged,
    this.showSeach = false,
    this.searchHint,
    required this.searchLabel,
    required this.noResultsLabel,
  });
  final String label;
  final String hint;
  final DropdownItem? selectedItem;
  final List<DropdownItem> items;
  final String? Function(DropdownItem?)? validator;
  final Function(DropdownItem?)? onChanged;
  final bool showSeach;
  final String? searchHint;
  final String searchLabel;
  final String noResultsLabel;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<DropdownItem>(
      selectedItem: selectedItem,
      items: items,
      itemAsString: (DropdownItem? u) => u!.label,
      onChanged: onChanged,
      validator: validator,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      popupProps: PopupProps.menu(
        showSearchBox: showSeach,
        fit: FlexFit.loose,
        constraints: const BoxConstraints.tightFor(),
        emptyBuilder: (context, searchEntry) => DropdownEmpty(
          noResultsLabel: noResultsLabel,
        ),
        //! IsSelected is not working
        itemBuilder: (context, item, isSelected) => PopupItem(
          item: item,
          isSelected: isSelected,
        ),
        searchFieldProps:
            SearchFieldProps(searchHint, searchLabel).build(context),
      ),
      dropdownBuilder: (_, item) => DropdownInput(item: item, hint: hint),
      dropdownDecoratorProps:
          DropdownInputDecorator(labelText: label).build(context),
      dropdownButtonProps: const DropdownButtonProps(
        padding: EdgeInsets.symmetric(
          horizontal: KaziInsets.md,
        ),
        color: KaziColors.black,
        icon: Icon(Icons.keyboard_arrow_down_outlined),
      ),
    );
  }
}

class DropdownInput extends StatelessWidget {
  const DropdownInput({super.key, this.item, required this.hint});
  final DropdownItem? item;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Text(
      item == null || item!.label == '' ? hint : item!.label,
      style: KaziTextStyles.md,
    );
  }
}

class DropdownInputDecorator extends DropDownDecoratorProps {
  const DropdownInputDecorator({required this.labelText});
  final String labelText;

  DropDownDecoratorProps build(BuildContext context) {
    return DropDownDecoratorProps(
      dropdownSearchDecoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
        hintStyle: KaziTextStyles.md,
        labelStyle: KaziTextStyles.md,
        contentPadding: const EdgeInsets.only(left: KaziInsets.md),
        border: const OutlineInputBorder(),
      ),
    );
  }
}

class PopupItem extends StatelessWidget {
  const PopupItem({
    super.key,
    required this.item,
    required this.isSelected,
  });
  final DropdownItem item;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: isSelected
          ? KaziColors.lightYellow
          : context.colorsScheme.primary.withOpacity(0.08),
      child: ListTile(
        contentPadding: const EdgeInsets.only(
          left: KaziInsets.md,
          right: KaziInsets.lg,
        ),
        title: Text(item.label, style: KaziTextStyles.md),
      ),
    );
  }
}

class DropdownEmpty extends StatelessWidget {
  const DropdownEmpty({super.key, required this.noResultsLabel});
  final String noResultsLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: KaziInsets.md,
        horizontal: KaziInsets.md,
      ),
      child: Text(
        noResultsLabel,
        style: KaziTextStyles.titleSm,
      ),
    );
  }
}

class SearchFieldProps extends TextFieldProps {
  const SearchFieldProps(this.searchHint, this.searchLabel);
  final String? searchHint;
  final String searchLabel;

  TextFieldProps build(BuildContext context) {
    return TextFieldProps(
      style: KaziTextStyles.md,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: searchLabel,
        hintText: searchHint,
        hintStyle: KaziTextStyles.md,
        contentPadding: EdgeInsets.zero,
        border: const OutlineInputBorder(),
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Icon(Icons.search),
        ),
      ),
    );
  }
}
