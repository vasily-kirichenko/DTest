module VariadicFunc;

import std.conv;
import std.algorithm;

string toString(string sep = ", ", Args...)(Args args)
if (args.length > 0 && args.length < 4)
{
	string res;
	foreach (i, arg; args) {
		res ~= to!string(arg);
		if (i < args.length - 1)
			res ~= sep;
	}
	return res;
}

unittest {
	assert (toString(1, 2.1, "str") == "1, 2.1, str");
	//assert (toString(1, 2.1, "str", 3) == "1, 2.1, str");
}