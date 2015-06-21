module GetterMixin;

mixin template Getters() 
{
	auto opDispatch(string name)() 
    if (name.length > 3 && name[0..3] == "get")
	{
		enum string member = name[3..$];
		static if (__traits(compiles, mixin ("is(typeof(this." ~ member ~ "))")))
			mixin ("return " ~ member ~ ";");
		else static assert (0, "Type does not have '" ~ member ~ "' member.");
	}
}

class Getter {
	private int i;
	private double f;
	this(int _i, double _f) { i = _i; f = _f; }
	mixin Getters;
}

struct Struct {
	private string k = "foo";
	mixin Getters;
}

auto getV(string k) {
	struct Inner {
		private string k;
		mixin Getters;
	}
	auto i = Inner();
	i.k = k;
	return i;
}

unittest {
	auto getter = new Getter(2, 3);
	assert (getter.geti == 2);
	assert (getter.getf == 3);
	auto s = Struct();
	assert (s.getk == "foo");
	auto v = getV("bar");
	assert (v.getk == "bar");
}