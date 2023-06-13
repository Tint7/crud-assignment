import 'dart:io';

void main() {
  // showOption();
  getOption();
}

// void showOption() {
//   var option = [
//     "List     - to display the list of cars",
//     "create   - to create a new car",
//     "update   - to update a car",
//     "delete   - to delete a car"
//   ];
//   for (var i = 0; i < option.length; i++) {
//     int no = i + 1;
//     print("$no. " + option[i]);
//   }
// }

void getOption() {
  var list = [];
  // final now = DateTime.now();
  // var i = now.microsecond.toInt();
  var i = 99;
  var next = true;
  do {
    var option = [
      "list     - to display the list of cars",
      "create   - to create a new car",
      "update   - to update a car",
      "delete   - to delete a car"
    ];
    for (var i = 0; i < option.length; i++) {
      int no = i + 1;
      print("$no. " + option[i]);
    }
    stdout.write("Enter a command above yout want: ");
    String getoption = stdin.readLineSync()!.toLowerCase();
    switch (getoption) {
      case "list":
        if (list.isEmpty) {
          print("First, create and add elements");
        } else {
          for (var element in list) {
            // Iterate over the values of each map
            print("ID: ${element['id']}");
            print("NAME: ${element['name']}");
            print("MODEL: ${element['model']}");
            print("\n");
            // element.values.forEach((value) {
            //   print(value);
            // });
          }
        }
        print("\n");
        break;

      case "create":
        Map carlist = new Map();
        stdout.write("Enter A New Car Brand Name: ");
        String name = stdin.readLineSync()!.toUpperCase();
        stdout.write("Enter A Car New Model: ");
        String model = stdin.readLineSync()!.toUpperCase();
        carlist['id'] = i;
        carlist['name'] = name;
        carlist['model'] = model;
        carlist.addAll(carlist);
        list.add(carlist);
        print("You created a new car sucessfully!");
        i += 2;
        print("\n");
        break;

      // case "update":
      //   stdout.write("Enter id to update: ");
      //   String sid = stdin.readLineSync()!;
      //   int id = int.parse(sid);
      //   stdout.write("Enter New Car Brand Name: ");
      //   String name = stdin.readLineSync()!.toUpperCase();
      //   stdout.write("Enter New Car Model: ");
      //   String model = stdin.readLineSync()!.toUpperCase();
      //   var result = list.firstWhere((element) => element['id'] == id);
      //   var index = list.indexWhere((element) => element['id'] == id);
      //   result['name'] = name;
      //   result['model'] = model;
      //   list.removeAt(index);
      //   list.insert(index, result);
      //   print("You updated car successfully!");

      //   print("\n");
      //   break;
      case "update":
        stdout.write("Enter id to update: ");
        String sid = stdin.readLineSync()!;
        int id = int.parse(sid);
        var index = list.indexWhere((element) => element['id'] == id);
        //print(index);
        if (index == -1) {
          print("Car with ID $id does not exist.");
        } else {
          stdout.write("Enter New Car Brand Name: ");
          String name = stdin.readLineSync()!.toUpperCase();
          stdout.write("Enter New Car Model: ");
          String model = stdin.readLineSync()!.toUpperCase();

          var result = list[index];
          result['name'] = name;
          result['model'] = model;

          print("Car with ID $id has been updated!");
        }
        print("\n");
        break;

      // case "delete":
      //   stdout.write("Enter id to delete: ");
      //   String sid = stdin.readLineSync()!;
      //   int id = int.parse(sid);
      //   var index = list.indexWhere((element) => element['id'] == id);
      //   list.removeAt(index);
      //   print("You have Deleted the car!");
      //   print("\n");
      //   break;
      case "delete":
        stdout.write("Enter id to delete: ");
        String sid = stdin.readLineSync()!;
        int id = int.parse(sid);
        var index = list.indexWhere((element) => element['id'] == id);

        if (index == -1) {
          print("Car with ID $id does not exist.");
        } else {
          list.removeAt(index);
          print("Car with ID $id has been deleted!");
        }
        print("\n");
        break;

      default:
        {
          print("Invalid choice!");
          next = false;
        }
        break;
    }
  } while (next == true);
}
