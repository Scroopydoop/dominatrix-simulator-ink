== debug_setup ===

// -> demo_intro.genderchoice

/scene bedroom.intro
/lock move-approach
/character goddess

// -> demo_intro.stand_straight
-> demo_intro.inspection
-> demo_intro.debug_jump

=== demo_intro ===

/scene LogoRoom.TitleScreen

+ [wait 6]

- (instructions)

/scene LogoRoom.Instructions
/wait

+ [yes]
+ [no]
    /scene LogoRoom.Empty
    -> instructions

- /scene LogoRoom.VerifyAge

+ [yes]
+ [no] -> demo_intro.DemoEnd

- /scene LogoRoom.Notifications

+ [move]

- (genderchoice) /scene hallway.genderchoice
/lock exit

- (options)

+ [character-choice:male]
    ~ player_name = "boy"
    <i>You now appear masculine.</i> #999
    /unlock exit
    -> options

+ [character-choice:female]
    ~ player_name = "girl"
    <i>You now appear feminine.</i> #999
    /unlock exit
    -> options

+ [move]

- (flash_scenes)

/scene bedroom.flash1
/prop orgy_audio
/character goddess
/perform bored

+ [wait 3]

- /scene bedroom.flash2
/character goddess
/perform squat

+ [wait 3]

- /scene bedroom.flash3
/character goddess
/perform step_on

+ [wait 4]

/scene bedroom.intro
/prop -orgy_audio
/lock move-approach
/character goddess

/perform amused

- Oh... How rude. #01

/perform bored

And I was having so much fun. #02
Ah, well... #03

/perform fake_annoyed

- (debug_jump)

How did you get in here? #04
Did Mistress Yuki-Onna let you in? #05

/perform idle

- (ask_entry)
+ [yes]
    /perform annoyed
    I've told that girl not to interrupt me #06
    when I'm playing with my toys. #07
+ [no]
    /perform sassy
    No? Another curious guest, then. #08
+ (ask_entry2)[timeout]
    {cycle:
        - It's a simple question. Nod your head for yes. #09
        Shake your head for no. #10
        - I asked you a question. #11
        - Hurry up. I'm waiting. #12
        - I don't like it when people make me wait. #13
        - What makes you think you can ignore me? Answer me. #14
    }
    {shuffle:
        - Did my Yuki let you in? #15
        - Did that naughty little maid let you in? #16
        - Did a dark-haired maid bring you to me? #17
        - Yuki-Onna is disobeying me again. She let you in, didn't she? #18
    }
    -> ask_entry
+ [distracted] -> PayAttention -> ask_entry2

- /perform bored

Well, you can't stay here. #19


// Debug Jump
// (must be in-editor and have 'Debug' checked in StoryTeller)
{ isVideo() :
    -   -> video_jump
}


/perform fake_annoyed

Only the truly exceptional may stay in my presence. #20
And you are <i>obviously</i> not exceptional. #21
/perform unhappy
Are you? #22

/perform idle

- (ask_exceptional)
+ [yes]
   /perform laugh
   Oh how absolutely delusional you are! #23
   /perform sassy
   You are nowhere near worthy. #24
    
+ [no]
    /perform fake_annoyed
    
    Now, that is a very honest answer. #25
    Perhaps I will give you a chance to prove your worth. #26
    
+ (ask_exceptional_again)[timeout]
    Do you think you're exceptional? #27
    -> ask_exceptional
    
+ [distracted] -> PayAttention -> ask_exceptional_again

- /perform pleased

I bet that turned you on. Didn't it?<br/>Spying on me and my precious pets. #28
  
/perform idle

- (ask_spying)
+ [yes]
  /perform amused
  Of course it did. #29
  I bet you'd like to see more of that, wouldn't you? #30
  /perform sassy
  Perhaps you'd like to be one some day? #31
  /perform idle

+ (spying_no)[no]
    /perform thoughtful
    No? How disappointing. #33
    I don't think you're going to be much fun at all. #34
    -> ask_spying_done
    
+ [timeout]
    /perform thoughtful
    Be honest now. Spying on me turned you on, didn't it? #35
    -> ask_spying
    
+ [distracted] -> PayAttention -> ask_spying_again

- (ask_spying2)

+ [yes]
    /perform fake_annoyed
    Well too bad. You haven't earned that privilege yet. #32

+ [no] -> spying_no

+ (ask_spying_again) [timeout]
    /perform thoughtful
    Be honest now. Spying on me turned you on, didn't it? #35
    -> ask_spying2

+ [distracted] -> PayAttention -> ask_spying_again


- (ask_spying_done) /perform sassy

I bet you have no idea where you are, do you? #36
 
- (ask_where)
  
/perform idle

+ [yes]
    // /perform laugh
    /perform amused
    You think you know where you are? #37
    You have no clue. #38
    
+ [no]
    // /perform agreement
    /perform amused
    Of course you don't. #39
    
+ (ask_where_again)[timeout]
    /perform angry
    Well... do you have any idea where you are? #40
    -> ask_where
    
