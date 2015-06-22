module HexLiteral;

import std.conv;
import std.stdio;
import std.conv;
import std.array;
import std.range;
import std.algorithm;
import std.string;

//struct HexChar {
//	private static immutable bool[char] validChars;
//	static this() {
//		foreach(c; iota(0, 16, 1).map!(x => to!char(format("%01X", x))))
//			validChars[c] = true;
//	}
//	static bool isHex(char c) { 
//		if (c in validChars) return true;
//		else return false;
//	}
//}

template sha1(string hexStr) {
	static if (hexStr.length != 40)
		static assert (0, "Hex string should be of length 40, but it's length is " 
						  ~ to!string(hexStr.length) ~ ".");
	enum sha1 = 
		hexStr
		.chunks(2)
		.map!(twoDigits => twoDigits.parse!ubyte(16))
		.array();
}

unittest {
	auto x = sha1!"0102030405060708090A0B0C0D0E0F101213141g";
}