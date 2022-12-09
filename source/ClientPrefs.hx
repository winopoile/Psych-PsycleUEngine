package;

import flixel.FlxG;
import flixel.util.FlxSave;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

class ClientPrefs {
    public static var msTimingNum:Bool = true;
	public static var timeZoom:Bool = true;
	public static var newScore:Bool = true;
	public static var newRating:Bool = true;
    public static var ratesOnHud:Bool = true;
	public static var iconScale:String = 'New Scale';
	public static var excamzoom:String = '2 Beats';
	public static var iconOverScale:Bool = false;
	public static var judgCounters:Bool = false;
	public static var comboNumberColor:Bool = false;
	//public static var oldScale:Bool = false; If I want to add this I will change to string here
	public static var KEscorebar:Bool = true;
	public static var oldIdle:Bool = false;
	public static var timingVisible:Bool = true;
	public static var comboVisible:Bool = true;
	public static var ratingVisible:Bool = true;
	public static var cameraSpeedSet:Int = 10;
	public static var menuCamSpeed:Float = 7.5;
	public static var iconScaleTimes:Float = 0; 
	public static var newIconScaletimes:Int = 0;
	public static var iconOldScaleCustom:Int = 0;
	public static var iconNewScaleCustom:Int = 0;
	public static var botPlayAutoVisible:Bool = true;
	//public static var iconOldScaling:Bool = true;
	public static var numScoreVisible:Bool = true;
	public static var comboSprColors:String = 'Default';
	public static var oldScoreBarEnabled:Bool = false;
	public static var newScaling:String = 'Default';
	public static var sustainNoteAlpha:Float = 0.6;
	public static var NotesMultiPAlpha:Float = 0.6;
	public static var MenuMusics:String = 'FreakyMenu';
	public static var ForcedIdles:Bool = true;
	public static var cameraSpeeds:Float = 1;
	public static var cameraOffsets:Float = 1;
	public static var zoomType:String = 'QuadInOut';
	public static var combosMoves:String = 'Vanilla';
	public static var spamKeysLossHealth:Bool = true;
	public static var accuracyModes:String = 'Default';
	public static var gfoncomboheypose:Bool = true;
	public static var watermarksVisible:Bool = true;
	public static var judgesScale:Bool = false;
	public static var combotiming:String = 'Default';
	public static var disableText:Bool = false;
	public static var LaneUnderlayPlayer:Float = 0;//Lay Beginning Broke The Engine
	public static var LaneUnderlayOpponent:Float = 0;//Dude Stuck on Null
	public static var iconZoomlerp:Bool = false;
	public static var healthBarColors:Bool = true;
	public static var winningIcons:Bool = true;
	public static var oldCamzoom:Bool = false;
	//public static var showVersionDisplay:Bool = true;
	//public static var timingshow:String = 'Default';
	//public static var comboshow:String = 'Default';
	//public static var idleDoBeat:String = 'Default';
	public static var splashAlpha:Float = 0.6;
	//public static var UIs:String = 'Default';
	//public static var engineGame:String = 'Default';
	//public static var camLerp:Float = 0.14;
	//Soon
	//psycle engine end
	public static var downScroll:Bool = false;
	public static var middleScroll:Bool = false;
	public static var opponentStrums:Bool = true;
	public static var showFPS:Bool = true;
	public static var flashing:Bool = true;
	public static var globalAntialiasing:Bool = true;
	public static var noteSplashes:Bool = true;
	public static var lowQuality:Bool = false;
	public static var framerate:Int = 60;
	public static var cursing:Bool = true;
	public static var violence:Bool = true;
	public static var camZooms:Bool = true;
	public static var hideHud:Bool = false;
	public static var noteOffset:Int = 0;
	public static var arrowHSV:Array<Array<Int>> = [[0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]];
	public static var imagesPersist:Bool = false;
	public static var ghostTapping:Bool = true;
	public static var timeBarType:String = 'Time Left';
	public static var scoreZoom:Bool = true;
	public static var noReset:Bool = false;
	public static var healthBarAlpha:Float = 1;
	public static var controllerMode:Bool = false;
	public static var hitsoundVolume:Float = 0;
	public static var pauseMusic:String = 'Tea Time';
	public static var checkForUpdates:Bool = true;
	public static var gameplaySettings:Map<String, Dynamic> = [
		'scrollspeed' => 1.0,
		'scrolltype' => 'multiplicative', 
		// anyone reading this, amod is multiplicative speed mod, cmod is constant speed mod, and xmod is bpm based speed mod.
		// an amod example would be chartSpeed * multiplier
		// cmod would just be constantSpeed = chartSpeed
		// and xmod basically works by basing the speed on the bpm.
		// iirc (beatsPerSecond * (conductorToNoteDifference / 1000)) * noteSize (110 or something like that depending on it, prolly just use note.height)
		// bps is calculated by bpm / 60
		// oh yeah and you'd have to actually convert the difference to seconds which I already do, because this is based on beats and stuff. but it should work
		// just fine. but I wont implement it because I don't know how you handle sustains and other stuff like that.
		// oh yeah when you calculate the bps divide it by the songSpeed or rate because it wont scroll correctly when speeds exist.
		'songspeed' => 1.0,
		'healthgain' => 1.0,
		'healthloss' => 1.0,
		'instakill' => false,
		'practice' => false,
		'botplay' => false,
		'opponentplay' => false,
		'healthop' => true,
		'cheatmod' => false,
		'sandbox' => false
	];

