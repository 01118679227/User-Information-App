class MyData {
  String previous;
  String next;
  List<Result> result;

  MyData.fromJson(Map<String, dynamic> json) {
    previous = json['previous'];
    next = json['next'];
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
  }
}

class Result {
  String firstName;
  String lastName;
  String email;
  String phone;
  bool verified;

  Result.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    verified = json['verified'];
  }
}