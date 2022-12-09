package;

import flixel.FlxSprite;
import openfl.utils.Assets as OpenFlAssets;
//import flixel.tweens.FlxEase;
//import flixel.tweens.FlxTween;

using StringTools;

class HealthIcon extends FlxSprite
{
	public var sprTracker:FlxSprite;
	private var isOldIcon:Bool = false;
	private var isPlayer:Bool = false;
	private var char:String = '';

	//private var tween:FlxTween;

	public var fixIcon:Bool = true;

	public var hitboxs:Bool = false;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		isOldIcon = (char == 'bf-old');
		this.isPlayer = isPlayer;
		changeIcon(char);
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}

	public function swapOldIcon() {
		if(isOldIcon = !isOldIcon) changeIcon('bf-old');
		else changeIcon('bf');
	}
    
    private var iconOffsets:Array<Float> = [0, 0];
	public function changeIcon(char:String) {
		if(this.char != char) {
			var name:String = 'icons/' + char;
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-' + char; //Older versions of psych engine's support
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-face'; //Prevents crash from missing icon
			var file:Dynamic = Paths.image(name);
		
		if(ClientPrefs.newScaling == 'Old' || ClientPrefs.newScaling == 'False Fix')
		{
            fixIcon = false;
		}

        if(fixIcon) {
			loadGraphic(file);
			if (ClientPrefs.winningIcons) {
			loadGraphic(file, true, Math.floor(width / 3), Math.floor(height));
			}
			else
			{
			loadGraphic(file, true, Math.floor(width / 2), Math.floor(height));
			} //Then load it fr
			iconOffsets[0] = (width - 150) / 3;
			iconOffsets[1] = (width - 150) / 3;
			if (ClientPrefs.winningIcons) {
			iconOffsets[2] = (width - 150) / 3;
			}

			updateHitbox();

            if (ClientPrefs.winningIcons)
			animation.add(char, [0, 1, 2], 0, false, isPlayer);
			else
            animation.add(char, [0, 1], 0, false, isPlayer);

			animation.play(char);
			this.char = char;
			//width scaling was bugged on game images load isn't great for winning icons so beginning weird
		}
		else
		{
			loadGraphic(file);
			if (ClientPrefs.winningIcons) {
			loadGraphic(file, true, Math.floor(width / 3), Math.floor(height));
			}
			else
			{
			loadGraphic(file, true, Math.floor(width / 2), Math.floor(height));
			}
			//loadGraphic(file, true, 150, 150);
			if (ClientPrefs.winningIcons)
			animation.add(char, [0, 1, 2], 0, false, isPlayer);
			else
            animation.add(char, [0, 1], 0, false, isPlayer);
			animation.play(char);
			this.char = char;
		}

			antialiasing = ClientPrefs.globalAntialiasing;
			if(char.endsWith('-pixel')) {
				antialiasing = false;
			}
		}

		//tween = FlxTween.tween(this, {}, 0);
	}

override function updateHitbox()
	{
		if(fixIcon) {
		super.updateHitbox();
		offset.x = iconOffsets[0];
		offset.y = iconOffsets[1];
		if(ClientPrefs.winningIcons) {
		offset.y = iconOffsets[2];
		}
		}
		else
		{
			if(hitboxs) {
			PlayState.shouldntUpdateHitbox = true;//fuck on online games. old icon scale options doesn't work this
			}
			else
			{
				PlayState.shouldntUpdateHitbox = false;
				super.updateHitbox();
			}
		}
	}
	//found issue , this is issues. 

	public function getCharacter():String {
		return char;
	}

	/*public function tweenToDefaultScale(_time:Float, _ease:Null<tweens.FlxEase>){

		tween.cancel();
		tween = FlxTween.tween(this, {iconScale: this.defualtIconScale}, _time, {ease: _ease});

	}*/
}
