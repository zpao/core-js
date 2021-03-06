QUnit.module \core-js
test 'Number#@@iterator' !->
  {getIterator} = core
  {toStringTag} = core.Symbol
  iter1 = getIterator 2
  ok iter1[toStringTag] is 'Number Iterator', '@@toStringTag'
  deepEqual iter1.next!, {done: no, value: 0}, '2 #1'
  deepEqual iter1.next!, {done: no, value: 1}, '2 #2'
  deepEqual iter1.next!, {done: on, value: void}, '2 #3'
  iter2 = getIterator 1.5
  deepEqual iter2.next!, {done: no, value: 0}, '1.5 #1'
  deepEqual iter2.next!, {done: no, value: 1}, '1.5 #2'
  deepEqual iter2.next!, {done: on, value: void}, '1.5 #3'
  iter3 = getIterator -1
  deepEqual iter3.next!, {done: on, value: void}, '-1'
  iter4 = getIterator NaN
  deepEqual iter4.next!, {done: on, value: void}, 'NaN'
  iter5 = getIterator Infinity
  deepEqual iter5.next!, {done: no, value: 0}, 'Infinity #1'
  deepEqual iter5.next!, {done: no, value: 1}, 'Infinity #1'
  deepEqual iter5.next!, {done: no, value: 2}, 'Infinity #1'
  iter6 = getIterator -Infinity
  deepEqual iter6.next!, {done: on, value: void}, '-Infinity'