	public static var comboOffset:Array<Int> = [0, 0, 0, 0];
	public static var statusOffset:Array<Int> = [0, 0, 0, 0];
	public static var ratingOffset:Int = 0;
	public static var marvelousWindow:Int = 25;//40 interval in hits next version will patch it.
	public static var fantasticWindow:Int = 65;//Basic 45
	public static var epicWindow:Int = 105;//80*/
	public static var sickWindow:Int = 145;//120
	public static var coolWindow:Int = 185;//170*/
	public static var goodWindow:Int = 225;//200
	public static var badWindow:Int = 265;//230
	public static var safeFrames:Float = 20;

	//Every key has two binds, add your key bind down here and then add your control on options/ControlsSubState.hx and Controls.hx
	public static var keyBinds:Map<String, Array<FlxKey>> = [
		//Key Bind, Name for ControlsSubState
		'note_left'		=> [A, LEFT],
		'note_down'		=> [S, DOWN],
		'note_up'		=> [W, UP],
		'note_right'	=> [D, RIGHT],
		
		'ui_left'		=> [A, LEFT],
		'ui_down'		=> [S, DOWN],
		'ui_up'			=> [W, UP],
		'ui_right'		=> [D, RIGHT],
		
		'accept'		=> [SPACE, ENTER],
		'back'			=> [BACKSPACE, ESCAPE],
		'pause'			=> [ENTER, ESCAPE],
		'reset'			=> [R, NONE],
		
		'volume_mute'	=> [ZERO, NONE],
		'volume_up'		=> [NUMPADPLUS, PLUS],
		'volume_down'	=> [NUMPADMINUS, MINUS],
		
		'debug_1'		=> [SEVEN, NONE],
		'debug_2'		=> [EIGHT, NONE]
	];
	public static var defaultKeys:Map<String, Array<FlxKey>> = null;

	public static function loadDefaultKeys() {
		defaultKeys = keyBinds.copy();
		//trace(defaultKeys);
	}

