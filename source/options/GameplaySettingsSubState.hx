package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

using StringTools;

class GameplaySettingsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Gameplay Settings';
		rpcTitle = 'Gameplay Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option('Controller Mode',
			'Check this if you want to play with\na controller instead of using your Keyboard.',
			'controllerMode',
			'bool',
			false);
		addOption(option);

		//I'd suggest using "Downscroll" as an example for making your own option since it is the simplest here
		var option:Option = new Option('Downscroll', //Name
			'If checked, notes go Down instead of Up, simple enough.', //Description
			'downScroll', //Save data variable name
			'bool', //Variable type
			false); //Default value
		addOption(option);

		var option:Option = new Option('Middlescroll',
			'If checked, your notes get centered.',
			'middleScroll',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Opponent Notes',
			'If unchecked, opponent notes get hidden.',
			'opponentStrums',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Ghost Tapping',
			"If checked, you won't get misses from pressing keys\nwhile there are no notes able to be hit.",
			'ghostTapping',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Disable Reset Button',
			"If checked, pressing Reset won't do anything.",
			'noReset',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Anti Mash',
		"If spamming on keys you will get health loss. (if Bads or Shits.)",
		'spamKeysLossHealth',
		'bool',
		true);
		addOption(option);

		//old Idle must here.

		var option:Option = new Option('Hitsound Volume',
			'Funny notes does \"Tick!\" when you hit them."',
			'hitsoundVolume',
			'percent',
			0);
		addOption(option);
		option.scrollSpeed = 1.6;
		option.minValue = 0.0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		option.onChange = onChangeHitsoundVolume;

		var option:Option = new Option('Camera Speed Offset',
		'You want change camera speed if Low values will slowly else Higher values will make it faster.',
		'cameraSpeedSet',
		'int',
		10);
		option.scrollSpeed = 25;
		option.minValue = 2;
		option.maxValue = 70;
		addOption(option);

		var option:Option = new Option('Accuracy Mods :',
		'Change Accuracy Mods Rates or Timings',
		'accuracyModes',
		'string',
		'Default',
		['Default', 'Timing']);
		addOption(option);

		var option:Option = new Option('Rating Offset',
			'Changes how late/early you have to hit for a "Sick!"\nHigher values mean you have to hit later.',
			'ratingOffset',
			'int',
			0);
		option.displayFormat = '%vms';
		option.scrollSpeed = 30;
		option.minValue = -60;
		option.maxValue = 60;
		addOption(option);

		var option:Option = new Option('Marvelous!!! Hit Window',
			'Changes the amount of time you have\nfor hitting a "Marvelous!!!" in milliseconds.',
			'marvelousWindow', //shit sickWindow
			'int',
			25);
		option.displayFormat = '%vms';
		option.scrollSpeed = 15;
		option.minValue = 0;
		option.maxValue = 25;
		addOption(option);

        #if EXTEND_JUDGES_ALLOWED
		var option:Option = new Option('Fantasitc! Hit Window',
			'Changes the amount of time you have\nfor hitting a "Fantastic!!" in milliseconds.',
			'fantasticWindow',
			'int',
			45);
		option.displayFormat = '%vms';
		option.scrollSpeed = 20;
		option.minValue = 0;
		option.maxValue = 65;
		addOption(option);

		var option:Option = new Option('Epic! Hit Window',
			'Changes the amount of time you have\nfor hitting a "Epic!" in milliseconds.',
			'epicWindow',
			'int',
			80);
		option.displayFormat = '%vms';
		option.scrollSpeed = 25;
		option.minValue = 0;
		option.maxValue = 105;
		addOption(option);
		#end

        //Basically In Vanilla Hit Windows Dosen't Changed to 0 Extends Hit Windows Only.

		var option:Option = new Option('Sick! Hit Window',
			'Changes the amount of time you have\nfor hitting a "Sick!" in milliseconds.',
			'sickWindow',
			'int',
			120);
		option.displayFormat = '%vms';
		option.scrollSpeed = 30;
		option.minValue = 15;
		option.maxValue = 145;
		addOption(option);

        #if EXTEND_JUDGES_ALLOWED
		var option:Option = new Option('Cool! Hit Window',
			'Changes the amount of time you have\nfor hitting a "Sick!" in milliseconds.',
			'coolWindow',
			'int',
			170);
		option.displayFormat = '%vms';
		option.scrollSpeed = 30;
		option.minValue = 0;
		option.maxValue = 185;
		addOption(option);
		#end

		var option:Option = new Option('Good Hit Window',
			'Changes the amount of time you have\nfor hitting a "Good" in milliseconds.',
			'goodWindow',
			'int',
			200);
		option.displayFormat = '%vms';
		option.scrollSpeed = 35;
		option.minValue = 15;
		option.maxValue = 225;
		addOption(option);

		var option:Option = new Option('Bad Hit Window',
			'Changes the amount of time you have\nfor hitting a "Bad" in milliseconds.',
			'badWindow',
			'int',
			230);
		option.displayFormat = '%vms';
		option.scrollSpeed = 60;
		option.minValue = 15;
		option.maxValue = 265;
		addOption(option);

		var option:Option = new Option('Safe Frames',
			'Changes how many frames you have for\nhitting a note earlier or late.',
			'safeFrames',
			'float',
			10);//default value 10
		option.scrollSpeed = 5;
		option.minValue = 2;
		option.maxValue = 20;
		option.changeValue = 0.1;
		addOption(option);

		var option:Option = new Option('Start Idle',
		'After You Started It will working you.',
		'ForcedIdles',
		'bool',
		true);
		addOption(option);

		var option:Option = new Option('Camera Speed',
		'Game Camera Speeds To change',
		'cameraSpeeds',
		'float',
		1);
		option.scrollSpeed = 10;
		option.minValue = 0.1;
		option.maxValue = 5;
		option.changeValue = 0.1;
		addOption(option);

		var option:Option = new Option('Camera Move Offset',
		'Game Camera Moving Smooths',
		'cameraOffsets',
		'float',
		1);
		option.scrollSpeed = 10;
		option.minValue = 0.1;
		option.maxValue = 2;
		option.changeValue = 0.1;
		addOption(option);

		var option:Option = new Option('Tutorial Zoom Type',
		'In Tutorial Zooming When GF and BF',
		'zoomType',
		'string',
		'QuadInOut',
		['QuadInOut', 'ElasticInOut']);
		addOption(option);

		var option:Option = new Option('GF Hey Pose On Combos',
		'Girlfriends Will 50 Combos , 100 Combo , etc... Doing Hey Pose.',
		'gfoncomboheypose',
		'bool',
		true);
		addOption(option);

		super();
	}

	function onChangeHitsoundVolume()
	{
		FlxG.sound.play(Paths.sound('hitsound'), ClientPrefs.hitsoundVolume);
	}
}