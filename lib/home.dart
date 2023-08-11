import 'package:bottomtabbar/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'widget/boxcontainer.dart';
import 'widget/modelbottom.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Map<String, dynamic>> listItem = [];

  // bool _isLoading = true;
  // This function is used to fetch all data from the database
  // void getData() async {
  //   final data = await SQLHelper.getListItems();
  //   setState(() {
  //     listItem = data;
  //     _isLoading = false;
  //   });
  // }

  List items = [];
  int idexRemove = -1;
  String name = "";
  SampleItem? selectedMenu;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idexRemove = -1;
    name = "";
    items = List<String>.generate(20, (i) => 'Item ${i + 1}');
    // getData();
  }

  // final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
  //     GlobalKey<ScaffoldMessengerState>();

  // void showCustomSnackBar() {
  //   _scaffoldMessengerKey.currentState?.showSnackBar(
  //     SnackBar(
  //       content: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           const Text('Custom Snackbar'),
  //           IconButton(
  //             icon: const Icon(Icons.close),
  //             onPressed: () {
  //               _scaffoldMessengerKey.currentState
  //                   ?.hideCurrentSnackBar(); // Đóng snackbar
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  handleDelete(index) {
    setState(() {
      items.removeAt(index);
      idexRemove = index;
    });
  }

  handleAdd(value) {
    setState(() {
      items.add(value);
    });
  }

  handleBackItem(value) {
    setState(() {
      items.insert(idexRemove, value);
    });
  }

  // final List<String> listTitle = [
  //   "hello",
  //   "main",
  //   "final",
  //   "dog",
  //   "cat",
  //   "fish",
  //   "home",
  //   "page",
  //   "school"
  // ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "My App",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.deepPurple[300],
            bottom: const TabBar(tabs: <Widget>[
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.hearing_sharp))
            ]),
          ),
          body: TabBarView(children: <Widget>[
            Stack(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      boxContainer(
                          'box1',
                          Alignment.bottomRight,
                          const EdgeInsets.only(right: 10),
                          const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                      boxContainer(
                          'box2',
                          Alignment.bottomLeft,
                          const EdgeInsets.only(left: 10),
                          const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      boxContainer(
                          'box1',
                          Alignment.topRight,
                          const EdgeInsets.only(right: 10),
                          const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                      boxContainer(
                          'box2',
                          Alignment.topLeft,
                          const EdgeInsets.only(left: 10),
                          const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                    ],
                  ),
                ],
              ),
              Center(
                child: boxContainer(
                    'Start',
                    Alignment.center,
                    const EdgeInsets.only(left: 0),
                    const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    true),
              ),
            ]),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.blue,
                              // Border radius
                              child: Container(
                                padding:
                                    const EdgeInsets.all(2), // Border width
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color.fromRGBO(110, 214, 235, 1),
                                      Color.fromRGBO(39, 94, 174, 1),
                                    ],
                                  ),
                                ),
                                child: ClipOval(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(
                                        10), // Image radius
                                    child: Image.network(
                                        'data:image/jpeg;base64,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',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              )),
                          Container(
                            padding: const EdgeInsets.only(left: 8),
                            child: const Text(
                              "Name",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      Row(children: [
                        PopupMenuButton<SampleItem>(
                          padding: const EdgeInsets.only(
                              left: 1, right: 1, top: 1, bottom: 1),
                          color: Colors.blueGrey[200],
                          offset: const Offset(0, 20),
                          shadowColor: Colors.grey,
                          elevation: 10,
                          icon: const Icon(Icons.filter_alt),
                          initialValue: selectedMenu,
                          // Callback that sets the selected popup menu item.
                          onSelected: (SampleItem item) {
                            // setState(() {
                            //   selectedMenu = item;
                            //   print(selectedMenu);
                            // });
                            switch (item) {
                              case SampleItem.itemOne:
                                showModalBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20))),
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return modelBottom(addTask: handleAdd);
                                    });
                                break;
                              case SampleItem.itemThree:
                                break;
                              case SampleItem.itemTwo:
                                break;
                              default:
                                break;
                            }
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<SampleItem>>[
                            const PopupMenuItem<SampleItem>(
                              value: SampleItem.itemOne,
                              child: Center(
                                child: Text('Day'),
                              ),
                            ),
                            const PopupMenuItem<SampleItem>(
                              value: SampleItem.itemTwo,
                              child: Center(
                                child: Text('name'),
                              ),
                            ),
                            const PopupMenuDivider(),
                            const PopupMenuItem<SampleItem>(
                              value: SampleItem.itemThree,
                              child: Center(
                                child: Text('Log Out'),
                              ),
                            ),
                          ],
                        ),
                      ])
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: MediaQuery.of(context).size.height - 300,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.red,
                    width: 5,
                  )),
                  child: Card(
                    color: Colors.white,
                    child: SlidableAutoCloseBehavior(
                      closeWhenOpened: true,
                      closeWhenTapped: true,
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return Slidable(
                              key: Key(item),
                              endActionPane: ActionPane(
                                dismissible: DismissiblePane(
                                  onDismissed: () {
                                    handleDelete(index);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            content: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Deleted item $item'),
                                        IconButton(
                                          icon: const Icon(Icons
                                              .settings_backup_restore_rounded),
                                          color: Colors.white,
                                          iconSize: 25,
                                          onPressed: () {
                                            handleBackItem(item);
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        'Back item $item')));
                                          },
                                        ), // Icon button
                                      ],
                                    )));
                                  },
                                ),
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    // An action can be bigger than the others.
                                    flex: 3,
                                    onPressed: (context) => {},
                                    backgroundColor: const Color(0xFF7BC043),
                                    foregroundColor: Colors.white,
                                    icon: Icons.save,
                                    label: 'Save',
                                  ),
                                  SlidableAction(
                                    flex: 2,
                                    onPressed: (context2) => {
                                      showDialog<String>(
                                        context: context2,
                                        builder: (BuildContext context1) =>
                                            AlertDialog(
                                          title: const Text(
                                              'Are you sure Delete?'),
                                          // content: const Text('AlertDialog description'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  context1, 'Cancel'),
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context1, 'OK');
                                                handleDelete(index);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('Deleted item $item'),
                                                    IconButton(
                                                      icon: const Icon(Icons
                                                          .settings_backup_restore_rounded),
                                                      color: Colors.white,
                                                      iconSize: 25,
                                                      onPressed: () {
                                                        handleBackItem(item);
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .hideCurrentSnackBar();
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(SnackBar(
                                                                content: Text(
                                                                    'Back item $item')));
                                                      },
                                                    ), // Icon button
                                                  ],
                                                )));
                                              },
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    },
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: Builder(
                                builder: (context) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DetailPage()),
                                    );
                                  },
                                  child: ListTile(
                                    title: Text(items[index]),
                                    tileColor: (index % 2 == 0)
                                        ? Colors.amber
                                        : Colors.blue,
                                    // onTap: () {
                                    //   final slidable = Slidable.of(context);
                                    //   final isClosed = slidable?.actionPaneType.value ==
                                    //       ActionPaneType.none;
                                    //   if (isClosed) {
                                    //     slidable?.openStartActionPane();
                                    //   } else {
                                    //     slidable?.close();
                                    //   }
                                    // },
                                  ),
                                ),
                              ));
                        },
                        // separatorBuilder: (context, index) => const Divider(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/detail');
            },
            child: const Icon(
              Icons.chevron_right_rounded,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
