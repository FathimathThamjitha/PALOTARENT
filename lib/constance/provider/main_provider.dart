import 'dart:collection';
import 'dart:io';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:palota_rent_app/constance/call_functions.dart';
import '../../user/urdetails.dart';
import '../../user/welcome.dart';
import 'my_models.dart';


class MainProvider extends ChangeNotifier {
  String checkvalue = "";
  File? CarImages;
  File?BrandLogo;
  String imageUrl = "";
  File? ProfileImg;
  String Imagespr="";
  String LogoImg="";
  final FirebaseFirestore db = FirebaseFirestore.instance;
  firebase_storage.Reference ref = FirebaseStorage.instance.ref("Images");


  TextEditingController nameController = TextEditingController();
  TextEditingController CarNameController = TextEditingController();
  TextEditingController BrandNameController = TextEditingController();
  TextEditingController PriceController = TextEditingController();
  TextEditingController SeatsController = TextEditingController();
  TextEditingController BagsController = TextEditingController();
  TextEditingController TransmissionController = TextEditingController();
  TextEditingController CarBrandid = TextEditingController();
  TextEditingController KlmController =TextEditingController();

  List<BrandNames> NameList = [];
  List<CarDetails> DetailList = [];
  void addBrandname(String from, String bid) async {
    print("code heree111");

    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> map = HashMap();
    map["BRAND_NAME"] = nameController.text.toString();
    map["ADDED_BY"] = "";
    map["TIME"] = DateTime.now();
    if(from=="NEW") {
      map["BRAND_ID"] = id;
    }

    if ( BrandLogo!= null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();

      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(BrandLogo!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["BRAND_LOGO"] = value;
          // categorymap["id photo"] = photoId;
          //  editMap['IMAGE_URL'] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      map['BRAND_LOGO'] = LogoImg;
      // editMap['IMAGE_URL'] = imageUrl;
    }
    print("code heree222");


    if (from == "NEW") {
      db.collection("BRANDS").doc(id).set(map);

    } else {
      db.collection("BRANDS").doc(bid).update(map);
    }
    getBrandName();
    notifyListeners();
  }


  List<String> Carosuelimg = [
    "assets/car_audi.png",
    "assets/img_6.png",
    "assets/img_7.png",
    "assets/img_10.png"
  ];
  int indextab = 0;

  int Activeindex = 0;

  void activeIndex(int index) {
    Activeindex = index;
    notifyListeners();
  }

  void tabIndex(int value) {
    indextab = value;
    notifyListeners();
    print(indextab);
  }

  void getBrandName() {
    db.collection("BRANDS").get().then((value1) {
      if (value1.docs.isNotEmpty) {
        NameList.clear();
        for (var value in value1.docs) {
          NameList.add(BrandNames(
              value.id,
              value.get("BRAND_NAME").toString(),
              value.get("BRAND_LOGO").toString()
          ));

          notifyListeners();
        }
        notifyListeners();
      }
    });
  }

  void Clearfn() {
    nameController.clear();
    BrandLogo=null;
  }

  void editBrandName(String editid) {
    db.collection("BRANDS").doc(editid).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> map = value.data() as Map;
        nameController.text = map["BRAND_NAME"].toString();
        notifyListeners();
      }
    });
  }

  void DeleteBrandName(String bid, context) {
    db.collection("BRANDS").doc(bid).delete();
    ScaffoldMessenger.of(context).showSnackBar
      (SnackBar(content: Text("Delete"),
      backgroundColor: Color(0xff474E5B).withOpacity(0.40),),);
    getBrandName();
    notifyListeners();
  }
  List<BookingPlaces> BookingPlacelist=[];
  TextEditingController PlaceController= TextEditingController();
   void deleteBookingPlaces(String plcid, context){
  db.collection("BOOKING_PLACES").doc(plcid).delete();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Deleted"),
  backgroundColor: Color(0xff474E5B).withOpacity(0.40),));
  getBookingPlaces();
  notifyListeners();
}
  void addBookingPlaces(String from,String Plcid){
     print("hffhgfdhvhfd");
    String Id=DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> map = HashMap();
    map["PLACE"]=PlaceController.text.toString();
    map["PLACE_ID"]=Id;
    map["TIME"]=DateTime.now();


    if (from == "NEW") {
      db.collection("BOOKING_PLACES").doc(Id).set(map);
    } else {
      db.collection("BOOKING_PLACES").doc(Plcid).update(map);
    }

    getBookingPlaces();

    notifyListeners();

  }
  void editBookingPlace(String editplc){
 db.collection("BOOKING_PLACES").doc(editplc).get().then((value){
   if (value.exists){
     Map<dynamic, dynamic> map = value.data() as Map;
     PlaceController.text = map ["PLACE"].toString();
   }
 });
 notifyListeners();
  }
  void clearBookPlcfunction(){
     PlaceController.clear();
  }
  void getBookingPlaces(){
    db.collection("BOOKING_PLACES").get().then((value1){
      if (value1.docs.isNotEmpty){
        BookingPlacelist.clear();
        for (var value in value1.docs){
          BookingPlacelist.add(BookingPlaces(
            value.id,
            value.get("PLACE").toString()
          ));
          notifyListeners();
        }
      }
    }
    );
  }
  void addBrandDetails(String Brandname,String Brandid) async {
    DateTime dat = DateTime.now();
    String cid = dat.millisecondsSinceEpoch.toString();
    HashMap<String, Object> map = HashMap();
    map["CAR_NAME"] = CarNameController.text.toString();
    map["ADDED_BY"] = "";
    map["TIME"] = DateTime.now();
    map["BRAND_NAME"] = Brandname;
    map["PRICE"] = PriceController.text.toString();
    map["SEATS"] = SeatsController.text.toString();
    map["BAGS"] = BagsController.text.toString();
    map["TRANSMISSION"] = checkvalue;
    map["CAR_ID"] =cid;
    map["CAR_BRAND_ID"]=Brandid;
    map["KLM"] = KlmController.text.toString();


    if (CarImages != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();

      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(CarImages!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["PHOTO"] = value;
          // categorymap["id photo"] = photoId;
          //  editMap['IMAGE_URL'] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      map['PHOTO'] = imageUrl;
      // editMap['IMAGE_URL'] = imageUrl;
    }
    db.collection("CAR_DETAILS").doc(cid).set(map);
    getBrandDetails(Brandid);
    notifyListeners();
  }


  editCardetails(String carname,String klm,String carimage,String price,String Seats,String bags,String transmision){
    CarNameController.text = carname;
    KlmController.text =klm;
    imageUrl = carimage ;
    PriceController.text = price;
    SeatsController.text = Seats;
    BagsController.text = bags;
    checkvalue= transmision;

notifyListeners();

  }

  void setImage(File imagee) {
    CarImages = imagee;


    notifyListeners();
  }
  void ClearDetails() {
    CarNameController.clear();
    PriceController.clear();
    SeatsController.clear();
    BagsController.clear();
    KlmController.clear();

  }

///car
  Future getImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // setImage(File(pickedImage.path));
      cropImage(pickedImage.path);
      // print("hjkl"+pickedImage.path);
    } else {
      print('No image selected.');
    }
  }

  Future getImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      cropImage(pickedImage.path);
      // setImage(File(pickedImage.path));

    } else {
      print('No image selected.');
    }
  }

  Future<void> cropImage(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      CarImages = File(croppedFile.path);
      notifyListeners();
    }
    notifyListeners();
  }
  void editBrandDetails(){




  }
