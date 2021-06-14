void main(List<String> args) {
  List<int> numList = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]; 
  List<int> res = []; 
  for (var num in numList)
    if (num%2 == 0) res.add(num); 
  print(res); 
}