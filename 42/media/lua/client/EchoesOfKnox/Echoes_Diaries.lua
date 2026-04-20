-- Diaries: 70 readable journal entries (10 per subject) that let the player
-- piece together the interconnected stories of the seven missing people.
-- Items are tagged Journal_SubjectNN_MM (NN=subject 1..7, MM=entry 1..10).
-- On right-click → "Read", opens ISModalRichText with the translated
-- literary adaptation of the entry.

Echoes = Echoes or {}
Echoes.Diaries = Echoes.Diaries or {}

-- Tablas bilingues expuestas en el namespace para que Echoes_Diaries_ES.lua
-- (que carga despues por orden alfabetico) agregue su contenido sin pisar.
Echoes.Diaries.HEADERS_EN = Echoes.Diaries.HEADERS_EN or {}
Echoes.Diaries.HEADERS_ES = Echoes.Diaries.HEADERS_ES or {}
Echoes.Diaries.TEXTS_EN   = Echoes.Diaries.TEXTS_EN   or {}
Echoes.Diaries.TEXTS_ES   = Echoes.Diaries.TEXTS_ES   or {}

local SUBJECT_HEADERS = {
    [1] = {
        name = "Elliot Hargreaves, MD",
        role = "Internal Medicine Physician",
        source = "Brown leather notebook found in a drawer of the Riverside Hospital ER office. Loose pages, some on prescription paper. Doctor's handwriting.",
    },
    [2] = {
        name = "Claire Vance, RN",
        role = "Registered Nurse",
        source = "Blue-cover school notebook, lined, with a half-peeled daisy sticker. Apartment above the Muldraugh bakery. Mixed-color pens.",
    },
    [3] = {
        name = "Marcus \"Buck\" Delaney",
        role = "Supermarket Clerk & Stocker",
        source = "Spiral notebook from Zippee Dee Mart, pencil. Coffee stains. Block letters, many exclamation marks.",
    },
    [4] = {
        name = "Father Tobias Cross",
        role = "Catholic Priest",
        source = "Black hardcover spiritual journal, Saint Anne's parish, Rosewood. First page reads A.M.D.G. Entries read more like confession than prayer.",
    },
    [5] = {
        name = "Rhett \"Hawk\" Malone",
        role = "Auto Mechanic (ex-pilot)",
        source = "Margin notes in a 1978 Beechcraft King Air flight manual, shop pencil. Short lines. Many crossings-out. The later entries, unlike the early ones, run long - as if he finally had something to say.",
    },
    [6] = {
        name = "Daniel \"Danny\" Orozco",
        role = "P.E. Teacher",
        source = "Iron Will Gym attendance sheets, folded in fours, written on the back. Sweat stains. Late-night handwriting.",
    },
    [7] = {
        name = "Dr. Isaac Volkov",
        role = "Biologist, ex-agroindustrial researcher, independent farmer",
        source = "Numbered hardcover notebooks, I through XXIII, from the Rosewood house basement. Scientist's hand, steady at first, tremoring toward the end. Two languages, English and Russian, often on the same line.",
    },
}

-- DIARY_TEXTS[subjectID][entryN] = rich-text body (literary English adaptation)
-- Paragraph breaks are plain \n\n; ISRichTextPanel converts newlines to <LINE>.
local DIARY_TEXTS = {}

-- ============================================================================
-- SUBJECT 01 - Elliot Hargreaves, MD (Physician)
-- ============================================================================
DIARY_TEXTS[1] = {}

DIARY_TEXTS[1][1] = [[
Tuesday, November 3.

I lost a patient today. Sixty-eight years old, massive heart attack, nothing to be done. Margaret asked me how my day had been and I said fine. I said fine. Then I went to the study and poured a whiskey and spent an hour staring at the wall. How long have I been lying to my wife about things that aren't even lies — just a tiredness I don't know how to tell her about. The kids were sleeping. Tomas had his mouth open the way he did as a baby. Sophie was hugging her bear. Sometimes I think this is the life I chose, and that it's fine. Sometimes I don't.
]]

DIARY_TEXTS[1][2] = [[
Friday, November 13.

A new nurse started this week. Claire. I showed her how to intubate a child with croup and her hands kept trembling for an hour afterward — not from fear. From adrenaline. She laughed to herself in the hallway. She looked at me. I looked at her. Nothing happened. But something happened. I'm not going to write this anywhere serious. I write it here because I need to put it somewhere.
]]

DIARY_TEXTS[1][3] = [[
Wednesday, January 27.

I bought her a phone. Prepaid, small — the kind that fits in a little purse. I activated it under the name of a patient who died months ago and whose line was never cancelled. Paid in cash at West Point so it wouldn't show up on my cards. God, listen to me. I sound like a con man. I spend my life operating on people and it turns out the most complicated lie I ever learned to tell was buying a cell phone for a woman who isn't my wife.
]]

DIARY_TEXTS[1][4] = [[
Saturday, April 11.

Louisville. Four hundred dollars on a blackjack table and we spent every dollar in one night like we were kids again. Claire bought shoes she'll never be able to wear at the hospital. I ate some French thing whose name I couldn't pronounce. We came back up 65 at five in the morning with the radio loud, windows down, cold air coming in, and I drove with one hand and the other on her knee, and she slept with her mouth half-open against the glass. I thought: I wish this road never ended. Then I remembered Margaret and Tomas and Sophie and felt hollow. But the road kept going. And so did I.
]]

