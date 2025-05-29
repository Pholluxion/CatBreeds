import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionCheck {
  final Connectivity _connectivity;
  ConnectionCheck(this._connectivity);
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged;
}
