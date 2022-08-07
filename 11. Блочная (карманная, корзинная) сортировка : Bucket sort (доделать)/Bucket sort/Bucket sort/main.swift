//
//  main.swift
//  Bucket sort
//
//  Created by Ilyas Tyumenev on 26.06.2022.
//

/*
 Блочная (карманная, корзинная) сортировка / Bucket sort
 
 Блочная сортировка - это алгоритм, основанный на разделении входного массива на несколько частей - блоки/сегменты - и
 использовании другого алгоритма для их сортировки.

 Общая идея алгоритма:
    • Делим массив на блоки таким образом, чтобы элементы в каждом следующем блоке были всегда больше, чем в предыдущем.
    • Сортируем каждый блок, используя какой-либо другой алгоритм сортировки, либо рекурсивно тем же методом разбиения
 на блоки.
    • Объединяем все блоки в один массив.
 
 Сложность      Лучшее      Среднее       Худшее
 Время          O(n+k)      O(n+k)        O(n2)
 Память                                   O(1)
 
    • k - количество блоков.
 
 
 
 */

import Foundation

print("Можно вводить данные")

let intArray = readLine()!.split(separator: " ").compactMap { Int($0) }

func insertionSort(array: [Int]) -> [Int] {
    var arr = array
    var i: Int
    for j in 1..<arr.count {
        let key = arr[j]
        i = j - 1
        while i >= 0 && arr[i] > key {
            arr[i + 1] = arr[i]
            i -= 1
        }
        arr[i + 1] = key
    }
    return arr
}

func bucketSort(array: [Int]) {
    var arr = array
    let n = arr.count
    var bucket
}
