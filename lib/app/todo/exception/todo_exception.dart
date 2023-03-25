class TodoException extends Error {
  String message;
  @override
  StackTrace? stackTrace;

  TodoException(this.message, [this.stackTrace]);
}

class TodoFetchException extends TodoException {
  TodoFetchException(super.message);
}
