import std.stdio;
import qmctf.simple;

void main()
{
	auto tf = new Oscillatory!(real)([0.2L, 0.5L, 1.0L, 2.0L], 0.3);
	tf([0.3L, 0.3L, 0.3L, 0.3L]).writeln;
}
