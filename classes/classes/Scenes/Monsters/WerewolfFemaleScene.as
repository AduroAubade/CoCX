/**
 * ...
 * @author Liadri
 */
package classes.Scenes.Monsters 
{
	import classes.*;
	import classes.GlobalFlags.kFLAGS;
	import classes.CoC;
import classes.IMutations.IMutationsLib;
import classes.Items.Mutations;
import classes.Scenes.SceneLib;
import classes.display.SpriteDb;

public class WerewolfFemaleScene extends BaseContent
	{
		public function WerewolfFemaleScene()
		{}
		
		public function introWerewolfFemale():void {
			clearOutput();
			//spriteSelect(SpriteDb.s_DarkElf);
			outputText("As you explore the sleeping land of mareth you begin to feel as if something was stalking you just out of your line of sight.");
			if (player.isRaceCached(Races.YUKIONNA) || player.isRaceCached(Races.JIANGSHI) || player.isRaceCached(Races.VAMPIRE) || player.isRaceCached(Races.WEREWOLF) || player.isRaceCached(Races.WENDIGO)) outputText("You focus your night eyes to quickly notice what appears to be wolf girl skulking in the shadow nearby. She pounces at you but you easily dodge her attack readying for battle.");
			else outputText("Out of nowhere a shadowy pounce on you and it’s barely if you manage to shove her back after overcoming the surprise attack. You focus your vision on your opponent and determine it to be a wolf girl of some sort.");
			outputText("She growls at you as she circles your position, claws and fangs out in a menacing display as she looks for an opening. Seems you are under attack by a werewolf!");
			startCombat(new WerewolfFemale());
		}
		
		public function lostToWerewolf():void {
			clearOutput();
			//spriteSelect(SpriteDb.s_DarkElf);

			outputText("As you hit the ground, the werewolf approaches you with a vicious smile.\n\n");
			outputText("\"<i>It's your lucky night intruder my alpha happens to be too lazy to leave the den and claim his prizes himself so I'm claiming you in his stead however I have no need of a new bitch begging and competing with me for my man's dick.</i>\"\n\n");
			outputText("Relieved you're about to leave when the female firmly sits on your face pinning you to the ground.\n\n");
			outputText("\"<i>Who said I was done with you slut? You want your freedom? Well I want you to lick my cunt and soothe my itch. Get to it and make sure you don't bite anything or I'll tear off one of your limbs. That'll also happen if I feel you don't put in enough enthusiasm!</i>\"\n\n");
			outputText("Knowing she's as serious as the crazies on Mareth goes you don't second guess her and proceed to dive in her needy pussy like your life depends on it which considering her sharp claws and fang just might." +
					" She almost asphyxiates you three times through the process threatening you everytime you relent but your efforts are eventually rewarded as the werewolf cum into your dazed face." +
					" You barely register her lifting up and taking distance as she leaves a last warning.\n\n");
			outputText("\"<i>By the way loser if my lazy Alpha somehow ever manages to acquire you I've already marked your face as my sub. Don't you ever get the crazy idea that you could get ahead of me. I'll use your subby face as my toilet as many times as it takes until I get that through your skull if I have to.</i>\"\n\n");
			outputText("You barely register her departure as you slowly lift up and drag your sorry self back to camp.\n\n");

			cleanupAfterCombat();
		}
		
		public function wonWithWerewolf():void {
			clearOutput();
			//spriteSelect(SpriteDb.s_DarkElf);
			outputText("The werewolf falls back to the ground toroughly defeated." +
					" It keeps snarling defiantly at you but you know this is a facade and that if you wanted to have your way with [monster him] all you need to do would be to push [monster him] on [monster his] back and get to work." +
					" Do you rape [monster him]?\n\n");
			rapeMenu();
		}

		public function rapeMenu():void {
			menu()
			addButtonDisabled(0, "Dominate", "This scene requires you to have a cock.", "Dominate");
			addButtonDisabled(1, "Femdom", "This scene requires you to have a vagina.", "Femdom");
			if (player.hasCock())addButton(0, "Dominate", domWithCock).hint("Show that pup who's boss.\n");
			if (player.hasVagina()) addButton(1, "Femdom", femDom).hint("You're top girl here. Its time to show it!");
			SceneLib.uniqueSexScene.pcUSSPreChecksV2(rapeMenu);
			addButton(14, "Leave", cleanupAfterCombat);
		}

		public function domWithCock():void {
			clearOutput();
			//spriteSelect(SpriteDb.s_DarkElf);
			var x:Number = player.biggestCockIndex();
			outputText("You pin the werewolf to the ground as your erect shaft drools in anticipation.\n\n");
			outputText("\"<i>Ugh, I won't yield!</i>\"\n\n");
			outputText("Yeah yeah, we’ll see about that. You're way too horny to stop now. You will use her/him however you want, and that starts with satisfying your desires.\n\n" +
					"You're going to start by getting a taste of that doggy hole right now. The werewolf begins to protest as you grab [monster his] hips forcing [monster him] on all fours. You move behind [monster him] and shove your " + cockDescript(x) + " right into [monster his] welcoming ass");
			if(player.hasKnot()) outputText(", your knot expanding, trapping your shaft inside them");
			outputText(".\n\n");
			outputText("\"<i>Ugh…Get that thing out… I won't be..!!!</i>\"\n\n");
			outputText("You're just beginning however, and start to pound the cub in earnest." +
					" You're going to teach [monster his] hole who owns it." +
					" The cub pants, drool falling on the dirt as you fuck [monster him], your crotch slapping against [monster his] well shaped backside with each thrust." +
					" [monster His] ass is constricting you like a vice." +
					" Before long [monster his] tail starts wagging from side to side as you fuck [monster him] for several minutes establishing your dominion over [monster his] body.\n\n");
			outputText("Finally you reach your climax howling in tandem with him/her as you fill his/her hole with your hot seed.\n\n");
			outputText("You keep painting [monster his] ass several times under the moonlight, once in a while switching to [monster his] mouth");
			if(player.hasKnot()) outputText(" or [monster his] cunt");
			outputText(", using and abusing all of [monster his] holes until dawn finally breaks, your cock still dripping cum on your defeated foe’s face. You took your sweet time to mark [monster him] over and over again as your playtoy.");
			if(player.isRaceCached(Races.WEREWOLF) || player.hasMutation(IMutationsLib.AlphaHowlIM) || rand(100)>25){
				outputText("The exhausted werewolf, now a broken mess, is merely able to pitifully wag [monster his] tail." +
						" You order [monster him] to stand up and follow you back to your camp." +
						" Unable to refuse the compulsion of their new alpha, your newest pack member complies with the order, joining your team permanently." +
						" Luna will also takes care to establish a proper hierarchy so that the pup stays beneath her in rank." +
						" How she does this is up to her but you know your toy is going to be used for a little longer.\n\n");
			}
			else{
				outputText("Perhaps as a last display of [monster his] fast breaking pride the defeated werewolf runs away");
				if(player.isRaceCached(Races.WEREWOLF) || player.hasMutation(IMutationsLib.AlphaHowlIM)) outputText(", preferring escape over subservience. Well it looks like you didn't get that one, maybe next time.\n\n");
				outputText(".\n\n");
			}
			outputText("Toroughly satisfied by this nightly encounter you head back to camp.\n\n");

			cleanupAfterCombat();
		}

		public function femDom():void {
			clearOutput();
			//spriteSelect(SpriteDb.s_DarkElf);
			var x:Number = player.biggestCockIndex();
			outputText("You sure are making this pup your toy tonight, you're the bigger female here and as such you deserve proper tribute!" +
					" You begin by brutally shoving [monster him] down on the ground to assert your dominance and make your positions clear." +
					" Now that [monster he]'s on [monster his] back you sit on [monster his] face and yip your first order..\n\n");
			outputText("\"<i>Lick me clean</i>");
			if(player.hasCock()) outputText("<i> and get to pumping my tool</i>")
			outputText("!\"\n\n");
			outputText("The cub, overwhelmed, doesn’t protest and swiftly gets to it making you growl in satisfaction as [monster his] dog tongue slithers in");
			if(player.hasCock())outputText(" and [monster his] paws jerks your " + cockDescript(x) +"");
			outputText(". Your toy will have to get off on the satisfaction of you cumming, something which seems to be possible for [monster him]." +
					" The both of you are panting in desire like beasts growling between gasps of pleasure.");
			outputText("Finally you cum, marking [monster his] thirsty mouth with your girl juices");
			if(player.hasCock()) outputText(" as your " + cockDescript(x) +" unloads, covering [monster his] chest up to [monster his] belly in semen");
			if(player.isRaceCached(Races.WEREWOLF)) outputText(" while you howl to the moon, savoring your mind blowing orgasm");
			outputText(".\n\n")
			outputText("That said, you are far from done. The moment you recover, you resume using [monster him] several times until dawn finally breaks.\n\n")

			if(player.isRaceCached(Races.WEREWOLF) || player.hasMutation(IMutationsLib.AlphaHowlIM) || rand(100)>25){
				outputText("The exhausted werewolf, now a broken mess, is merely able to pitifully wag [monster his] tail." +
						" You order [monster him] to stand up and follow you back to your camp." +
						" Unable to refuse the compulsion of their new alpha, your newest pack member complies with the order, joining your team permanently." +
						" Luna will also takes care to establish a proper hierarchy so that the pup stays beneath her in rank." +
						" How she does this is up to her but you know your toy is going to be used for a little longer.\n\n");
			}
			else{
				outputText("Perhaps as a last display of [monster his] fast breaking pride the defeated werewolf runs away");
				if(player.isRaceCached(Races.WEREWOLF) || player.hasMutation(IMutationsLib.AlphaHowlIM)) outputText(", preferring escape over subservience. Well it looks like you didn't get that one, maybe next time.\n\n");
				outputText(".\n\n");
			}
			outputText("Toroughly satisfied by this nightly encounter you head back to camp.\n\n");

			cleanupAfterCombat();
		}
	}
}