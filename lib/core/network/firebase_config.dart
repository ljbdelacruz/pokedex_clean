




import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseServiceNetwork{
  FirebaseUtilModel _firebaseUtil;
  FirebaseServiceNetwork(){
    this.fetchRemoteConfig();
  }
  fetchRemoteConfig(){
    RemoteConfig.instance.then((instance){
      if(instance.getString("ConfigKey").length > 0){
        Map<String, dynamic> jsonConfig = jsonDecode(instance.getString("ConfigKey"));
        _firebaseUtil = FirebaseUtilModel.toMap(jsonConfig);
      }
    });
  }
  FirebaseUtilModel getFirebaseUtil(){
    return this._firebaseUtil;
  }

}



class FirebaseUtilModel{
  FirebaseUrl url;
  FirebaseConfigurations config;
  FirebaseUtilModel({this.url, this.config});
  factory FirebaseUtilModel.toMap(dynamic map){
     return FirebaseUtilModel(url:FirebaseUrl.toMap(map), config: FirebaseConfigurations.toMap(map));
  }
}


class FirebaseUrl{
  String easyPayUrl;
  String apiUrl;
  String portalApiUrl;
  String notifApiUrl;
  String rewardsAPIURL;
  String rewardService;
  String userService;
  String iamservice;
  String bpiUrl;
  String adsManagerUrl;
  String lucky8Api;
  String govApi;
  FirebaseUrl({this.easyPayUrl, this.apiUrl, this.portalApiUrl, this.notifApiUrl, this.rewardsAPIURL, this.rewardService, this.userService, this.iamservice, this.bpiUrl, this.adsManagerUrl, this.lucky8Api, this.govApi});

  factory FirebaseUrl.toMap(dynamic map){
    return FirebaseUrl(
      easyPayUrl: map["easyPayUrl"] ?? "",
      apiUrl: map["apiUrl"] ?? "",
      portalApiUrl: map["portalApiUrl"] ?? "",
      notifApiUrl: map["notifApiUrl"] ?? "",
      rewardsAPIURL: map["rewardsAPIURL"] ?? "",
      rewardService: map["rewardService"] ?? "",
      userService: map["userService"] ?? "",
      iamservice: map["iamservice"] ?? "",
      bpiUrl: map["bpiUrl"] ?? "",
      adsManagerUrl: map["adsManagerUrl"] ?? "",
      lucky8Api: map["lucky8Api"] ?? "",
      govApi: map["govApi"] ?? ""
    );
  }


}

class FirebaseConfigurations{
  String companyId;
  String merchantAppUpdate;
  String merchantDownloadUrl;

  bool isServerMaintenance;
  String userVersion;
  List<String> versionUpdate;
  FirebaseBPICreds bpiCredentials;

  FirebaseConfigurations({this.companyId, this.merchantAppUpdate, this.merchantDownloadUrl, this.isServerMaintenance, this.userVersion, this.versionUpdate, this.bpiCredentials});
  factory FirebaseConfigurations.toMap(dynamic map){
    return FirebaseConfigurations(
      companyId: map["companyId"] ?? "",
      merchantAppUpdate: map["merchantAppUpdate"] ?? "",
      merchantDownloadUrl: map["merchantUrl"] ?? "",
      isServerMaintenance: map["isServerMaintenance"] ?? false,
      userVersion: map["userVersion"] ?? "",
      versionUpdate: map["versionUpdate"] ?? [],
      bpiCredentials: FirebaseBPICreds.toMap(map["bpiCredentials"])
    );
  }

}

class FirebaseBPICreds{
  String clientId;
  String clientSecret;
  String webview;
  FirebaseBPICreds({this.clientId="", this.clientSecret="", this.webview=""});

  factory FirebaseBPICreds.toMap(dynamic map){
    return FirebaseBPICreds(
      clientId:map["client_map"] ?? "",
      clientSecret: map["client_secret"] ?? "",
      webview: map["webview"] ?? ""
    );
  }


}