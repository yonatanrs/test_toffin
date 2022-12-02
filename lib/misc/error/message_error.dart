class MessageError extends Error {
  String title;
  String message;

  MessageError({
    required this.title,
    required this.message
  });
}