DIARY_TEXTS[1][5] = [[
Thursday, July 2.

Today I treated a little girl in the ER. Bike fall, nine years old, fractured arm. The father was frantic — young guy, muscular, looked like a gym teacher or something. He held her hand in the waiting room like she might vanish if he let go. I kept thinking about that image. The father and the daughter. What it means to be the one waiting outside the door. I'm always on the other side of the door. I don't know that I could ever be the one waiting.
]]

DIARY_TEXTS[1][6] = [[
Saturday, August 15.

I wrote a letter. I'm not going to send it. I tell Claire that next summer I'm leaving Margaret. That I'll give the kids time, that I'll find an apartment in Louisville, that we'll start over. I folded it and slipped it into my Netter anatomy atlas, volume two, the page on the pelvic region — a private joke she'd get. I'm not going to send it because I'm not sure. But I didn't tear it up either. That's an answer too, I suppose.
]]

DIARY_TEXTS[1][7] = [[
Friday, September 11.

A colleague told me today, half-joking and half-not, that I've been happier than usual for about a year now. That you can see it. I didn't know what to say. Later, in the parking lot, I overheard two nurses talking. One said to the other, "Vance seems different too." Something froze in me. Then something warmed. Then I realized I'd been smiling alone in my car, like an idiot.
]]

DIARY_TEXTS[1][8] = [[
Saturday, October 3 — Claire didn't show up.

I called the hidden phone thirteen times. No answer. Drove to Muldraugh. The apartment is locked. The baker downstairs said she hasn't seen her since Friday. I had to sit on the stairs to keep from throwing up. Went back to the hospital and asked around, casual. Nobody knows anything. I can't do more. I can't put her face on a missing poster. I can't tell the police I'm looking for her because I'm her lover. Margaret asked at dinner if I was feeling all right. I told her I'd lost a patient. Again.
]]

DIARY_TEXTS[1][9] = [[
Thursday, October 8 — the Iron Will.

I went to the gym where she trains. Nothing. The receptionist looked at me strangely. There was an old man in the coffee shop across the street who kept watching me. White beard, book in hand. I didn't recognize him. Later I thought maybe I did — that he was familiar from some old conference. I pushed it out of my head. I don't have room for faces today. Today I only have room for one face.
]]

DIARY_TEXTS[1][10] = [[
Friday, October 16 — a package arrived.

Margaret left it at the entrance. No return address. I opened it in the bathroom with the door locked. A red apple. A metal tag with a number: 02. And a note from her — my Claire, her handwriting — saying she's alive, that she'll wait for me tomorrow at six at the cabin by the lake. The cabin by the lake. Only she and I know about the cabin by the lake.

I hung the tag under my shirt right now. Margaret is sleeping. Tomorrow I'll tell her I have a conference in Lexington, I'll kiss her, I'll drive out, and I'll hold her. She's alive. God, she's alive.

If this is the last time I write in this notebook because next time I'm already with her and everything starts again — fine. That's very fine.
]]

-- ============================================================================
-- SUBJECT 02 - Claire Vance, RN (Nurse)
-- ============================================================================
DIARY_TEXTS[2] = {}

DIARY_TEXTS[2][1] = [[
Sunday, March 8.

Went to see Mom at the home today. She was better. Recognized me. Asked about Dad, like Dad didn't die fifteen years ago. I told her he was at work. Sometimes it's easier to lie to her than to explain it again. The nurse at the home told me Mom had sung a song at lunch — one I didn't know. I drove back with the radio on no station. Doc greeted me meowing like a month had passed. I gave him tuna and poured a glass of wine. It's Sunday and I'm tired and it's an old sadness I'm carrying, not a new one.
]]

DIARY_TEXTS[2][2] = [[
Tuesday, March 17.

Today a doctor taught me how to intubate a child with croup. His name is Hargreaves. Grey hair, brown eyes, and his hand stays on the patient's shoulder a fraction of a second longer than necessary. When he explained the procedure he looked at me as if I were the only person in the room. Then nothing happened. But in the elevator back up I realized I'd fixed my hair without knowing when.
]]

DIARY_TEXTS[2][3] = [[
Saturday, May 2.

We spent the night at a motel in West Point. Fake names. He wrote "John Smith" in the guest book and I laughed so hard I almost couldn't walk into the lobby. Then it was less funny. Then it was beautiful. Then it was guilt. Driving home I thought about his wife — Margaret — whom I don't know but has a name. I thought about his kids. I thought about me. I can't keep doing this. Tomorrow I'll tell him. Tomorrow I'll tell him. I write "tomorrow I'll tell him" and I know I won't tell him anything. Doc looks at me like he knows. Traitor cat.
]]

DIARY_TEXTS[2][4] = [[
Thursday, June 18 — pottery class.

Finished a mug today. Ugly but finished. The teacher said I have nurse's hands — that I'm not afraid of clay. I laughed. I liked that. I'm going to give it to him. What a silly thing, a mug for a married man, but I'm going to do it anyway. Next week I'll make one for Mom.
]]

DIARY_TEXTS[2][5] = [[
Sunday, August 30 — the West Point store.

Stopped by the Zippee Dee Mart for milk today and the clerk — skinny guy, grey beard, Cardinals cap — slipped a red apple into my bag without charging me. He said, "for the pretty nurse." It moved me. I ate the apple walking, after my shift, before heading to the apartment where he was waiting. What the clerk doesn't know is that apples are important in my life in a strange way I can't explain to anyone. Thank you, Mr. Cardinals.
]]

