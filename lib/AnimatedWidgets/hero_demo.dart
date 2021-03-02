import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeroDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => HeroExpandedPage()));
          },
          child: Hero(
              transitionOnUserGestures: true,
              tag: "DemoTag",
              child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset("asset/hero.png"))),
        ),
        SizedBox(
          height: 8,
        ),
        Text("Click Me ↑️")
      ],
    );
  }
}

class HeroExpandedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey,
            width: double.infinity,
            height: 200,
            child: Hero(
                transitionOnUserGestures: true,
                tag: "DemoTag",
                child: Image.asset("asset/hero.png")),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                  "Sagittis nisl rhoncus mattis rhoncus urna neque viverra "
                  "justo nec. Mattis aliquam faucibus purus in. "
                  "Mauris vitae ultricies leo integer "
                  "malesuada nunc vel risus. Commodo "
                  "sed egestas egestas fringilla. Posuere morbi leo urna "
                  "molestie at elementum eu facilisis sed. Suspendisse sed"
                  " nisi lacus sed viverra tellus in hac habitasse. "
                  "Nunc eget lorem dolor sed viverra ipsum. Elit scelerisque "
                  "mauris pellentesque pulvinar pellentesque. "
                  "Orci a scelerisque purus semper eget duis. "
                  "Eu sem integer vitae justo. "
                  "Est placerat in egestas erat imperdiet sed. "
                  "Sed adipiscing diam donec adipiscing tristique risus "
                  "nec feugiat in. Lacus vestibulum sed arcu non odio "
                  "euismod lacinia. Nunc mi ipsum faucibus vitae "
                  "aliquet nec ullamcorper sit. Ac tortor vitae purus "
                  "faucibus ornare suspendisse sed nisi lacus. Porta lorem "
                  "mollis aliquam ut porttitor leo a diam sollicitudin. "
                  "Viverra justo nec ultrices dui sapien eget mi. Nulla "
                  "posuere sollicitudin aliquam ultrices sagittis orci. "
                  "Sit amet facilisis magna etiam tempor orci. "
                  "Diam in arcu cursus euismod quis viverra nibh."
                  "Sagittis nisl rhoncus mattis rhoncus urna neque viverra "
                  "justo nec. Mattis aliquam faucibus purus in. "
                  "Mauris vitae ultricies leo integer "
                  "malesuada nunc vel risus. Commodo "
                  "sed egestas egestas fringilla. Posuere morbi leo urna "
                  "molestie at elementum eu facilisis sed. Suspendisse sed"
                  " nisi lacus sed viverra tellus in hac habitasse. "
                  "Nunc eget lorem dolor sed viverra ipsum. Elit scelerisque "
                  "mauris pellentesque pulvinar pellentesque. "
                  "Orci a scelerisque purus semper eget duis. "
                  "Eu sem integer vitae justo. "
                  "Est placerat in egestas erat imperdiet sed. "
                  "Sed adipiscing diam donec adipiscing tristique risus "
                  "nec feugiat in. Lacus vestibulum sed arcu non odio "
                  "euismod lacinia. Nunc mi ipsum faucibus vitae "
                  "aliquet nec ullamcorper sit. Ac tortor vitae purus "
                  "faucibus ornare suspendisse sed nisi lacus. Porta lorem "
                  "mollis aliquam ut porttitor leo a diam sollicitudin. "
                  "Viverra justo nec ultrices dui sapien eget mi. Nulla "
                  "posuere sollicitudin aliquam ultrices sagittis orci. "
                  "Sit amet facilisis magna etiam tempor orci. "
                  "Diam in arcu cursus euismod quis viverra nibh."),
            ),
          )
        ],
      ),
    );
  }
}
