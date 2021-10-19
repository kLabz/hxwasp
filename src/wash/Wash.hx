package wash;

@:native('Wasp')
class Wash {
	@:keep
	public static var system(default, null):Manager;

	@:keep
	public static function init():Void {
		if (system == null) {
			system = new Manager();
			system.init();
		}
	}

	@:keep
	public static function start():Void {
		init();
		system.schedule(true);
	}
}