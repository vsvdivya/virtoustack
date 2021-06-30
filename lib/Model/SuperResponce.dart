class SuperResponse<T>{

  String status;
  String message;
  String title;
  T data;

  SuperResponse({
    this.status,
    this.message,
    this.title,
    this.data
  });

  factory SuperResponse.fromJson(Map<String, dynamic> json, T t){
    return SuperResponse<T>(
        status: json['status'],
        message: json['message'],
        title: json['title'],
        data: t
    );
  }
  @override
  String toString() {
    return "status : $status \n message : $message \n data : $data";
  }
}