DIARY_TEXTS[2][6] = [[
Wednesday, September 9 — Danny.

Today at the gym I stayed on the bench after training. Danny, the coach, sat next to me. I ended up telling him things I don't tell anyone. Not everything. But a lot. He's a good guy. He gave me a strange capsule and said it would help me feel better about myself. He said it with such good faith that I didn't have the heart to refuse. I have it in my jean pocket. I don't know if I'll take it. Maybe I will.
]]

DIARY_TEXTS[2][7] = [[
Wednesday, September 9 — night entry.

I took it. I waited. I looked at myself in the mirror, searching for something. I didn't feel anything. He came over. Everything was the same. Exactly the same as always. And it was right there, while he slept and I stared at the ceiling, that I understood something. I don't want to keep being the other woman. No more codes, no more apples on desks, no more fake names. The pill did nothing to my body. But it did something to my head. I'm going to ask him to leave her. This time for real.
]]

DIARY_TEXTS[2][8] = [[
Friday, October 2 — a package arrived.

A box at the door this morning. No return address. Red apple. Metal tag engraved with the number 01. And a note: "So you don't have to hide it anymore. I'll wait for you tonight at the motel on mile 12. I'm going to leave her." It's him. It has to be him. Nobody else in the world would write that sentence. I cried on the kitchen floor for ten minutes and it wasn't sadness, it was relief. After three years. I hung the tag under my blouse, against my skin. I'm going tonight. If this is the last page before the rest of my life — good. Let the rest begin. Doc, be good. I'll be back tomorrow.
]]

DIARY_TEXTS[2][9] = [[
[Undated — pencil on a napkin found in her pocket]

everything hurts. there's an old man. it's not him. my head hurts. if someone finds this please tell elliot. he knows where i live. he knows who i am. doc is alone. please the cat.
]]

DIARY_TEXTS[2][10] = [[
[Folded paper — written months later, trembling hand]

I don't write much anymore. My hands tremble and the veins show black down to my fingertips. But today I wrote a long letter to someone I don't know and I felt, for the first time since the motel, that I was doing something right. We were seven around a car and all of us signed it. I left the box at the door and I didn't look back.

Elliot squeezed my hand when I came back in. He didn't say anything. He didn't need to.

I hope whoever reads this understands, someday, that we were people too — before. We were people who loved other people. We were people who ate apples in kitchens. We were people. Nothing more.
]]

-- ============================================================================
-- SUBJECT 03 - Marcus "Buck" Delaney (Supermarket Clerk)
-- ============================================================================
DIARY_TEXTS[3] = {}

DIARY_TEXTS[3][1] = [[
Monday, May 4.

Today Fign climbed onto my shoulder while I was reading the paper and stayed there the whole coffee break. Rufus growled, jealous. I told them both there's enough Buck to go around. Rufus didn't understand but he lay at my feet anyway. Fign stole a piece of my cookie. They're my kids, these two. Wouldn't trade them for anything.
]]

DIARY_TEXTS[3][2] = [[
Thursday, May 21 — the light.

LAST NIGHT I SAW A LIGHT. Over the trees to the south. Wasn't a plane, wasn't a satellite, wasn't the moon. It stayed still for about fifteen minutes and then it was gone without moving, like it just switched off. Third one in my life. Told Mrs. Henderson today. She said "Buck, again?" and laughed and bought her bread. I'm used to it. But this time was different. This time I felt it was for me. That they were checking if I was ready. Fign woke up and hid under the bed and didn't come out until morning. Animals know.
]]

DIARY_TEXTS[3][3] = [[
Saturday, June 6 — the pretty nurse.

A girl came into the store today. Comes often. Brown hair, tired eyes, you can tell she works at the hospital. Today she looked like she'd done three shifts back-to-back. I slipped a red apple into her bag, didn't charge her. Said, "for the pretty nurse." She smiled. I thought of my Aunt Edith, from when I was a kid. There are people who need an apple more than others. You hand them out how you can.
]]

DIARY_TEXTS[3][4] = [[
Tuesday, June 16 — Father Cross.

Father Tobias came by for coffee. I told him about the light. He went quieter than polite folks usually go. Then he said, "take care, Buck," and walked off looking at the empty street. Things happen to that priest. Not like to me. Different things. Sadder things. One day I'll work up the nerve to ask him.
]]

DIARY_TEXTS[3][5] = [[
Sunday, June 28 — Fign and the McKenzie squirrel.

Fign fought a squirrel in Mr. McKenzie's yard. Fign won. Came back with a torn ear and her dignity intact. I cleaned it with cotton. She bit my ear gently when I finished — that's her way of saying thank you. Rufus pretended to be asleep the whole episode. That dog is a divine coward.
]]

DIARY_TEXTS[3][6] = [[
Wednesday, July 8 — the dreams.

Three nights in a row, same dream. I'm standing in the middle of a clearing in the forest. Above me there's no moon — there's something else. I can't move but I'm not afraid. A voice says, "it won't be long now, Marcus." I wake up calm. Nobody has called me Marcus since Mom died.
]]

