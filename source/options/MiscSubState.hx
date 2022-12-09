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

class MiscSubState extends BaseOptionsMenu
{
    public function new()
    {
        title = 'Misc UI';
		rpcTitle = 'More UI Settings Menu'; //for Discord Rich Presence


        var option:Option = new Option('BotPlay Text Auto Invisible',
		"If unchecked, Will not make auto invisible.",
		'botPlayAutoVisible',
		'bool',
		true);
		addOption(option);

        var option:Option = new Option('Timing Visible',
		"If unchecked, Will Not show then.",
		'timingVisible',
		'bool',
		true);
		addOption(option);

		var option:Option = new Option('Combo Visible',
		"If unchecked, Will Not show then.",
		'comboVisible',
		'bool',
		true);
		addOption(option);

		var option:Option = new Option('Rating Visible',
		"If unchecked, Will Not show then.",
		'ratingVisible',
		'bool',
		true);
		addOption(option);

		var option:Option = new Option('Number Score Visible',
		"If unchecked, Will Not show then.",
		'numScoreVisible',
		'bool',
		true);
		addOption(option);

		var option:Option = new Option('Old Score bar',
		"Back To Original???",
		'oldScoreBarEnabled',
		'bool',
		false);
		addOption(option);

		var option:Option = new Option('New Score Bar',
		"If unchecked, Hide New Score Text.",
		'newScore',
		'bool',
		true);
		addOption(option);

		var option:Option = new Option('Rating Text',
		"If unchecked, Hide Rating Text.",
		'newRating',
		'bool',
		true);
		addOption(option);

		var option:Option = new Option('Upgraded Score Bar',
		"If unchecked, They will won't show.",
		'KEscorebar',
		'bool',
		true);
		addOption(option);

		var option:Option = new Option('Judgment Counter',
		"Its Did Not Hide the Counters while unchecked.",
		'judgCounters',
		'bool',
		false);
		addOption(option);

		var option:Option = new Option('Combo Numbers Color',
		"Working on Color with Combos Number. (If checked.)",
		'comboNumberColor',
		'bool',
		false);
		addOption(option);

		var option:Option = new Option('Combo Sprite Color :',
		"You Can Change The Combo Sprite Colors (Default,Judgments,Disabled)",
		'comboSprColors',
		'string',
        'Default',
		['Default', 'Judgments', 'Disabled']);
		addOption(option);

		var option:Option = new Option('Timing Show',
		"Show the Hit times in 'ms'. (If unchecked Will not show.)",
		'msTimingNum',
		'bool',
		true);
		addOption(option);

		var option:Option = new Option('Rates On Camhud',
		'They Are will On Cam Hud. (If checked.)',
		'ratesOnHud',
		'bool',
		true);
		addOption(option);

		var option:Option = new Option('Icon Bops :',
		"You Can Now Change The Icon Bops.",
		'iconScale',
		'string',
		'New Scale',
		['New Scale', 'Old Scale', 'Very Old Scale', 'Week 7', 'Rework Old', 'Docks Ultimate', 'Fast New Scale', 'Disabled']);
		addOption(option);

		var option:Option = new Option('Icon Extend Scale',
		"If checked, Icons will over scale in last beat hit.",
		'iconOverScale',
		'bool',
		false);
		addOption(option);

		/*var option:Option = new Option('Icon Old Scale',
		"If checked, Icons working on the old versions. (Before This Engine.)",
		'oldScale',
		'bool',
		false);
		addOption(option);*/

		/*var option:Option = new Option('Icon Old Scaling Options',
		"There is a Two Options for scaling style",
		'iconOldScaling',
		'bool',
		true);
		addOption(option);*/

		var option:Option = new Option('Icon Bopping Option :',
		"Change The Scaling",
		'newScaling',
		'string',
		'Default',
		['Default', 'Old', 'Static', 'Black', 'Broke', 'False Fix']);
		addOption(option);

		var option:Option = new Option('Icon Zoom Lerp',
		"Default ZoomLerp : 0.09 , If Checked Icon Zoom Will Changed",
		'iconZoomlerp',
		'bool',
		false);
		addOption(option);

		var option:Option = new Option('New Scale Custom',
		"Custom Scaling For Icons in game playing on New",
		'iconNewScaleCustom',
		'int',
		0);
		option.scrollSpeed = 20;
		option.minValue = -10;
		option.maxValue = 30;
		addOption(option);

		var option:Option = new Option('Old Scale Custom',
		"Custom Scaling For Icons in game playing on Old",
		'iconOldScaleCustom',
		'int',
		0);
		option.scrollSpeed = 20;
		option.minValue = -10;
		option.maxValue = 30;
		addOption(option);

		var option:Option = new Option('Winning Icons',
		"If unchecked they are not.",
		'winningIcons',
		'bool',
		true);
		addOption(option);

        var option:Option = new Option('Score Text Zoom on Hit',
			"If unchecked, disables the Score text zooming\neverytime you hit a note.",
			'scoreZoom',
			'bool',
			true);
		addOption(option);

        var option:Option = new Option('Time Text Zoom on Beat Hit',
		"If unchecked, disables the Time Text zooming while Beat Hit. (Oh No Golden Apple!)",
		'timeZoom',
		'bool',
		true);
		addOption(option);

		var option:Option = new Option('Camera Zooms',
			"If unchecked, the camera won't zoom in on a beat hit.",
			'camZooms',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Extra Camera Zooms :',
		"Can change : 2 Beats or Every Beats  (You can Disabled it too)",
		'excamzoom',
		'string',
		'2 Beats',
		['2 Beats', 'Every Beats', 'Disabled']);
		addOption(option);

		var option:Option = new Option('Old Camera Zooms',
		"If checked, camera zooming speeds following with FPS.",
		'oldCamzoom',
		'bool',
		false);
		addOption(option);

        super();
    }
}