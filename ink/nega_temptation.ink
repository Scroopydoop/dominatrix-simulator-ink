=== nega_temptation ===
{ web: -> select_gender -> }

/scene burned_room
/character nega
/equip dice 

{ web:
    <blockquote><i>You are disoriented for a moment as everything turns black and the scene around you changes.</i></blockquote>

    <blockquote><i>You find yourself in a dim room badly blackened by a recent fire. Charred and broken remnants of furniture litter the room. A sullen and attractive woman in a tattered maid's uniform smiles menacingly at you...</i></blockquote>

    + [Continue]
- else:
    -> start
}

- (start)
/perform bored
Don't worry, pretty {player_name}.
Expect that to happen once in a while.

/perform behold
Walk out one door, expecting to arrive somewhere,
and suddenly find yourself somewhere else.

/perform open_arms_shrug
You get used to it.

+[wait]

- (give_reward)

You have something I want.
/perform lean_forward
And you're going to give it to me.
Aren't you?

+ [yes]
    That's right.
    You're going to give me that reward marker
    and I might give you something in return.

+ [no]
    I would think twice about that if I were you.
    Are you sure you don't want to give me your reward marker?
    
    ++[yes]
        Stop wasting my time!
        Get out of here.
    
    ++[no]
        Very good. 
        I can be a lot of fun with the right guest.
    
+ [timeout]
    Well, do you want to be used and abused?
    -> give_reward

+[distracted] -> PayAttention -> give_reward

-
-> END

= PayAttention

{ cycle:
    - You're not very good at this yet, are you?
    You're supposed to look at me when I'm talking.
    - Bad {isBoy:prick|cunt}! You should look at me when I speak to you.
    - Oh gee. You need a lot of training. Look at me.
    - Didn't anyone ever teach you to look at people 
    when they're speaking to you?
    - It's very rude not to look at me when I'm speaking to you.
}

+ [paying_attention]
    { cycle:
        - Now... what was I saying? Oh right...
        - Much better. Ahem.
        - Good {player_name}. You might be teachable after all.
        - Now back to your instructions.
    }
    ->->
+ [timeout] -> PayAttention