DIARY_TEXTS[3][7] = [[
Friday, July 31 — eyes.

I FELT EYES ON THE BACK OF MY NECK ALL DAY. At the store, in the truck, at home. It's not paranoia. It's attention. Someone is watching. I feel it in my shoulder blades like cold. Rufus growled at a corner of the living room where there was nothing. Fign stayed stiller than I've ever seen her, on the curtain. The three of us knew. I don't know who's watching. But let them know I'm ready.
]]

DIARY_TEXTS[3][8] = [[
Tuesday, September 15 — the package came.

IT CAME. IT CAME. A box on the counter this afternoon. No return address. Inside: a red apple and a metal tag with my name and the number 03. And a note that said, "Marcus, it's time. We knew you were ready." FIFTY-TWO YEARS. Fifty-two years saying it and nobody believing me. Today I cried behind the cash register with Rufus at my feet. Not from sadness. From pride. Tonight I'm going to the clearing. I've left food for Rufus and Fign for three days. If I come back, I'll tell them about it. If I don't come back, they should know I was happy.
]]

DIARY_TEXTS[3][9] = [[
[Note taped to the refrigerator, careful handwriting]

RUFUS eats at 7 and at 6. No more. He's a bit chubby. Heart pills in the yellow bottle, one each morning. FIGN eats shelled nuts (NOT in the shell, she'll choke), strawberries sometimes. The mailbox key is in the coffee tin. If I don't come back this time, I love them both. Don't wait for me. Someone came looking for me and I knew they would. Neighbor Henderson, please come feed them. Thanks. Marcus.
]]

DIARY_TEXTS[3][10] = [[
[Loose page, months later, crooked writing]

i write poorly now. it's hard. i'm with the other six. they're good people. the priest takes care of me. the doctor too. the mechanic talks little and i talk for two so we balance out. it wasn't the martians. i'm writing this for the Buck of before who deserves to know. it wasn't the martians. it was an old man with a garden who made a mistake. but they still picked me. they still saw me. i was right my whole life and that i get to take with me. rufus if you're alive i'm sorry. fign if you're alive i'm sorry. they took my blood but they left me my heart. buck of before, sleep easy. you were right.
]]

-- ============================================================================
-- SUBJECT 04 - Father Tobias Cross (Priest)
-- ============================================================================
DIARY_TEXTS[4] = {}

DIARY_TEXTS[4][1] = [[
Sunday, March 12 — Ellie's anniversary.

Eighteen years today. I said the nine o'clock mass like always. Nobody in town knows what day this is for me. Later, in the sacristy, I knelt and asked forgiveness — from her, not from God. God forgives me as a matter of profession. Ellie isn't here. And that's what won't heal. Tonight I'll walk past the corner of the house where she died. I don't stop anymore. Haven't stopped in years. But I walk past.
]]

DIARY_TEXTS[4][2] = [[
Thursday, April 2 — the prison.

I still go to the prison on Wednesdays. Today I heard confession from a young man from Rosewood who beat his wife to death. He's twenty-six. Cries like a child. I gave him absolution and felt, as I did it, that I was giving it to myself. God, forgive me. Not for the sins I committed. For the sins I keep committing every time I let these people love me without knowing who I was.
]]

DIARY_TEXTS[4][3] = [[
Friday, April 24 — Hawk.

Took the Plymouth to the shop. Hawk greeted me with his black coffee. We talked for three hours. He doesn't believe in God. I don't believe his not-believing. We laughed. He told me if God exists, He's an engineer, not a poet. I told him I think He's a mechanic. He sat with that for two days, then texted me: "maybe you're right, padre." I don't talk about Ellie with Hawk. I don't talk about anything that really matters. But I talk, and it's the closest thing to a friend I've had since then.
]]

DIARY_TEXTS[4][4] = [[
Sunday, May 10 — Isaac.

Isaac brought me herbs today for the sick. He's done this for years. I don't know much about him, except that he's a widower and talks little. But today he looked tired. More than tired. He pretended to be normal but his eyes carried something very heavy. I asked if he wanted to confess. He laughed, without humor, and said "padre, if I confessed I'd ruin your week." I hugged him. Nobody has ever stiffened that much in an embrace of mine. I pray for him tonight.
]]

DIARY_TEXTS[4][5] = [[
Wednesday, June 17 — Buck and the light.

Buck told me he saw another light in the sky. Over the trees to the south. I went quiet. In this parish, on the nights of vigil, I've felt things that don't match anything I was taught at seminary. I don't talk about them with anyone. But when Buck told me his story, I wanted to tell him mine. I held back. I said, "take care, Buck." One day I'll work up the nerve.
]]

DIARY_TEXTS[4][6] = [[
Tuesday, July 7 — the dream.

I dreamed about Ellie. But not the Ellie of the later years. The Ellie of nine, the one who followed me to the yard with her crooked braids. She was saying "Toby, get up, we'll be late." I woke up crying. Hadn't dreamed of her like that in a decade. I wondered what it meant. I wondered if God was warning me. Then I wondered if God warns, or only waits.
]]

DIARY_TEXTS[4][7] = [[
Saturday, August 1 — an inmate.

Something strange happened at the prison today. A guard looked at me longer than necessary. For a second I thought he knew. He can't know. Only the three men serving time for what happened know, and Hank never spoke. Hank will never speak. But that look stayed in my body all day. God, if You want my secret out, let it out. But give me the courage not to run when it does.
]]

