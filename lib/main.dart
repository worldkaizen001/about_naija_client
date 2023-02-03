import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();

}



class _HomePageState extends State<HomePage> {

   ScrollController  _scrollController = ScrollController();


  @override
  void initState(){
    super.initState();
    _scrollController = ScrollController();
  }

  bool hideAppbar = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: const Text('Scroll Notification'),
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification){
          if(notification.direction == ScrollDirection.forward){
            setState(() {
              hideAppbar = false;
            });
          }
         if(notification.direction == ScrollDirection.reverse){
           setState(() {
             hideAppbar = true;
           });
         }

          return true;
        },

        child: ListView.builder(
          controller: _scrollController,
          itemCount: 200,
            itemBuilder: (context, index){
          return ListTile(title: Text('item $index'));
        }),
      ),
      floatingActionButton: hideAppbar? FloatingActionButton(
        onPressed: (){
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ): null, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
