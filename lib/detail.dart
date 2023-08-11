import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detail',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "My App",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple[300],
        ),
        body: Center(
          child: boxContainer(
              'box1',
              Alignment.bottomRight,
              const EdgeInsets.only(right: 10),
              const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.normal)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.chevron_left_rounded,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Container boxContainer(
      String name, Alignment alignment, EdgeInsets edgeInsets, TextStyle a,
      [bool isRadiusBox = false]) {
    return Container(
      alignment: alignment,
      height: 150,
      width: 150,
      padding: edgeInsets,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isRadiusBox ? 100 : 0),
        color: Colors.blue[300],
      ),
      child: Text(
        name,
        style: a,
      ),
    );
  }
}
