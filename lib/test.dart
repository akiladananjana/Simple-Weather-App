void main() {
  String myString = "10q0";

  try {
    double data = double.parse(myString);
    print(data);
  } catch (e) {
    print("Error!");
  }
}
