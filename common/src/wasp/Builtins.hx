package wasp;

import python.Bytearray;
import python.Bytes;
import python.NativeIterator;
import python.Tuple;
// import python.lib.io.RawIOBase;
import python.lib.io.BufferedWriter;
import python.lib.io.BufferedReader;

@:pythonImport("builtins")
extern class Builtins {
	@:overload(function(x:Any, base:Int):Int {})
	static function int(x:Any):Int;
	static function str(o:Any):String;
	static function eval(expression:String):Any;
	static function print(o:Any):Void;
	static function type(o:Any):Class<Any>;
	static function chr(c:Int):String;

	// @:overload(function(f:Set<Dynamic>):Int {})
	// @:overload(function(f:StringBuf):Int {})
	@:overload(function(f:Array<Dynamic>):Int {})
	// @:overload(function(f:Dict<Dynamic, Dynamic>):Int {})
	@:overload(function(f:Bytes):Int {})
	// @:overload(function(f:DictView<Dynamic>):Int {})
	@:overload(function(f:Bytearray):Int {})
	@:overload(function(f:Tuple<Dynamic>):Int {})
	static function len(x:String):Int;

	static function next<T>(it:NativeIterator<T>):T;
	static function divmod(a:Int, b:Int):Tuple2<Int, Int>;

	// static function open(file:String, mode:String):RawIOBase;

	extern inline static function openRead(file:String):BufferedReader
		return (untyped open)(file, 'rb');

	extern inline static function openWrite(file:String):BufferedWriter
		return (untyped open)(file, 'wb');
}