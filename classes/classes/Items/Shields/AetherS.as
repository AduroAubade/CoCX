/**
 * ...
 * @author Ormael
 */
package classes.Items.Shields 
{
	import classes.Items.Shield;
	import classes.PerkLib;
	import classes.Player;
	import classes.GlobalFlags.kFLAGS;
	import classes.StatusEffects;

	public class AetherS extends Shield {
		
		public function AetherS() 
		{
			super("AetherS", "AetherS", "Aether (Sin)", "an Aether (Sin)", 0, 0, "Aether - sinister part of mysterious sentient weapons pair rumored to be forged by the god of blacksmiths.");
		}
		
		override public function get block():Number { 
			var temp:int = 0;
			temp += game.player.statusEffectv2(StatusEffects.AetherTwins1);
			return temp; 
		}
		
		override public function get description():String {
			var desc:String = _description;
			//Type
			desc += "\n\nType: ";
			if (game.player.statusEffectv4(StatusEffects.AetherTwins1) == 1) desc += "Shield";
			else desc += "Shield";
			//Block Rating
			desc += "\nBlock: " + String(block);
			//Value
			desc += "\nBase value: 0";
			return desc;
		}
		
		override public function useText():void {
			outputText("\n\n\"<i>Well alright then, [name]!</i>\" Aether (Sin) says excitedly, \"<i>Let's go!</i>\"\n\n");
		}
		override public function playerEquip():Shield { //This item is being equipped by the player. Add any perks, etc.
			game.flags[kFLAGS.AETHER_SINISTER_TWIN_AT_CAMP] = 2;
			return super.playerEquip();
		}
		
		override public function removeText():void { //Produces any text seen when removing the armor normally
			outputText("Aether (Sin) lays on the ground for a moment, \"<i>I will be waiting in the camp</i>\" she says before teleporting back to your camp.\n\n(<b>Aether (Sin) is now available in the followers tab!</b>)");
		}
		override public function playerRemove():Shield { //This item is being removed by the player. Remove any perks, etc.
			game.flags[kFLAGS.AETHER_SINISTER_TWIN_AT_CAMP] = 1;
			return null; //Can't put Aether (Sin) in your inventory
		}
	}
}