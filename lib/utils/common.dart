import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utils_widget/utils_widget.dart';
export 'appwrite_auth.dart';

/// Provider Observer for debugging
class ProviderLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger.v('''
{
  "provider": "${provider.name ?? ""}, ${provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    logger.v("Dispose: ${provider.name ?? ""}, ${provider.runtimeType}");
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    logger.e(
      "Error: ${provider.name ?? ""}, ${provider.runtimeType}",
      error.toString(),
      stackTrace,
    );
  }
}
