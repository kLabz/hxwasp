package wasp.app;

import python.Bytes;

import wasp.event.TouchEvent;

class BaseApplication implements IApplication {
	public var NAME(default, null):String;
	public var ICON(default, null):Bytes;

	public function foreground():Void {}
	public function background():Void {}
	public function sleep():Bool return false;
	public function wake():Void {}
	public function tick(ticks:Int):Void {}
	public function touch(event:TouchEvent):Void {}
	public function swipe(event:TouchEvent):Bool return true;
	public function press(eventType:EventType, state:Bool):Bool return true;
}