DIARY_TEXTS[4][8] = [[
Thursday, October 22 — a letter arrived.

Someone left a box in the sacristy. No return address. Red apple, tag with the number 04, and a long typewritten letter. It's from Hank. Eighteen years without a word from him. He says he wants to confess to me before he dies. Says a guard will leave the side door of block B open Saturday at four in the morning. That I should come alone. I knelt and prayed for three hours. I'm afraid. But I also have something bigger than the fear. This is what I've been waiting eighteen years for. This is the tribunal of God meant for me. I'll go.
]]

DIARY_TEXTS[4][9] = [[
[Torn page from a Bible, written in the margin of Matthew 6]

it wasn't Hank. wasn't anyone. the door closed behind me. i was left without oils, without stole, just the little box. an old man told me he would make something important out of me. drew my blood. talked about science. i prayed hard in my head that he would feel shame, not me. Ellie, if you're watching from wherever you are, it's not revenge i want. not anymore. i just want it to end.
]]

DIARY_TEXTS[4][10] = [[
[Note found with the other diaries, written with a hand barely obeying]

God granted me two beautiful things at the end. The first was forgiving the old man who used us. Not for him. For me. The second was writing, with the other six, a letter for someone I don't know. We didn't put our sins in it. We put our names. I hope that's enough. Lord, may it be that when my body stops being my body, my soul is already with You and not inside what comes next. Amen.
]]

-- ============================================================================
-- SUBJECT 05 - Rhett "Hawk" Malone (Auto Mechanic)
-- ============================================================================
DIARY_TEXTS[5] = {}

DIARY_TEXTS[5][1] = [[
January - no day.

Started the sedan project. Ford '71. Adapted a system I read about in an old avionics magazine. If it works, the thing will drive itself. If it doesn't, I roll it off the ravine and laugh. I won't say this out loud to myself, but this project is saving me this winter.

Yesterday I had another flash, number twenty-something this year. A new customer I'd never seen walked into the shop two days later. My hands shook when I recognized him. He didn't notice.
]]

DIARY_TEXTS[5][2] = [[
March — no day.

Tobias came in with the Plymouth. That car's a corpse and he knows it and I know it, but we both act like we're saving it. Two cups of bad coffee. He asked if I believed in anything. I told him yeah, in engines. He laughed. Didn't tell him the other thing. The other thing is for me.
]]

DIARY_TEXTS[5][3] = [[
April - Tuesday.

Eyesight's worse. Today I mistook a 10mm for an 11mm and that's already a problem. Told the customer I had sand in my lenses. Inside, I collapsed. My vision is deteriorating fast.
]]

DIARY_TEXTS[5][4] = [[
July - Saturday - FLASH 1.

SOMETHING HUGE HAPPENED. I was adjusting a servomotor on the sedan, crouched under the wheel, and my sight went and a flash hit me - long, two seconds that lasted an hour. I saw MYSELF driving the sedan down an empty highway, thin, dirty, fast. Next to me sat a priest. Yes. A priest from Rosewood that I don't know, one I've never in my life gotten into any car with. Cassock torn. Yelling something at me. Behind us, people running. People running wrong. I came out of the flash slamming my head against the steering wheel and vomited beside the shop. This isn't a regular flash. This is something big. This is something ugly.
]]

DIARY_TEXTS[5][5] = [[
July - Sunday - FLASH 2.

I went to mass. First time since Mom died. Drove out to Rosewood, walked into Saint Anne's, sat at the back. When the priest came out to the altar I almost fell. It was him. It was exactly him. I stayed until the end and then went up to speak with him. I told him kind lies, asked if we knew each other, if he'd ever brought a car to the shop. He answered politely. No, we hadn't met, not ever. I drove back slow and afraid of myself. Tobias, if you ever read this, I'm sorry in advance. I don't know what we're going to live through together. But we're going to live through something. And it won't be pretty.
]]

DIARY_TEXTS[5][6] = [[
August - Thursday - FLASH 3.

Went to Riverside for a part. A man and a woman were walking on the opposite sidewalk, close but not touching. I didn't know them. A flash hit me. I saw the same man on his knees in front of her, saying "we'll be together all our lives, till death do us part." Two seconds. I froze. I turned around to see them better and THEY turned around too, but to separate. She walked into the clinic. He crossed to the other side of the street. As if they didn't know each other. As if they had choreography for it. Right there I understood one thing: the flashes aren't always the future. Sometimes they're the secret.
]]

DIARY_TEXTS[5][7] = [[
September - Monday - FLASH 4.

A guy walked into the shop with a motorcycle leaking oil. Gym teacher. I shook his hand and the contact triggered a flash. NOW THEY COME THROUGH TOUCH. I saw him sitting on a gym bench next to the same woman from Riverside, the one from the secret couple. He was putting a white capsule in her hand and saying something in her ear. I didn't hear the words but I felt them. Ugly. I threw him out of the shop. Almost yelled at him. He left the bike lying there, leaking oil. I locked myself inside and cried from rage. Why do they show me these things? So I'll avoid them? So I'll understand them? Or just to screw with me?
]]

