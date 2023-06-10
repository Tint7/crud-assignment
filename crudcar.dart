import 'dart:io';

void main() {
  showOption();
  getOption();
}

void showOption() {
  var option = [
    "List     - to display the list of cars",
    "create   - to create a new car",
    "update   - to update a car",
    "delete   - to delete a car"
  ];
  for (var i = 0; i < option.length; i++) {
    int no = i + 1;
    print("$no. " + option[i]);
  }
}

void getOption() {
  var list = [];
  // final now = DateTime.now();
  // var i = now.microsecond.toInt();
  var i = 99;
  var next = true;
  do {
    stdout.write("Enter Name, what do you do: ");
    String option = stdin.readLineSync()!.toLowerCase();
    switch (option) {
      case "list":
        if (list.isEmpty) {
          print("First, create and add elements");
        } else {
          list.map((listcar) => print(listcar)).toList();
        }
        break;

      case "create":
        Map carlist = new Map();
        stdout.write("Enter Brand Name: ");
        String name = stdin.readLineSync()!.toLowerCase();
        stdout.write("Enter Color: ");
        String color = stdin.readLineSync()!.toLowerCase();
        carlist['id'] = i;
        carlist['name'] = name;
        carlist['color'] = color;
        carlist.addAll(carlist);
        list.add(carlist);
        print("Adding Complete!");
        i += 2;
        break;

      case "update":
        stdout.write("Enter id to update: ");
        String sid = stdin.readLineSync()!;
        int id = int.parse(sid);
        stdout.write("Enter New Brand Name: ");
        String name = stdin.readLineSync()!.toLowerCase();
        stdout.write("Enter New Color: ");
        String color = stdin.readLineSync()!.toLowerCase();
        var result = list.firstWhere((element) => element['id'] == id);
        var index = list.indexWhere((element) => element['id'] == id);
        result['name'] = name;
        result['color'] = color;
        list.removeAt(index);
        list.insert(index, result);
        print("Update Success!");
        break;

      case "delete":
        stdout.write("Enter id to delete: ");
        String sid = stdin.readLineSync()!;
        int id = int.parse(sid);
        var index = list.indexWhere((element) => element['id'] == id);
        list.removeAt(index);
        print("Deleted!");
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
