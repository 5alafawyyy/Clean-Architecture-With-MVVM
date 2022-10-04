// ignore_for_file: public_member_api_docs, sort_constructors_first
class Failure {
  int code; // 200, 201, 400, 303 ..500 and so on
  String message; // Error , Success

  Failure(
    this.code,
    this.message,
  );
}