bool Getcar =false;
  void getBrandDetails(String carid) {
    Getcar=true;
    db.collection("CAR_DETAILS").where("CAR_BRAND_ID",isEqualTo: carid).get().then((value1) {
      if (value1.docs.isNotEmpty) {
        DetailList.clear();
        for (var value in value1.docs) {
          Getcar =false;
          DetailList.add(CarDetails(
            value.id,
            value.get("CAR_NAME").toString(),
            value.get("BRAND_NAME").toString(),
            value.get("PRICE").toString(),
            value.get("SEATS").toString(),
            value.get("BAGS").toString(),
            value.get("TRANSMISSION").toString(),
            value.get("KLM").toString(),
            value.get("PHOTO").toString()
          ));
          notifyListeners();
        }
      }
    });
  }
  TextEditingController PhoneRegcontoller=TextEditingController();
  TextEditingController nameRegcontroller=TextEditingController();
  List<NamePhn> NamePhnList = [];

bool loader=false;
  Future<void> addProfileDetails(BuildContext context,String id,from) async {
    loader=true;
    notifyListeners();
    String Id=DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String,Object> map=HashMap();
    map["NAME"]=nameRegcontroller.text;
    map["PHONE"]=PhoneRegcontoller.text;
    map["STATUS"]="REQUEST";

    if (ProfileImg != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(ProfileImg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["PHOTO"] = value;
          // categorymap["id photo"] = photoId;
          //  editMap['IMAGE_URL'] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      map['PHOTO'] = imageUrl;
      // editMap['IMAGE_URL'] = imageUrl;
    }
    if(from=="New") {
      db.collection("CUSTOMER").doc(Id).set(map);
      callNext(context, Welcome(uderId: "",));
      loader =false;
    }else
      {
        db.collection("CUSTOMER").doc(id).update(map);
        callNext(context, urdetails(userId: id,name: name,phone: phone,profilephoto: Profileimage,));
        getProfiledetails(id);
        loader =false;
        notifyListeners();
      }




    notifyListeners();
  }

  void setmg(File imagee) {
    ProfileImg = imagee;


    notifyListeners();
  }

  void editProfile(String editid) {
    db.collection("CUSTOMER").doc(editid).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> map = value.data() as Map;
        nameRegcontroller.text = map["NAME"].toString();
        imageUrl= map["PHOTO"].toString();
        notifyListeners();
      }
    });
  }

