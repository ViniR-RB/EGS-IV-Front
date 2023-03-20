class TodoException extends Error {
  String message;
  StackTrace? stackTrace;

  TodoException(this.message, [this.stackTrace]);
}

class TodoFetchException extends TodoException {
  TodoFetchException(super.message);
}
