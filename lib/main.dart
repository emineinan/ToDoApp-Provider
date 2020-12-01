import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/model/todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ToDo APP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: ChangeNotifierProvider(
          create: (context) => TodoModel(),
          child: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      appBar: buildAppBar(),
      body: buildBodyColumn(),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Provider.of<TodoModel>(context).addTaskInList();
        });
  }

  Column buildBodyColumn() {
    return Column(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              "02 : 36 PM",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 45,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "current time",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
        Expanded(
            child: Container(
          decoration: buildBoxDecoration(),
          child: Consumer<TodoModel>(
            builder: (context, todo, child) {
              return ListView.builder(
                  itemCount: todo.taskList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: ListTile(
                        contentPadding: EdgeInsets.only(
                            left: 32, right: 32, top: 8, bottom: 8),
                        title: Text(
                          todo.taskList[index].title,
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          todo.taskList[index].detail,
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(
                          Icons.check_circle,
                          color: Colors.red[900],
                        ),
                      ),
                      margin: EdgeInsets.only(
                          bottom: 8, top: 8, left: 16, right: 16),
                    );
                  });
            },
          ),
        ))
      ],
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(50), topLeft: Radius.circular(50)),
        color: Colors.white);
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        "Todo App",
        style: TextStyle(color: Colors.white),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white70,
        ),
        onPressed: () {},
      ),
    );
  }
}
