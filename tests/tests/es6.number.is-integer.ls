QUnit.module \ES6

test 'Number.isInteger' !->
  {isInteger} = Number
  {create} = Object
  ok typeof! isInteger is \Function, 'Is function'
  ok /native code/.test(isInteger), 'looks like native'
  for [1 -1 2^16 2^16 - 1 2^31 2^31 - 1 2^32 2^32 - 1 -0]
    ok isInteger(..), "isInteger #{typeof ..} #{..}"
  for [NaN, 0.1, Infinity, \NaN, \5, no, new Number(NaN), new Number(Infinity), new Number(5), new Number(0.1), void, null, {}, ->, create(null)]
    ok not isInteger(..), "not isInteger #{typeof ..} #{try String(..) catch e => 'Object.create(null)'}"