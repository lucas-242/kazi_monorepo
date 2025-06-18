import 'package:kazi_companies/presenter/clients/models/client_info.dart';

sealed class ClientDetailsState {
  const ClientDetailsState({required this.clientInfo, this.isEditing = false});

  final ClientInfo clientInfo;
  final bool isEditing;

  ClientDetailsState copyWith({
    ClientInfo? clientInfo,
    bool? isEditing,
  });
}

final class ClientDetailsInitial extends ClientDetailsState {
  const ClientDetailsInitial({
    required super.clientInfo,
    super.isEditing,
  });

  @override
  ClientDetailsInitial copyWith({
    ClientInfo? clientInfo,
    bool? isEditing,
  }) =>
      ClientDetailsInitial(
        clientInfo: clientInfo ?? this.clientInfo,
        isEditing: isEditing ?? this.isEditing,
      );
}

final class ClientDetailsLoading extends ClientDetailsState {
  const ClientDetailsLoading({
    required super.clientInfo,
    super.isEditing,
  });

  @override
  ClientDetailsLoading copyWith({
    ClientInfo? clientInfo,
    bool? isEditing,
  }) =>
      ClientDetailsLoading(
        clientInfo: clientInfo ?? this.clientInfo,
        isEditing: isEditing ?? this.isEditing,
      );
}

final class ClientDetailsError extends ClientDetailsState {
  const ClientDetailsError({
    required super.clientInfo,
    super.isEditing,
  });

  @override
  ClientDetailsError copyWith({
    ClientInfo? clientInfo,
    bool? isEditing,
  }) =>
      ClientDetailsError(
        clientInfo: clientInfo ?? this.clientInfo,
        isEditing: isEditing ?? this.isEditing,
      );
}
