//
//  main.swift
//  Radix sort
//
//  Created by Ilyas Tyumenev on 26.06.2022.
//

/*
 Поразрядная (цифровая) сортировка / Radix sort
 
 Поразрядная сортировка - это алгоритм, который использует внутреннюю структуру сортируемых объектов.

 Перед началом сортировки необходимо знать:
    • length - максимальное количество разрядов в сортируемых величинах (например, при сортировке слов необходимо знать
 максимальное количество букв в слове);
    • rang количество возможных значений одного разряда (при сортировке слов – количество букв в алфавите).
 
 Общая идея алгоритма:
    • Создаём пустые массивы, количество которых равно rang.
    • Распределяем исходные значения по этим массивам. Распределение осуществляется по значению младшего (крайнего)
 разряда.
    • Соединяем значения в той последовательности, в которой они находятся после распределения по спискам.
    • Повторяем шаги 1-2 для оставшихся разрядов.
 
 Сложность      Лучшее    Среднее   Худшее
 Время          O(n+w)    O(nk)     O(w * n)
 Память                             O(n + w)
 
    • w - количество бит, требуемых для хранения каждого ключа.
 
 Ввод:   10 9 7 101 23
 Вывод:  7 9 10 23 101
 */

import Foundation

print("Можно вводить данные")

let intArray = readLine()!.split(separator: " ").compactMap { Int($0) }

func radixSort(original: [Int]) -> [Int] {
    var old = original
    for shift in stride(from: 31, to: 0, by: -1) {
        var tmp = Array(repeating: 0, count: old.count)
        var j = 0
        
        for i in 0..<old.count {
            let move = (old[i] << shift) >= 0
            let toBeMoved = (shift == 0) ? !move : move
            
            if toBeMoved {
                tmp[j + 1] = old[i]
            } else {
                old[i - j] = old[i]
            }
        }
        
        for i in j..<tmp.count {
            tmp[i] = old[i - j]
            old = tmp
        }
    }
    return old
}

print(radixSort(original: intArray))
