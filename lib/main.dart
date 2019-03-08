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
      return "fadfa";
    });
  }

  Future<String> getUsrInformation(String id) {
    return Future<String>(() {
      return "infroation";
    });
  }

  Future<bool> saveInformation(String information) {
    return Future<bool>(() {
      print("ok");
    });
  }


  login("afda", "afda").then((id) {
    getUsrInformation(id).then((information) {
      saveInformation(information).then((data){
        print(data);
      });
    });
  });

  login("daf","daafa").then((id){
    return getUsrInformation(id);
  }).then((information){
    return saveInformation(information);
  }).then((ret){
    print(ret);
  }).catchError((onError){
    print(onError);
  });


  task() async{
    try{
      String id = await login("af", "afa");
      String information = await getUsrInformation(id);
      bool ret = await saveInformation(information);

    }catch(e){
      print(e);
    }
  }
}

