import 'package:flutter/material.dart';
import 'package:kazi_companies/core/routes/routes.dart';
import 'package:kazi_companies/presenter/clients/components/favorite_services_chips.dart';
import 'package:kazi_core/kazi_core.dart';

class ClientForm extends StatelessWidget {
  const ClientForm({
    super.key,
    required this.services,
    required this.onSubmit,
    required this.formKey,
    required this.nameEC,
    required this.emailEC,
    required this.phoneEC,
    required this.birthDateEC,
    required this.identifierEC,
    required this.addressEC,
    required this.cityEC,
    required this.cepEC,
    required this.favoriteServices,
    required this.onFavoriteServicesChanged,
  });

  final List<ServiceType> services;
  final VoidCallback onSubmit;
  final GlobalKey<FormState> formKey;
  final TextEditingController nameEC;
  final TextEditingController emailEC;
  final TextEditingController phoneEC;
  final TextEditingController birthDateEC;
  final TextEditingController identifierEC;
  final TextEditingController addressEC;
  final TextEditingController cityEC;
  final TextEditingController cepEC;
  final List<String> favoriteServices;
  final ValueChanged<List<String>> onFavoriteServicesChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
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
                      controller: nameEC,
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
                            controller: emailEC,
                            labelText: 'E-mail *',
                            keyboardType: TextInputType.emailAddress,
                            validator: FormValidator.validateEmailField,
                          ),
                        ),
                        KaziSpacings.horizontalLg,
                        Expanded(
                          child: KaziTextFormField(
                            controller: phoneEC,
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
                      controller: birthDateEC,
                      label: 'Data de Aniversário *',
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      onChange: (date) {
                        birthDateEC.text =
                            date.format(const Locale('pt', 'BR'));
                      },
                      validator: (value) => FormValidator.validateTextField(
                        value,
                        'data de aniversário',
                      ),
                    ),
                    KaziSpacings.verticalLg,
                    KaziTextFormField(
                      controller: identifierEC,
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
                      controller: addressEC,
                      labelText: 'Endereço Completo',
                      hintText: 'Rua, número, bairro',
                    ),
                    KaziSpacings.verticalLg,
                    Row(
                      children: [
                        Expanded(
                          child: KaziTextFormField(
                            controller: cityEC,
                            labelText: 'Cidade',
                          ),
                        ),
                        KaziSpacings.horizontalLg,
                        Expanded(
                          child: KaziTextFormField(
                            controller: cepEC,
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
                    FavoriteServicesChips(
                      services: services,
                      initialFavoriteServices: favoriteServices,
                      onSelectionChanged: onFavoriteServicesChanged,
                    ),
                    KaziSpacings.verticalXxLg,
                    Row(
                      children: [
                        Expanded(
                          child: KaziElevatedButton.outlined(
                            onTap: () => context.navigate(Routes.clients),
                            label: 'Cancelar',
                          ),
                        ),
                        KaziSpacings.horizontalLg,
                        Expanded(
                          child: KaziElevatedButton.label(
                            onTap: onSubmit,
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
    );
  }
}
