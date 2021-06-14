import 'dart:io';

void main()
{
  print("Input a number"); 
  int num = int.parse(stdin.readLineSync()!); 
  if (num%2==0){
    print("$num is an even number"); 
  }
  else print("$num in an odd number"); 
}