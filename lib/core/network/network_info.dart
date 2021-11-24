



import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}


class NetworkInfoImpl implements NetworkInfo{
  final DataConnectionChecker dataConn;
  NetworkInfoImpl(this.dataConn);
  @override
  // TODO: implement isConnected
  Future<bool> get isConnected => dataConn.hasConnection;
}