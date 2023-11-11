import 'package:homme/domain/config/network_config.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: INetworkConfig)
class NetworkConfig implements INetworkConfig {
  @override
  String get baseUrl => 'https://api.spaceflightnewsapi.net/';

  @override
  Map<String, String> get headers => {'Content-Type': 'application/json'};
}
