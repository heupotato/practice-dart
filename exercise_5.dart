List<int> checkList(List<int> nl1, List<int> nl2){
  List<int> res = []; 
  for (var num in nl1){
    if (nl2.contains(num) && !res.contains(num))
      res.add(num); 
  }
  return res; 
}
void main(List<String> args) {
  List<int> numList1 = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]; 
  List<int> numList2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]; 
  print(checkList(numList1, numList2)); 

}