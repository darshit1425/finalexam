import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Modaldeta/Modal.dart';

class Home1 extends StatefulWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  TextEditingController txt_name = TextEditingController();
  TextEditingController txt_number = TextEditingController();

  List<Modalclass> call = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          actions: [
            Icon(Icons.menu, color: Colors.black),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "MY CONTACT",
                  style: TextStyle(color: Colors.grey.shade500),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  height: 35,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "type name of number                                                                              🔍",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "A",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey.shade400,
                width: double.infinity,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.add),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              // Positioned(child: )

              ElevatedButton(
                onPressed: () async {
                  await launchUrl(Uri.parse("tel: 7861019675"));
                },
                child: const Text("Call"),
              ),
              ElevatedButton(
                onPressed: () async {
                  await launchUrl(Uri.parse("sms: 7046632533?body=Hello hii"));
                },
                child: const Text("SMS"),
              ),

              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Enter your contacts"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: txt_name,
                                decoration: InputDecoration(
                                    hintText: 'Enter your name'),
                              ),
                              TextField(
                                controller: txt_number,
                                decoration: InputDecoration(
                                    hintText: 'Enter your phone number'),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("CANCEL")),
                            TextButton(
                              onPressed: () {
                                String pname = txt_name.text;
                                String pnumber = txt_number.text;

                                Modalclass insertModel = Modalclass(
                                  name: pname,
                                  number: pnumber,
                                );

                                setState(
                                  () {
                                    call.add(insertModel);
                                  },
                                );
                                Navigator.of(context).pop();
                              },
                              child: Text("ADD"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                    primary: Colors.black,
                  ),
                  child: Text(
                    "  Number ",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: call.length,
                  itemBuilder: (context, index) {
                    return App(index, call[index].name!, call[index].number!);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget App(int Index, String? name, String? number) {
    return ListTile(
      leading: Text(
        "$Index",
        style: TextStyle(fontSize: 18),
      ),
      title: Text("$name"),
      subtitle: Text("$number"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              txt_name = TextEditingController(text: "$name");
              txt_number = TextEditingController(text: "$number");

              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Enter Product Detail'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          controller: txt_name,
                          decoration: const InputDecoration(
                            hintText: 'Enter  name',
                          ),
                        ),
                        TextField(
                          controller: txt_number,
                          decoration: const InputDecoration(
                            hintText: 'Enter number ',
                          ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('CANCEL'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('UPDATE'),
                        onPressed: () {
                          setState(
                            () {
                              Modalclass m1 = Modalclass(
                                name: txt_name.text,
                                number: txt_number.text,
                              );
                              call[Index] = m1;
                            },
                          );
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.edit,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(
                () {
                  call.removeAt(Index);
                },
              );
            },
            icon: Icon(
              Icons.delete,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
