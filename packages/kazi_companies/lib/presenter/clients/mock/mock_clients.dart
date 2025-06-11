import 'package:kazi_core/kazi_core.dart';

import '../models/client_info.dart';

const _corteMasculino = ServiceType(
  id: 1,
  name: 'Corte Masculino',
  userId: 1,
  defaultValue: 50.0,
  discountPercent: 0.0,
  defaultDuration: Duration(minutes: 30),
  color: 'FFFFD700',
);
const _barba = ServiceType(
  id: 2,
  name: 'Barba',
  userId: 1,
  defaultValue: 30.0,
  discountPercent: 0.0,
  defaultDuration: Duration(minutes: 20),
  color: 'FF8B4513',
);
const _sobrancelha = ServiceType(
  id: 3,
  name: 'Sobrancelha',
  userId: 1,
  defaultValue: 20.0,
  discountPercent: 0.0,
  defaultDuration: Duration(minutes: 15),
  color: 'FFB8860B',
);
const _escovaProgressiva = ServiceType(
  id: 4,
  name: 'Escova Progressiva',
  userId: 2,
  defaultValue: 120.0,
  discountPercent: 0.0,
  defaultDuration: Duration(minutes: 90),
  color: 'FF00BFFF',
);
const _corteFeminino = ServiceType(
  id: 5,
  name: 'Corte Feminino',
  userId: 2,
  defaultValue: 70.0,
  discountPercent: 0.0,
  defaultDuration: Duration(minutes: 40),
  color: 'FFFF69B4',
);
const _hidratacao = ServiceType(
  id: 6,
  name: 'Hidratacao',
  userId: 2,
  defaultValue: 60.0,
  discountPercent: 0.0,
  defaultDuration: Duration(minutes: 30),
  color: 'FF40E0D0',
);
const _corteBarba = ServiceType(
  id: 7,
  name: 'Corte + Barba',
  userId: 3,
  defaultValue: 70.0,
  discountPercent: 0.0,
  defaultDuration: Duration(minutes: 50),
  color: 'FF4682B4',
);
const _manicurePedicure = ServiceType(
  id: 8,
  name: 'Manicure e Pedicure',
  userId: 4,
  defaultValue: 60.0,
  discountPercent: 0.0,
  defaultDuration: Duration(minutes: 60),
  color: 'FFFFA07A',
);
const _esmaltecao = ServiceType(
  id: 9,
  name: 'Esmaltecao',
  userId: 4,
  defaultValue: 25.0,
  discountPercent: 0.0,
  defaultDuration: Duration(minutes: 20),
  color: 'FFDC143C',
);
const _corteDegrade = ServiceType(
  id: 10,
  name: 'Corte Degrade',
  userId: 5,
  defaultValue: 55.0,
  discountPercent: 0.0,
  defaultDuration: Duration(minutes: 35),
  color: 'FF708090',
);

final mockClients = <ClientInfo>[
  ClientInfo(
    user: User(
      id: 1,
      name: 'João Silva',
      email: 'joao.silva@email.com',
      phones: const ['(11) 99999-9999'],
      identifier: '123.456.789-00',
      birthDate: DateTime(1990, 6, 10),
      userType: UserType.client,
      authToken: '',
      refreshToken: '',
      authExpires: DateTime.now(),
    ),
    lastServiceName: 'Corte Masculino',
    lastServiceDate: DateTime.now().subtract(const Duration(days: 25)),
    mostUsedServices: {
      'Corte Masculino': 12,
      'Barba': 8,
      'Sobrancelha': 5,
    },
  ),
  ClientInfo(
    user: User(
      id: 2,
      name: 'Maria Santos',
      email: 'maria.santos@email.com',
      phones: const ['(11) 88888-8888'],
      identifier: '987.654.321-00',
      birthDate: DateTime(1985, 5, 28),
      userType: UserType.client,
      authToken: '',
      refreshToken: '',
      authExpires: DateTime.now(),
    ),
    lastServiceName: 'Escova Progressiva',
    lastServiceDate: DateTime.now().subtract(const Duration(days: 2)),
    mostUsedServices: {
      'Escova Progressiva': 10,
      'Corte Feminino': 7,
      'Hidratacao': 4,
    },
  ),
  ClientInfo(
    user: User(
      id: 3,
      name: 'Pedro Costa',
      email: 'pedro.costa@email.com',
      phones: const ['(11) 77777-7777'],
      identifier: '321.654.987-00',
      birthDate: DateTime(1992, 6, 2),
      userType: UserType.client,
      authToken: '',
      refreshToken: '',
      authExpires: DateTime.now(),
    ),
    lastServiceName: 'Corte + Barba',
    lastServiceDate: DateTime.now().subtract(const Duration(days: 5)),
    mostUsedServices: {
      'Corte + Barba': 9,
      'Corte Masculino': 6,
      'Barba': 6,
    },
  ),
  ClientInfo(
    user: User(
      id: 4,
      name: 'Ana Oliveira',
      email: 'ana.oliveira@email.com',
      phones: const ['(11) 66666-6666'],
      identifier: '456.789.123-00',
      birthDate: DateTime(1991, 6, 10),
      userType: UserType.client,
      authToken: '',
      refreshToken: '',
      authExpires: DateTime.now(),
    ),
    lastServiceName: 'Manicure e Pedicure',
    lastServiceDate: DateTime.now().subtract(const Duration(days: 30)),
    mostUsedServices: {
      'Manicure e Pedicure': 11,
      'Esmaltecao': 8,
      'Corte Feminino': 3,
    },
    isBirthday: true,
  ),
  ClientInfo(
    user: User(
      id: 5,
      name: 'Carlos Ferreira',
      email: 'carlos.ferreira@email.com',
      phones: const ['(11) 55555-5555'],
      identifier: '654.321.987-00',
      birthDate: DateTime(1988, 6, 5),
      userType: UserType.client,
      authToken: '',
      refreshToken: '',
      authExpires: DateTime.now(),
    ),
    lastServiceName: 'Corte Degrade',
    lastServiceDate: DateTime.now().subtract(const Duration(days: 10)),
    mostUsedServices: {
      'Corte Degrade': 7,
      'Barba': 5,
      'Sobrancelha': 2,
    },
  ),
];
