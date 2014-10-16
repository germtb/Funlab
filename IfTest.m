% If tests

list = List([]);

If(false,@() list.Add(0));
assert(list.Count() == 0);

If(true,@() list.Add(0))
assert(list.Count() == 1);

disp('All test passed');