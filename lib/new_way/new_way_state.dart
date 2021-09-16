abstract class NewWayState {}

abstract class Success implements NewWayState {}

abstract class Error implements NewWayState {}

class Idle implements NewWayState {}

class Loading implements NewWayState {}

class DataSuccess implements Success {}

class GenericError implements Error {}

