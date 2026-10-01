package;

import flixel.FlxObject;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.group.FlxSpriteContainer;
import flixel.FlxState;

class MenuState extends FlxState
{
	var items = ['Sodic 1',];

	var texts:FlxSpriteContainer;
	final textSize = 16;

	var selection = 0;

	var camFollow:FlxObject;

	override public function create()
	{
		super.create();

		add(texts = new FlxSpriteContainer());

		for (i => item in items)
		{
			var text = new FlxText(10, 0, 0, item, textSize);
			text.ID = i;
			texts.add(text);
		}

		FlxG.camera.follow(camFollow = new FlxObject(FlxG.width / 2), LOCKON, 0.04);

		changeSelection(0);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.anyJustPressed([A, LEFT])) changeSelection(-1);
		if (FlxG.keys.anyJustPressed([D, RIGHT])) changeSelection(1);
		if (FlxG.keys.anyJustPressed([ENTER])) select();
	}

	function select()
	{
		var item = items[selection].toLowerCase();
		switch (item)
		{
			default: trace('Unimplmeneted : $item');
		}
	};

	function changeSelection(amount = 0)
	{
		selection += amount;

		if (selection < 0) selection = items.length - 1;
		if (selection > items.length - 1) selection = 0;

		for (text in texts)
		{
			text.color = (selection == text.ID) ? 0xFFFFFF00 : 0xFFFFFFFF;
			text.y = 10 + (text.ID * textSize);

			if (selection == text.ID) camFollow.y = (FlxG.height / 2) + text.y;
		}
	}
}
