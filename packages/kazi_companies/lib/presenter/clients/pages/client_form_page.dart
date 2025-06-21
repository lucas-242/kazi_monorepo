import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kazi_companies/presenter/clients/controllers/client_form_controller.dart';
import 'package:kazi_core/kazi_core.dart';
import 'package:kazi_core/modules/users/data/mocks/service_type_mock.dart';

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
  final _services = ServiceTypeMock.all;

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
    ref.listen(clientFormControllerProvider, (previous, next) {
      if (next is AsyncError) {
        KaziSnackbar.show(next.error.toString(), context);
      }
      if (next is AsyncData) {
        KaziSnackbar.show('Cliente cadastrado com sucesso!', context);
        context.pop();
      }
    });

    final controller = ref.watch(clientFormControllerProvider);

    return KaziSafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            spacing: KaziInsets.md,
            children: [
              const KaziPageTitle(
                title: 'Cadastrar Cliente',
                subtitle: 'Adicione um novo cliente ao sistema',
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(KaziInsets.xxLg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      KaziSpacings.verticalSm,
                      GestureDetector(
                        onTap: () {
                          //TODO: Add action
                        },
                        child: Center(
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: KaziColors.lightGrey,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                const Icon(
                                  Icons.camera_alt,
                                  size: 40,
                                  color: KaziColors.grey,
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: KaziCircularButton(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.add,
                                      color: KaziColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      KaziSpacings.verticalXxLg,
                      Row(
                        children: [
                          const Icon(Icons.person, color: KaziColors.primary),
                          KaziSpacings.horizontalSm,
                          Text(
                            'Informações Pessoais',
                            style: KaziTextStyles.titleMd,
                          ),
                        ],
                      ),
                      KaziSpacings.verticalLg,
                      KaziTextFormField(
                        controller: _nameEC,
                        labelText: 'Nome Completo *',
                        validator: (value) => FormValidator.validateTextField(
                          value,
                          'nome completo',
                        ),
                      ),
                      KaziSpacings.verticalLg,
                      Row(
                        children: [
                          Expanded(
                            child: KaziTextFormField(
                              controller: _emailEC,
                              labelText: 'E-mail *',
                              keyboardType: TextInputType.emailAddress,
                              validator: FormValidator.validateEmailField,
                            ),
                          ),
                          KaziSpacings.horizontalLg,
                          Expanded(
                            child: KaziTextFormField(
                              controller: _phoneEC,
                              labelText: 'Telefone *',
                              keyboardType: TextInputType.phone,
                              validator: (value) =>
                                  FormValidator.validateTextField(
                                value,
                                'telefone',
                              ),
                            ),
                          ),
                        ],
                      ),
                      KaziSpacings.verticalLg,
                      KaziDatePicker(
                        controller: _birthDateEC,
                        label: 'Data de Aniversário *',
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        onChange: (date) {
                          _birthDateEC.text =
                              date.format(const Locale('pt', 'BR'));
                        },
                        validator: (value) => FormValidator.validateTextField(
                          value,
                          'data de aniversário',
                        ),
                      ),
                      KaziSpacings.verticalLg,
                      KaziTextFormField(
                        controller: _identifierEC,
                        labelText: 'CPF/CNPJ *',
                        validator: (value) =>
                            FormValidator.validateTextField(value, 'CPF/CNPJ'),
                      ),
                      KaziSpacings.verticalXxLg,
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: KaziColors.primary,
                          ),
                          KaziSpacings.horizontalSm,
                          Text(
                            'Endereço (Opcional)',
                            style: KaziTextStyles.titleMd,
                          ),
                        ],
                      ),
                      KaziSpacings.verticalLg,
                      KaziTextFormField(
                        controller: _addressEC,
                        labelText: 'Endereço Completo',
                        hintText: 'Rua, número, bairro',
                      ),
                      KaziSpacings.verticalLg,
                      Row(
                        children: [
                          Expanded(
                            child: KaziTextFormField(
                              controller: _cityEC,
                              labelText: 'Cidade',
                            ),
                          ),
                          KaziSpacings.horizontalLg,
                          Expanded(
                            child: KaziTextFormField(
                              controller: _cepEC,
                              labelText: 'CEP',
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      KaziSpacings.verticalXxLg,
                      Row(
                        children: [
                          const Icon(Icons.star, color: KaziColors.primary),
                          KaziSpacings.horizontalSm,
                          Text(
                            'Serviços Favoritos',
                            style: KaziTextStyles.titleMd,
                          ),
                        ],
                      ),
                      KaziSpacings.verticalLg,
                      Wrap(
                        spacing: KaziInsets.md,
                        runSpacing: KaziInsets.md,
                        children: _services
                            .map(
                              (service) => ChoiceChip(
                                label: Text(service.name),
                                selected:
                                    _favoriteServices.contains(service.name),
                                onSelected: (selected) =>
                                    _onSelectServiceType(selected, service),
                              ),
                            )
                            .toList(),
                      ),
                      KaziSpacings.verticalXxLg,
                      Row(
                        children: [
                          Expanded(
                            child: KaziElevatedButton.label(
                              onTap: () => context.pop(),
                              label: 'Cancelar',
                              backgroundColor: KaziColors.white,
                              foregroundColor: KaziColors.primary,
                            ),
                          ),
                          KaziSpacings.horizontalLg,
                          Expanded(
                            child: KaziElevatedButton.label(
                              onTap: controller.isLoading
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        ref
                                            .read(
                                              clientFormControllerProvider
                                                  .notifier,
                                            )
                                            .submit(
                                              name: _nameEC.text,
                                              email: _emailEC.text,
                                              phone: _phoneEC.text,
                                              identifier: _identifierEC.text,
                                              address: _addressEC.text,
                                              city: _cityEC.text,
                                              cep: _cepEC.text,
                                            );
                                      }
                                    },
                              label: 'Cadastrar Cliente',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSelectServiceType(bool selected, ServiceType service) {
    setState(() {
      if (selected) {
        _favoriteServices.add(service.name);
      } else {
        _favoriteServices.remove(service.name);
      }
    });
  }
}
