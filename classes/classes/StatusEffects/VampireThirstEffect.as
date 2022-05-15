/**
 * Coded by aimozg on 28.10.2017.
 */
package classes.StatusEffects {
import classes.IMutations.IMutationsLib;
import classes.StatusEffectClass;
import classes.StatusEffectType;

public class VampireThirstEffect extends StatusEffectClass {
	public static const TYPE:StatusEffectType = register("Vampire Thirst", VampireThirstEffect);
	public function VampireThirstEffect() {
		super(TYPE);
	}
	
	public function drink(amount:Number=1):void {
        modSatiety(amount);
    }
	public function maxThirst():Number {
		var maxThi:Number = 0;
		if (game.player.facePart.type == 34) maxThi += 30;
		if (game.player.perkv1(IMutationsLib.VampiricBloodstreamIM) >= 1) maxThi += 15;
		if (game.player.perkv1(IMutationsLib.VampiricBloodstreamIM) >= 2 && game.player.vampireScore() >= 6) maxThi += 30;
		if (game.player.perkv1(IMutationsLib.VampiricBloodstreamIM) >= 3 && game.player.vampireScore() >= 12) maxThi += 60;
		if (game.player.perkv1(IMutationsLib.HollowFangsIM) >= 1) maxThi += 5;
		if (game.player.perkv1(IMutationsLib.HollowFangsIM) >= 2) maxThi += 5;
		if (game.player.perkv1(IMutationsLib.HollowFangsIM) >= 3) maxThi += 5;
		return maxThi;
	}
    public function modSatiety(delta:Number):void {
        value1 = boundFloat(-10, value1 + delta, maxThirst());
		host.statStore.replaceBuffObject({str:currentBoost,spe:currentBoost,int:currentBoost,lib:currentBoost},"VampirismSatiety",{text:"Vampirism"});
		if (game.player.hunger < game.player.maxHunger())
		{
			game.player.refillHunger(10, false);
		}
    }
	
	public function get currentBoost():int {
        if (value1 <= 0) return 0;
        return value1*singleStackBoost;
    }
    public function get singleStackBoost():Number {
        if (game.player.perkv1(IMutationsLib.VampiricBloodstreamIM) >= 3) return ((1 + game.player.newGamePlusMod()) * 3);
		else return ((1 + game.player.newGamePlusMod()) * 2);
    }
    
    override public function onRemove():void {
		host.statStore.removeBuffs("VampirismSatiety");
    }

	override public function onAttach():void {
		host.statStore.replaceBuffObject({str:currentBoost,spe:currentBoost,int:currentBoost,lib:currentBoost},"VampirismSatiety",{text:"Vampirism"});
	}
}
}
