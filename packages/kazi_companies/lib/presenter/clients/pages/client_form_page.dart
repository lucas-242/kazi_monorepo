import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kazi_companies/core/routes/routes.dart';
import 'package:kazi_companies/presenter/clients/components/client_form.dart';
import 'package:kazi_companies/presenter/clients/controllers/client_form_controller.dart';
import 'package:kazi_core/kazi_core.dart';

class ClientFormPage extends ConsumerStatefulWidget {
  const ClientFormPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ClientFormPageState();
}

class _ClientFormPageState extends ConsumerState<ClientFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _phoneEC = TextEditingController();
  final _birthDateEC = TextEditingController();
  final _identifierEC = TextEditingController();
  final _addressEC = TextEditingController();
  final _cityEC = TextEditingController();
  final _cepEC = TextEditingController();
  final _favoriteServices = <String>[];

  @override
  void dispose() {
    super.dispose();
    _nameEC.dispose();
    _emailEC.dispose();
    _phoneEC.dispose();
    _birthDateEC.dispose();
    _identifierEC.dispose();
    _addressEC.dispose();
    _cityEC.dispose();
    _cepEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final services = ref.watch(clientFormControllerProvider);

    return KaziSafeArea(
      child: services.when(
        data: (data) => ClientForm(
          services: data,
          onSubmit: _onSubmit,
          formKey: _formKey,
          nameEC: _nameEC,
          emailEC: _emailEC,
          phoneEC: _phoneEC,
          birthDateEC: _birthDateEC,
          identifierEC: _identifierEC,
          addressEC: _addressEC,
          cityEC: _cityEC,
          cepEC: _cepEC,
          favoriteServices: _favoriteServices,
          onSelectServiceType: _onSelectServiceType,
        ),
        error: (error, stackTrace) => KaziError(message: error.toString()),
        loading: () => const KaziLoading(),
      ),
    );
  }

  void _onSelectServiceType(bool selected, ServiceType service) {
    //TODO move setState to the client form chips
    setState(() {
      if (selected) {
        _favoriteServices.add(service.name);
      } else {
        _favoriteServices.remove(service.name);
      }
    });
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const KaziLoading(),
    );

    final message =
        await ref.read(clientFormControllerProvider.notifier).submit(
              name: _nameEC.text,
              email: _emailEC.text,
              phone: _phoneEC.text,
              identifier: _identifierEC.text,
              address: _addressEC.text,
              city: _cityEC.text,
              cep: _cepEC.text,
            );

    if (!mounted) return;

    context.pop();

    if (message == null) {
      context.showSnackbar('Cliente cadastrado com sucesso!');
      context.navigate(Routes.clients);
    } else {
      context.showSnackbar(message);
    }
  }
}
