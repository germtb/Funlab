string = 'Hello world, this is a sentence';
tokens = SplitStringBy(string,' ');
assert(strcmp(tokens.Get(1).array,'Hello'));
assert(strcmp(tokens.Get(2).array,'world,'));
assert(strcmp(tokens.Get(3).array,'this'));
assert(strcmp(tokens.Get(4).array,'is'));
assert(strcmp(tokens.Get(5).array,'a'));
assert(strcmp(tokens.Get(6).array,'sentence'));

disp('All test passed');