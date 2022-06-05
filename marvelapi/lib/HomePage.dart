import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marvelapi/Models/MOdelVIew.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<McuModel> McuMoviesList = [];


  @override
  void initState() {
    super.initState();
    getApi();
  }

  Widget buildnew( McuModel mcuModel) {
    return Scaffold(backgroundColor: Colors.black45,
        body: McuMoviesList.isNotEmpty
            ? GridView.builder(
                itemCount: McuMoviesList.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2/3,
                    mainAxisSpacing: 10,
                     crossAxisSpacing: 12.0),
                itemBuilder: (context, index) {
                  return ClipRRect(borderRadius: BorderRadius.circular(25),
                      child: McuMoviesList.isNotEmpty
                          ? CachedNetworkImage(
                            
                             imageUrl:
                                  McuMoviesList[index].coverUrl.toString())
                          : const Center(child: CircularProgressIndicator(color: Colors.yellow,)));
                },
              )
            : const SizedBox(
                width: 300,
                height: 400,
                child: Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.white10,
                )),
              ));
  }

  
}
