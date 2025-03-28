// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/*member: main:[null|powerset=1]*/
main() {
  exposeThis1();
  exposeThis2();
  exposeThis4();
  exposeThis5();
}

////////////////////////////////////////////////////////////////////////////////
// Class with two initializers. No closure.
////////////////////////////////////////////////////////////////////////////////

class Class1 {
  // The inferred type of the field does _not_ include `null` because `this`
  // is _not_ been exposed.
  /*member: Class1.field1:[exact=JSUInt31|powerset=0]*/
  var field1;
  /*member: Class1.field2:[exact=JSUInt31|powerset=0]*/
  var field2;

  /*member: Class1.:[exact=Class1|powerset=0]*/
  Class1() : field1 = 42, field2 = 87;
}

/*member: exposeThis1:[exact=Class1|powerset=0]*/
exposeThis1() => Class1();

////////////////////////////////////////////////////////////////////////////////
// Class with initializers in the constructor body. No closure.
////////////////////////////////////////////////////////////////////////////////

class Class2 {
  /*member: Class2.field1:[exact=JSUInt31|powerset=0]*/
  var field1;
  /*member: Class2.field2:[exact=JSUInt31|powerset=0]*/
  var field2;

  /*member: Class2.:[exact=Class2|powerset=0]*/
  Class2() {
    /*update: [exact=Class2|powerset=0]*/
    field1 = 42;
    /*update: [exact=Class2|powerset=0]*/
    field2 = 87;
  }
}

/*member: exposeThis2:[exact=Class2|powerset=0]*/
exposeThis2() => Class2();

////////////////////////////////////////////////////////////////////////////////
// Class with closure after two initializers in the constructor body.
////////////////////////////////////////////////////////////////////////////////

class Class4 {
  /*member: Class4.field1:[exact=JSUInt31|powerset=0]*/
  var field1;
  /*member: Class4.field2:[exact=JSUInt31|powerset=0]*/
  var field2;

  /*member: Class4.:[exact=Class4|powerset=0]*/
  Class4() : field1 = 42, field2 = 87 {
    /*[exact=JSUInt31|powerset=0]*/
    () {
      return 42;
    };
  }
}

/*member: exposeThis4:[exact=Class4|powerset=0]*/
exposeThis4() => Class4();

////////////////////////////////////////////////////////////////////////////////
// Class with closure between two initializers in the constructor body.
////////////////////////////////////////////////////////////////////////////////

class Class5 {
  /*member: Class5.field1:[exact=JSUInt31|powerset=0]*/
  var field1;
  /*member: Class5.field2:[null|exact=JSUInt31|powerset=1]*/
  var field2;

  /*member: Class5.:[exact=Class5|powerset=0]*/
  Class5() {
    /*update: [exact=Class5|powerset=0]*/
    field1 = 42;
    /*[exact=JSUInt31|powerset=0]*/
    () {
      return 42;
    };
    /*update: [exact=Class5|powerset=0]*/
    field2 = 87;
  }
}

/*member: exposeThis5:[exact=Class5|powerset=0]*/
exposeThis5() => Class5();
