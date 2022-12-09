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

class VisualsUISubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Visuals and UI';
		rpcTitle = 'Visuals & UI Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option('Note Splashes',
			"If unchecked, hitting \"Sick!\" notes won't show particles.",
			'noteSplashes',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Hide HUD',
			'If checked, hides most HUD elements.',
			'hideHud',
			'bool',
			false);
		addOption(option);
		
		var option:Option = new Option('Time Bar:',
			"What should the Time Bar display?",
			'timeBarType',
			'string',
			'Time Left',
			['Time Left', 'Time Elapsed', 'Song Name', 'Song + Time Left', 'Disabled']);
		addOption(option);

		var option:Option = new Option('Menu Camera Speed',
		"Values are can change on the menu camera speed thing.",
		'menuCamSpeed',
		'float',
		7.5);
		option.scrollSpeed = 5;
		option.minValue = 5;
		option.maxValue = 20;
		option.changeValue = 0.1;
		addOption(option);

		var option:Option = new Option('Water Marks Visible',
		'If Unchecked, They will Not Show.',
		'watermarksVisible',
		'bool',
		true);
		addOption(option);

		var option:Option = new Option('Combos Show Sets :',
		"Vanilla or Psycle Versions If Psycle Version It's will UP. (StepMina But isn't Scale Later will Fix This.)",
		'combosMoves',
		'string',
		'Vanilla',
		['Vanilla', 'Psycle', 'SM Mod']);
		addOption(option);

		var option:Option = new Option('Judgments Scales',
		"if checked they are will scaling (Custom Mod If Not StepMina)",
		'judgesScale',
		'bool',
		false);
		addOption(option);

		var option:Option = new Option('Combo,Timing Type :',
		"Default:Sprite , Text Mod , Both Show.",
		'combotiming',
		'string',
		'Default',
		['Default', 'Text', 'Both']);
		addOption(option);

		var option:Option = new Option('Flashing Lights',
			"Uncheck this if you're sensitive to flashing lights!",
			'flashing',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Health Bar Transparency',
			'How much transparent should the health bar and icons be.',
			'healthBarAlpha',
			'percent',
			1);
		option.scrollSpeed = 1.6;
		option.minValue = 0.0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		addOption(option);

		var option:Option = new Option('Hold Notes Transparceny',
		'Hold Notes That',
		'sustainNoteAlpha',
		'percent',
		0.6);
		option.scrollSpeed = 1.5;
		option.minValue = 0.3;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		addOption(option);

		var option:Option = new Option('Note Splashes Transparceny :',
		'How much transparent should the Note Splashes be.',
		'splashAlpha',
		'percent',
		0.6);
		option.scrollSpeed = 1.6;
		option.minValue = 0.3;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		addOption(option);

		var option:Option = new Option('LaneUnderlay Player :',
		'How Transparceny Your Lane.',
		'LaneUnderlayPlayer',
		'percent', 
		0);
		option.scrollSpeed = 1.5;
		option.minValue = 0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		addOption(option);

		var option:Option = new Option('LaneUnderlay Opponent :',
		'How Transparceny Opponent Lane.',
		'LaneUnderlayOpponent',
		'percent', 
		0);
		option.scrollSpeed = 1.5;
		option.minValue = 0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		addOption(option);

		var option:Option = new Option('Health Bar Colors',
		'Change Character Health Bar To Old Else Not',
		'healthBarColors',
		'bool',
		true);
		addOption(option);
		
		#if !mobile
		var option:Option = new Option('FPS Counter',
			'If unchecked, hides FPS Counter.',
			'showFPS',
			'bool',
			true);
		addOption(option);
		option.onChange = onChangeFPSCounter;
		#end

		/*var option:Option = new Option('Version Display',
		'If unchecked, hides versions on FPS Counter.',
		'showVersionDisplay',
		'bool',
		true);
	    addOption(option);
		option.onChange = */

		
		var option:Option = new Option('Pause Screen Song:',
			"What song do you prefer for the Pause Screen?",
			'pauseMusic',
			'string',
			'Tea Time',
			['None', 'Breakfast', 'Tea Time']);
		addOption(option);
		option.onChange = onChangePauseMusic;

		var option:Option = new Option('Menu Musics :',
		    "Songs For Menu -Aplha- (Reworked)",
			'MenuMusics',
			'string',
			'FreakyMenu',
			['FreakyMenu', 'FunkyMenu']);
		addOption(option);
		option.onChange = onChangeMenuMusic;
		
		#if CHECK_FOR_UPDATES
		var option:Option = new Option('Check for Updates',
			'On Release builds, turn this on to check for updates when you start the game.',
			'checkForUpdates',
			'bool',
			true);
		addOption(option);
		#end

		super();
	}

	var changedMusic:Bool = false;
	function onChangePauseMusic()
	{
		if(ClientPrefs.pauseMusic == 'None')
			FlxG.sound.music.volume = 0;
		else
			FlxG.sound.playMusic(Paths.music(Paths.formatToSongPath(ClientPrefs.pauseMusic)));

		changedMusic = true;
	}

	function onChangeMenuMusic()
	{
		if(ClientPrefs.MenuMusics == 'FreakyMenu')
		FlxG.sound.playMusic(Paths.music('FreakyMenu'));
		else if(ClientPrefs.MenuMusics == 'FunkyMenu')
		FlxG.sound.playMusic(Paths.music('FunkyMenu'));

		if(ClientPrefs.MenuMusics == null) {
			FlxG.sound.playMusic(Paths.music('FreakyMenu'));
		}
	}

	override function destroy()
	{
		if(changedMusic && ClientPrefs.MenuMusics == 'FreakyMenu') 
		FlxG.sound.playMusic(Paths.music('freakyMenu'));
		else if(changedMusic && ClientPrefs.MenuMusics == 'FunkyMenu')
		FlxG.sound.playMusic(Paths.music('FunkyMenu'));
		super.destroy();
	}

	#if !mobile
	function onChangeFPSCounter()
	{
		if(Main.fpsVar != null)
			Main.fpsVar.visible = ClientPrefs.showFPS;
	}
	#end

	/*function onChangeVersionDisplay()
	{
		if(Main.fpsVar != null)
		    Main.fpsVar.visible =
	}*/
}