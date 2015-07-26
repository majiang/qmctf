module qmctf.simple;

import std.math, std.algorithm, std.range;

class Oscillatory(F=real)
{
	this (F[] a, F u)
	{
		this.u = u;
		this.a = a;
		immutable s = a.length;
		immutable F t0 = 2 * PI * u - (s & 3) * PI_2;
		F mI = 0;
		foreach (i; 0..(1u << s))
		{
			F t = t0;
			auto dir = 1;
			foreach (j, c; a)
				if (i >> j & 1)
					t += c;
				else
					dir *= -1;
			mI += t.cos() * dir;
		}
		I = mI / a.product();
	}
	F opCall(in F[] x)
	in
	{
		assert (x.length == a.length);
	}
	body
	{
		F t = 2 * PI * u;
		foreach (i, c; x)
			t += a[i] * c;
		return t.cos();
	}
private:
	F u;
	F[] a;
	immutable F I;
}

alias sum = reduce!"a+b";
alias product = reduce!"a*b";
