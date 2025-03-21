// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/*member: main:
 static=[
  testAbstractClassWithField(0),
  testEnum(0),
  testForwardingConstructor(0),
  testForwardingConstructorGeneric(0),
  testForwardingConstructorTyped(0),
  testGenericMixinInstantiation(0),
  testGenericNamedMixinInstantiation(0),
  testInstanceGenericMethod(0),
  testMixinInstantiation(0),
  testNamedMixinInstantiation(0),
  testStaticGenericMethod(0),
  testSuperCall(0),
  testSuperClosurization(0),
  testSuperFieldSet(0),
  testSuperGet(0),
  testSuperSetterSet(0)]
*/
main() {
  testSuperCall();
  testSuperGet();
  testSuperFieldSet();
  testSuperSetterSet();
  testSuperClosurization();
  testForwardingConstructor();
  testForwardingConstructorTyped();
  testForwardingConstructorGeneric();
  testEnum();
  testStaticGenericMethod();
  testInstanceGenericMethod();
  testAbstractClassWithField();
  testMixinInstantiation();
  testNamedMixinInstantiation();
  testGenericMixinInstantiation();
  testGenericNamedMixinInstantiation();
}

/*member: Super1.:static=[Object.(0)]*/
class Super1 {
  /*member: Super1.foo:*/
  foo() {}
}

class Sub1 extends Super1 {
  /*member: Sub1.:static=[Super1.(0),Super1.foo(0)]*/
  Sub1() {
    super.foo();
  }
}

/*member: testSuperCall:static=[Sub1.(0)]*/
testSuperCall() => Sub1();

/*member: Super2.:static=[Object.(0)]*/
class Super2 {
  /*member: Super2.foo:type=[inst:JSNull]*/
  var foo;
}

class Sub2 extends Super2 {
  /*member: Sub2.:static=[Super2.(0),Super2.foo]*/
  Sub2() {
    super.foo;
  }
}

/*member: testSuperGet:static=[Sub2.(0)]*/
testSuperGet() => Sub2();

/*member: Super3.:static=[Object.(0)]*/
class Super3 {
  /*member: Super3.foo:type=[inst:JSNull]*/
  var foo;
}

class Sub3 extends Super3 {
  /*member: Sub3.:static=[Super3.(0),set:Super3.foo],type=[inst:JSBool]*/
  Sub3() {
    super.foo = true;
  }
}

/*member: testSuperFieldSet:static=[Sub3.(0)]*/
testSuperFieldSet() => Sub3();

/*member: Super4.:static=[Object.(0)]*/
class Super4 {
  /*member: Super4.foo=:*/
  set foo(_) {}
}

class Sub4 extends Super4 {
  /*member: Sub4.:static=[Super4.(0),set:Super4.foo],type=[inst:JSBool]*/
  Sub4() {
    super.foo = true;
  }
}

/*member: testSuperSetterSet:static=[Sub4.(0)]*/
testSuperSetterSet() => Sub4();

/*member: Super5.:static=[Object.(0)]*/
class Super5 {
  /*member: Super5.foo:*/
  foo() {}
}

/*member: Sub5.:static=[Super5.(0),Super5.foo]*/
class Sub5 extends Super5 {
  Sub5() {
    super.foo;
  }
}

/*member: testSuperClosurization:static=[Sub5.(0)]*/
testSuperClosurization() => Sub5();

mixin EmptyMixin {}

class ForwardingConstructorSuperClass {
  /*member: ForwardingConstructorSuperClass.:static=[Object.(0)]*/
  ForwardingConstructorSuperClass(arg);
}

class ForwardingConstructorClass = ForwardingConstructorSuperClass
    with EmptyMixin;

/*member: testForwardingConstructor:
 static=[ForwardingConstructorClass.(1)],
 type=[inst:JSNull]
*/
testForwardingConstructor() => ForwardingConstructorClass(null);

class ForwardingConstructorTypedSuperClass {
  /*member: ForwardingConstructorTypedSuperClass.:
   static=[
    Object.(0),
    Rti._bind(1),
    Rti._eval(1),
    _arrayInstanceType(1),
    _asBool(1),
    _asBoolQ(1),
    _asDouble(1),
    _asDoubleQ(1),
    _asInt(1),
    _asIntQ(1),
    _asNum(1),
    _asNumQ(1),
    _asObject(1),
    _asString(1),
    _asStringQ(1),
    _asTop(1),
    _generalAsCheckImplementation(1),
    _generalIsTestImplementation(1),
    _generalNullableAsCheckImplementation(1),
    _generalNullableIsTestImplementation(1),
    _installSpecializedAsCheck(1),
    _installSpecializedIsTest(1),
    _instanceType(1),
    _isBool(1),
    _isInt(1),
    _isNum(1),
    _isObject(1),
    _isString(1),
    _isTop(1),
    findType(1),
    instanceType(1)],
   type=[
    inst:Closure,
    inst:JSBool,
    param:int?]
  */
  ForwardingConstructorTypedSuperClass(int? arg);
}

