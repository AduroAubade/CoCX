package classes.Races {
import classes.BodyParts.*;
import classes.IMutations.IMutationsLib;
import classes.Race;

public class YukiOnnaRace extends Race {
	public static const YukiOnnaSkinColors:/*String*/Array = ["snow white", "light blue", "glacial white"];
	public static const YukiOnnaHairColors:/*String*/Array = ["snow white", "silver white", "platinum blonde", "quartz white"];
	
	public function YukiOnnaRace(id: int) {
		super("Yuki Onna", id);
	}
	
	public override function setup():void {
		
		addScores()
				.skinBaseColor(ANY(YukiOnnaSkinColors), +1)
				.skinBaseAdj("cold", +1)
				.eyeColor("light purple", +1)
				.hairColor(ANY(YukiOnnaHairColors), +1)
				.hairType(Hair.SNOWY, +1)
				.legType(LowerBody.YUKI_ONNA, +1)
				.armType(Arms.YUKI_ONNA, +1)
				.faceType(Face.YUKI_ONNA, +1)
				.rearType(RearBody.GLACIAL_AURA, +1)
				.wingType(Wings.LEVITATION, +3)
				.femininity(GREATER_THAN(99), +1)
				.noCock(+1)
				.hasVagina(+1);
		
		addMutation(IMutationsLib.FrozenHeartIM);
		
		buildTier(14,"Yuki Onna")
				.buffs({
					"spe.mult": +0.70,
					"int.mult": +1.40,
					"wis.mult": +0.70,
					"lib.mult": +0.50
				})
				.end()
	}
}
}
