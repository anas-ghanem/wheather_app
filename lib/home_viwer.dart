import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/cubit/get_wheather_cubit.dart';
import 'package:wheather_app/cubit/wheather_status.dart';
import 'package:wheather_app/main.dart';
import 'package:wheather_app/nothing_widget.dart';
import 'package:wheather_app/search_view.dart';
import 'package:wheather_app/wheatherinfo.dart';

class HOME_viewr extends StatelessWidget {
  const HOME_viewr({super.key});
   


  @override
  
  Widget build(BuildContext context) {
      var themeColor = getWeatherColor(
            BlocProvider.of<GetWheatherCubit>(
              context,
            ).wheatherModel?.wheathercondition,
          );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text("weather app",style: TextStyle(fontSize: 25),),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetWheatherCubit, wheather_status>(
        builder: (context, state) {
          if (state is nowheather) {
            return NothingWidget();
          } else if (state is wheather_data) {
            return Wheatherinfo(wheather: state.wheatherModel,);
          } else {
            return Text("error");
            ;
          }
        },
      ),
    );
  }
}
