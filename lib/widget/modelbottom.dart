import 'package:flutter/material.dart';

class modelBottom extends StatelessWidget {
  modelBottom({Key? key, required this.addTask}) : super(key: key);
  String name = "";
  final Function addTask;
  @override
  Widget build(BuildContext buildContext) {
    return Padding(
      padding: MediaQuery.of(buildContext).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextField(
            onSubmitted: (value) {
              addTask(name);
              Navigator.pop(buildContext);
            },
            onChanged: (value) {
              name = value;
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: "Your name..."),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))))),
                onPressed: () {
                  addTask(name);
                  Navigator.pop(buildContext);
                },
                child: const Text("Add Name")),
          )
        ]),
      ),
    );
  }
}
