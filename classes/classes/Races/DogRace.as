package classes.Races {
import classes.BodyData;
import classes.BodyParts.*;
import classes.CockTypesEnum;
import classes.IMutations.IMutationsLib;
import classes.PerkLib;
import classes.Race;
public class DogRace extends Race {
	public function DogRace(id:int) {
		super("Dog", id);
		chimeraTier = 0;
		grandChimeraTier = 0;
	}
	
	public override function setup():void {
		addScores()
				.faceType(Face.DOG, +1)
				.earType(Ears.DOG, +1)
				.tailType(Tail.DOG, +1)
				.legType(LowerBody.DOG, +1)
				.hasCockOfType(CockTypesEnum.DOG, +1)
				.breastRowCount(2, +1)
				.breastRowCount(3, +2)
		addScoresAfter(1)
				.skinCoatType(Skin.FUR, +1);
		
		buildTier(4, "dog-morph")
				.namesMaleFemaleMorphTaur("dog-boy", "dog-girl", "dog-morph", "dog-taur")
				.buffs({
					"spe.mult": +0.15,
					"int.mult": -0.05
				})
				.end();
	}
}
}
