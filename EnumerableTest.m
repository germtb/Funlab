%Enumerable tests

e0 = Enumerable([]);
assert(e0.Count() == 0);

e1 = Enumerable([1,2,3]);
assert(e1.Sum() == 6);

e2 = e1.Map(@(x) x*2);
assert(e2.Sum() == 12);

multiply = @(x,y)x*y;
assert(e1.Reduce(multiply,1) == 6);

e3 = e1.Filter(@(x) x >= 2);
assert(e3.Sum() == 5);

e4 = e1.Concat(4);
assert(e1.Sum() + 4 == e4.Sum()); 

assert(e1.All(@(x) x < 100));
assert(e1.Any(@(x) x > 0));

assert(e1.Average() == 2);

e5 = e1.Zip(e1,multiply);
assert(e5.Sum() == 14);

disp('All test passed')