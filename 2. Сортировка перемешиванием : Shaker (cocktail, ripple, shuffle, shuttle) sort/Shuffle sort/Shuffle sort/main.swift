//
//  main.swift
//  Shuffle sort
//
//  Created by Ilyas Tyumenev on 25.06.2022.
//

/*
 Сортировка перемешиванием / Shaker (cocktail, ripple, shuffle, shuttle) sort
 
 Также известна как шейкерная или коктейльная сортировка.

 Сортировка перемешиванием - это разновидность сортировки пузырьком. Отличие в том, что данная сортировка в рамках
 одной итерации проходит по массиву в обоих направлениях (слева направо и справа налево), тогда как сортировка
 пузырьком - только в одном направлении (слева направо).

 Общая идея алгоритма:
    • Обход массива слева направо, аналогично пузырьковой - сравнение соседних элементов, меняя их местами, если левое
 значение больше правого. В итоге наибольшее число будет перемещено в конец массива.
    • Обход массива в обратном направлении (справа налево), начиная с элемента, который находится перед последним
 отсортированным. На этом этапе элементы также сравниваются между собой и меняются местами, чтобы наименьшее
 значение всегда было слева. В итоге наименьшее число будет перемещено в начало массива.
 
 Сложность      Лучшее      Среднее     Худшее
 Время          O(n)        O(n^2)      O(n^2)
 Память                                 O(1)
 
 Сложность у алгоритма такая же, как и у сортировки пузырьком, однако реальное время работы лучше
 (обычно менее чем в два раза быстрее).
 
 Ввод:   10 9 7 101 23
 Вывод:  7 9 10 23 101
 */

import Foundation

print("Можно вводить данные")

let intArray = readLine()!.split(separator: " ").compactMap { Int($0) }

func shuffleSort(array: [Int]) -> [Int] {
    var a = array
    var swapped = false
    repeat {        
        for i in 1..<a.count {
            if a[i] < a[i - 1] {
                (a[i], a[i - 1]) = (a[i - 1], a[i])
                swapped = true
            }
        }
        
        if swapped == false {
            break
        }
        swapped = false
        
        for i in stride(from: a.count - 2, to: 0, by: -1) {
            if a[i] < a[i - 1] {
                (a[i], a[i - 1]) = (a[i - 1], a[i])
                swapped = true
            }
        }
    } while swapped == true

    return a
}

print(shuffleSort(array: intArray))
