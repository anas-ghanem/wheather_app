import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/cubit/get_wheather_cubit.dart';
import 'package:wheather_app/model/wheather_model.dart';
import 'package:wheather_app/wheather_survace.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("search a city")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
             var getwheathercubit= BlocProvider.of<GetWheatherCubit>(context);
             getwheathercubit.getwheather(cityname: "$value");
              
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              labelText: "search",
              hintText: "enter the city",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.yellow),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

