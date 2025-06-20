import 'package:kazi_core/modules/users/data/mocks/user_mock.dart';
import 'package:kazi_core/shared/entities/client_info.dart';

abstract class ClientInfoMock {
  static final mock = [
    ClientInfo(
      user: UserMock.clients[0], // Fernanda Rocha
      lastServiceName: 'Esmaltação em Gel',
      lastServiceDate: DateTime.now().subtract(const Duration(days: 10)),
      mostUsedServices: const {
        'Esmaltação em Gel': 5,
        'Manicure Tradicional': 10,
      },
      serviceHistory: [
        ServiceHistoryItem(
          serviceName: 'Esmaltação em Gel',
          professionalName: 'Beatriz Batata', // Nail Designer
          date: DateTime.now().subtract(const Duration(days: 10)),
        ),
        ServiceHistoryItem(
          serviceName: 'Manicure Tradicional',
          professionalName: 'Eduarda Esmalte', // Manicure
          date: DateTime.now().subtract(const Duration(days: 25)),
        ),
      ],
    ),
    ClientInfo(
      user: UserMock.clients[1], // Gabriel Souza
      lastServiceName: 'Extensão de Cílios',
      lastServiceDate: DateTime.now().subtract(const Duration(days: 45)),
      mostUsedServices: const {
        'Extensão de Cílios': 2,
        'Lash Lifting': 3,
      },
      serviceHistory: [
        ServiceHistoryItem(
          serviceName: 'Extensão de Cílios',
          professionalName: 'Carla Cílios', // Lash Designer
          date: DateTime.now().subtract(const Duration(days: 45)),
        ),
        ServiceHistoryItem(
          serviceName: 'Lash Lifting',
          professionalName: 'Carla Cílios', // Lash Designer
          date: DateTime.now().subtract(const Duration(days: 90)),
        ),
      ],
    ),
    ClientInfo(
      user: UserMock.clients[2], // Heloisa Lima
      lastServiceName: 'Limpeza de Pele',
      lastServiceDate: DateTime.now().subtract(const Duration(days: 5)),
      mostUsedServices: const {
        'Limpeza de Pele': 8,
        'Drenagem Linfática': 4,
      },
      serviceHistory: [
        ServiceHistoryItem(
          serviceName: 'Limpeza de Pele',
          professionalName: 'Daniela Derme', // Esthetician
          date: DateTime.now().subtract(const Duration(days: 5)),
          notes: 'Pele sensível, usar produtos específicos.',
        ),
        ServiceHistoryItem(
          serviceName: 'Drenagem Linfática',
          professionalName: 'Daniela Derme', // Esthetician
          date: DateTime.now().subtract(const Duration(days: 20)),
        ),
      ],
    ),
    // Adding the rest of the clients without detailed history for simplicity
    ...UserMock.clients.skip(3).map(
          (user) => ClientInfo(
            user: user,
            lastServiceName: 'N/A',
            lastServiceDate: DateTime.now().subtract(const Duration(days: 100)),
            mostUsedServices: const {},
          ),
        ),
  ];
}
