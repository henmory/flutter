void main() {
  Future.wait([
    Future.delayed(new Duration(seconds: 2), () {
      return "hello";
    }),
    Future.delayed(new Duration(seconds: 2), () {
      return "world";
    })

  ]).then((data) {
    print(data);
  }, onError: (data) => print(data));

  Future<String> login(String usrName, String passWord) {
    return Future<String>(() {
      return "change";
    });
  }
}

