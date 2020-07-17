import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:higgletaskapp/ListviewModel.dart';
import 'package:higgletaskapp/Loading.dart';
import 'package:higgletaskapp/UserModel.dart';
import 'package:higgletaskapp/UsersLIstViewModel.dart';
import 'package:stacked/stacked.dart';

class ListViewAPI extends StatefulWidget {
  @override
  _ListViewAPIState createState() => _ListViewAPIState();
}

class _ListViewAPIState extends State<ListViewAPI> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: model.loadingStatus == LoadingStatus.loading?LoadingConst.loadingAlert(context):SafeArea(
          bottom: false,
          child: new ListView.builder(
            itemCount:10,
            itemBuilder: (context,int index){
            UsersListViewModel currentItem = model.usersList[index];
              return Padding(
                padding:  EdgeInsets.only(top:10,bottom:10,left: 5.0,right: 5.0),
                child: Parent(
                  style: ParentStyle()..elevation(currentItem.isSelected? 8:3)..borderRadius(all: 4.0)..scale(currentItem.isSelected ? 0.98 : 1.0)..animate(300, Curves.easeInOut),
                  child: GestureDetector(
                    onTap: (){
                      print("Selection:${model.selectionMode}");
                      if(model.selectionMode){
                        currentItem.isSelected?model.unSelect(index):model.select(index);
                        bool isLast = false;
                        for(int i =0;i<model.usersList.length;i++){
                          if(model.usersList[i].isSelected){
                            isLast = false;
                            break;
                          }
                          else{
                            isLast = true;
                          }
                        }
                        if(isLast){
                          model.selectionMode = false;
                        }


                      }
                      else{

                      }
                    },
                    onLongPress: (){
                      if(!model.selectionMode){
                        model.selectionMode = true;
                        model.select(index);
                      }
                      else{
                        model.clearSelection();
                        model.selectionMode = false;
                      }
                    },
                    child: new Container(
                      padding: new EdgeInsets.only(top: 7,bottom: 7),
                      decoration: new BoxDecoration(
                        color: currentItem.isSelected?Colors.blue:Colors.white,
                        borderRadius: new BorderRadius.all(new Radius.circular(4.0))
                      ),
                    child: new Row(
                      children: [
                        new SizedBox(width: 15.0,),
                        Container(
                          height: 80,
                          width: 80,
                          decoration: new BoxDecoration(
                              image: DecorationImage(image: NetworkImage(currentItem.avatar)),
                              shape: BoxShape.circle
                          ),
                        ),
                        new SizedBox(width: 20,),
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            new Text("${currentItem.firstName} ${currentItem.lastName}",style: GoogleFonts.jura(fontWeight: FontWeight.w700,color:currentItem.isSelected?Colors.white:Colors.black ),),
                            new Text("${currentItem.email}",style: GoogleFonts.jua(fontWeight: FontWeight.w100,color:currentItem.isSelected?Colors.white:Colors.black )),
                          ],
                        ),

                      ],
                    ),
            ),
                  ),
                ),
              );
          }),
        ),
      ) ,
      viewModelBuilder: () => ListViewModel(),

    );
  }
}
