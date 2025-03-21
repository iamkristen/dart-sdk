// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
// Redirection constructors must not be cyclic.

class A {
  var x;
  A(x) : this(0);
  //     ^^^^^^^
  // [analyzer] COMPILE_TIME_ERROR.RECURSIVE_CONSTRUCTOR_REDIRECT
  // [cfe] Redirecting constructors can't be cyclic.
}

main() {
  new A(10);
}
