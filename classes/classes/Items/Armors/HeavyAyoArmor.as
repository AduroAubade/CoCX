/**
 * ...
 * @author Ormael
 */
package classes.Items.Armors
{
	import classes.GlobalFlags.kFLAGS;
	import classes.ItemType;
	import classes.Items.Armor;
	import classes.Player;

	public class HeavyAyoArmor extends Armor {
		
		public function HeavyAyoArmor() {//100 * armor + mres
			super("HAyoArm","HAyoArm","heavy ayo armor","a heavy ayo armor",120,20,14000,"This suit of armor is more than typical heavy armor - it have added pieces of Ayo Tech that increase by a huge margin it properties as long user is capable to feed it on regular basis with soulforce.","Heavy Ayo");
			withBuffs({"str": -20, "spe": -20});
		}
		
		override public function get def():Number {
			if (game.flags[kFLAGS.SOULFORCE_STORED_IN_AYO_ARMOR] > 0) return 120;
			else return 72;
		}
		
		override public function get mdef():Number {
			if (game.flags[kFLAGS.SOULFORCE_STORED_IN_AYO_ARMOR] > 0) return 20;
			else return 12;
		}
		
		override public function afterEquip(doOutput:Boolean):void {
			super.afterEquip(doOutput);
		}
		
		override public function afterUnequip(doOutput:Boolean):void {
			if (game.flags[kFLAGS.SOULFORCE_STORED_IN_AYO_ARMOR] > 0) {
				game.player.soulforce += game.flags[kFLAGS.SOULFORCE_STORED_IN_AYO_ARMOR];
				if (game.player.soulforce > game.player.maxSoulforce()) game.player.soulforce = game.player.maxSoulforce();
				game.flags[kFLAGS.SOULFORCE_STORED_IN_AYO_ARMOR] = 0;
			}
			super.afterUnequip(doOutput);
		}
		
		override public function canEquip(doOutput:Boolean):Boolean {
			if (game.player.str >= 40 && game.player.spe >= 40) return super.canEquip(doOutput);
			if(doOutput) outputText("You aren't strong and agile enough to wear this armor!  Unless you likes to move slower than snail and hit weaked than wet noddle!  ");
			return false;
		}
	}
}
