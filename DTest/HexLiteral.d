module HexLiteral;

import std.conv;
import std.stdio;
import std.range;
import std.algorithm;
import std.string;

struct HexString {
	private static auto getValidChars() {
		bool[dchar] res;
		foreach(c; iota(0, 16, 1).map!(x => to!dchar(format("%01X", x))))
			res[c] = true;
		return res;
	}
	static bool isValid(const string str) {
		auto validChars = getValidChars();
		return str.filter!(x => !(x in validChars)).count == 0;
	}
}

template sha1(string hexStr) {
	static if (hexStr.length != 40)
		static assert (0, "Hex string should be of length 40, but it's length is " 
						  ~ to!string(hexStr.length) ~ ".");
	static if (!HexString.isValid(hexStr))
		static assert (0, "Invalid char in hex string.");
	enum sha1 = 
		hexStr
		.chunks(2)
		.map!(twoDigits => twoDigits.parse!ubyte(16))
		.array();
}

unittest {
	auto x = sha1!"0102030405060708090A0B0C0D0E0F1012131415";
}