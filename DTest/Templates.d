module Templates;

template isMonoid(T) {
	static if (__traits(compiles,
			{
				auto t1 = T.init;
				auto t2 = T.init;
				T zero = t1.mzero();
				T t3 = t1.mappend(t2);
			}))
		enum isMonoid = true;
	else 
		enum isMonoid = false;
}

class MList{
	int elem;
	MList next;
	this(int _elem, MList _next) {
		elem = _elem;
		next = _next;
	}
	auto mzero() { return new MList(0, null); }
	auto mappend(MList other) {
		next = other;
		return this;
	}
}

static assert(isMonoid!MList);

//template foo(T) if (isMonoid(T)) {
//	T foo(T t) {
//		auto x = t.mzero();
//		auto y = t.mzero();
//		return x.mappend(y);
//	}
//}
//auto x = foo!MList(new MList(0, null));