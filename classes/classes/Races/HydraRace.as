package classes.Races {
import classes.BodyData;
import classes.BodyParts.*;
import classes.IMutations.IMutationsLib;
import classes.PerkLib;
import classes.Race;
import classes.Races.VouivreRace;
import classes.StatusEffects;
import classes.VaginaClass;

public class HydraRace extends Race {
	public function HydraRace(id:int) {
		super("Hydra", id);
	}
	
	public override function setup():void {
		addScores()
				.customScoreRequirement("legs", "hydra lower body, +1 per tail after 2",
						function (body:BodyData):Boolean {
							return body.legType == LowerBody.HYDRA && body.player.statusEffectv1(StatusEffects.HydraTailsPlayer) >= 1;
						},
						function (body:BodyData):int {
							return Math.min(11, body.player.statusEffectv1(StatusEffects.HydraTailsPlayer)-1);
						},
						-1000
				)
				.armType(Arms.HYDRA, +1)
				.hairType(ANY(Hair.NORMAL, Hair.GORGON), +1)
				.tongueType(Tongue.SNAKE, +1)
				.faceType(Face.SNAKE_FANGS, +1)
				.skinCoatType(Skin.SCALES, +1)
				.eyeType(Eyes.SNAKE, +1)
				.earType(Ears.SNAKE, +1)
				.noWings(+2)
				.height(AT_LEAST(120), +1)
				.customRequirement("","naga vagina or lizard cock",
						function (body:BodyData):Boolean {
							return body.vaginaType == VaginaClass.NAGA || body.player.lizardCocks() > 0
						}, +1)
				.hasPerk(PerkLib.LizanRegeneration, +1)
				.hasPerk(PerkLib.HydraRegeneration, +1)
				.hasPerk(PerkLib.HydraAcidBreath, +1)
				.customRequirement("","not another snake-like race",
						function (body:BodyData):Boolean {
							return !(body.player.nagaScore() > 10
									|| GorgonRace.isGorgonLike(body)
									|| VouivreRace.isVouivreLike(body)
									|| CouatlRace.isCouatlLike(body));
						}, 0, -1000);
		
		addMutation(IMutationsLib.VenomGlandsIM);
		
		buildTier(14, "hydra")
				.buffs({
					"str.mult": +1.00,
					"tou.mult": +0.50,
					"spe.mult": +0.60
				})
				.end();
		
		buildTier(19, "greater hydra")
				.buffs({
					"str.mult": +1.20,
					"tou.mult": +1.05,
					"spe.mult": +0.60
				})
				.end();
		
		buildTier(24, "ancient hydra")
				.buffs({
					"str.mult": +1.30,
					"tou.mult": +1.25,
					"spe.mult": +1.05
				})
				.end();
		
		buildTier(29, "legendary hydra")
				.buffs({
					"str.mult": +1.60,
					"tou.mult": +1.45,
					"spe.mult": +1.30
				})
				.end();
	}
	
	public static function isHydraLike(body:BodyData):Boolean {
		return body.legType == LowerBody.HYDRA
				|| body.armType == Arms.HYDRA;
	}
}
}
