/**
 * ...
 * @author Liadri
 */
package classes.Items.Weapons
{
	import classes.Items.Weapon;
	import classes.PerkLib;
	import classes.Player;
	
	public class DorcSouls extends Weapon {
		
		public function DorcSouls() {
			super("DorSoul", "DorcSouls", "Dorc Souls", "a Dorc Souls", "slash", 70, 5600, "Said to have been the favored weapon of a mad god named Dorc these corrupted swords heals the wielder on swings.", "Dual Large, LGWrath", "Sword");
		}
		
		override public function get attack():Number {
			var boost:int = 0;
			if (game.player.str >= 150) boost += 20;
			if (game.player.str >= 100) boost += 15;
			if (game.player.str >= 50) boost += 10;
			boost += Math.round(game.player.cor / 5);
			return (5 + boost);
		}
		
		override public function canEquip(doOutput:Boolean):Boolean {
			if ((game.player.hasPerk(PerkLib.DualWield) && (game.player.hasPerk(PerkLib.GigantGrip) || game.player.hasPerk(PerkLib.AntyDexterity))) || (game.player.hasPerk(PerkLib.GigantGrip) && game.player.hasPerk(PerkLib.AntyDexterity))) return super.canEquip(doOutput);
			if (doOutput) {
				if (game.player.hasPerk(PerkLib.GigantGrip) || game.player.hasPerk(PerkLib.AntyDexterity)) outputText("You aren't skilled in handling large weapons with one hand yet to effectively use those swords. Unless you want to hurt yourself instead of your enemies when trying to use them...  ");
				else outputText("You aren't skilled enough to handle this pair of weapons!  ");
			}
			return false;
		}
	}
}
