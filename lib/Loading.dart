import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

enum LoadingStatus {
  loading,
  completed,
  searching
}

class LoadingConst{
 static loadingAlert(BuildContext context){
    return Material(
      color: Theme.of(context).accentColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width * 0.5,
                padding: new EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
                decoration: new BoxDecoration(
                    color: Colors.black38,
                    borderRadius: new BorderRadius.all(new Radius.circular(12))
                ),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                    Center(child: SpinKitFoldingCube(
                      color: Colors.white,
                      size: 30,
                    ),),
                    new SizedBox(height: 10.0,),
                    new Text("Loading...",style: new TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 12),),

                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}