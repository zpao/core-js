if Object.setPrototypeOf or '__proto__' of Object::
  QUnit.module \ES6
  
  eq = strictEqual
  
  test 'Object.setPrototypeOf' !->
    {setPrototypeOf} = core.Object
    ok typeof! setPrototypeOf is \Function, 'Is function'
    ok \apply of setPrototypeOf({} Function::), 'Parent properties in target'
    eq setPrototypeOf(a:2, {b: -> @a^2})b!, 4, 'Child and parent properties in target'
    eq setPrototypeOf(tmp = {}, {a: 1}), tmp, 'setPrototypeOf return target'
    ok !(\toString of setPrototypeOf {} null), 'Can set null as prototype'