DIARY_TEXTS[5][8] = [[
September - Wednesday - THE BLACKOUT.

Pulled the paperwork on the motorcycle guy. Daniel Orozco. Iron Will in West Point. Went to find him, to ask what capsule that was, what woman that was, what the hell was going on. Didn't go into the gym. On the sidewalk across the street an old man with a white beard was coming out of a coffee shop. I looked at him. He looked at me. And the longest flash of my life hit me. Almost a whole film. A warehouse with fluorescent lights. Seven cots. IV lines. Me on one of them. The priest on another. The gym teacher on another. The woman. Her lover. AN OLD STORE CLERK I DON'T KNOW. And the old man with the white beard. The same old man standing three meters from me. BUT IN THE FLASH THE OLD MAN WASN'T THE ONE LOCKING THE OTHERS IN. HE WAS ONE OF THE ONES LOCKED IN. My nose started bleeding. I blacked out on the sidewalk. Woke up in a hospital. The chart said vasovagal crisis. Pure bullshit.
]]

DIARY_TEXTS[5][9] = [[
September - Friday - I take the job.

Had another flash last night. Me climbing into a King Air. A voice saying "good flight, captain." A pinprick. Black. I understood that no matter what, I end up there. Today a package came to the shop with an apple, a tag with the number 05, and a letter offering me the King Air job. If it's inevitable, let me be the one walking toward it, not them coming to get me while I sleep. I'll go. The sedan stays covered with the tarp. If someone finds it, let them know: it works. Three meters it drove on its own. It was a little but it was enough. I hope someone uses it. I hope it's good for something. The flashes weren't lies. I always knew where I was going.
]]

DIARY_TEXTS[5][10] = [[
[Last entry, in the margin of the King Air manual, written blind]

i can't see well from the other eye now. i write from memory over the manual i know by heart. the sky didn't come. an old man came. fine. not that different. the sky was always a metaphor anyway. today tobias held my hand before i went under. said a prayer in a low voice. i didn't understand the words but i understood the voice. the warehouse vision came true and the old man was there with us as one of us. i was right again and i wish i hadn't been. captain of what, tobias. of nothing. captain of having seen. that's enough. good flight.
]]

-- ============================================================================
-- SUBJECT 06 - Daniel "Danny" Orozco (P.E. Teacher)
-- ============================================================================
DIARY_TEXTS[6] = {}

DIARY_TEXTS[6][1] = [[
Monday, February 2 — 5:15 a.m.

Went out running like every Monday. Town's asleep. I like it when it's like this, when the world feels like mine and the bakers'. Sofia, seven years today. Lucia asked me yesterday what you were like. I told her you were the best. I told her you sang badly. She laughed. I bit the inside of my cheek so I wouldn't cry in front of her. Later in the shower I did. Seven years, love. I'm doing the best I can.
]]

DIARY_TEXTS[6][2] = [[
Thursday, March 5 — homework.

Lucia didn't understand long division. I remembered you, Mom, the accountant — how you made it look so easy. We were up until eleven. She fell asleep with the calculator in her hand. Tomorrow I have a double shift and my eyes close on their own. But it was worth it. She got a 6.8 on the test. Hugged me hard. That hug I bottle and open whenever I feel like falling apart.
]]

DIARY_TEXTS[6][3] = [[
Friday, April 10 — the braces.

The orthodontist told me today I'm three payments behind. Said, "Danny, I can't suspend the girl's treatment, but —." But. There's always a but with money. Walked out and almost cried at the stoplight. State gym teacher plus night shift still isn't enough. Something has to come up. Something has to come up.
]]

DIARY_TEXTS[6][4] = [[
Saturday, April 25 — the Rosewood fair.

Lucia and I walking around. Stopped at an old man's stand where he was giving away basil. Isaac, his name is. Strange guy — friendly but strange, like he's always thinking about something else. He asked about me. I told him what I did. He gave me his home address on a napkin and said to come by anytime. Lucia grabbed his hand out of nowhere and said "you smell like the forest." The old man laughed. So did I. Good day.
]]

DIARY_TEXTS[6][5] = [[
Wednesday, June 3 — the offer.

Went to Isaac's for the third time. He showed me the basement. I won't lie, notebook — I got a little scared. But then he explained. He told me he had something that could change people's lives, that he was old, that he needed someone to distribute them at the gym, that he wouldn't take a cut. He offered me money for Lucia. A lot. I didn't ask too many questions. We made up together the story about some guy in a parking lot, in case anyone asked. Drove home with the first box and threw up on the sidewalk before going inside. Then I made Lucia soup.
]]

DIARY_TEXTS[6][6] = [[
Wednesday, September 9 — Claire.

Today a woman from my class — Claire, a nurse — stayed on the bench after training. Sad. I got a piece of the story out of her, not everything but enough. In love with someone who isn't hers. I gave her a capsule. Didn't charge her. Said something about how if she loved herself more it would be easier. I don't know why I said it. It just came out. I hope the pill helps her. I hope I'm good for something, even by accident.
]]

DIARY_TEXTS[6][7] = [[
Wednesday, September 16 — something strange.

Claire came back to the gym and told me the pill did nothing to her. NOTHING. Eight months selling these things and nobody has ever told me that. Something strange is happening. I went to Isaac's that same night and told him. The old man calmed me down but his eyes were different. I drove back thinking something ugly: I don't know what I've been selling at the gym. Never knew. Lucia was asleep when I got home. I watched her a long while.
]]

DIARY_TEXTS[6][8] = [[
Thursday, October 29 — a photo of my daughter.

A box arrived. Apple. Tag with the 06. And a photo of Lucia leaving school, taken today, from a car. A PHOTO OF MY DAUGHTER. I threw up twice in the bathroom. They threaten to send another photo Monday. I have to go alone tomorrow to a parking lot. I'm a gym teacher. I've got forty kilos on any office worker. If it's a fight, I fight. If they kill me, I fight to the end. All I need is for Lucia not to be anywhere in the frame. Lucia, not. Lucia, never.
]]

