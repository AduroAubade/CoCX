package classes.Races {
import classes.BodyData;
import classes.BodyParts.*;
import classes.IMutations.IMutationsLib;
import classes.PerkLib;
import classes.Race;
public class CowRace extends Race {
	public function CowRace(id:int) {
		super("Cow", id);
	}
	
	public override function setup():void {
		addScores()
				.earType(Ears.COW, +1)
				.tailType(Tail.COW, +1)
				.legType(LowerBody.HOOFED, +1)
				.hornType(Horns.COW_MINOTAUR, +1)
				.hasPerk(PerkLib.Feeder, +1);
		addScoresAfter(4)
				.faceType(ANY(Face.HUMAN, Face.COW_MINOTAUR), +1)
				.armType(Arms.HUMAN, +1)
				.skinPlainOnly(+1)
				.skinCoatType(Skin.FUR, +1)
				.biggestTitSize(GREATER_THAN(4), +1)
				.height(AT_LEAST(73), +1)
				.corruption(AT_LEAST(20), +1)
				.hasVagina(+1)
				.noCock(0,-8);
		
		addBloodline(PerkLib.MinotaursDescendant, PerkLib.BloodlineMinotaur);
		addMutation(IMutationsLib.LactaBovinaOvariesIM);
		
		buildTier(10, "cow-morph")
				.namesMaleFemale("cow-morph", "cow-girl")
				.buffs({
					"str.mult": +1.20,
					"tou.mult": +0.45,
					"spe.mult": -0.40,
					"int.mult": -0.20,
					"lib.mult": +0.45
				})
				.end();
		
		buildTier(15, "Lacta Bovine")
				.buffs({
					"str.mult": +1.70,
					"tou.mult": +0.45,
					"spe.mult": -0.40,
					"int.mult": -0.20,
					"lib.mult": +0.70
				})
				.end();
	}
}
}