+ [distracted] -> PayAttention -> ask_where_again

/perform lean_forward

- You're just a tiny little mouse stuck in a maze. #41

You may never find your way out again. #42

/perform behold

This is no ordinary house, mind you. #43

/wait

/perform annoyed

Even so. You are here now. #44

/perform bored

And you won't be going anywhere for quite a while. #45

/perform thoughtful

That means I'll have to give you a name. #46

/perform sassy

Would you like that? #47
  
/perform idle

+[yes] 
    /perform pleased
    Well, well. I must say I'm pleased. #48
    /perform amused
    I think we are off to a good start. #49
    /perform fake_annoyed
    Don't you? #50
    
    /perform idle
    
    ++[yes]
        /perform amused
        Keep this up and I might just take an interest in you. #51
    
    ++[no] -> DemandApology ->
        /perform thoughtful
        Now... as for a name. #52
    
+ [no]
    /perform fake_annoyed
    Too bad. #53
    Whatever name you had before is gone. #54

+ [timeout]
    Cat got your tongue? #55
    Well... I will ignore that for now. #56

-
/perform thoughtful

I will name you... {player_name}. #57

/perform amused

I expect you to respond to {player_name} from now on. #58

Until you earn a new name, that is. #59
/perform unhappy
Do you understand? #60

/perform idle

+ [yes] -> GoodJob ->
    /perform sassy
    I am pleased. #61

+ [no]
    /perform annoyed
    Let's try this again. Your name is now {player_name}. #62
    /perform unhappy
    Everyone who meets you will refer to you as {player_name}. #63
    One day, if you are very <i>very</i> good, you may earn a new name. #64
    /perform amused
    But for now, your name is {player_name}. #65

+ [timeout]
    /perform thoughtful
    Well, perhaps you're a little overwhelmed. #66
    That's to be expected. #67
    /perform amused
    Just remember your name is {player_name} #68
    /perform sassy
    until I decide otherwise. #69

- /wait

/perform unhappy

I really must send you away soon. #70
/perform amused
But first, let me have a good look at you. #71

+ [continue]

- (inspection)
- (inspection_tries)

/perform point_down

{cycle:
    - Come here. #72
    - Come here, {player_name}. #73
    - I <i>said</i> come here! #74
}

/unlock move-approach
  
+ [move]
    /lock move-approach
    -> GoodJob ->
+ { inspection_tries < 2 } [timeout]
    /lock move-approach
    -> inspection
+ { inspection_tries >= 2 } [timeout]
    /lock move-approach
    -> CheckIfInterested -> inspection
+ [distracted]
    /lock move-approach
    -> PayAttention -> inspection

- /lock move-approach

/perform fake_annoyed

I'm always curious about our new guests. #75
/perform sassy
I so rarely take the time to inspect them personally #76
when they first arrive. #77
This is a bit of an unexpected treat. #78
/perform pleased
You don't mind, do you? #79

/perform idle

+ [yes] How unfortunate\. #80
    /perform annoyed
    Honestly, I don't even know why I bother asking. #81
+ [no]
    /perform sassy
    Mmm... I think someone might be enjoying this. #82
+ [timeout]
    That's alright. It's not like you have a choice anyway. #83
+ [distracted] -> PayAttention -> stand_straight

- (stand_straight)
- (stand_straight_tries)

/perform unhappy

{cycle:
    - Stand up straight. #84
    - Come on. Lift that head a bit for me. #85
    - Chin up, little one. Let me inspect you. #86
}
  
/perform idle

- (raised_chin_fail)

+ [pose:raised_chin] -> HoldPose(-> raised_chin_fail, -> stand_straight) ->
+ { stand_straight_tries < 2 } [timeout] -> stand_straight
//+ { stand_straight_tries >= 2 } [timeout]
+ { stand_straight_tries >= 2 } [timeout] -> CheckIfInterested -> stand_straight
// + [no] -> CheckIfInterested -> stand_straight

- -> GoodJob ->

/perform circle_player

That's it. #87
Push your shoulders back and arch that lovely spine. #88
Stick that pretty little ass out where I can see it. #89

/wait for:circle_player

Now then... #90

/perform point_down
- (kneel)
- (kneel_tries)

{cycle:
    - Kneel. #91
    - Get down on your knees. #92
    - You belong on your knees. Down. #93
}

- (kneel_fail)

+ [pose:kneel] -> HoldPose(-> kneel_fail, -> kneel) ->
+ { kneel_tries < 2 } [timeout] -> kneel
//+ { kneel_tries >= 2 } [timeout]
+ { kneel_tries >= 2 } [timeout] -> CheckIfInterested -> kneel
// + [no] -> CheckIfInterested -> kneel

- -> GoodJob ->

/perform sassy

Mmmmm... so much delicious flesh to work with. #94

/perform amused

Strong bones and muscles. #95
You'll need to be flexible, as well. #96
/perform fake_annoyed
Oh yes... there is much here we can work with. #97