DIARY_TEXTS[6][9] = [[
[Crumpled note, found in the seat of the abandoned car]

if anyone finds this: my daughter is Lucia Orozco, eleven years old, she's with the neighbor Mrs. Patterson in the building at 412 Main Street. Tell Social Services. My cousin Marta lives in Louisville, number in the address book. don't let her go to the state, please. LUCIA. LUCIA. LUCIA. i'm Daniel Orozco and i was a good father. i did one thing wrong for her sake. if in the end it helped her, it was worth it. if it didn't, i'm sorry.
]]

DIARY_TEXTS[6][10] = [[
[Written weeks later, handwriting of someone very tired]

i learned in the warehouse what i'd been selling. i learned about the compound. i thought about killing isaac with my bare hands. i didn't. not because i forgave him, but because lucia wouldn't have wanted a murderer for a dad. isaac was useful to keep the others alive a little longer, and i chose the others over my revenge. i hope, daughter, that one day you understood why i did what i did at the gym, and why i didn't kill the man who ruined my life when i could have. i hope you're alive. i think about you every minute. if someone reads this who someday finds you, tell her her dad thought of her to the end. to the very end.
]]

-- ============================================================================
-- SUBJECT 07 - Dr. Isaac Volkov (Biologist)
-- ============================================================================
DIARY_TEXTS[7] = {}

DIARY_TEXTS[7][1] = [[
Notebook XVIII, March 4.

Mrs. Kerr came back today to pick up two kilos of tomatoes. She walks upright. A year ago she couldn't climb stairs. She's the fourth customer I've seen with improvements that shouldn't be attributable to diet. There's something in the fruits I'm producing. Marina, if you can still hear me, I want you to know this wasn't what I planned. But now that I've seen it, it isn't something I can unsee.
]]

DIARY_TEXTS[7][2] = [[
Notebook XIX, May 12.

Synthesized the active principle into a compressed cellulose matrix. Capsules. Forty milligrams. Equivalent to one month of garden intake. Initial tests on volunteers (myself included, two weeks) show: sustained energy increase, improved night vision, elevated libido, changes in body odor (pheromones, likely). Marina would have laughed today. She would have liked this.
]]

DIARY_TEXTS[7][3] = [[
Notebook XX, June 3 — the teacher.

A young man stopped at the fair today. Gym instructor. Widower. One daughter. He has the desperate air of those who need something. Told him to come by the house. It may be him. He may be my bridge. I don't want to sell. But I need to distribute. I need to see what the compound does in forty different bodies, not just one. Science doesn't do itself.
]]

DIARY_TEXTS[7][4] = [[
Notebook XX, July 11 — agreement.

Daniel accepted. We made up a story in case anyone asks — an anonymous man in a parking lot, a Canadian mafia. More believable than the truth. The truth is never believable. He doesn't want to know. I don't want to tell him. Marina, last night I cried. I don't know if it was for his daughter, for my fear, or for being close to something I've spent forty years looking for.
]]

DIARY_TEXTS[7][5] = [[
Notebook XXI, September 18 — the nurse.

Daniel came tonight. The client Vance showed no response to the compound. Zero reaction. This is impossible, according to my data. Forty-one subjects, forty-one positive reactions. Vance is the exception. Vance is, therefore, the evidence that the next iteration exists. This is not a failure of the compound. It is a more advanced organism. I begin monitoring tomorrow. Marina, I think I've found her. I think I've found the next step.
]]

DIARY_TEXTS[7][6] = [[
Notebook XXI, October 12 — six.

I've identified six subjects carrying the same biological marker as Vance. Nurse. Doctor (her lover, by chance). Supermarket clerk. Priest. Mechanic. Gym teacher (yes, Daniel himself). The statistical probability of six individuals with this rarity living within a thirty-mile radius is zero. This is not chance. This is directed biology. Humanity is silently producing a next phase. And I have detected it before anyone else.
]]

DIARY_TEXTS[7][7] = [[
Notebook XXII, October 30 — the warehouse.

I have the six. The procedure was clean. Personalized bait for each. Vance the easiest. Hargreaves followed Vance, as I predicted. Delaney came on his own, poor man. Cross from guilt. Malone from nostalgia. Orozco for his daughter. Each one bites his own hook. I'm extracting samples daily. Version 2 in preparation. Marina, I sleep four hours. I no longer speak to you on the porch. I speak here. Forgive me.
]]

DIARY_TEXTS[7][8] = [[
Notebook XXII, November 14 — the eighth.

I identified a seventh compatible subject. Seventh because my group is now six plus me, but outside the group it would be the seventh, and my plan calls it the eighth, so eighth it stays. I won't include him in the experiments. I can't explain it rationally. I watched him from a parked car and something inside me broke. I will not touch him. I'll do the only good thing I can do at this point. I will protect him. Marina, if you are still there — help me do this right.
]]

DIARY_TEXTS[7][9] = [[
Notebook XXIII, November 21 — the cabin.

I sedated him with the retrograde memory compound. Six months completely erased. Took him to the cabin on the Jefferson River. Loaded provisions for a year. Locked the doors. Wrote him a note with the bare minimum. Drove home slowly. Tonight I deliver version 2 to the contact. I know something is not right in the latest results. There is a protein instability I cannot explain. But the contact is pressing. I signed months ago. Marina, forgive me. If this goes badly, the only clean thing I'll have done was the cabin.
]]

