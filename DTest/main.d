module main;

import std.stdio;
import std.string;
import std.algorithm;

enum string[] names = [ 
	"Vicky Pollard", 
	"Keith Pollard", 
	"Ian Smith", 
	"Dave Pollard", 
	"Maria Osawa", 
	"Mark Kelly", 
	"John Pollard", 
	"Sarah Kelly"
];

struct person { 
	string first; 
	string last; 
};

string distribute(const string[] names) { 
	assert(names.length%2==0); 
	int[string] familyCount; 
	person[] people;
	
	// create people and max family count 
	int maxFamilyMembers = 0; 
	foreach(name;names) { 
		auto split = split(name); 
		assert(split.length==2); 
		auto p = person(split[0],split[1]); 
		int count; 
		if(p.last in familyCount) count = ++familyCount[p.last]; 
		else count = familyCount[p.last] = 1; 
		if(count > maxFamilyMembers) maxFamilyMembers = count; 
		people ~= p; 
	}
	
	// sort by family count 
	people.sort!((p1,p2) => familyCount[p1.last] > familyCount[p2.last]);
	
	string result; 
	// assign presents using max count as an offset 
	for(int i=0; i<people.length; i++){ 
		auto source = people[i]; 
		auto dest = people[(i+maxFamilyMembers)%people.length]; 
		result ~= join([source.first," ",source.last," -> ",dest.first," ",dest.last,"\n"]); 
	}
	
	return result; 
}

void main(string[] args)
{
	//writeln("Hello World!");
	//stdin.readln();
}