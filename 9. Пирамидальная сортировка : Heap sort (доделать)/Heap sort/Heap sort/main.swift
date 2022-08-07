//
//  main.swift
//  Heap sort
//
//  Created by Ilyas Tyumenev on 26.06.2022.
//

/*
 Пирамидальная сортировка / Heap sort
 
 Пирамидальная сортировка - это улучшенная сортировка выбором.

 Для сортировки используется бинарное сортирующее дерево - дерево, у которого выполнены условия:
• Каждый лист имеет глубину либо d, либо d-1, d — максимальная глубина дерева.
• Значение в любой вершине не меньше значения её потомков.
    
               16
              /  \
             /    \
           11      9
          /  \     /\
         /    \   /  \
        10     5 6    8
       /  \     \
      1    2     4
 
 
 Общая идея алгоритма:
 • Выстраиваем массив в виде сортирующего дерева:
    Array[i] >= Array[2i + 1]
    Array[i] >= Array[2i + 2]
    при 0 <= i < n/2
 • Обмениваем элементы Array[0] и Array[n-1] местами. Array[0] является корнем сортирующего дерева, т.е. самым большим
 значением массива.
 • Повторям шаги до тех пор, пока в сортирующем дереве не останется один элемент.
 
 Сложность      Лучшее          Среднее         Худшее
 Время          O(n log n)      O(n log n)      O(n log n) или O(n) (при одинаковых ключах)
 Память                                         O(1)
 
 Ввод:   10 9 7 101 23
 Вывод:  7 9 10 23 101
 */

import Foundation
//
//print("Можно вводить данные")
//
//let intArray = readLine()!.split(separator: " ").compactMap { Int($0) }

func heapSort(array: [Int]) -> [Int] {
    var a = array
    heapify(a)
    var end = a.count - 1
    while end > 0 {
        (a[end], a[0]) = (a[0], a[end])
        end -= 1
        siftDown(a, 0, end)
    }
    return a
}

func heapify(_ array: [Int]) {
    var start = (array.count - 2) / 2
    while start >= 0 {
        siftDown(array, start, array.count - 1)
        start -= 1
    }
}

func siftDown(_ array: [Int], _ start: Int, _ end: Int) -> [Int]{
    var a = array
    var root = start
    while (root * 2) + 1 <= end {
        var child = root * 2 + 1
        if child + 1 <= end && a[child] < a[child + 1] {
            child += 1
        }
        if a[root] < a[child] {
            (a[root], a[child]) = (a[child], a[root])
            root = child
        } else  {
            return []
        }
    }
    return a
}

let aa = [
    [100, 2, 56, 200, -52, 3, 99, 33, 177, -199],
    [4, 65, 2, -31, 0, 99, 2, 83, 782, 1],
    [12, 11, 15, 10, 9, 1, 2, 3, 13, 14, 4, 5, 6, 7, 8]
]

func main() {
    for a in aa {
        print(heapSort(array: a))
    }
}

main()
