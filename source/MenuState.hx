package;

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

	override public function create()
	{
		super.create();

		add(texts = new FlxSpriteContainer());

		for (i => item in items)
		{
			var text = new FlxText(0, 0, 0, item, textSize);
			text.ID = i;
			texts.add(text);
		}

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
		trace(items[selection]);
	};

	function changeSelection(amount = 0)
	{
		selection += amount;

		if (selection < 0) selection = items.length - 1;
		if (selection > items.length - 1) selection = 0;

		for (text in texts)
		{
			text.color = (selection == text.ID) ? 0xFFFFFF00 : 0xFFFFFFFF;
			text.y = text.ID * textSize;
		}
	}
}
