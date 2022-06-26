//
//  main.swift
//  Merge sort
//
//  Created by Ilyas Tyumenev on 26.06.2022.
//

/*
 Сортировка слиянием / Merge sort
 
 Сортировка слиянием - это алгоритм типа “разделяй и властвуй”.

 Общая идея алгоритма:
 1) Массив разбивается на две части примерно одинакового размера. Разбиение получившихся массивов повторяется до тех
 пор, пока размер каждого массива не достигнет единицы.
 2) Каждая из получившихся частей сортируется отдельно, после чего происходит слияние двух массивов следующим образом:
    • На каждом шаге сравниваем первые элементы массивов, берём наименьшее значение и записываем в результирующий массив.
    • Когда один из массив закончился, добавляем оставшиеся элементы второго массива в результирующий массив.
 3) Слияние подмассивов продолжается до тех пор, пока не получим один, отсортированный массив.
 
 Сложность      Лучшее          Среднее         Худшее
 Время          O(n log n)      O(n log n)      O(n log n)
 Память                                         O(n)
 
 Ввод:   10 9 7 101 23
 Вывод:  7 9 10 23 101
 */

import Foundation

print("Можно вводить данные")

let intArray = readLine()!.split(separator: " ").compactMap { Int($0) }

func mergeSort(array: [Int]) -> [Int] {
    if array.count <= 1 {
        return array
    }
    
    let a = array
    let middle = a.count / 2
    let left = Array(a[0..<middle])
    let right = Array(a[middle..<a.count])
    
    return merge(mergeSort(array: left), mergeSort(array: right))
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var indexLeft = 0
    var indexRight = 0
    var newA = [Int]()
    
    while indexLeft < left.count && indexRight < right.count {
        if left[indexLeft] <= right[indexRight] {
            newA.append(left[indexLeft])
            indexLeft += 1
        } else {
            newA.append(right[indexRight])
            indexRight += 1
        }
    }
    
    while indexLeft < left.count {
        newA.append(left[indexLeft])
        indexLeft += 1
    }
    
    while indexRight < right.count {
        newA.append(right[indexRight])
        indexRight += 1
    }
    
    return newA
}

print(mergeSort(array: intArray))
