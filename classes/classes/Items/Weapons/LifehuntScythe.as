package classes.Items.Weapons 
{
	import classes.PerkLib;
	/**
	 * ...
	 * @author Oxdeception
	 */
	public class LifehuntScythe extends WeaponWithPerk
	{
		
		public function LifehuntScythe() 
		{
			super("LifScyt", "L.Scythe", "lifehunt scythe", "a lifehunt scythe", "slash", 25, 2000,
					"This enchanted scythe is made of a white metal, and its surface is decorated with ruby gemstones and silver engravings depicting dragons. It seems to drink in the opponents blood use it to heal its user’s wounds.",
					"Large", PerkLib.Sanctuary, 1, 0, 0, 0, "", "Scythe, StaffPart"
			);
		}
		override public function get attack():Number{
			return 20 + ((100 - game.player.cor) / 20);
		}
		override public function canUse():Boolean {
			if (game.player.level >= 40) return super.canUse();
			outputText("You try and wield the legendary weapon but to your disapointment the item simply refuse to stay in your hands. It would seem you yet lack the power and right to wield this item.");
			return false;
		}
	}

}