	public static function saveSettings() {
		//FlxG.save.data.
		FlxG.save.data.iconScale = iconScale;
		FlxG.save.data.ratesOnHud = ratesOnHud;
		FlxG.save.data.judgCounters = judgCounters;
		FlxG.save.data.msTimingNum = msTimingNum;
		FlxG.save.data.oldIdle = oldIdle;
		//FlxG.save.data.oldScale = oldScale;
		FlxG.save.data.excamzoom = excamzoom;
		FlxG.save.data.iconOverScale = iconOverScale;
		FlxG.save.data.comboNumberColor = comboNumberColor;
		FlxG.save.data.newScore = newScore;
		FlxG.save.data.newRating = newRating;
		FlxG.save.data.timeZoom = timeZoom;
		FlxG.save.data.timingVisible = timingVisible;
		FlxG.save.data.comboVisible = comboVisible;
		FlxG.save.data.statusOffset = statusOffset;
		FlxG.save.data.KEscorebar = KEscorebar;
		FlxG.save.data.ratingVisible = ratingVisible;
		FlxG.save.data.cameraSpeedSet = cameraSpeedSet;
		FlxG.save.data.menuCamSpeed = menuCamSpeed;
		FlxG.save.data.botPlayAutoVisible = botPlayAutoVisible;
		//FlxG.save.data.iconOldScaling = iconOldScaling;
		FlxG.save.data.newScaling = newScaling;
		FlxG.save.data.iconOldScaleCustom = iconOldScaleCustom;
		FlxG.save.data.iconNewScaleCustom = iconNewScaleCustom;
		FlxG.save.data.comboSprColors = comboSprColors;
		FlxG.save.data.oldScoreBarEnabled = oldScoreBarEnabled;
		FlxG.save.data.numScoreVisible = numScoreVisible;
		FlxG.save.data.sustainNoteAlpha = sustainNoteAlpha;
		FlxG.save.data.NotesMultiPAlpha = NotesMultiPAlpha;
		FlxG.save.data.MenuMusics = MenuMusics;
		FlxG.save.data.ForcedIdles = ForcedIdles;
		FlxG.save.data.cameraSpeeds = cameraSpeeds;
		FlxG.save.data.cameraOffsets = cameraOffsets;
		FlxG.save.data.zoomType = zoomType;
		FlxG.save.data.combosMoves = combosMoves;
		FlxG.save.data.spamKeysLossHealth = spamKeysLossHealth;
		FlxG.save.data.gfoncomboheypose = gfoncomboheypose;
		FlxG.save.data.watermarksVisible = watermarksVisible;
		FlxG.save.data.judgesScale = judgesScale;
		FlxG.save.data.combotiming = combotiming;
		FlxG.save.data.disableText = disableText;
		FlxG.save.data.LaneUnderlayPlayer = LaneUnderlayPlayer;
		FlxG.save.data.LaneUnderlayOpponent = LaneUnderlayOpponent;
		FlxG.save.data.iconZoomlerp = iconZoomlerp;
		FlxG.save.data.healthBarColors = healthBarColors;
		FlxG.save.data.splashAlpha = splashAlpha;
		FlxG.save.data.winningIcons = winningIcons;
		FlxG.save.data.oldCamzoom = oldCamzoom;
		//pscle options
		FlxG.save.data.downScroll = downScroll;//vanilla options
		FlxG.save.data.middleScroll = middleScroll;
		FlxG.save.data.opponentStrums = opponentStrums;
		FlxG.save.data.showFPS = showFPS;
		FlxG.save.data.flashing = flashing;
		FlxG.save.data.globalAntialiasing = globalAntialiasing;
		FlxG.save.data.noteSplashes = noteSplashes;
		FlxG.save.data.lowQuality = lowQuality;
		FlxG.save.data.framerate = framerate;
		FlxG.save.data.accuracyModes = accuracyModes;
		//FlxG.save.data.cursing = cursing;
		//FlxG.save.data.violence = violence;
		FlxG.save.data.camZooms = camZooms;
		FlxG.save.data.noteOffset = noteOffset;
		FlxG.save.data.hideHud = hideHud;
		FlxG.save.data.arrowHSV = arrowHSV;
		FlxG.save.data.imagesPersist = imagesPersist;
		FlxG.save.data.ghostTapping = ghostTapping;
		FlxG.save.data.timeBarType = timeBarType;
		FlxG.save.data.scoreZoom = scoreZoom;
		FlxG.save.data.noReset = noReset;
		FlxG.save.data.healthBarAlpha = healthBarAlpha;
		FlxG.save.data.comboOffset = comboOffset;
		FlxG.save.data.achievementsMap = Achievements.achievementsMap;
		FlxG.save.data.henchmenDeath = Achievements.henchmenDeath;

		FlxG.save.data.ratingOffset = ratingOffset;
		FlxG.save.data.marvelousWindow = marvelousWindow;//Hit Windows / I didn't saved these shit
		#if EXTEND_JUDGES_ALLOWED
		FlxG.save.data.fantasticWindow = fantasticWindow;
		FlxG.save.data.epicWindow = epicWindow;
		#end
		FlxG.save.data.sickWindow = sickWindow;
		#if EXTEND_JUDGES_ALLOWED
		FlxG.save.data.coolWindow = coolWindow;
		#end
		FlxG.save.data.goodWindow = goodWindow;
		FlxG.save.data.badWindow = badWindow;
		FlxG.save.data.safeFrames = safeFrames;
		FlxG.save.data.gameplaySettings = gameplaySettings;
		FlxG.save.data.controllerMode = controllerMode;
		FlxG.save.data.hitsoundVolume = hitsoundVolume;
		FlxG.save.data.pauseMusic = pauseMusic;
		FlxG.save.data.checkForUpdates = checkForUpdates;
	
		FlxG.save.flush();

		var save:FlxSave = new FlxSave();
		save.bind('controls_v2', 'ninjamuffin99'); //Placing this in a separate save so that it can be manually deleted without removing your Score and stuff
		save.data.customControls = keyBinds;
		save.flush();
		FlxG.log.add("Settings saved!");
	}