- (present_self)
- (present_self_tries)

/perform amused

Arms behind your head. #98
Thrust your chest out. Knees apart. #99
/perform unhappy
I want to see you present yourself more fully to me. #100
  
/perform idle

- (present_fail)

+ [pose:present] -> HoldPose(-> present_fail, -> present_self) ->
+ { present_self_tries < 2 } [timeout] -> present_self
//+ { present_self_tries >= 2 } [timeout]
+ { present_self_tries >= 2 } [timeout] -> CheckIfInterested -> present_self
// + [no] -> CheckIfInterested -> present_self

- -> GoodJob ->

/perform fake_annoyed

Look at you. So obedient. So ready. #101

/wait 3
/perform fake_annoyed
You may go. But first, a reward. #102
/perform thoughtful
You may show me how much you appreciate my instruction. #103

/perform present_foot

You may bow before me and kiss my feet. #104

- (kiss_feet)
- (kiss_feet_tries)

/perform present_foot

Bow down, kiss, then back to your pose like a good little {player_name}. #105

- (kiss_feet_fail)

+ [pose:kiss_feet] -> HoldPose(-> kiss_feet_fail, -> kiss_feet) -> GoodJob ->
+ { kiss_feet_tries < 2 } [timeout] -> kiss_feet
+ { kiss_feet_tries >= 2 } [timeout]
// + [no] No?! #106
//    /perform confused
//    Turning down such a reward. You are a strange one. #107

- /perform angry

That's enough. #108
You might just prove useful one day, #109

/perform bored

but you'll need much more training first. #110

/perform sassy

Off to Mistress Yuki-Onna with you. #111
I'm sure she can show you the ropes, so to speak. #112

- (video_jump)

-> ByeForNow

= ByeForNow

/perform snap_fingers

/scene bedroombroken

/wait 1.5

/character goddess-huge

/perform looming

Bye for now, {player_name}. #113

/wait 5

// { isDebug() :
//    -> debug_again
// }
-> DemoEnd
// -> demo_tutorial

- (debug_again)
    + [yes] -> debug_jump
    + [no] -> DemoEnd

= GoodJob

/perform fake_annoyed

{ shuffle:
    - There's a good {player_name}. #114
    - What a good little {player_name}. #115
    - That's my {player_name}. #116
    - Aren't you the sweetest little thing. #117
    - Very nice. #118
    - That will do just fine. #119
    - Quite satisfying. #120
    - Mmmm. I like that. #121
    - Someone is being a good {player_name}. #122
    - Well done. #123
    - That's very pleasing. #124
}

->->

= PayAttention

/perform amused

{ cycle:
    - Look at me when I'm speaking to you, {player_name}. #125
    - I expect your eyes on me at all times, #126
    unless I tell you otherwise. #127
    - Did I give you permission to look elsewhere? #128
    - Didn't anyone ever teach you to look at people #129
    when they're speaking to you? #130
    - Pay attention to me when you're in my presence. #131
    - You're trying my patience. Pay attention. #132
    - Eyes on me, {player_name}. #133
}

+ [pay-attention]
+ [timeout] -> PayAttention

/perform thoughtful

- { cycle:
    - Where was I? Oh yes... #134
    - That's better. Let's continue. #135
    - Good {player_name}. #136
    - Let's try that again. #137
    - As I was saying... #138
    - Now... Let's start over. #139
}

->->

= DemoEnd

/scene LogoRoom.EndScreen

-> END

= DemandApology

/perform angry

/wait

{ cycle:
    - Don't pretend to toy with me. #140
    - I am not amused. #141
    - Such behaviour is unacceptable. #142
    - You are trying my patience, worm. #143
}

You will apologize this instant. #144

/perform sassy

Tell me: Do you beg for my forgiveness? #145

+ [yes] -> GoodJob ->
+ [no] -> CheckIfInterested ->

- /perform unhappy

You are forgiven. #146
Don't let it happen again. #147
->->

= CheckIfInterested

{CheckIfInterested > 1: -> check_terse}

/perform unhappy

These are the sorts of tasks demanded of you here. #148
- (check_again)

/perform behold

Are you willing to simply do as I say like a good {player_name}? #149

/perform idle

+ [yes] -> check_yes
+ [no]
+ [timeout] -> check_again

- (check_terse) Really? #150

/perform angry

We will need to be rid of you if you can't perform. #151

Your willingness to serve is, after all, why you are here. #152

/perform annoyed

So I'll ask one last time: #153

/perform lean_forward

Are you willing to perform for your goddess? #154

+ [yes] -> check_yes
+ [no]

- /perform annoyed
Then away with you. #155
Perhaps another time when you are ready to learn your place. #156
-> ByeForNow

- (check_yes) -> GoodJob ->
/perform confused
There is hope for you yet. #157

->->

=== HoldPose(-> onFail, -> onTimeout)
+ [timeout] -> onTimeout
+ [pose-cancel] -> onFail
+ [pose-success] ->->



