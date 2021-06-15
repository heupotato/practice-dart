List<int> ReadList(List<int> numList){
    List<int> res = []; 
    res.addAll([numList[0], numList[numList.length - 1]]); 
    return res; 
}
void main(List<String> args) { 
    List<int> numList = [5, 10, 15, 20, 25]; 
    print(ReadList(numList)); 
}