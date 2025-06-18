// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_details_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$employeeDetailsControllerHash() =>
    r'3ed249406b26d1303f7df1b1311c3ec3e357dd4c';

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

abstract class _$EmployeeDetailsController
    extends BuildlessAutoDisposeAsyncNotifier<EmployeeDetailsInitialState> {
  late final User? employee;
  late final int? employeeId;

  FutureOr<EmployeeDetailsInitialState> build({
    User? employee,
    int? employeeId,
  });
}

/// See also [EmployeeDetailsController].
@ProviderFor(EmployeeDetailsController)
const employeeDetailsControllerProvider = EmployeeDetailsControllerFamily();

/// See also [EmployeeDetailsController].
class EmployeeDetailsControllerFamily
    extends Family<AsyncValue<EmployeeDetailsInitialState>> {
  /// See also [EmployeeDetailsController].
  const EmployeeDetailsControllerFamily();

  /// See also [EmployeeDetailsController].
  EmployeeDetailsControllerProvider call({
    User? employee,
    int? employeeId,
  }) {
    return EmployeeDetailsControllerProvider(
      employee: employee,
      employeeId: employeeId,
    );
  }

  @override
  EmployeeDetailsControllerProvider getProviderOverride(
    covariant EmployeeDetailsControllerProvider provider,
  ) {
    return call(
      employee: provider.employee,
      employeeId: provider.employeeId,
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
  String? get name => r'employeeDetailsControllerProvider';
}

/// See also [EmployeeDetailsController].
class EmployeeDetailsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<EmployeeDetailsController,
        EmployeeDetailsInitialState> {
  /// See also [EmployeeDetailsController].
  EmployeeDetailsControllerProvider({
    User? employee,
    int? employeeId,
  }) : this._internal(
          () => EmployeeDetailsController()
            ..employee = employee
            ..employeeId = employeeId,
          from: employeeDetailsControllerProvider,
          name: r'employeeDetailsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$employeeDetailsControllerHash,
          dependencies: EmployeeDetailsControllerFamily._dependencies,
          allTransitiveDependencies:
              EmployeeDetailsControllerFamily._allTransitiveDependencies,
          employee: employee,
          employeeId: employeeId,
        );

  EmployeeDetailsControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.employee,
    required this.employeeId,
  }) : super.internal();

  final User? employee;
  final int? employeeId;

  @override
  FutureOr<EmployeeDetailsInitialState> runNotifierBuild(
    covariant EmployeeDetailsController notifier,
  ) {
    return notifier.build(
      employee: employee,
      employeeId: employeeId,
    );
  }

  @override
  Override overrideWith(EmployeeDetailsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: EmployeeDetailsControllerProvider._internal(
        () => create()
          ..employee = employee
          ..employeeId = employeeId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        employee: employee,
        employeeId: employeeId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<EmployeeDetailsController,
      EmployeeDetailsInitialState> createElement() {
    return _EmployeeDetailsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EmployeeDetailsControllerProvider &&
        other.employee == employee &&
        other.employeeId == employeeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, employee.hashCode);
    hash = _SystemHash.combine(hash, employeeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin EmployeeDetailsControllerRef
    on AutoDisposeAsyncNotifierProviderRef<EmployeeDetailsInitialState> {
  /// The parameter `employee` of this provider.
  User? get employee;

  /// The parameter `employeeId` of this provider.
  int? get employeeId;
}

class _EmployeeDetailsControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<EmployeeDetailsController,
        EmployeeDetailsInitialState> with EmployeeDetailsControllerRef {
  _EmployeeDetailsControllerProviderElement(super.provider);

  @override
  User? get employee => (origin as EmployeeDetailsControllerProvider).employee;
  @override
  int? get employeeId =>
      (origin as EmployeeDetailsControllerProvider).employeeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
