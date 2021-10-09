package wasp.widgets;

import wasp.icon.BleStatusIcon;
import wasp.icon.NotificationIcon;
import wasp.util.PointTuple;

class NotificationBar implements IWidget {
	var pos:PointTuple;

	public function new(x:Int = 0, y:Int = 0) {
		pos = PointTuple.make(x, y);
	}

	public function draw():Void update();

	public function update():Void {
		var draw = Watch.drawable;

		if (Watch.connected()) {
			draw.blit(BleStatusIcon, pos.x, pos.y, Manager.theme('ble'));

			if (Manager.notifications.length > 0)
				draw.blit(NotificationIcon, pos.x+22, pos.y, Manager.theme('notify-icon'));
			else
				draw.fill(0, pos.x+22, pos.y, 30, 32);

		} else if (Manager.notifications.length > 0) {
			draw.blit(NotificationIcon, pos.x, pos.y, Manager.theme('notify-icon'));
			draw.fill(0, pos.x + 30, pos.y, 22, 32);
		} else {
			draw.fill(0, pos.x, pos.y, 52, 32);
		}
	}
}
