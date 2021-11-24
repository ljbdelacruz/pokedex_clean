


import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  Failure([List properties = const<dynamic>[]]):super([properties]);
}



///
///
///Exceptions for failure object
///
class ServerFailure extends Failure{

}
class MappingFailure extends Failure{

}
class CacheFailure extends Failure{
}
class CacheFetchingFailure extends Failure{
}

class ValidationFailure extends Failure{
  
}
class NoInternetFailure extends Failure{}

class BadGatewayFailure extends Failure{}

class UnauthorizedFailure extends Failure{}

class RepositoryFailure extends Failure{}

class NotRegisteredYetFailure extends Failure{}

class UsecaseFailure extends Failure{}

class LocalDSFailure extends Failure{}