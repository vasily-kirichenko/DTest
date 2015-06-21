module HexLiteral;

import std.conv;
import std.stdio;

auto hexImpl(byte length, string s) {
	return cast(immutable(ubyte)[])s;
}

template sha1(string s) {
	enum hex = hexImpl(20, s);
}

unittest {
	//writeln(sha1!"ffff");
	writeln(to!string(typeof(cast(immutable(ubyte)[])x"ff")));
}