DIARY_TEXTS[7][10] = [[
[Notebook XXIII, last entry — after the warehouse, before writing the letter for the dog tags]

My hands no longer fully obey me. I must write quickly. I was wrong. It wasn't evolution. It was a disease with the symptoms of greatness. The bitten do not evolve: they are lost. And I understood it too late. The seven in my warehouse are my fault, and I am among the seven, and that is a minuscule justice but it is the only one I could obtain. I will now write the last note, the one that goes in the dog tags. I will ask the six to decide. I can decide no more. Marina. Marina. The bridge passes alone. Now I understand what you told me. It was never a metaphor. Only one person crosses. The rest stay on the side where they began. Goodbye.
]]

-- Exponer las tablas EN al namespace (Echoes_Diaries_ES.lua popula las ES).
for k, v in pairs(SUBJECT_HEADERS) do
    Echoes.Diaries.HEADERS_EN[k] = v
end
for s, entries in pairs(DIARY_TEXTS) do
    Echoes.Diaries.TEXTS_EN[s] = Echoes.Diaries.TEXTS_EN[s] or {}
    for e, body in pairs(entries) do
        Echoes.Diaries.TEXTS_EN[s][e] = body
    end
end

-- Eleccion bilingue runtime.
local function pickHeaderTable()
    if Echoes.getLang and Echoes.getLang() == "ES"
            and Echoes.Diaries.HEADERS_ES
            and next(Echoes.Diaries.HEADERS_ES) then
        return Echoes.Diaries.HEADERS_ES
    end
    return Echoes.Diaries.HEADERS_EN
end

local function pickBodyTable()
    if Echoes.getLang and Echoes.getLang() == "ES"
            and Echoes.Diaries.TEXTS_ES
            and next(Echoes.Diaries.TEXTS_ES) then
        return Echoes.Diaries.TEXTS_ES
    end
    return Echoes.Diaries.TEXTS_EN
end

-- ============================================================================
-- API
-- ============================================================================

function Echoes.Diaries.fullType(subjectID, entryN)
    return string.format("EchoesOfKnox.Journal_Subject%02d_%02d", subjectID, entryN)
end

function Echoes.Diaries.isDiary(item)
    if not item or not item.getFullType then return false end
    local ft = item:getFullType()
    if not ft then return false end
    return string.match(ft, "^EchoesOfKnox%.Journal_Subject%d+_%d+$") ~= nil
end

-- Devuelve subjectID, entryN o nil si el item no es diario.
function Echoes.Diaries.parseDiary(item)
    if not item or not item.getFullType then return nil end
    local ft = item:getFullType()
    if not ft then return nil end
    local s, e = string.match(ft, "^EchoesOfKnox%.Journal_Subject(%d+)_(%d+)$")
    if s and e then return tonumber(s), tonumber(e) end
    return nil
end

function Echoes.Diaries.readDiary(subjectID, entryN, player)
    local headers = pickHeaderTable()
    local texts = pickBodyTable()
    local hdr = headers[subjectID]
    local body = texts[subjectID] and texts[subjectID][entryN]
    -- Fallback a EN si el idioma ES no tiene la entrada (seguridad).
    if not hdr then hdr = Echoes.Diaries.HEADERS_EN[subjectID] end
    if not body then
        body = Echoes.Diaries.TEXTS_EN[subjectID]
            and Echoes.Diaries.TEXTS_EN[subjectID][entryN]
    end
    if not hdr or not body then return end

    -- Composicion del rich text. ISRichTextPanel convierte \n -> <LINE> con
    -- espacios alrededor, asi que los parrafos se separan con una linea en
    -- blanco y el parser no se come la ultima palabra.
    local text = "<CENTRE>"
        .. "<SIZE:large>" .. hdr.name .. "\n"
        .. "<SIZE:small>" .. hdr.role .. " - Subject "
            .. string.format("%02d", subjectID)
            .. " - Entry " .. tostring(entryN) .. "/10\n"
        .. "<SIZE:small>(" .. hdr.source .. ")\n"
        .. "\n"
        .. "<LEFT>"
        .. body

    local w = 560
    local h = 640
    local x = (getCore():getScreenWidth() - w) / 2
    local y = (getCore():getScreenHeight() - h) / 2
    local modal = ISModalRichText:new(x, y, w, h, text, false, nil, nil,
        player and player:getPlayerNum() or 0)
    modal:initialise()
    modal:addToUIManager()
end

-- ============================================================================
-- Context menu
-- ============================================================================

local function resolveItem(entry)
    if entry and entry.getFullType then return entry end
    if entry and entry.items and entry.items[1] then return entry.items[1] end
    return nil
end

local function onReadClick(player, item)
    local s, e = Echoes.Diaries.parseDiary(item)
    if s and e then
        Echoes.Diaries.readDiary(s, e, getSpecificPlayer(player))
    end
end

local function onFillMenu(player, context, items)
    if not items or #items == 0 then return end
    for _, entry in ipairs(items) do
        local item = resolveItem(entry)
        if Echoes.Diaries.isDiary(item) then
            local label = Echoes.text("UI_EOK_ReadDiary")
            context:addOption(label, player, onReadClick, item)
            return
        end
    end
end

Events.OnFillInventoryObjectContextMenu.Add(onFillMenu)
