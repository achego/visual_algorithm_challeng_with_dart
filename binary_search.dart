// NOT DONE
/*
8. RECURSIVE FACTORIAL
  why: read about resursion to understand
12. IMPLEMENT MERGE SORT
  why: read the.. apply divide and conquer
13. IMPLEMENT MERGE
  why: dont understand requiremnt: repeadedly copy lowest untaken? and once one is added
16 STORE A GRAPH
  16 a STORE ADJACENT GRAPH
  16 b STORE ADJACENT LIST


// 17 IMPLEMENT BREADTH-FIRST SEARCH
 */

// 1
int doSearch(List<int> array, int targetValue) {
  int min = 0;
  int max = array.length - 1;
  int guess;
  int result = 0;

  for (var i = 0; i < array.length; i++) {
    print('Run - ${i + 1}');
    if (max < min) {
      print('Element is not in array');
      result = -1;
      break;
    }

    guess = ((max + min) / 2).floor();

    if (array[guess] == targetValue) {
      result = guess;
      print('Guess = $guess');
      print(
          'Found the target value of $targetValue at index of $result in the array');
      break;
    } else if (array[guess] < targetValue) {
      min = guess + 1;
      print('Guess is less $guess');
    } else {
      max = guess - 1;
      print('Guess is more $guess');
    }
  }
  return result;
}

// 2
List<int> swap(List<int> array, int firstIndex, int secondIndex) {
  List<int> newArray = [...array];
  try {
    int firstHolder = newArray[firstIndex];
    newArray[firstIndex] = newArray[secondIndex];
    newArray[secondIndex] = firstHolder;

    // print('in swap');
    // print('old array - $array');
    // print('new array - $newArray');
  } catch (e) {
    newArray = [];
    // print('An error occured - $e');
  }

  return newArray;
}

// 3
int indexOfMinimum(List<int> array, int startIndex) {
  if (startIndex >= array.length) {
    print('The startIndex is out of bound');
    return -1;
  }

  int smallest = array[startIndex];
  int smallestIndex = startIndex;

  for (var i = startIndex + 1; i < array.length; i++) {
    if (array[i] < smallest) {
      smallest = array[i];
      smallestIndex = i;
    }
  }
  print('The smallest value is {$smallest} at index of ${smallestIndex}');
  return smallestIndex;
}

// 4
List<int> selectionSort(List<int> array) {
  List<int> newArray = [...array];
  for (var i = 0; i < newArray.length; i++) {
    int minimunIndex = indexOfMinimum(newArray, i);
    print('Minimum index - $minimunIndex');
    print('Current index - $i');
    newArray = swap(newArray, i, minimunIndex);
    print('New Array - $newArray');
  }
  print('In selection');
  print('old array = $array');
  print('new array = $newArray');
  return newArray;
}

// 5 INSERT A VALUE BEFORE AN INDEX IN A SORTED ARRAY
List<int> insert(List<int> array, int rightIndex, int value) {
  final oldArray = [...array];

  for (var i = 0; i < rightIndex; i++) {
    for (var j = 0; j < rightIndex; j++) {
      if (array[j] > array[i]) {
        array = swap(array, j, i);
      }
    }
  }

  for (var i = rightIndex; i < array.length; i++) {
    if (array[i] == value) {
      array.remove(array[i]);
    }
  }
  for (var i = 0; i < rightIndex + 1; i++) {
    if (array[i] > value) {
      array.insert(i, value);
      break;
    }
  }
  // print('old array = $oldArray');
  // print('new array = $array');
  return array;
}

// 6. IMPLEMENT INSERTION SORT
// problems
// * cannot use the insert function previously written, because there was no specification for the right index and value for the new task
List<int> insertionSort(List<int> array) {
  List<int> subArray = [];
  for (var i = 0; i < array.length; i++) {
    subArray.insert(0, array[i]);
  }
  return subArray;
}

// 7. ITERATIVE FACTORIAL
int factorial(int number) {
  int result = number == 0 ? 0 : 1;
  for (var i = 1; i < number + 1; i++) {
    result = result * i;
  }
  return result;
}

// 8. RECURSIVE FACTORIAL
int recursiveFactorial(int number) {
  if (number <= 1) {
    return 1;
  } else {
    return number * recursiveFactorial(number - 1);
  }
}

// 9. IS A STRING A PALINDROME
// Recursive
bool isPalindrome(String text) {
  if (text.length <= 1) {
    return true;
  }
  if (text[0] != text[text.length - 1]) {
    return false;
  }
  print(text.substring(1, text.length - 1));
  return isPalindrome(text.substring(1, text.length - 1));
}

// Linear
bool isPalindrome2(String text) {
  bool isPalindrome = false;

  int textL = text.length;
  for (var i = 0; i < textL; i++) {
    if (text.length <= 1) {
      isPalindrome = true;
      break;
    } else {
      if (text[0] == text[text.length - 1]) {
        text = text.replaceFirst(text[0], '');
        text = text.replaceFirst(text[text.length - 1], '');
      } else {
        isPalindrome = false;
      }
    }
  }
  return isPalindrome;
}

// 10 COMPUTING POWER OF NUMBERS
// recursive
double power(double value, int pow) {
  if (pow == 0) {
    return 1;
  }
  if (pow % 2 == 0 && !pow.isNegative) {
    return power(value, pow ~/ 2) * power(value, pow ~/ 2);
  }
  if (pow % 2 == 1 && !pow.isNegative) {
    return value * power(value, pow - 1);
  }
  if (pow.isNegative) {
    double val = power(value, -pow);
    return 1 / val;
  }
  return 0;
}

// iterative
double power2(double value, int power) {
  if (power == 0) {
    return 1;
  } else {
    double result = 1;
    for (var i = 0; i < power.abs(); i++) {
      result = result * value;
    }
    if (power.isNegative) {
      return 1 / result;
    } else {
      return result;
    }
  }
}

// 11. SOLVE HANOI RECURSIVELY
int solveCount = 0;
solveHanoi(int numOfDisks, String fromPeg, String toPeg, String idPeg) {
  solveCount++;
  int n = numOfDisks;
  if (numOfDisks == 1) {
    print('Moved disk $numOfDisks from $fromPeg to $toPeg');
    return;
  }
  solveHanoi(numOfDisks - 1, fromPeg, idPeg, toPeg);
  print('Moved disk $n from $fromPeg to $toPeg');
  solveHanoi(numOfDisks - 1, idPeg, toPeg, fromPeg);
  print('Solved Hanoi in $solveCount moves');
}

//12. IMPLEMENT MERGE SORT
mergeA() {}
mergeSort(List<int> array) {
  if (array.length <= 1) {
    return array;
  } else {}
}

// 13 IMPLEMENT MERGE
merge(List<int> array, int start, int middle, int end) {
  List<int> lowHalf = array.sublist(start, middle + 1);
  List<int> highHalf = array.sublist(middle + 1, end + 1);
  print(lowHalf);
  print(highHalf);
}

// 14 QUICK SORT
quickSort() {}

// 15 IMPLEMENT PARTITION
partition(List<int> subArray, int pivot) {
  for (var i = 0; i < subArray.length; i++) {}
}

// 16 STORE A GRAPH
// 16 a STORE ADJACENT GRAPH
// 16 b STORE ADJACENT LIST


// 17 IMPLEMENT BREADTH-FIRST SEARCH
