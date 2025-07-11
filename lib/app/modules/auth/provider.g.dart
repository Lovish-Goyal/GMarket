// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userStateHash() => r'7ddbeda8483cd1b5b548d2e9748b5599be379916';

/// See also [UserState].
@ProviderFor(UserState)
final userStateProvider = NotifierProvider<UserState, UserModel?>.internal(
  UserState.new,
  name: r'userStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserState = Notifier<UserModel?>;
String _$adminHash() => r'ed7ec72ed6bd96b8dc528c54258cade80abc616c';

/// See also [Admin].
@ProviderFor(Admin)
final adminProvider = NotifierProvider<Admin, bool>.internal(
  Admin.new,
  name: r'adminProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$adminHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Admin = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
