import 'package:core/di/dependency.dart';
import 'package:video/di/dependency.dart';

class Injections {
  void init() {
    // Shared modules
    RegisterCoreModule();

    // Feature modules
    RegisterVideoModule();
  }
}
