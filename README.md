# Алгоритмы сортировки
## 1. Сортировка пузырьком / Bubble sort
**`Сортировка пузырьком`** — это простейший и один из самых известных алгоритмов сортировки. Идея заключается в последовательном сравнении значений соседних элементов. Если текущий элемент больше следующего, меняем их местами. Алгоритм необходимо повторять до тех пор, пока массив не будет отсортирован.

*Плюсы и минусы:* этот алгоритм считается учебным и почти не применяется на практике из-за низкой эффективности: он медленно работает на тестах, в которых маленькие элементы (их называют «черепахами») стоят в конце массива. Однако на нём основаны многие другие методы, например, шейкерная сортировка и сортировка расчёской.

Сложность | Лучшее | Среднее | Худшее
--- |:---:|:---:|:---:
Время | $O({n})$ | $O({n^2})$ | $O({n^2})$
Память | | | $O({1})$ 

## 2. Сортировка перемешиванием / Shaker (cocktail, ripple, shuffle, shuttle) sort
**`Сортировка перемешиванием`** (также известна как шейкерная или коктейльная сортировка) - это разновидность сортировки пузырьком. Отличие в том, что данная сортировка в рамках одной итерации проходит по массиву в обоих направлениях (слева направо и справа налево), тогда как сортировка пузырьком - только в одном направлении (слева направо). 

*Общая идея алгоритма:*

- Обход массива слева направо, аналогично пузырьковой - сравнение соседних элементов, меняя их местами, если левое значение больше правого. В итоге наибольшее число будет перемещено в конец массива.
    
- Обход массива в обратном направлении (справа налево), начиная с элемента, который находится перед последним отсортированным. На этом этапе элементы также сравниваются между собой и меняются местами, чтобы наименьшее значение всегда было слева. В итоге наименьшее число будет перемещено в начало массива.

Сложность | Лучшее | Среднее | Худшее
--- |:---:|:---:|:---:
Время | $O({n})$ | $O({n^2})$ | $O({n^2})$
Память |  |  | $O({1})$

Сложность у алгоритма такая же, как и у сортировки пузырьком, однако реальное время работы лучше (обычно менее чем в два раза быстрее).

## 3. Сортировка расчёской / Comb sort ##
**`Сортировка расчёской`** - еще одна разновидность сортировки пузырьком. Данная сортировка улучшает сортировку пузырьком за счет устранения маленьких значений в конце списка (черепах).

Достигается это тем, что вместо сравнения соседних элементов, сравниваются элементы на достаточно большом расстоянии друг от друга, постепенно уменьшая это расстояние. Сначала разрыв между элементами берётся максимальный, т.е. на единицу меньше, чем размер массива. Затем на каждой итерации расстояние уменьшается путём деления расстояния на фактор уменьшения. Так продолжается до тех пор, пока разность индексов сравниваемых элементов не достигнет единицы. Тогда сравниваются уже соседние элементы как и в сортировке пузырьком, но эта итерация будет последней. 

Оптимальное значение фактора уменьшения - 1,247.
 
Сложность | Лучшее | Среднее | Худшее
--- |:---:|:---:|:---:
Время | $O({n \log n})$ | $O({n^2/2^p}$), где p - количество инкрементов | $O({n^2})$
Память |  |  | $O({1})$

## 4. Сортировка вставками / Insertion sort
**`Сортировка вставками`** - алгоритм, при котором каждый последующий элемент массива сравнивается с предыдущими элементами (отсортированными) и вставляется в нужную позицию.

 *Общая идея алгоритма:*
 
 - Сравниваем второй элемент с первым элементом массива и при необходимости меняем их местами. Условно эти элементы (первый и второй) будут являться отсортированным массивом, остальные элементы - неотсортированным.
 
 - Сравниваем следующий элемент из неотсортированного массива с элементами отсортированного и вставляем в нужную позицию.
 
 - Повторям шаг 2 до тех пор, пока в неотсортированном массиве не останется элементов.
 
 Сложность | Лучшее | Среднее | Худшее
--- |:---:|:---:|:---:
Время | $O({n})$ | $O({n^2})$ | $O({n^2})$
Память |  |  | $O({1})$

## 5. Сортировка Шелла / Shell sort
**`Сортировка Шелла`** - усовершенствованная разновидность сортировки вставками.

 Сначала сравниваются и сортируются между собой значения, стоящие друг от друга на некотором расстоянии - d. После этого расстояние d уменьшается и процедура повторяется до тех пор, пока значение d не станет минимальным, т.е. d = 1. Это означает, что сортировка достигла последнего шага. А на последнем шага элементы сортируются обычной сортировкой вставками. 
 
 Первоначально было предложено расчитывать расстояние между сравниваемыми элементами следующим образом:
 
 - первая итерация - $d_1 = N/2$, где N - размер массива;
 
 - последующие итерации - $d_i = d_{i-1}/2$;
 
 - последняя итерация - $d_k = 1$
 
 Существуют и другие последовательности.

Сложность | Лучшее | Среднее | Худшее
--- |:---:|:---:|:---:
Время | $O({n \log n})$ | зависит от выбранных шагов (d) | $O({n^2})$ или $O({n \log^2 n})$ (зависит от выбранных шагов)
Память |  |  | $O({1})$

## 6. Сортировка выбором / Selection sort
**`Сортировка выбором`** - это алгоритм, при котором многократно осуществляется поиск минимального элемента в неотсортированной части массива и его помещение в конец отсортированной части массива.

*Общая идея алгоритма:*

1) Данный алгоритм условно делит массив на две части:

- подмассив, который уже отсортирован (находится в левой части массива),

- подмассив, который нужно отсортировать (находится в правой части массива).

2) Поиск минимального значения в неотсортированном массиве. Найденное значение меняем местами с первым элементом в неотсортированном массиве.

3) Повторяем предыдущий шаг до тех пор, пока массив не будет отсортирован.

Сложность | Лучшее | Среднее | Худшее
--- |:---:|:---:|:---:
Время | $O({n})$ | $O({n^2})$ | $O({n^2})$
Память |  |  | $O({1})$
