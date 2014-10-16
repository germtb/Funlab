%List tests

list = List([]);
assert(list.Count() == 0);

list.Add(0);
assert(list.Count() == 1);
assert(list.Get(1) == 0);

list.Add(1);
list.Add(2);
list.Add(3);
list.Add(4);

list.Remove(1);
assert(list.Get(1) == 1);

list.Remove(4);
assert(list.Get(list.Count()) == 3);

list.Remove(2);
assert(list.Get(2) == 3);

disp('All test passed');