	public static function loadPrefs() {
		if(FlxG.save.data.comboNumberColor != null) {
			comboNumberColor = FlxG.save.data.comboNumberColor;
		}
		/*if(FlxG.save.data.oldScale != null) {
			oldScale = FlxG.save.data.oldScale;
		}*/
		if(FlxG.save.data.oldIdle != null) {
			oldIdle = FlxG.save.data.oldIdle;
		} 
		if(FlxG.save.data.judgCounters != null) {
			judgCounters = FlxG.save.data.judgCounters;
		}
		if(FlxG.save.data.ratesOnHud != null) {
			ratesOnHud = FlxG.save.data.ratesOnHud;
		}
		if(FlxG.save.data.iconScale != null) {
			iconScale = FlxG.save.data.iconScale;
		}
		if(FlxG.save.data.msTimingNum != null) {
			msTimingNum = FlxG.save.data.msTimingNum;
		}
		if(FlxG.save.data.iconOverScale != null) {
			iconOverScale = FlxG.save.data.iconOverScale;
		}
		if(FlxG.save.data.newScore != null) {
			newScore = FlxG.save.data.newScore;
		}
		if(FlxG.save.data.newRating != null) {
			newRating = FlxG.save.data.newRating;
		}
		if(FlxG.save.data.timeZoom != null) {
			timeZoom = FlxG.save.data.timeZoom;
		}
		if(FlxG.save.data.timingVisible != null) {
			timingVisible = FlxG.save.data.timingVisible;
		}
		if(FlxG.save.data.comboVisible != null) {
			comboVisible = FlxG.save.data.comboVisible;
		}
		if(FlxG.save.data.ratingVisible != null) {
			ratingVisible = FlxG.save.data.ratingVisible;
	    }
		if(FlxG.save.data.statusOffset != null) {
			statusOffset = FlxG.save.data.statusOffset;
		}
		if(FlxG.save.data.KEscorebar != null) {
			KEscorebar = FlxG.save.data.KEscorebar;
		}
		if(FlxG.save.data.cameraSpeedSet != null) {
			cameraSpeedSet = FlxG.save.data.cameraSpeedSet;
		}
		if(FlxG.save.data.menuCamSpeed != null) {
			menuCamSpeed = FlxG.save.data.menuCamSpeed;
		}
		if(FlxG.save.data.botPlayAutoVisible != null) {
			botPlayAutoVisible = FlxG.save.data.botPlayAutoVisible;
		}
		if(FlxG.save.data.excamzoom != null) {
			excamzoom = FlxG.save.data.excamzoom;
		}
		/*if(FlxG.save.data.iconOldScaling != null) {
			iconOldScaling = FlxG.save.data.iconOldScaling;
		}*/
		if(FlxG.save.data.newScaling != null) {
			newScaling = FlxG.save.data.newScaling;
		}
		if(FlxG.save.data.iconOldScaleCustom != null) {
			iconOldScaleCustom = FlxG.save.data.iconOldScaleCustom;
		}
		if(FlxG.save.data.iconNewScaleCustom != null) {
			iconNewScaleCustom = FlxG.save.data.iconNewScaleCustom;
		}
		if(FlxG.save.data.oldScoreBarEnabled != null) {
			oldScoreBarEnabled = FlxG.save.data.oldScoreBarEnabled;
		}
		if(FlxG.save.data.comboSprColors != null) {
			comboSprColors = FlxG.save.data.comboSprColors;
		}
		if(FlxG.save.data.numScoreVisible != null) {
			numScoreVisible = FlxG.save.data.numScoreVisible;
		}
		if(FlxG.save.data.sustainNoteAlpha != null) {
			sustainNoteAlpha = FlxG.save.data.sustainNoteAlpha;
		}
		if(FlxG.save.data.NotesMultiPAlpha != null) {
			NotesMultiPAlpha = FlxG.save.data.NotesMultiPAlpha;
		}
		if(FlxG.save.data.splashAlpha != null) {
            splashAlpha = FlxG.save.data.splashAlpha;
		}
		if(FlxG.save.data.MenuMusics != null) {
			MenuMusics = FlxG.save.data.MenuMusics;
		}
		if(FlxG.save.data.ForcedIdles != null) {
			ForcedIdles = FlxG.save.data.ForcedIdles;
		}
		if(FlxG.save.data.cameraSpeeds != null) {
			cameraSpeeds = FlxG.save.data.cameraSpeeds;
		}
		if(FlxG.save.data.cameraOffsets != null) {
			cameraOffsets = FlxG.save.data.cameraOffsets;
		}
		if(FlxG.save.data.zoomType != null) {
			zoomType = FlxG.save.data.zoomType;
		}
		if(FlxG.save.data.combosMoves != null) {
			combosMoves = FlxG.save.data.combosMoves;
		}
		if(FlxG.save.data.accuracyModes != null) {
			accuracyModes = FlxG.save.data.accuracyModes;
		}
		if(FlxG.save.data.spamKeysLossHealth != null) {
			spamKeysLossHealth = FlxG.save.data.spamKeysLossHealth;
		}
		if(FlxG.save.data.gfoncomboheypose != null) {
			gfoncomboheypose = FlxG.save.data.gfoncomboheypose;
		}
		if(FlxG.save.data.watermarksVisible != null) {
			watermarksVisible = FlxG.save.data.watermarksVisible;
		}
		if(FlxG.save.data.judgesScale != null) {
			judgesScale = FlxG.save.data.judgesScale;
		}
		if(FlxG.save.data.combotiming != null) {
			combotiming = FlxG.save.data.combotiming;
		}
		if(FlxG.save.data.disableText != null) {
			disableText = FlxG.save.data.disableText;
		}
		if(FlxG.save.data.LaneUnderlayPlayer != null) {
			LaneUnderlayPlayer = FlxG.save.data.LaneUnderlayPlayer;
		}
		if(FlxG.save.data.LaneUnderlayOpponent != null) {
			LaneUnderlayOpponent = FlxG.save.data.LaneUnderlayOpponent;
		}
		if(FlxG.save.data.iconZoomlerp != null) {
			iconZoomlerp = FlxG.save.data.iconZoomlerp;
		}
		if(FlxG.save.data.healthBarColors != null) {
			healthBarColors = FlxG.save.data.healthBarColors;
		}
		if(FlxG.save.data.winningIcons != null) {
			winningIcons = FlxG.save.data.winningIcons;
		}
		if(FlxG.save.data.oldCamzoom != null) {
			oldCamzoom = FlxG.save.data.oldCamzoom;
		}
		//psycle options
		if(FlxG.save.data.downScroll != null) {
			downScroll = FlxG.save.data.downScroll;
		}//vanilla options
		if(FlxG.save.data.middleScroll != null) {
			middleScroll = FlxG.save.data.middleScroll;
		}
		if(FlxG.save.data.opponentStrums != null) {
			opponentStrums = FlxG.save.data.opponentStrums;
		}
		if(FlxG.save.data.showFPS != null) {
			showFPS = FlxG.save.data.showFPS;
			if(Main.fpsVar != null) {
				Main.fpsVar.visible = showFPS;
			}
		}
		if(FlxG.save.data.flashing != null) {
			flashing = FlxG.save.data.flashing;
		}
		if(FlxG.save.data.globalAntialiasing != null) {
			globalAntialiasing = FlxG.save.data.globalAntialiasing;
		}
		if(FlxG.save.data.noteSplashes != null) {
			noteSplashes = FlxG.save.data.noteSplashes;
		}
		if(FlxG.save.data.lowQuality != null) {
			lowQuality = FlxG.save.data.lowQuality;
		}
		if(FlxG.save.data.framerate != null) {
			framerate = FlxG.save.data.framerate;
			if(framerate > FlxG.drawFramerate) {
				FlxG.updateFramerate = framerate;
				FlxG.drawFramerate = framerate;
			} else {
				FlxG.drawFramerate = framerate;
				FlxG.updateFramerate = framerate;
			}
		}
		/*if(FlxG.save.data.cursing != null) {
			cursing = FlxG.save.data.cursing;
		}
		if(FlxG.save.data.violence != null) {
			violence = FlxG.save.data.violence;
		}*/
		if(FlxG.save.data.camZooms != null) {
			camZooms = FlxG.save.data.camZooms;
		}
		if(FlxG.save.data.hideHud != null) {
			hideHud = FlxG.save.data.hideHud;
		}
		if(FlxG.save.data.noteOffset != null) {
			noteOffset = FlxG.save.data.noteOffset;
		}
		if(FlxG.save.data.arrowHSV != null) {
			arrowHSV = FlxG.save.data.arrowHSV;
		}
		if(FlxG.save.data.ghostTapping != null) {
			ghostTapping = FlxG.save.data.ghostTapping;
		}
		if(FlxG.save.data.timeBarType != null) {
			timeBarType = FlxG.save.data.timeBarType;
		}
		if(FlxG.save.data.scoreZoom != null) {
			scoreZoom = FlxG.save.data.scoreZoom;
		}
		if(FlxG.save.data.noReset != null) {
			noReset = FlxG.save.data.noReset;
		}
		if(FlxG.save.data.healthBarAlpha != null) {
			healthBarAlpha = FlxG.save.data.healthBarAlpha;
		}
		if(FlxG.save.data.comboOffset != null) {
			comboOffset = FlxG.save.data.comboOffset;
		}
		
		if(FlxG.save.data.ratingOffset != null) {
			ratingOffset = FlxG.save.data.ratingOffset;
		}
		if(FlxG.save.data.marvelousWindow != null) {
			marvelousWindow = FlxG.save.data.marvelousWindow;
		}//Hit Windows
		#if EXTEND_JUDGES_ALLOWED
		if(FlxG.save.data.fantasticWindow != null) {
			fantasticWindow = FlxG.save.data.fantasticWindow;
		}
		if(FlxG.save.data.epicWindow != null) {
			epicWindow = FlxG.save.data.epicWindow;
		}
		#end
		if(FlxG.save.data.sickWindow != null) {
			sickWindow = FlxG.save.data.sickWindow;
		}
		#if EXTEND_JUDGES_ALLOWED
		if(FlxG.save.data.coolWindow != null) {
			coolWindow = FlxG.save.data.coolWindow;
		}
		#end
		if(FlxG.save.data.goodWindow != null) {
			goodWindow = FlxG.save.data.goodWindow;
		}
		if(FlxG.save.data.badWindow != null) {
			badWindow = FlxG.save.data.badWindow;
		}
		if(FlxG.save.data.safeFrames != null) {
			safeFrames = FlxG.save.data.safeFrames;
		}
		if(FlxG.save.data.controllerMode != null) {
			controllerMode = FlxG.save.data.controllerMode;
		}
		if(FlxG.save.data.hitsoundVolume != null) {
			hitsoundVolume = FlxG.save.data.hitsoundVolume;
		}
		if(FlxG.save.data.pauseMusic != null) {
			pauseMusic = FlxG.save.data.pauseMusic;
		}
		if(FlxG.save.data.gameplaySettings != null)
		{
			var savedMap:Map<String, Dynamic> = FlxG.save.data.gameplaySettings;
			for (name => value in savedMap)
			{
				gameplaySettings.set(name, value);
			}
		}
		
		// flixel automatically saves your volume!
		if(FlxG.save.data.volume != null)
		{
			FlxG.sound.volume = FlxG.save.data.volume;
		}
		if (FlxG.save.data.mute != null)
		{
			FlxG.sound.muted = FlxG.save.data.mute;
		}
		if (FlxG.save.data.checkForUpdates != null)
		{
			checkForUpdates = FlxG.save.data.checkForUpdates;
		}

		var save:FlxSave = new FlxSave();
		save.bind('controls_v2', 'ninjamuffin99');
		if(save != null && save.data.customControls != null) {
			var loadedControls:Map<String, Array<FlxKey>> = save.data.customControls;
			for (control => keys in loadedControls) {
				keyBinds.set(control, keys);
			}
			reloadControls();
		}
	}

