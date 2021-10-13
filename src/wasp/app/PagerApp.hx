package wasp.app;

import python.Syntax;
import python.Syntax.opFloorDiv;

import wasp.event.TouchEvent;
import wasp.icon.AppIcon;
import wasp.widgets.ScrollIndicator;

using python.NativeStringTools;

@:native('PagerApp')
class PagerApp extends BaseApplication {
	var msg:String;
	var scroll:ScrollIndicator;
	var page:Int;
	var numPages:Null<Int>;
	var chunks:Array<Int>;

	public function new(msg:String) {
		NAME = "Pager";
		ICON = AppIcon;

		this.msg = msg;
		scroll = new ScrollIndicator();
	}

	override public function foreground():Void {
		Wasp.system.requestEvent(EventMask.SWIPE_UPDOWN);
		redraw();
	}

	override public function background():Void {
		chunks = null;
		numPages = null;
	}

	override public function swipe(event:TouchEvent):Bool {
		if (event.type == UP) {
			if (page >= numPages) {
				Wasp.system.navigate(BACK);
				return false;
			}

			page++;
		} else {
			if (page <= 0) {
				Watch.vibrator.pulse();
				return false;
			}

			page--;
		}

		draw();
		return false;
	}

	function redraw():Void {
		page = 0;
		chunks = Watch.drawable.wrap(msg, 240);
		numPages = opFloorDiv(chunks.length - 2, 9);
		draw();
	}

	function draw():Void {
		Watch.display.mute(true);
		Watch.drawable.set_color(0xffff);
		Watch.drawable.fill();

		var i = page * 9;
		var j = i + 11;
		var chunks = chunks.slice(i, j);

		for (i in 0...(chunks.length - 1)) {
			var sub = Syntax.substr(msg, chunks[i], chunks[i+1]).rstrip();
			Watch.drawable.string(sub, 0, 24*i);
		}

		scroll.up = page > 0;
		scroll.down = page < numPages;
		scroll.draw();

		Watch.display.mute(false);
	}
}
