import 'dart:io';

List<int>FibonacciGen(int number){
    List<int> res = [1, 1]; 
    for (int i = 0; i<number - 2; i++)
        res.add(res[res.length-1] + res[res.length - 2]); 
    return res; 
}
void main(List<String> args) {
    print("How many Fibonnaci numbers you want to generate?"); 
    int number = int.parse(stdin.readLineSync()!); 
    print(FibonacciGen(number)); 

}