// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_details_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clientDetailsControllerHash() =>
    r'9fd5a9cc225aa68b999be237091b2b440edd108d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ClientDetailsController
    extends BuildlessAutoDisposeAsyncNotifier<ClientInfo> {
  late final String? clientId;
  late final ClientInfo? clientInfo;

  FutureOr<ClientInfo> build(
    String? clientId,
    ClientInfo? clientInfo,
  );
}

/// See also [ClientDetailsController].
@ProviderFor(ClientDetailsController)
const clientDetailsControllerProvider = ClientDetailsControllerFamily();

/// See also [ClientDetailsController].
class ClientDetailsControllerFamily extends Family<AsyncValue<ClientInfo>> {
  /// See also [ClientDetailsController].
  const ClientDetailsControllerFamily();

  /// See also [ClientDetailsController].
  ClientDetailsControllerProvider call(
    String? clientId,
    ClientInfo? clientInfo,
  ) {
    return ClientDetailsControllerProvider(
      clientId,
      clientInfo,
    );
  }

  @override
  ClientDetailsControllerProvider getProviderOverride(
    covariant ClientDetailsControllerProvider provider,
  ) {
    return call(
      provider.clientId,
      provider.clientInfo,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'clientDetailsControllerProvider';
}

/// See also [ClientDetailsController].
class ClientDetailsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ClientDetailsController,
        ClientInfo> {
  /// See also [ClientDetailsController].
  ClientDetailsControllerProvider(
    String? clientId,
    ClientInfo? clientInfo,
  ) : this._internal(
          () => ClientDetailsController()
            ..clientId = clientId
            ..clientInfo = clientInfo,
          from: clientDetailsControllerProvider,
          name: r'clientDetailsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$clientDetailsControllerHash,
          dependencies: ClientDetailsControllerFamily._dependencies,
          allTransitiveDependencies:
              ClientDetailsControllerFamily._allTransitiveDependencies,
          clientId: clientId,
          clientInfo: clientInfo,
        );

  ClientDetailsControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.clientId,
    required this.clientInfo,
  }) : super.internal();

  final String? clientId;
  final ClientInfo? clientInfo;

  @override
  FutureOr<ClientInfo> runNotifierBuild(
    covariant ClientDetailsController notifier,
  ) {
    return notifier.build(
      clientId,
      clientInfo,
    );
  }

  @override
  Override overrideWith(ClientDetailsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ClientDetailsControllerProvider._internal(
        () => create()
          ..clientId = clientId
          ..clientInfo = clientInfo,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        clientId: clientId,
        clientInfo: clientInfo,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ClientDetailsController, ClientInfo>
      createElement() {
    return _ClientDetailsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ClientDetailsControllerProvider &&
        other.clientId == clientId &&
        other.clientInfo == clientInfo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, clientId.hashCode);
    hash = _SystemHash.combine(hash, clientInfo.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ClientDetailsControllerRef
    on AutoDisposeAsyncNotifierProviderRef<ClientInfo> {
  /// The parameter `clientId` of this provider.
  String? get clientId;

  /// The parameter `clientInfo` of this provider.
  ClientInfo? get clientInfo;
}

class _ClientDetailsControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ClientDetailsController,
        ClientInfo> with ClientDetailsControllerRef {
  _ClientDetailsControllerProviderElement(super.provider);

  @override
  String? get clientId => (origin as ClientDetailsControllerProvider).clientId;
  @override
  ClientInfo? get clientInfo =>
      (origin as ClientDetailsControllerProvider).clientInfo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