	inline public static function getGameplaySetting(name:String, defaultValue:Dynamic):Dynamic {
		return /*PlayState.isStoryMode ? defaultValue : */ (gameplaySettings.exists(name) ? gameplaySettings.get(name) : defaultValue);
	}

	public static function reloadControls() {
		PlayerSettings.player1.controls.setKeyboardScheme(KeyboardScheme.Solo);

		TitleState.muteKeys = copyKey(keyBinds.get('volume_mute'));
		TitleState.volumeDownKeys = copyKey(keyBinds.get('volume_down'));
		TitleState.volumeUpKeys = copyKey(keyBinds.get('volume_up'));
		FlxG.sound.muteKeys = TitleState.muteKeys;
		FlxG.sound.volumeDownKeys = TitleState.volumeDownKeys;
		FlxG.sound.volumeUpKeys = TitleState.volumeUpKeys;
	}
	public static function copyKey(arrayToCopy:Array<FlxKey>):Array<FlxKey> {
		var copiedArray:Array<FlxKey> = arrayToCopy.copy();
		var i:Int = 0;
		var len:Int = copiedArray.length;

		while (i < len) {
			if(copiedArray[i] == NONE) {
				copiedArray.remove(NONE);
				--i;
			}
			i++;
			len = copiedArray.length;
		}
		return copiedArray;
	}
}