///registration
  Future getRegimagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // setImage(File(pickedImage.path));
      CropRegImage(pickedImage.path);
      // print("hjkl"+pickedImage.path);
    } else {
      print('No image selected.');
    }
  }

  Future getRegimagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      CropRegImage(pickedImage.path);
      // setImage(File(pickedImage.path));

    } else {
      print('No image selected.');
    }
  }

  Future<void> CropRegImage(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      ProfileImg = File(croppedFile.path);
      notifyListeners();
    }
    notifyListeners();
  }
void clearNamePhone(){
    nameRegcontroller.clear();
    PhoneRegcontoller.clear();
    ProfileImg=null;
    Imagespr="";


}

  void getProfilelist(){

    print("code heree");
    db.collection("CUSTOMER").where("STATUS",isEqualTo: "REQUEST").get().then((value2) {
      NamePhnList.clear();
      if (value2.docs.isNotEmpty) {
        for (var value in value2.docs) {
          NamePhnList.add(NamePhn(
            value.id,
              // value.get("USER_ID").toString(),
              value.get("NAME").toString(),
              value.get("PHONE").toString(),
              value.get("PHOTO").toString(),
          ));

          print(NamePhnList.length.toString()+"asdbjhs");
          notifyListeners();
        }
      }
    });
      }


      void acceptRequest(String id,String name,String phone){
        HashMap<String,Object> map=HashMap();
        map["STATUS"] ="ACCEPT";
        db.collection("CUSTOMER").doc(id).update(map);

        HashMap<String,Object> userMap=HashMap();
        userMap["NAME"] = name;
        userMap["PHONE"] = "+91"+phone;
        userMap["TYPE"] = "USER";
        userMap["USER_ID"] = id;
        db.collection("USERS").doc(id).set(userMap);

        getProfilelist();
      }
void declineRequest(id){
  HashMap<String,Object> map=HashMap();
  map["STATUS"] ="DECLINE";
  db.collection("CUSTOMER").doc(id).update(map);
  getProfilelist();
}

  void getUserInfo() {
    db.collection("CUSTOMER").where("STATUS", isEqualTo: "ACCEPT")
        .get()
        .then((value) {
   NamePhnList.clear();
      if (value.docs.isNotEmpty) {
        for (var elements in value.docs) {
          Map<String, dynamic> userinfomap = elements.data();
          NamePhnList.add(NamePhn(
            userinfomap["USER_ID"].toString(),
            userinfomap["NAME"].toString(),
            userinfomap["PHONE"].toString(),
            userinfomap["PHOTO"].toString(),
          ));
          notifyListeners();
        }
      }
      notifyListeners();
      });
    }
    String Id='';
    String name="";
  String phone="";
  String Profileimage='';
  void getProfiledetails(String id){

    db.collection("CUSTOMER").doc(id).get().then((value1) {
      if (value1.exists) {
        Id=value1.id;
       nameRegcontroller.text=value1.get("NAME").toString();
       PhoneRegcontoller.text=value1.get("PHONE").toString();
       imageUrl=value1.get("PHOTO").toString();


          notifyListeners();
      }
    });



  }

  void setBrandLogo(File imagee) {
    BrandLogo = imagee;


    notifyListeners();
  }
  // void ClearDetails() {
  //   CarNameController.clear();
  //   PriceController.clear();
  //   SeatsController.clear();
  //   BagsController.clear();
  //   KlmController.clear();
  //
  // }

  ///car
  Future getLogogallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // setImage(File(pickedImage.path));
      cropBrandLogo(pickedImage.path);
      // print("hjkl"+pickedImage.path);
    } else {
      print('No image selected.');
    }
  }

  Future getLogocamera() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      cropBrandLogo(pickedImage.path);
      // setImage(File(pickedImage.path));

    } else {
      print('No image selected.');
    }
  }

  Future<void> cropBrandLogo(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      BrandLogo = File(croppedFile.path);
      notifyListeners();
    }
    notifyListeners();
  }



  void getAllBrandDetails() {
    Getcar=true;
    db.collection("CAR_DETAILS").limit(5).get().then((value1) {
      if (value1.docs.isNotEmpty) {
        DetailList.clear();

        for (var value in value1.docs) {
          Getcar =false;
          DetailList.add(CarDetails(
              value.id,
              value.get("CAR_NAME").toString(),
              value.get("BRAND_NAME").toString(),
              value.get("PRICE").toString(),
              value.get("SEATS").toString(),
              value.get("BAGS").toString(),
              value.get("TRANSMISSION").toString(),
              value.get("KLM").toString(),
              value.get("PHOTO").toString()
          ));
          notifyListeners();
        }
        // print(DetailList[3].CarName+"ghhh");
      }

    });
  }




  // void LogoutNo(String editid) {
  //   db.collection("BRANDS").doc(editid).get().then((value) {
  //     if (value.exists) {
  //       Map<dynamic, dynamic> map = value.data() as Map;
  //       nameController.text = map["BRAND_NAME"].toString();
  //       notifyListeners();
  //     }
  //   });
  // }

  // void LogoutYes(String bid, context) {
  //   db.collection("BRANDS").doc(bid).delete();
  //   ScaffoldMessenger.of(context).showSnackBar
  //     (SnackBar(content: Text("Delete"),
  //     backgroundColor: Color(0xff474E5B).withOpacity(0.40),),);
  //   getBrandName();
  //   notifyListeners();
  // }



  void getAllCarDetailsSecond() {
    Getcar=true;
    db.collection("CAR_DETAILS").get().then((value1) {
      if (value1.docs.isNotEmpty) {
        DetailList.clear();

        for (var value in value1.docs) {
          Getcar =false;
          DetailList.add(CarDetails(
              value.id,
              value.get("CAR_NAME").toString(),
              value.get("BRAND_NAME").toString(),
              value.get("PRICE").toString(),
              value.get("SEATS").toString(),
              value.get("BAGS").toString(),
              value.get("TRANSMISSION").toString(),
              value.get("KLM").toString(),
              value.get("PHOTO").toString()
          ));
          notifyListeners();
        }
        // print(DetailList[3].CarName+"ghhh");
      }

    });
  }
