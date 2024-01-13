import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: "lib/env/.env")
abstract class Env {
  @EnviedField(varName: 'GAMESHIFT_API_KEY') //
  static const String GameshiftApiKey = _Env.GameshiftApiKey;
}