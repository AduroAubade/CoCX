package classes.Races {
import classes.BodyData;
import classes.BodyParts.*;
import classes.CockTypesEnum;
import classes.IMutations.IMutationsLib;
import classes.PerkLib;
import classes.Race;
import classes.StatusEffects;
import classes.VaginaClass;

public class GorgonRace extends Race {
	public function GorgonRace(id:int) {
		super("Gorgon", id);
	}
	
	public override function setup():void {
		addScores()
				.isNaga(+3, -1000)
				.tongueType(Tongue.SNAKE, +1)
				.faceType(Face.SNAKE_FANGS, +1)
				.armType(Arms.HUMAN, +1)
				.skinCoatType(Skin.SCALES, +1)
				.earType(Ears.SNAKE, +1)
				.eyeType(Eyes.SNAKE, +1)
				.eyeType(Eyes.GORGON, +2)
				.hairType(Hair.GORGON, +2)
				.cockOrVaginaOfType(CockTypesEnum.LIZARD, VaginaClass.NAGA, +1)
				.customRequirement("","not another snake-like race",
						function (body:BodyData):Boolean {
							return !(body.player.nagaScore() > 10
									|| CouatlRace.isCouatlLike(body)
									|| VouivreRace.isVouivreLike(body)
									|| HydraRace.isHydraLike(body));
						}, 0, -1000);
		
		addMutation(IMutationsLib.VenomGlandsIM);
		addMutation(IMutationsLib.GorgonEyesIM);
		
		buildTier(11, "gorgon")
				.buffs({
					"str.mult": +0.50,
					"tou.mult": +0.45,
					"spe.mult": +0.70,
					"maxhp_base": +50
				})
				.end();
		
		buildTier(17, "greater gorgon")
				.buffs({
					"str.mult": +0.80,
					"tou.mult": +0.65,
					"spe.mult": +1.10,
					"maxhp_base": +100
				})
				.end();
	}
	
	public static function isGorgonLike(body:BodyData):Boolean {
		return body.hairType == Hair.GORGON
				|| body.eyeType == Eyes.GORGON;
	}
}
}
