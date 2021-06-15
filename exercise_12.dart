import 'dart:io';

List<int>FibonacciGen(int number){
    List<int> res = [1, 1]; 
    for (int i = 0; i<number - 2; i++)
        res.add(res[res.length-1] + res[res.length - 2]); 
    return res; 
}
void main(List<String> args) {
    print("How many Fibonnaci numbers you want to generate?"); 
    while (true)
    try{
      int number = int.parse(stdin.readLineSync()!); 
      if (number < 1) throw("Invalid Input. Please try again"); 
      print(FibonacciGen(number));
      return; 
    }
    catch (err){
      print(err.toString()); 
    }
}