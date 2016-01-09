/* Ben Scott * bescott@andrew.cmu.edu * 2015-12-01 * Warner */
/* Jocelyn Huang * jocelynh@andrew.cmu.edu * 2015-11-21 * Warner */

#include <adv3.h>
#include <en_us.h>
#include "macros.h"
#pragma newline_spacing(preserve)


warner_entrance : OutdoorRoom
'Warner Hall (Outside)' 'Warner'
"""
You are standing on a north-south walkway outside Warner Hall. The recently bought marble exterior ($180,000) impresses you beyond words, though there's a black grate obscuring some of the design. The cut is nearby, and you see a large black building to the west.
""" {
    east = cut_north;
    south = cut_walkway_0;
    west = ucc_atrium;
    in = warner_hall;
}

+ steel_grate : Fixture
'grate/steel grate' 'grate'
"""
It's a boring, kind of ugly steel grate that covers the front of the building. Someone once told you that, back in the day, when tuition was increased and students complained, the president at the time told them it was worth it since Warner ended up all pimped out (not in those exact words). The students then thought it prudent to chuck cookies at Warner until the administration put up that steel grate in front to fend them off. You could do with a nice gooey cookie right now...
""";


warner_forbes : OutdoorRoom
'Warner Hall (near Forbes Ave.)' 'Warner'
"""
You are by Warner hall on Forbes Avenue.  You notice the gleaming new marble exterior on the building. A high wall separates you from the building itself.
""" {
    in : FakeConnector "A high wall stops you from getting to Warner." {  }
}


warner_hall : Room
'Warner Hall' 'warner'
"""
This is Warner Hall, home of the enigmatic application process. The very air reeks of bureaucracy. You might want to exit, or, if you're feeling adventurous, you could wander upstairs...
""" {
    up = warner_second_floor;
    out = warner_entrance;
}


warner_second_floor : Room
'Warner Hall Second Floor' 'Warner 2'
"""
It's warm and cozy in here, and you can hear some murmuring emanating from a room to the west. Someone seems to be shuffling papers in an interviewer office to the east.
""" {
    east = interview_room;
    west = interview_in_progress;
    down = warner_hall;
}


interview_room : Room
'Interview Room' 'Warner 2'
"""
The interviewers office is sparse, populated only by a few leather chairs and his desk, which is lined with a row of shiny baubles, all of which seem to have some form of CMU iconography plastered across them in some way or another.
""" {
    out asExit(west);
    west = warner_second_floor;
}

+ interviewer_desk : Fixture, Platform
'desk/table/office' 'Office Desk'
"""
The interviewer's desk is cluttered with all manner of office supplies.
""";

++ tape_recorder : Thing
'(tape) deck/recorder/device/tape'
'a small tape recorder (off)'
"""
You found this tape recorder after stealing it from the desk of an admissions interviewer.
""" {
    initSpecialDesc {
        """
        The tape recorder is submerged in a bunch of papers. You don't think the interviewer would notice you if you were to take it.
        """;
    }
}

interview_in_progress : FakeConnector
"""
Oh dear, you seem to have walked into someone's interview! The kindly, nonplussed interviewer asks if you're lost while the startled interviewee turns to you and instinctively blurts out
<<one of>>
"My greatest strength is my team-leading ability, which I have demonstrated at length through my presidencies in my school's debate, cooking, MUN, anime, and waterskiing clubs!"
<<or>>
"I have lived in twenty-three different countries and am very well versed in Chinese, Spanish, Latin, Hakka, Japanese, Finnish, Proto-Indonesian, Whistled Turkish, Esperanto, Klingon, and Python, but only Python 2.7!"
<<or>>
"I love Carnegie Mellon because of the premier academic experiences, prestigious programs, and varied and esteemed extracurriculars, such as the KGB, that it offers!"
<<or>>
"I excel at all sports, and have recently won tennis, soccer, flag football, foosball, Calvinball, hopscotch, parkour, <i>Jai alai</i>, and hitball tournaments!"<.reveal eavesdropped-sports>
<<or>>
"I've gone through as many hardships as the human heart and mind can bear, since my grandmother died last year, my grandfather died two years ago, my other grandmother died three years ago, my other grandfather died four years ago, all of my cousins died five years ago, and most tragic of all, my goldfish died at age twenty a mere six years ago. I had to bury them all."
<<or>>
"I have won many awards for my excellent academic ability, and have been recognized as a National Merit Scholar for my 2500 SAT score, have won a Siemen's Award for my cure for hypochondriacs, and maintain a 17.40 GPA!"
<<or>>
"(Help, I wandered on campus by accident and got into an interview! I'm actually a middle schooler!)"
<<or>>
"What's the culture like at this school? What varieties of strep does CMU grow?"
<<or>>
"I spend my weekends helping out at soup kitchens as a ladle, at the local library as a bookend, at the hospital as a backup syringe, at the Town Hall as a red-tape provider, and at the homeless astronaut shelter as an astronaut!"
<<at random>>
You murmur some placating words and back out of the doorway.""";



