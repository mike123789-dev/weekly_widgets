import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'helpers/db_helpers.dart';
import 'models/dog.dart';

class MySqflite extends StatefulWidget {
  @override
  _MySqfliteState createState() => _MySqfliteState();
}

class _MySqfliteState extends State<MySqflite> {
  List<Dog> _dogs = [];

  @override
  void initState() {
    fetchDogs();
    super.initState();
  }

  fetchDogs() async {
    final List<Map<String, dynamic>> maps = await DBHelper.getData("dogs");
    setState(() {
      _dogs = List.generate(maps.length, (i) {
        return Dog(
          id: maps[i]['id'],
          name: maps[i]['name'],
          age: maps[i]['age'],
        );
      });
    });
  }

  _addDog() async {
    final lastId = _dogs.last.id;
    var newDog = Dog(
      id: lastId + 1,
      name: Faker().person.name().split(" ").last,
      age: Random().nextInt(30),
    );
    DBHelper.insert(
      "dogs",
      newDog.toMap(),
    ).then(
      (_) => print("inserted!"),
    );
    fetchDogs();
  }

  _deleteDog(id) async {
    DBHelper.deleteDog(id);
    fetchDogs();
  }

  _updateDogAge(id) async {
    final updatedDog = _dogs.where((element) => element.id == id).first;
    updatedDog.age += 1;
    DBHelper.updateDog(updatedDog.toMap());
    fetchDogs();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "List of Dogs",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (_, index) {
              final dog = _dogs[index];
              return ListTile(
                title: Text(
                  dog.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  "${dog.age}",
                ),
                leading: IconButton(
                  icon: Icon(Icons.arrow_upward),
                  onPressed: () {
                    _updateDogAge(dog.id);
                  },
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteDog(dog.id);
                  },
                  color: Colors.red,
                ),
              );
            },
            itemCount: _dogs.length,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: ElevatedButton(
            onPressed: () {
              _addDog();
            },
            child: Text("Add Dog"),
          ),
        )
      ],
    );
  }
}
