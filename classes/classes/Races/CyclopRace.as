package classes.Races {
import classes.BodyData;
import classes.BodyParts.*;
import classes.Race;
import classes.StatusEffects;
import classes.internals.race.RaceUtils;

public class CyclopRace extends Race {
	public function CyclopRace(id:int) {
		super("Cyclop", id);
		
		addScores()
				.skinPlainOnly(+1)
				.eyeType(Eyes.MONOEYE, +3)
				.faceType(Face.ANIMAL_TOOTHS, +1)
				.noWings(+1)
				.noTail(+1)
				.tone(AT_LEAST(90), +1)
				.customRequirement("","not a gazer",
						function(body:BodyData):Boolean {
							return !(body.rearType == RearBody.TENTACLE_EYESTALKS && body.player.statusEffectv1(StatusEffects.GazerEyeStalksPlayer) >= 2);
						}, 0, -10);
		addConditionedScores(
				RaceUtils.checkSlotFn(BodyData.SLOT_EYE_TYPE, Eyes.MONOEYE),
				"monoeye;")
				.armType(Arms.HUMAN, +1)
				.legType(LowerBody.HUMAN, +1);
		addScoresAfter(4)
				.tone(AT_LEAST(120), +1)
				.height(GREATER_THAN(72), +1);
		addScoresAfter(6)
				.height(GREATER_THAN(96), +1);
		addScoresAfter(8)
				.height(GREATER_THAN(120), +1);
		
		buildTier(12, "cyclop")
				.buffs({
					"str.mult": +0.90,
					"tou.mult": +0.90
				})
				.end()
	}
}
}
