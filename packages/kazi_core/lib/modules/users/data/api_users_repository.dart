import 'package:kazi_core/kazi_core.dart';

final class ApiUsersRepository implements UsersRepository {
  @override
  Future<void> create(CreateUserParams params) async {
    try {
      await Future.delayed(const Duration(seconds: 4));
    } catch (error, trace) {
      throw ExternalError(
        'Error to create user with identifier: ${params.identifier}',
        trace: trace,
      );
    }
  }

  @override
  Future<void> delete(int userId) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
    } catch (error, trace) {
      throw ExternalError(
        'Error to create user with id: $userId',
        trace: trace,
      );
    }
  }

  @override
  Future<List<User>> get(GetUsersParams params) async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      Iterable<User> response = <User>[];

      if (params.userType != null) {
        response =
            _employeesMock.where((user) => user.userType == params.userType);
      }

      if (params.name != null) {
        response = _employeesMock.where((user) => user.name == params.name);
      }

      return response.toList();
    } catch (error, trace) {
      throw ExternalError(
        'Error to get user with filters: $params',
        trace: trace,
      );
    }
  }

  @override
  Future<User?> getById(int userId) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return _employeesMock.firstWhere((user) => user.id == userId);
    } catch (error, trace) {
      throw ExternalError('Error to get user with id: $userId', trace: trace);
    }
  }

  @override
  Future<void> update(UpdateUserParams params) async {
    try {
      await Future.delayed(const Duration(seconds: 4));
    } catch (error, trace) {
      throw ExternalError(
        'Error to update user with params: $params',
        trace: trace,
      );
    }
  }
}

final _employeesMock = [
  User(
    id: 1,
    identifier: '99999999999',
    name: 'Jupira Sem Dente',
    email: 'jupirinha_dentinho@test.com',
    birthDate: DateTime(1982, 04, 08),
    userType: UserType.employee,
    admissionDate: DateTime(2022, 02, 03),
    role: 'Manicure',
    authToken: '',
    refreshToken: '',
    authExpires: DateTime.now(),
    phones: const ['(21) 33333-4444'],
    addresses: const [
      Address(
        id: 999,
        postalCode: '12345-789',
        street: 'Rua dos sem dentes',
        number: 10,
        neighborhood: 'Dentinho',
        city: 'Rio de Janeiro',
        state: 'RJ',
        complement: 'Broco 03, apto 108',
      ),
    ],
    services: const [
      ServiceType(
        id: 996,
        name: 'Mão Simples',
        userId: 1,
        defaultValue: 35,
        discountPercent: 40,
        defaultDuration: Duration(minutes: 30),
        color: 'FFFE5858',
      ),
      ServiceType(
        id: 995,
        name: 'Pé Simples',
        userId: 1,
        defaultValue: 35,
        discountPercent: 40,
        defaultDuration: Duration(minutes: 30),
        color: 'FF6AC3B1',
      ),
    ],
  ),
  User(
    id: 2,
    identifier: '99999999998',
    name: 'Pateta',
    email: 'pateta@test.com',
    birthDate: DateTime(1998, 11, 04),
    userType: UserType.employee,
    admissionDate: DateTime(2022, 02, 03),
    role: 'Esteticista',
    authToken: '',
    refreshToken: '',
    authExpires: DateTime.now(),
    phones: const ['(21) 44444-4444'],
    addresses: const [
      Address(
        id: 998,
        postalCode: '12345-888',
        street: 'Disney Street',
        number: 233,
        neighborhood: 'Disneylandia',
        city: 'Rio de Janeiro',
        state: 'RJ',
      ),
    ],
    services: const [
      ServiceType(
        id: 994,
        name: 'Massagem Corporal',
        userId: 3,
        defaultValue: 180,
        discountPercent: 40,
        defaultDuration: Duration(minutes: 30),
        color: 'FF6AC3B1',
      ),
      ServiceType(
        id: 993,
        name: 'Drenagem',
        userId: 3,
        defaultValue: 150,
        discountPercent: 45,
        defaultDuration: Duration(minutes: 45),
        color: 'FF6AC3B1',
      ),
      ServiceType(
        id: 992,
        name: 'Limpeza de pele - rosto',
        userId: 3,
        defaultValue: 50,
        discountPercent: 35,
        defaultDuration: Duration(minutes: 30),
        color: 'FF6AC3B1',
      ),
      ServiceType(
        id: 991,
        name: 'Limpeza de pele - costas',
        userId: 3,
        defaultValue: 70,
        discountPercent: 35,
        defaultDuration: Duration(minutes: 30),
        color: 'FF6AC3B1',
      ),
      ServiceType(
        id: 990,
        name: 'Massagem modeladora',
        userId: 3,
        defaultValue: 180,
        discountPercent: 40,
        defaultDuration: Duration(minutes: 30),
        color: 'FF6AC3B1',
      ),
    ],
  ),
  User(
    id: 3,
    identifier: '99999999997',
    name: 'Pluto',
    email: 'pluto@test.com',
    birthDate: DateTime(2001, 07, 19),
    userType: UserType.employee,
    admissionDate: DateTime(2022, 02, 03),
    role: 'Cão de Guarda',
    authToken: '',
    refreshToken: '',
    authExpires: DateTime.now(),
    phones: const ['(21) 43213-7887'],
    addresses: const [
      Address(
        id: 998,
        postalCode: '12345-888',
        street: 'Disney Street',
        number: 1234,
        neighborhood: 'Disneylandia',
        city: 'Rio de Janeiro',
        state: 'RJ',
        complement: 'Próximo ao posto dos Stormtroops',
      ),
    ],
    services: const [
      ServiceType(
        id: 999,
        name: 'Caça aos gatos',
        userId: 3,
        defaultValue: 100,
        discountPercent: 25,
        defaultDuration: Duration(minutes: 20),
        color: 'FF6AC3B1',
      ),
      ServiceType(
        id: 998,
        name: 'Caça aos ratos',
        userId: 3,
        defaultValue: 80,
        discountPercent: 25,
        defaultDuration: Duration(minutes: 15),
        color: 'FF6AC3B1',
      ),
      ServiceType(
        id: 997,
        name: 'Caça aos invasores',
        userId: 3,
        defaultValue: 280,
        discountPercent: 20,
        defaultDuration: Duration(minutes: 45),
        color: 'FF6AC3B1',
      ),
    ],
  ),
  User(
    id: 4,
    identifier: '99999999996',
    name: 'Mickey',
    email: 'mickey@test.com',
    birthDate: DateTime(1984, 06, 07),
    userType: UserType.client,
    authToken: '',
    refreshToken: '',
    authExpires: DateTime.now(),
    phones: const ['(11) 94444-4444'],
    addresses: const [
      Address(
        id: 997,
        postalCode: '12345-888',
        street: 'Disney Street',
        number: 123,
        neighborhood: 'Disneylandia',
        city: 'Rio de Janeiro',
        state: 'RJ',
      ),
    ],
  ),
  User(
    id: 5,
    identifier: '99999999995',
    name: 'Minnie',
    email: 'miniie@test.com',
    birthDate: DateTime(1986, 11, 14),
    userType: UserType.client,
    authToken: '',
    refreshToken: '',
    authExpires: DateTime.now(),
    phones: const ['(11) 44444-4444'],
  ),
  User(
    id: 6,
    identifier: '99999999994',
    name: 'Jefferson',
    email: 'jefferson@test.com',
    birthDate: DateTime(1979, 01, 29),
    userType: UserType.client,
    authToken: '',
    refreshToken: '',
    authExpires: DateTime.now(),
    phones: const ['(11) 44444-4444'],
  ),
];
