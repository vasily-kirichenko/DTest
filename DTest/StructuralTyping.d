module StructuralTyping;

struct House {
	int length;
	this(int _length) {
		length = _length;
	}
	@disable this();
}

class Cat {
	int length;
	this(int _length) {
		length = _length;
	}
}

auto voldemont(int length) {
	struct Inner {
		int length;
		this(int _lenght) {
			length = _lenght;
		}
	}
	return Inner(length);
}

int size(T)(T t) {
	return t.length;
}

int totalSize(T...)(T ts) {
	int res;
	foreach (t; ts)
		res += t.length;
	return res;
}

unittest {
	auto house = House(10);
	assert (size(house) == 10);
	auto cat = new Cat(11);
	assert (size(cat) == 11);
	auto voldemont = voldemont(12);
	assert (size(voldemont) == 12);
	assert (totalSize(house, cat, voldemont) == 33);
}