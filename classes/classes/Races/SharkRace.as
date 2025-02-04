package classes.Races {
import classes.BodyData;
import classes.BodyParts.*;
import classes.GeneticMemories.RaceMem;
import classes.IMutations.IMutationsLib;
import classes.PerkLib;
import classes.Race;
import classes.VaginaClass;
import classes.lists.Gender;

public class SharkRace extends Race {
	public static const SharkScaleColors:/*String*/Array = ["rough gray","orange","dark gray","iridescent gray","ashen grayish-blue","gray"];
	public static const SharkHairColors:/*String*/Array = ["silver"];
    public static const RaceBody:/*String*/Array = [
        /*Antenna*/		"Human",
        /*Arms*/		"Shark",
        /*Balls*/		"Human",
        /*Breasts*/		"Human",
        /*Nips*/		"Human",
        /*Ears*/		"Shark",
        /*Eyes*/		"Human",
        /*Face*/		"Shark",
        /*Gills*/		"Fish",
        /*Hair*/		"Shark",
        /*Horns*/		"Human",
        /*LowerBody*/	"Shark",
        /*RearBody*/	"Shark",
        /*Skin*/		"Shark",
        /*Ovipositor*/	"Human",
        /*Oviposition*/	"Human",
        /*GlowingAss*/	"Human",
        /*Tail*/		"Shark",
        /*Tongue*/		"Human",
        /*Wings*/		"Human",
        /*Penis*/		"Human",
        /*Vagina*/		"Shark",
        /*Perks*/		"Human"];
	
	public function SharkRace(id:int) {
		super("Shark", id, RaceBody);
	}
	
	public override function setup():void {
		addScores()
				.faceType(Face.SHARK_TEETH,1)
				.gillType(Gills.FISH, +1)
				.earType(Ears.SHARK, +1)
				.rearType(RearBody.SHARK_FIN, +1)
				.armType(Arms.SHARK, +1)
				.legType(LowerBody.SHARK, +1)
				.tailType(Tail.SHARK, +1)
				.hairTypeAndColor1(Hair.NORMAL, "silver", +1)
				.skinCoatTypeAndColor1(ANY(Skin.SCALES, Skin.AQUA_SCALES, Skin.DRAGON_SCALES), ANY(SharkScaleColors), +1)
				.skinCoatPattern(Skin.PATTERN_TIGER_STRIPES, +1)
				.eyeType(Eyes.HUMAN, +1)
				.gender(Gender.GENDER_HERM, +1)
				.vaginaType(VaginaClass.SHARK, +1)
				.wingType(NOT(Wings.FEATHERED_LARGE), 0, -1000);
		
		addMutation(IMutationsLib.SharkOlfactorySystemIM);
		
		buildTier(10, "shark-morph")
				.namesTauric("shark-morph", "shark-taur")
				.buffs({
					"str.mult": +0.40,
					"spe.mult": +1.00,
					"lib.mult": +0.10
				})
				.end();
		
		buildTier(11, "tigershark-morph")
				.namesTauric("tigershark-morph", "tigershark-taur")
				.require("hermaprhodite", function(body:BodyData):Boolean {
					return body.gender == Gender.GENDER_HERM;
				})
				.require("tiger stripes", function(body:BodyData):Boolean{
					return body.skinCoatPattern == Skin.PATTERN_TIGER_STRIPES;
				})
				.buffs({
					"str.mult": +0.60,
					"spe.mult": +1.00,
					"lib.mult": +0.10,
					"maxlust_base": +50
				})
				.end();
	}
}
}