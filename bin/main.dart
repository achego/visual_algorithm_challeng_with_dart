import '../binary_search.dart';

void main() {
  List<int> me = [1, 5, 7, 9, 2, 3, 4, 8, 6, 10];

  List<int> you = [1, 2, 3, 4, 5, 10, 7, 8, 6, 10];
  List<int> test = [2, 3, 5, 7, 11, 13, 9, 6];
  // doSearch(me, 20);
  // swap(me, 0, 1);
  // indexOfMinimum(me, 5);
  // selectionSort(me);
  // insert(test, 5, 9);
  // print(insertionSort(you));
  // print(factorial(5));
  // print(isPalindrome('rottmor'));
  // print(power(2, -1));
  // merge(you, 2, 4, 8);
  solveHanoi(
    numOfDisks: 64,
    fromPeg: 'A',
    toPeg: 'B',
    idPeg: 'C',
  );
}
