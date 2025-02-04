package classes.Scenes.Dungeons.DemonLab {
import classes.Monster;
import classes.PerkLib;
import classes.Scenes.Dungeons.DungeonAbstractContent;
import classes.Scenes.SceneLib;
import classes.StatusEffects;

/**
 * ...
 * @author ...
 */
public class IncubusScientist extends Monster {

    public function IncubusScientist() {
        this.short = "incubus Scientist";
        this.long = "This demon is clad in a heavy-looking lab coat, and wears a strange pistol at his hip. Weedy and thin, he doesn't look like he's much of a fighter, but the anger in his gaze is a clear indicator of his intent. He wears an odd contraption on his left hand,"
        initStrTouSpeInte(150, 100, 130, 305);
        initWisLibSensCor(105, 190, 110, 100);
        this.weaponAttack = 86;
        this.armorDef = 38;
        this.armorMDef = 23;
        this.bonusHP = 500;
        this.bonusLust = 206;
        this.level = 40;
        this.additionalXP = 50;
        this.gems = rand(30) + 15;
        this.createPerk(PerkLib.OverMaxHP, 26, 0, 0, 0);
    }

    private function ForHisNeutralSpecialHeWieldsAGun():void {
        outputText("The demon scientist lines you up in his sights, pulling the trigger several times.")
        //Miss:
        //Determine if evaded
        if (player.getEvasionRoll()) {
            outputText("You dodge the bullets, and they fly past, taking small chunks out of the stone wall behind you.");
        }
        else {
            var damage:Number = Math.round(90 + rand(10) + (player.newGamePlusMod() * 30));
            outputText("You can’t even see the projectile as it flies, striking you in the [chest].");
            player.takePhysDamage(damage * 2);
        }
    }

    public var ShieldHits:int;
    private var ShieldCooldown:Number;

    private function ShieldsUp():void {
        outputText("(Priority if it is available and he has no shield) You notice the demon touch something in his lab coat. A thin veil of blue energy forms around him, and he smirks. “<i>Break this, you primitive!</i>” \n\n");
        ShieldHits = 4;
    }

    //TODO: hook these two functions somehow
    public function ShieldsHitMelee():void {
        outputText("Your [weapon] slams hard into the blue light, sliding off it with a shower of sparks. \n\n");
        --ShieldHits;
        if (ShieldHits == 3) {
            outputText("The shield is firm, it’s like hitting a wall! \n\n");
        } else if (ShieldHits == 2) {
            outputText("The light bends to your attack, but springs right back into place. \n\n");
        } else if (ShieldHits == 1) {
            outputText("The shield flashes red, and the demon scientist takes a half-step back, the ferocity of your strike seeming to get to him. \n\n");
        } else if (ShieldHits == 0) {
            ShieldCooldown = 3;
            outputText("You drive your [weapon] through the shield. The demon’s eyes are wide, and he inhales sharply. He presses the button in his coat, but no shield comes back into place. Smoke rises from his coat, and he plants his feet, grinding his teeth.  \n\n");
        }
    }

    public function ShieldsHitRanged():void {
        outputText("Your [weapon] slams hard into the blue light, sliding off it with a shower of sparks. \n\n");
        --ShieldHits;
        if (ShieldHits == 3) {
            outputText("Your [projectile] strikes the demon scientist, but he doesn’t even seem to notice the strike. He laughs, raising his pistol and taking another shot at you. \n\n");
            createStatusEffect(StatusEffects.Attacks, 1, 0, 0, 0);
        } else if (ShieldHits == 2) {
            outputText("Your [projectile] strikes the demon scientist, but his shield flashes, blocking the attack. He frowns, raising his pistol and taking another shot at you.\n\n");
            createStatusEffect(StatusEffects.Attacks, 1, 0, 0, 0);
        } else if (ShieldHits == 1) {
            outputText("Your [projectile] strikes the demon scientist's shield, which is visibly cracking'. He sweats, raising his pistol and taking another shot at you.\n\n");
            createStatusEffect(StatusEffects.Attacks, 1, 0, 0, 0);
        } else if (ShieldHits == 0) {
            ShieldCooldown = 3;
            outputText(" The shield shatters, and your [projectile] lands. He looks down at the [projectile] in his gut.\n\n");
        }
    }

    private function serum():void {
        clearOutput();
        outputText("The demon scientist reaches into his lab coat, pulling out a hypodermic needle.\n"
            + "“<i>The side effects are nasty...but I need the power now.</i>” He sticks himself, and he inhales sharply. He doesn’t look any different, but as he cocks his weapon, you notice the vein pulsing on his forehead. He’s way faster now!");
        buff("Serum").addStats({"spe": 200, "str": -100, "int": -100});
        createPerk(PerkLib.Evade, 0, 0, 0, 0);
        createPerk(PerkLib.ImprovedEvade, 0, 0, 0, 0);
        createPerk(PerkLib.GreaterEvade, 0, 0, 0, 0);
    }

    override public function defeated(hpVictory:Boolean):void {
        if (DungeonAbstractContent.dungeonLoc == DungeonAbstractContent.DUNGEON_LAB_ENTRANCE) SceneLib.dungeons.demonLab.AfterFirstFight();
        else cleanupAfterCombat();
    }

    override public function won(hpVictory:Boolean, pcCameWorms:Boolean):void {
        SceneLib.dungeons.demonLab.BadEndExperiment();
    }

    override protected function performCombatAction():void {
        clearOutput();
        if (ShieldCooldown > 0) --ShieldCooldown;
        if (HP < maxHP() * 0.6) {
            serum();
            return;
        }
        var choice0:Number = rand(2);
        switch (choice0) {
            case 0:
                ForHisNeutralSpecialHeWieldsAGun();
                break;
            case 1:
                ShieldsUp();
                break;
        }
    }
}

}