class ForwardingConstructorTypedClass = ForwardingConstructorTypedSuperClass
    with EmptyMixin;

/*member: testForwardingConstructorTyped:
 static=[ForwardingConstructorTypedClass.(1)],
 type=[inst:JSNull]
*/
testForwardingConstructorTyped() => ForwardingConstructorTypedClass(null);

class ForwardingConstructorGenericSuperClass<T> {
  /*member: ForwardingConstructorGenericSuperClass.:
   static=[
    Object.(0),
    Rti._bind(1),
    Rti._eval(1),
    _arrayInstanceType(1),
    _asBool(1),
    _asBoolQ(1),
    _asDouble(1),
    _asDoubleQ(1),
    _asInt(1),
    _asIntQ(1),
    _asNum(1),
    _asNumQ(1),
    _asObject(1),
    _asString(1),
    _asStringQ(1),
    _asTop(1),
    _generalAsCheckImplementation(1),
    _generalIsTestImplementation(1),
    _generalNullableAsCheckImplementation(1),
    _generalNullableIsTestImplementation(1),
    _installSpecializedAsCheck(1),
    _installSpecializedIsTest(1),
    _instanceType(1),
    _isBool(1),
    _isInt(1),
    _isNum(1),
    _isObject(1),
    _isString(1),
    _isTop(1),
    _setArrayType(2),
    findType(1),
    instanceType(1)],
   type=[
    inst:Closure,
    inst:JSArray<dynamic>,
    inst:JSBool,
    inst:JSExtendableArray<dynamic>,
    inst:JSFixedArray<dynamic>,
    inst:JSMutableArray<dynamic>,
    inst:JSUnmodifiableArray<dynamic>,
    param:ForwardingConstructorGenericSuperClass.T]
  */
  ForwardingConstructorGenericSuperClass(T arg);
}

class ForwardingConstructorGenericClass<
  S
> = ForwardingConstructorGenericSuperClass<S>
    with EmptyMixin;

/*member: testForwardingConstructorGeneric:
 static=[
  ForwardingConstructorGenericClass.(1),
  checkTypeBound(4)],
 type=[inst:JSNull]
*/
testForwardingConstructorGeneric() {
  ForwardingConstructorGenericClass<int?>(null);
}

enum Enum { A }

/*member: testEnum:
 static=[
  _Enum._name=StringConstant("A"),
  _Enum.index=IntConstant(0)],
 type=[
  const:Enum,
  inst:JSInt,
  inst:JSNumNotInt,
  inst:JSNumber,
  inst:JSPositiveInt,
  inst:JSString,
  inst:JSUInt31,
  inst:JSUInt32]
*/
testEnum() => Enum.A;

/*member: staticGenericMethod:
 static=[
  Rti._bind(1),
  Rti._eval(1),
  _arrayInstanceType(1),
  _asBool(1),
  _asBoolQ(1),
  _asDouble(1),
  _asDoubleQ(1),
  _asInt(1),
  _asIntQ(1),
  _asNum(1),
  _asNumQ(1),
  _asObject(1),
  _asString(1),
  _asStringQ(1),
  _asTop(1),
  _generalAsCheckImplementation(1),
  _generalIsTestImplementation(1),
  _generalNullableAsCheckImplementation(1),
  _generalNullableIsTestImplementation(1),
  _installSpecializedAsCheck(1),
  _installSpecializedIsTest(1),
  _instanceType(1),
  _isBool(1),
  _isInt(1),
  _isNum(1),
  _isObject(1),
  _isString(1),
  _isTop(1),
  _setArrayType(2),
  findType(1),
  instanceType(1)],
 type=[
  inst:Closure,
  inst:JSArray<dynamic>,
  inst:JSBool,
  inst:JSExtendableArray<dynamic>,
  inst:JSFixedArray<dynamic>,
  inst:JSMutableArray<dynamic>,
  inst:JSUnmodifiableArray<dynamic>,
  inst:List<staticGenericMethod.T>,
  param:Object?,
  param:staticGenericMethod.T]
*/
List<T> staticGenericMethod<T>(T arg) => [arg];