///Pick Date........................................................
  // TimeOfDay _time = TimeOfDay.now();
  DateTime _date = DateTime.now();
  // DateTime scheduledTime = DateTime.now();
  DateTime scheduledDate = DateTime.now();
  String scheduledDayNode = "";
  var outputDateFormat = DateFormat('dd/MM/yyyy');
  // var outputTimeFormat = DateFormat('hh:mm a');
  TextEditingController dateController = TextEditingController();
  // TextEditingController timeController = TextEditingController();

  // Future<void> selectDateAndTime(BuildContext context) async {
  //
  //   await _selectDate(context);
  //   await _selectTime(context);
  // }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      _date = picked;
      scheduledDate = DateTime(_date.year, _date.month, _date.day);
      dateController.text = outputDateFormat.format(scheduledDate);

    }
    }

///Drop Date...........................................

  // TimeOfDay _time = TimeOfDay.now();
  DateTime _dropdate = DateTime.now();
  // DateTime scheduledTime = DateTime.now();
  DateTime scheduleddropDate = DateTime.now();
  String scheduleddropDayNode = "";
  var outputdropDateFormat = DateFormat('dd/MM/yyyy');
  // var outputTimeFormat = DateFormat('hh:mm a');
  TextEditingController dropdateController = TextEditingController();
  // TextEditingController timeController = TextEditingController();

  // Future<void> selectDateAndTime(BuildContext context) async {
  //
  //   await _selectDate(context);
  //   await _selectTime(context);
  // }

  Future<void> selectDropDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dropdate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      _dropdate = picked;
      scheduleddropDate = DateTime(_dropdate.year, _dropdate.month, _dropdate.day);
      dropdateController.text = outputdropDateFormat.format(scheduleddropDate);
    }
  }



  ///YOUR PROOF........................................
  File? YourProofimg;
  String imageproof="";

  void setYourProof(File imagee) {
    YourProofimg = imagee;


    notifyListeners();
  }
  // void ClearDetails() {
  //   CarNameController.clear();
  //   PriceController.clear();
  //   SeatsController.clear();
  //   BagsController.clear();
  //   KlmController.clear();
  //
  // }


  Future getyourProofgallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // setImage(File(pickedImage.path));
      cropYourProof(pickedImage.path);
      // print("hjkl"+pickedImage.path);
    } else {
      print('No image selected.');
    }
  }

  Future getYourProofcamera() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      cropYourProof(pickedImage.path);
      // setImage(File(pickedImage.path));

    } else {
      print('No image selected.');
    }
  }

  Future<void> cropYourProof(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ] :
      [CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      YourProofimg = File(croppedFile.path);
      notifyListeners();
    }
    notifyListeners();
  }

    }







