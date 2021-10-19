package wash.widgets;

import wasp.Watch;
import wash.icon.DownArrow;
import wash.icon.UpArrow;
import wash.util.PointTuple;

class ScrollIndicator {
	public var up:Bool;
	public var down:Bool;
	public var pos:PointTuple;

	public function new(x:Int = 240-18, y:Int = 240-24) {
		pos = PointTuple.make(x, y);
		up = true;
		down = true;
	}

	public function draw():Void {
		update();
	}

	public function update():Void {
		var color = Wash.system.theme.scrollIndicator;

		if (up) Watch.drawable.blit(UpArrow, pos.x, pos.y, color);
		if (down) Watch.drawable.blit(DownArrow, pos.x, pos.y+13, color);
	}
}