/*member: testStaticGenericMethod:
 static=[staticGenericMethod<bool>(1)],
 type=[inst:JSBool]
*/
testStaticGenericMethod() {
  staticGenericMethod<bool>(true);
}

/*member: testInstanceGenericMethod:
 dynamic=[GenericClass.genericMethod<bool>(1)],
 static=[
  GenericClass.generative(0),
  checkTypeBound(4)],
 type=[inst:JSBool]
*/
testInstanceGenericMethod() {
  GenericClass<int, String>.generative().genericMethod<bool>(false);
}

abstract class AbstractClass {
  // ignore: UNUSED_FIELD
  final _field = null;

  /*member: AbstractClass.build:type=[inst:JSNull]*/
  static build() => null;
}

/*member: testAbstractClassWithField:static=[AbstractClass.build(0)]*/
testAbstractClassWithField() => AbstractClass.build();

/*member: testMixinInstantiation:static=[Sub.(0)]*/
testMixinInstantiation() => Sub();

/*member: testNamedMixinInstantiation:static=[NamedMixin.(0)]*/
testNamedMixinInstantiation() => NamedMixin();

/*member: testGenericMixinInstantiation:static=[
  GenericSub.(0),
  checkTypeBound(4)]*/
testGenericMixinInstantiation() => GenericSub<int, String>();

/*member: testGenericNamedMixinInstantiation:static=[
  GenericNamedMixin.(0),
  checkTypeBound(4)]*/
testGenericNamedMixinInstantiation() => GenericNamedMixin<int, String>();

class Class {
  /*member: GenericClass.generative:static=[Object.(0)]*/
  const Class.generative();
}

class GenericClass<X, Y> {
  const GenericClass.generative();

  /*member: GenericClass.genericMethod:
   static=[
    Rti._bind(1),
    Rti._eval(1),
    _arrayInstanceType(1),
    _asBool(1),
    _asBoolQ(1),
    _asDouble(1),
    _asDoubleQ(1),
    _asInt(1),
    _asIntQ(1),
    _asNum(1),
    _asNumQ(1),
    _asObject(1),
    _asString(1),
    _asStringQ(1),
    _asTop(1),
    _generalAsCheckImplementation(1),
    _generalIsTestImplementation(1),
    _generalNullableAsCheckImplementation(1),
    _generalNullableIsTestImplementation(1),
    _installSpecializedAsCheck(1),
    _installSpecializedIsTest(1),
    _instanceType(1),
    _isBool(1),
    _isInt(1),
    _isNum(1),
    _isObject(1),
    _isString(1),
    _isTop(1),
    _setArrayType(2),
    findType(1),
    instanceType(1)],
   type=[
    inst:Closure,
    inst:JSArray<dynamic>,
    inst:JSBool,
    inst:JSExtendableArray<dynamic>,
    inst:JSFixedArray<dynamic>,
    inst:JSMutableArray<dynamic>,
    inst:JSNull,
    inst:JSUnmodifiableArray<dynamic>,
    inst:Map<GenericClass.X?,genericMethod.T>,
    param:Object?,
    param:genericMethod.T]
  */
  Map<X?, T> genericMethod<T>(T arg) => {null: arg};
}

/*member: Super.:static=[Object.(0)]*/
class Super {}

mixin Mixin1 {}

mixin Mixin2 {}

/*member: Sub.:static=[_Sub&Super&Mixin1&Mixin2.(0)]*/
class Sub extends Super with Mixin1, Mixin2 {}

class NamedMixin = Super with Mixin1, Mixin2;

/*member: GenericSuper.:static=[Object.(0)]*/
class GenericSuper<X1, Y1> {}

mixin GenericMixin1<X2, Y2> {}

mixin GenericMixin2<X3, Y3> {}

/*member: GenericSub.:
  static=[_GenericSub&GenericSuper&GenericMixin1&GenericMixin2.(0)]
*/
class GenericSub<X4, Y4> extends GenericSuper<X4, Y4>
    with GenericMixin1<X4, Y4>, GenericMixin2<X4, Y4> {}

class GenericNamedMixin<X5, Y5> = GenericSuper<X5, Y5>
    with GenericMixin1<X5, Y5>, GenericMixin2<X5, Y5>;
