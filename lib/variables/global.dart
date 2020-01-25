import 'dart:convert';

String currentCat = "";
double score = 0.0;
List savedPlayers = [];
List<String> savedScoores = [];
List savedScores = [{"name":"null","score": 0},{"name":"null","score": 0},{"name":"null","score": 0},{"name":"null","score": 0},{"name":"null","score": 0}];
List players = [];
JsonEncoder jsonEconders;
List questionArray = [
  {
    "category_name":"English",
    "category_img":"assets/images/english.png",
    "difficulty":[
      {
        "difficulty_name":"Grade 1",
        "grade_desc" : "The first grade is the first school year in Elementary school after Kindergarten. Children who are usually 6 to 7 years old are enrolled for this grade. ... Additionally, first graders are taught basic reading skills with the focus on reading and writing simple statements.",
        "diff-avatar": "assets/images/grade1.png",
        "content": [
          {
            "type": "easy",
            "questions": [
              {
                "q_img": "assets/images/english/eng.jpg",
                "question":".Which letters BEST complete the word below? \n spar__________",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"kle"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"klee"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"kele"
                  },
                ],
              },
              // Q2
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which letters BEST complete the word below? \n han___________",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"dle"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"dlee"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"ple"
                  },

                ],
              },
              // Q3
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which letters BEST completes the word below? \n gig__________",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"lle"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"gle"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"mle"
                  },

                ],
              },
              //Q4
              {
                "q_img": "assets/images/english/eng.png",
                "question":"We are  __________ how to fly a kite.",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"laughing"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"learning"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"jumping"
                  },
                ],
              },
              //Q5
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Phil is six __________ old.",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"yarn"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"years"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"year"
                  },
                ],
              },
              //Q6
              {
                "q_img": "assets/images/english/eng.png",
                "question":"The _________ chick needs its parents.",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"your"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"young"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"yawn"
                  },
                ],
              },
              //Q7
              {
                "q_img": "assets/images/english/eng.png",
                "question":"You have to wait ________ supper is over to play games..",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"until"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"upper"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"lower"
                  },
                ],
              },
              //Q8
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Sonny and Baek  ___  eating ice cream.",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"Are"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"Is"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"Am"
                  },
                ],
              },
              //Q9
              {
                "q_img": "assets/images/english/eng.png",
                "question":"The moon comes out at __________.",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"next"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"night"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"previous"
                  },
                ],
              },
              //Q10
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which word is made of two smaller words?",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"jumping"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"outside"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"running"
                  },
                ],
              },
              //Q11-------------------
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which might make you \"giggle\"?",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"Baking cookies with your mom"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"Getting tickled by a feather"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"Walking with friends"
                  },
                ],
              },
              //Q12
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which word is made of two smaller words?",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"jumping"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"looking"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"redalert"
                  },
                ],
              },
              //Q13
              {
                "q_img": "assets/images/english/eng.png",
                "question":"What does the word \"replay\" mean in the sentence below?",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"not play"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"play again"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"play"
                  },
                ],
              },
              //Q14
              {
                "q_img": "assets/images/english/eng.png",
                "question":"A pencil is:?",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"smooth"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"pointed"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"heavy"
                  },
                ],
              },
              //Q15
              {
                "q_img": "assets/images/english/eng.png",
                "question":"What a wonderful feast this is! \nWhat does feast mean?",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"to become less hard"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"a large meal"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"a small meal"
                  },
                ],
              },
              //Q16
              {
                "q_img": "assets/images/english/eng.png",
                "question":"When you \"pause\" you",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"continue doing something"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"stop what you are doing for a long time."
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"stop completely"
                  },
                ],
              },
              //Q17
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which word is made of two smaller words?",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"jumping"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"outside"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"running"
                  },
                ],
              },
              //Q18
              {
                "q_img": "assets/images/english/balls.png",
                "question":"The middle of the earth is called the ________",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"core"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"plates"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"soil"
                  },
                ],
              },
              //Q19
              {
                "q_img": "assets/images/english/eng.png",
                "question":"I ________ Tim singing a song",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"heard"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"because"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"eat"
                  },
                ],
              },
              //Q20
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which word is made of two smaller words?",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"jumping"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"outside"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"walking"
                  },
                ],
              },
              //Q21
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Brush your teeth _________ you go to bed.",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"been"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"before"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"now"
                  },
                ],
              },
              //Q22
              {
                "q_img": "assets/images/english/eng.png",
                "question":"I had to go to bed _________ I was sleepy.",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"when"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"Because"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"are"
                  },
                ],
              },
              //Q23
              {
                "q_img": "assets/images/english/eng.png",
                "question":"We learn in a _________",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"restaurant"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"classroom"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"restroom"
                  },
                ],
              },
              //Q24
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Lemons, butter and the sun are _________.",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"green"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"blue"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"yellow"
                  },
                ],
              },
              //Q25
              {
                "q_img": "assets/images/english/eng.png",
                "question":". A _________ is someone you do not know",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"family member"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"classmate"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"stranger"
                  },
                ],
              },
            ]
          },
          {
            "type": "medium",
            "questions": [
              {
                "q_img": "assets/images/english/eng.jpg",
                "question":"Adam shivered from the cold January wind. What does shiver mean?",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"to make up a story"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"to shake or tremble"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"to dance around"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"to cry around"
                  },

                ],
              },
              // Q2
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Zachary will assist the teacher in class today. What does assist mean?",
                "answer": "4",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"ignore"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"push"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"copy"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"help"
                  }
                ],
              },
              // Q3
              {
                "q_img": "assets/images/english/eng.png",
                "question":"My new reading teacher is a __________",
                "answer": "4",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"rat"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"bat"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"bat"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"man"
                  }
                ],
              },
              //Q4
              {
                "q_img": "assets/images/english/eng.png",
                "question":". My ___________ kite went up in the sky.",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"lie"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"pie"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"high"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"my"
                  },
                ],
              },
              //Q5
              {
                "q_img": "assets/images/english/eng.png",
                "question":"You have to ________ your mom's hand to cross the street.",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"hold"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"high"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"better"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"he"
                  },
                ],
              },
              //Q6
              {
                "q_img": "assets/images/english/eng.png",
                "question":"If you lose your paper, you must ________ it.",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"return"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"rewrite"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"replay"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"destroy"
                  },
                ],
              },
              //Q7
              {
                "q_img": "assets/images/english/eng.png",
                "question":"To breathe, eat, and grow means",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"live"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"plant"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"die"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"walk"
                  },
                ],
              },
              //Q8
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Bad things always happen to Matt. He is",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"unsafe"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"unlucky"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"unusual"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"lucky"
                  },
                ],
              },
              //Q9
              {
                "q_img": "assets/images/english/eng.png",
                "question":"What is the opposite of loud?",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"noisy"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"quiet"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"louder"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"quit"
                  },
                ],
              },
              //Q10
              {
                "q_img": "assets/images/english/eng.png",
                "question":"She looks very nice in that dress. She is pretty. \n PRETTY means:",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"looks good"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"looks bad"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"looks happy"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"looks sad"
                  },
                ],
              },
              //Q11-------------------
              {
                "q_img": "assets/images/english/eng.png",
                "question":"incorrect means?",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"good"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"ugly"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"wrong"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"handsome"
                  },
                ],
              },
              //Q12
              {
                "q_img": "assets/images/english/eng.png",
                "question":"I drank all of my juice. Please _________ my cup.",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"redo"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"refill"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"remake"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"return"
                  },
                ],
              },
              //Q13
              {
                "q_img": "assets/images/english/eng.png",
                "question":"The ________ was in the cave",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"bat"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"van"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"dog"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"cat"
                  },
                ],
              },
              //Q14
              {
                "q_img": "assets/images/english/eng.png",
                "question":"If you treat everyone in the same way, you are:",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"bad"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"fair"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"free"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"crazy"
                  },
                ],
              },
              //Q15
              {
                "q_img": "assets/images/english/eng.png",
                "question":"I like to ride on a ________.",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"boat"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"belt"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"boot"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"bat"
                  },
                ],
              },
              //Q16
              {
                "q_img": "assets/images/english/eng.png",
                "question":"She is going ________ me to the beach.",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"with"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"what"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"where"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"when"
                  },
                ],
              },
              //Q17
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which word DOES NOT belong with the others?",
                "answer": "4",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"computer"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"keyboard"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"mouse"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"television"
                  },
                ],
              },
              //Q18
              {
                "q_img": "assets/images/english/balls.png",
                "question":"My best friend _______ Sam.",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"is"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"on"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"if"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"in"
                  },
                ],
              },
              //Q19
              {
                "q_img": "assets/images/english/eng.png",
                "question":"What category do the following words belong to? \n orange, red, green, purple, blue",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"shape"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"color"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"foods"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"pet"
                  },
                ],
              },
              //Q20
              {
                "q_img": "assets/images/english/eng.png",
                "question":"What category do the following words belong to? \n chicken, pork, hotdog,",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"colors"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"pet"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"food"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"shape"
                  },
                ],
              },
              //Q21
              {
                "q_img": "assets/images/english/eng.png",
                "question":"What category do the following words belong to? \n triangle,circle,square",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"color"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"shape"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"food"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"pet"
                  },
                ],
              },
              //Q22
              {
                "q_img": "assets/images/english/eng.png",
                "question":"What category do the following words belong to? \n five, three, two, seven, nine",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"shapes"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"food"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"number"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"color"
                  },
                ],
              },
              //Q23
              {
                "q_img": "assets/images/english/eng.png",
                "question":"What category do the following words belong to? \n a,b,c,d",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"shapes"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"letters"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"numbers"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"colors"
                  },
                ],
              },
              //Q24
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which word is spelled correctly?",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"backpak"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"backpack"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"bakpack"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"bacpack"
                  },
                ],
              },
              //Q25
              {
                "q_img": "assets/images/english/eng.png",
                "question":"What is the opposite of big?",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"large"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"thin"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"small"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"cold"
                  },
                ],
              },
            ]
          },
          {
            "type": "hard",
            "questions": [
              {
                "q_img": "assets/images/english/eng.jpg",
                "question":"Which season is hot?",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"Summer"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"Spring"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"Fall"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"Winter"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"None"
                  },

                ],
              },
              // Q2
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which word does not belong in a group with the other words?",
                "answer": "4",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"Summer"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"Fall"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"Winter"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"October"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"Spring"
                  }
                ],
              },
              // Q3
              {
                "q_img": "assets/images/english/eng.png",
                "question":"The coat I wore last year is ________.",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"tie"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"tire"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"tight"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"tired"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"type"
                  }
                ],
              },
              //Q4
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which word does not belong in a group with the other words?",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"Ear"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"Sock"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"Nose"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"Eye"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"Ear"
                  },
                ],
              },
              //Q5
              {
                "q_img": "assets/images/english/eng.png",
                "question":". A synonym for discover is _______.",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"lose"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"carry"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"find"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"follow"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"Read"
                  },
                ],
              },
              //Q6
              {
                "q_img": "assets/images/english/eng.png",
                "question":"He wore a ________ crown on his head.",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"crowded"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"golden"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"banana"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"chicken"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"egg"
                  },
                ],
              },
              //Q7
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which word belongs in the category below? \n PETS",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"crocodile"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"elephant"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"hamster"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"whale"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"All of the above"
                  },
                ],
              },
              //Q8
              {
                "q_img": "assets/images/english/eng.png",
                "question":"A person who hires or supervises workers \n manager",
                "answer": "4",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"dog"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"mouse"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"dad"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"boss"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"cat"
                  },
                ],
              },
              //Q9
              {
                "q_img": "assets/images/english/eng.png",
                "question":". My mom gave _______ of us a big hug.",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"hold"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"both"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"Us"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"We"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"None"
                  },
                ],
              },
              //Q10
              {
                "q_img": "assets/images/english/eng.png",
                "question":"A member of a community",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"citizen"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"family"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"friend"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"mother"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"father"
                  },
                ],
              },
              //Q11-------------------
              {
                "q_img": "assets/images/english/eng.png",
                "question":"I want ________ one!",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"a"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"the"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"that"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"you"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"are"
                  },
                ],
              },
              //Q12
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which word is spelled correctly?",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"tebu"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"tube"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"tbue"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"ubet"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"None"
                  },
                ],
              },
              //Q13
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Sam ______ the bag.",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"wished"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"tucked"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"packed"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"baked"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"None"
                  },
                ],
              },
              //Q14
              {
                "q_img": "assets/images/english/eng.png",
                "question":"A device for securing a door, gate, lid, or drawer in position when closed",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"microphone"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"lock"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"doorbell"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"bell"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"door"
                  },
                ],
              },
              //Q15
              {
                "q_img": "assets/images/english/eng.png",
                "question":"The art or act of singing; vocal music",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"song"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"light"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"homework"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"plastic"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"work"
                  },
                ],
              },
              //Q16
              {
                "q_img": "assets/images/english/eng.png",
                "question":"How are _______ doing?",
                "answer": "4",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"he"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"is"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"the"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"you"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"am"
                  },
                ],
              },
              //Q17
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which word is spelled correctly?",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"eetr"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"treee"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"tree"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"tere"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"None"
                  },
                ],
              },
              //Q18
              {
                "q_img": "assets/images/english/balls.png",
                "question":"A small child",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"Minnie Mouse"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"tot"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"Mom"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"cookie"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"None"
                  },
                ],
              },
              //Q19
              {
                "q_img": "assets/images/english/eng.png",
                "question":"A synonym for steaming is",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"cold"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"freezing"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"hot"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"dry"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"froze"
                  },
                ],
              },
              //Q20
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Choose the word that is spelled correctly.",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"plant"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"platn"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"platn"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"plante"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"None of the above"
                  },
                ],
              },
              //Q21
              {
                "q_img": "assets/images/english/eng.png",
                "question":"A synonym for note is",
                "answer": "4",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"letter"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"memo"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"message"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"communication"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"All of the above"
                  },
                ],
              },
              //Q22
              {
                "q_img": "assets/images/english/eng.png",
                "question":"A synonym for moist is",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"dry"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"crisp"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"damp"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"solid"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"hot"
                  },
                ],
              },
              //Q23
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which word does not belong in a group with the other words?",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"Walk"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"Football"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"Baseball"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"Volleyball"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"Basketball"
                  },
                ],
              },
              //Q24
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which word is spelled correctly?",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"backpak"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"backpack"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"bakpack"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"bacpack"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"None of the above"
                  },
                ],
              },
              //Q25
              {
                "q_img": "assets/images/english/eng.png",
                "question":"To have a low temperature means",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"hot"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"cold"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"weather"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"sunny"
                  },
                  {
                    "choice_id":"5",
                    "choice_content":"dry"
                  },
                ],
              },
            ]
          }
        ]
      },

      // GRADE2
       {
        "difficulty_name":"Grade 2",
        "grade_desc" : "In the second grade, children are usually 7 to 8 years old. Students are taught subjects such as Math, Science, Geography and Social Studies. In Math, they are introduced to larger numbers (building up on what was taught to them in the first grade) and fundamental operations such as addition and subtraction.",
        "diff-avatar": "assets/images/grade2.png",
        "content":[
          {
            "type": "easy",
            "questions": [
              {
                "q_img": "assets/images/english/eng.jpg",
                "question":"I ________ with my fingers.",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"touch"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"taste"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"hear"
                  },
                ],
              },
              // Q2
              {
                "q_img": "assets/images/english/eng.png",
                "question":"I _________ with my brain.",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"smell"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"think"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"see"
                  },

                ],
              },
              // Q3
              {
                "q_img": "assets/images/english/eng.png",
                "question":"A tree has the _______ stem of all the plants.",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"hard"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"harder"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"hardest"
                  },

                ],
              },
              //Q4
              {
                "q_img": "assets/images/english/eng.png",
                "question":"January is  _______ than May.",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"cold"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"colder"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"coldest"
                  },
                ],
              },
              //Q5
              {
                "q_img": "assets/images/english/eng.png",
                "question":"The red ball is  _______ than the green ball.",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"small"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"smaller"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"smallest"
                  },
                ],
              },
              //Q6
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Mindy saw _______ ant crawling on the ground.",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"an"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"a"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"the"
                  },
                ],
              },
              //Q7
              {
                "q_img": "assets/images/english/eng.png",
                "question":"We picked _______ apples from a tree.",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"a"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"an"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"the"
                  },
                ],
              },
              //Q8
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Identify the common noun in this sentence below. \nThe class studied English today.",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"class"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"studied"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"English"
                  },
                ],
              },
              //Q9
              {
                "q_img": "assets/images/english/eng.png",
                "question":"When I add the suffix -ing it means it is happening right now.",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"True"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"False"
                  },

                ],
              },
              //Q10
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Identify the word that should start with a capital letter.",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"flag"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"america"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"country"
                  },
                ],
              },
              //Q11-------------------
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Elijah and Jude ________ five grasshoppers.",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"catched"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"caught"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"catches"
                  },
                ],
              },
              //Q12
              {
                "q_img": "assets/images/english/eng.png",
                "question":"I enjoy _______ photographs of my friends.",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"take"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"took"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"taking"
                  },
                ],
              },
              //Q13
              {
                "q_img": "assets/images/english/eng.png",
                "question":"What is the past tense for drink?",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"drinks"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"Drunk"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"drinking"
                  },
                ],
              },
              //Q14
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Choose the sentence that has correct capitalization.",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"My aunt Julie always makes me tasty treats."
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"In the winter, sharon wears a big fur coat."
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"there are seven days in a week."
                  },
                ],
              },
              //Q15
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Choose the correct place for the apostrophe in the following sentence from the choices below.",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"The dog ate its bone but wont eat its biscuits."
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"The dog ate it\'s bone but wont eat its biscuits."
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"The dog ate it\'s bone but wont eat it\'s biscuits."
                  },
                ],
              },
              //Q16
              {
                "q_img": "assets/images/english/eng.png",
                "question":"If your teacher tells you to rewrite something, you",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"write it again."
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"write it for the first time."
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"erase it."
                  },
                ],
              },
              //Q17
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Kai'leah and Tatyana _______ all day.",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"sleeped"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"sleeps"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"slept"
                  },
                ],
              },
              //Q18
              {
                "q_img": "assets/images/english/balls.png",
                "question":"Mr. Joe _______ our classroom.",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"sweeped"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"sweep"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"swept"
                  },
                ],
              },
              //Q19
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which sentence is written correctly?",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"grandma is coming for passover"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"Grandma is coming for Passover."
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"Grandma is coming for passover."
                  },
                ],
              },
              //Q20
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which word is made of two smaller words?",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"jumping"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"outside"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"walking"
                  },
                ],
              },
              //Q21
              {
                "q_img": "assets/images/english/eng.png",
                "question":"What is the past tense for want?",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"wanted"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"waiting"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"waited"
                  },
                ],
              },
              //Q22
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which phrase suggests it is in the future tense?",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"I am"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"I will"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"I have"
                  },
                ],
              },
              //Q23
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which phrase suggests it is in the future tense?",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"I am going to"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"I already have"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"I am doing it"
                  },
                ],
              },
              //Q24
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which word is not a time stamp?",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"later"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"tomorrow"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"shoes"
                  },
                ],
              },
              //Q25
              
            ]
          },
          {
            "type": "medium",
            "questions": [
              {
                "q_img": "assets/images/english/eng.jpg",
                "question":"Someone who is joyful is",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"without joy."
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"full of joy."
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"joyless"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"a little happy"
                  },

                ],
              },
              // Q2
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Choose the greeting that is written incorrectly",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"Dear Grandma,"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"Dear, Bob,"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"Dear Mr. Crosby,"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"Dear Molly,"
                  }
                ],
              },
              // Q3
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which sentence is written correctly? ",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"Susan\'s basket was full."
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"Susans\' basket was full."
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"Susans basket was full."
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"Susan\'s basket was full"
                  }
                ],
              },
              //Q4
              {
                "q_img": "assets/images/english/eng.png",
                "question":"A sentence that makes a statement, is called a _______. ",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"declarative sentence"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"interrogative sentence"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"exclamatory sentence"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"independent sentence"
                  },
                ],
              },
              //Q5
              {
                "q_img": "assets/images/english/eng.png",
                "question":"When you are upset about something, you are...",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"happy"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"unhappy"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"happiest"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"unangry"
                  },
                ],
              },
              //Q6
              {
                "q_img": "assets/images/english/eng.png",
                "question":"When you want to watch something again you _______ it.",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"unwatch"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"watchless"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"rewatch"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"watched"
                  },
                ],
              },
              //Q7
              {
                "q_img": "assets/images/english/eng.png",
                "question":"What is the verb in the following sentence? \n Sadie raced down the stairs.",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"raced"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"down"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"Sadie"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"The"
                  },
                ],
              },
              //Q8
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which word in this sentence is the ADJECTIVE? \n He threw the hard rock into the river.",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"threw"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"rock"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"hard"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"hard"
                  },
                ],
              },
              //Q9
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which is the opposite of zip?",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"rezip"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"unzip"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"zipper"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"prezip"
                  },
                ],
              },
              //Q10
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which of these words is a NOUN? ",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"cat"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"hit"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"red"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"sing"
                  },
                ],
              },
              //Q11-------------------
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Ken filled his cup with too much milk and it ______",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"overflowed"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"reflowed"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"underflowed"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"preflowed"
                  },
                ],
              },
              //Q12
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which word in this sentence is the ADJECTIVE?",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"boy"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"wore"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"blue"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"shirt"
                  },
                ],
              },
              //Q13
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Choose the sentence that is written correctly.",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"Mrs. Smith has a puppy named Spot."
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"Mrs. Smith has a puppy named spot."
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"mrs. smith has a puppy named Spot."
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"mrs. smith has a puppy named spot."
                  },
                ],
              },
              //Q14
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Select the past tense of the verb to drive ",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"driven"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"drived"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"drove"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"has, have, or had driven"
                  },
                ],
              },
              //Q15
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Select the past tense of the verb to play.",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"player"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"playing"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"played"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"plays"
                  },
                ],
              },
              //Q16
              {
                "q_img": "assets/images/english/eng.png",
                "question":"______ is my umbrella ? it is behind the door",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"where"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"what"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"when"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"it"
                  },
                ],
              },
              //Q17
              {
                "q_img": "assets/images/english/eng.png",
                "question":"________ it is the necklace ? It is one hundred and ten dollars. ",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"How "
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"how much"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"What"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"Where"
                  },
                ],
              },
              //Q18
              {
                "q_img": "assets/images/english/balls.png",
                "question":"Hang the __________ clothes outside!",
                "answer": "1",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"wet"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"dry"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"clean"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"small"
                  },
                ],
              },
              //Q19
              {
                "q_img": "assets/images/english/eng.png",
                "question":"that hat is too__________ for you, girl You should get a bigger one. ",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"beautiful"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"small"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"cheap"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"bad"
                  },
                ],
              },
              //Q20
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Please ask your________ children to keep quit in the library. ",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"lazy"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"bad"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"noisy"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"good"
                  },
                ],
              },
              //Q21
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which word best fits in the blank? \n The school bell rang ______.",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"loud"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"loudly"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"love"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"lovely"
                  },
                ],
              },
              //Q22
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Choose the correct closing. ",
                "answer": "2",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"Sincerely yours"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"Sincerely yours,"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"sincerely yours"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"sincerely, yours"
                  },
                ],
              },
              //Q23
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Which word means to be more sad than someone else?",
                "answer": "c",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"sad"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"sadder"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"saddest"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"unsad"
                  },
                ],
              },
              //Q24
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Identify the word that should start with a capital letter in the following sentence: \n The new girl at our school used to live in canada.",
                "answer": "3",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"girl"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"school"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"canada"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"used"
                  },
                ],
              },
              //Q25
              {
                "q_img": "assets/images/english/eng.png",
                "question":"Choose the greeting that is written correctly. ",
                "answer": "d",
                "choices":[
                  {
                    "choice_id":"1",
                    "choice_content":"Dear Grandma"
                  },
                  {
                    "choice_id":"2",
                    "choice_content":"Dear, Grandma"
                  },
                  {
                    "choice_id":"3",
                    "choice_content":"Dear, Grandma,"
                  },
                  {
                    "choice_id":"4",
                    "choice_content":"Dear Grandma,"
                  },
                ],
              },
            ]
          },
          {
            "type": "hard",
            "questions": [
          {
          "q_img": "assets/images/english/eng.jpg",
          "question":"Which season is hot?",
          "answer": "3",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"has a home."
          },
          {
          "choice_id":"2",
          "choice_content":"has a lot of homes."
          },
          {
          "choice_id":"3",
          "choice_content":"does not have a home."
          },
          {
          "choice_id":"4",
          "choice_content":"moves a lot."
          },
          {
          "choice_id":"5",
          "choice_content":"many house and lo"
          },

          ],
          },
          // Q2
              {
          "q_img": "assets/images/english/eng.png",
          "question":"Choose the prepostion that completes the sentence. \n I go home ______ bus.",
          "answer": "4",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"until"
          },
          {
          "choice_id":"2",
          "choice_content":"up"
          },
          {
          "choice_id":"3",
          "choice_content":"Winter"
          },
          {
          "choice_id":"4",
          "choice_content":"October"
          },
          {
          "choice_id":"5",
          "choice_content":"Spring"
          }
          ],
          },
          // Q3
              {
          "q_img": "assets/images/english/eng.png",
          "question":"Tom ran home after school.",
          "answer": "3",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"home"
          },
          {
          "choice_id":"2",
          "choice_content":"Tom"
          },
          {
          "choice_id":"3",
          "choice_content":"ran"
          },
          {
          "choice_id":"4",
          "choice_content":"after"
          },
          {
          "choice_id":"5",
          "choice_content":"is"
          }
          ],
          },
          //Q4
              {
          "q_img": "assets/images/english/eng.png",
          "question":"Anthony is throwing the football. \n Which word above is the verb?",
          "answer": "2",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"Anthony"
          },
          {
          "choice_id":"2",
          "choice_content":"Throwing"
          },
          {
          "choice_id":"3",
          "choice_content":"Football"
          },
          {
          "choice_id":"4",
          "choice_content":"The"
          },
          {
          "choice_id":"5",
          "choice_content":"is"
          },
          ],
          },
          //Q5
              {
          "q_img": "assets/images/english/eng.png",
          "question":"He thought about his stupid mistake in the test.\nWhich word above is the verb?",
          "answer": "3",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"Thought"
          },
          {
          "choice_id":"2",
          "choice_content":"About"
          },
          {
          "choice_id":"3",
          "choice_content":"Mistake"
          },
          {
          "choice_id":"4",
          "choice_content":"Test"
          },
          {
          "choice_id":"5",
          "choice_content":"About"
          },
          ],
          },
          //Q6
              {
          "q_img": "assets/images/english/eng.png",
          "question":"The dog ran across the yard.\n Which word above is the verb?",
          "answer": "3",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"Dog"
          },
          {
          "choice_id":"2",
          "choice_content":"across"
          },
          {
          "choice_id":"3",
          "choice_content":"Ran"
          },
          {
          "choice_id":"4",
          "choice_content":"Yard"
          },
          {
          "choice_id":"5",
          "choice_content":"The"
          },
          ],
          },
          //Q7
              {
          "q_img": "assets/images/english/eng.png",
          "question":"The boys ______ in the car. ",
          "answer": "3",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"am"
          },
          {
          "choice_id":"2",
          "choice_content":"was"
          },
          {
          "choice_id":"3",
          "choice_content":"were"
          },
          {
          "choice_id":"4",
          "choice_content":"they"
          },
          {
          "choice_id":"5",
          "choice_content":"them"
          },
          ],
          },
          //Q8
              {
          "q_img": "assets/images/english/eng.png",
          "question":"Which word represents playing something again?",
          "answer": "3",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"unplay"
          },
          {
          "choice_id":"2",
          "choice_content":"player"
          },
          {
          "choice_id":"3",
          "choice_content":"replay"
          },
          {
          "choice_id":"4",
          "choice_content":"played"
          },
          {
          "choice_id":"5",
          "choice_content":"pused"
          },
          ],
          },
          //Q9
              {
          "q_img": "assets/images/english/eng.png",
          "question":"Choose the verb in the sentence.\n The prince climbed the tower.",
          "answer": "3",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"prince"
          },
          {
          "choice_id":"2",
          "choice_content":"tower"
          },
          {
          "choice_id":"3",
          "choice_content":"climbed"
          },
          {
          "choice_id":"4",
          "choice_content":"The"
          },
          {
          "choice_id":"5",
          "choice_content":"None of the above"
          },
          ],
          },
          //Q10
              {
          "q_img": "assets/images/english/eng.png",
          "question":"Which one of these nouns is a PLURAL NOUN?",
          "answer": "5",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"Foot"
          },
          {
          "choice_id":"2",
          "choice_content":"Sheep"
          },
          {
          "choice_id":"3",
          "choice_content":"Dog"
          },
          {
          "choice_id":"4",
          "choice_content":"Water"
          },
          {
          "choice_id":"5",
          "choice_content":"Boys"
          },
          ],
          },
          //Q11-------------------
              {
          "q_img": "assets/images/english/eng.png",
          "question":"Identify the word that should start with a capital letter in the following sentence: \n Emma was excited when she got a postcard from her friend in florida. ",
          "answer": "3",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"excited"
          },
          {
          "choice_id":"2",
          "choice_content":"postcard"
          },
          {
          "choice_id":"3",
          "choice_content":"florida"
          },
          {
          "choice_id":"4",
          "choice_content":"was"
          },
          {
          "choice_id":"5",
          "choice_content":"postcard"
          },
          ],
          },
          //Q12
              {
          "q_img": "assets/images/english/eng.png",
          "question":"Which of the following sentences is written correctly? ",
          "answer": "4",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"I want to go to the louisville zoo."
          },
          {
          "choice_id":"2",
          "choice_content":"I want to go to the Louisville Zoo"
          },
          {
          "choice_id":"3",
          "choice_content":"I want to go to the Louisville zoo."
          },
          {
          "choice_id":"4",
          "choice_content":"I want to go to the Louisville Zoo."
          },
          {
          "choice_id":"5",
          "choice_content":"I want to go to the LouisVille Zoo."
          },
          ],
          },
          //Q13
              {
          "q_img": "assets/images/english/eng.png",
          "question":"Which word below needs a capital letter? ",
          "answer": "3",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"stone"
          },
          {
          "choice_id":"2",
          "choice_content":"snake"
          },
          {
          "choice_id":"3",
          "choice_content":"new york"
          },
          {
          "choice_id":"4",
          "choice_content":"attraction"
          },
          {
          "choice_id":"5",
          "choice_content":"mad"
          },
          ],
          },
          //Q14
              {
          "q_img": "assets/images/english/eng.png",
          "question":"He is a teacher. ______ name is Mr. Phillips.",
          "answer": "1",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"His"
          },
          {
          "choice_id":"2",
          "choice_content":"Its"
          },
          {
          "choice_id":"3",
          "choice_content":"Her"
          },
          {
          "choice_id":"4",
          "choice_content":"Your"
          },
          {
          "choice_id":"5",
          "choice_content":"You"
          },
          ],
          },
          //Q15
              {
          "q_img": "assets/images/english/eng.png",
          "question":"Identify the word that should start with a capital letter in the following sentence: \n Joel's birthday is in april and he is having a party.",
          "answer": "2",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"birthday"
          },
          {
          "choice_id":"2",
          "choice_content":"april"
          },
          {
          "choice_id":"3",
          "choice_content":"party"
          },
          {
          "choice_id":"4",
          "choice_content":"in"
          },
          {
          "choice_id":"5",
          "choice_content":"having"
          },
          ],
          },
          //Q16
              {
          "q_img": "assets/images/english/eng.png",
          "question":"Choose the word that should start with a capital letter. ",
          "answer": "2",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"mountain"
          },
          {
          "choice_id":"2",
          "choice_content":"texas"
          },
          {
          "choice_id":"3",
          "choice_content":"country"
          },
          {
          "choice_id":"4",
          "choice_content":"man"
          },
          {
          "choice_id":"5",
          "choice_content":"men"
          },
          ],
          },
          //Q17
              {
          "q_img": "assets/images/english/eng.png",
          "question":"What is the verb in the sentence below? \nThe boys play in the backyard after school.",
          "answer": "1",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"play"
          },
          {
          "choice_id":"2",
          "choice_content":"boys"
          },
          {
          "choice_id":"3",
          "choice_content":"school"
          },
          {
          "choice_id":"4",
          "choice_content":"in"
          },
          {
          "choice_id":"5",
          "choice_content":"backyard"
          },
          ],
          },
          //Q18
              {
          "q_img": "assets/images/english/balls.png",
          "question":"Choose the verb that matches the phrase. \n ________ a horse",
          "answer": "3",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"tell"
          },
          {
          "choice_id":"2",
          "choice_content":"turn on"
          },
          {
          "choice_id":"3",
          "choice_content":"ride"
          },
          {
          "choice_id":"4",
          "choice_content":"play"
          },
          {
          "choice_id":"5",
          "choice_content":"buy"
          },
          ],
          },
          //Q19
              {
          "q_img": "assets/images/english/eng.png",
          "question":"What is the verb in the sentence below? \n The weather is hot",
          "answer": "4",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"a.weather"
          },
          {
          "choice_id":"2",
          "choice_content":"is"
          },
          {
          "choice_id":"3",
          "choice_content":"the"
          },
          {
          "choice_id":"4",
          "choice_content":"hot"
          },
          {
          "choice_id":"5",
          "choice_content":"the weather"
          },
          ],
          },
          //Q20
              {
          "q_img": "assets/images/english/eng.png",
          "question":"What is the verb in the sentence below? \n The diamond is expensive",
          "answer": "1",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"expensive"
          },
          {
          "choice_id":"2",
          "choice_content":"diamond"
          },
          {
          "choice_id":"3",
          "choice_content":"is"
          },
          {
          "choice_id":"4",
          "choice_content":"the diamond"
          },
          {
          "choice_id":"5",
          "choice_content":"the weather"
          },
          ],
          },
          //Q21
              {
          "q_img": "assets/images/english/eng.png",
          "question":"Identify the opposite of  underline adjective below. \n The orange is sour",
          "answer": "4",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"sweet"
          },
          {
          "choice_id":"2",
          "choice_content":"cold"
          },
          {
          "choice_id":"3",
          "choice_content":"hot"
          },
          {
          "choice_id":"4",
          "choice_content":"gross"
          },
          {
          "choice_id":"5",
          "choice_content":"chill"
          },
          ],
          },
          //Q22
              {
          "q_img": "assets/images/english/eng.png",
          "question":"Identify the opposite of  underline adjective below. \n The clothes are wet",
          "answer": "1",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"dry"
          },
          {
          "choice_id":"2",
          "choice_content":"sweet"
          },
          {
          "choice_id":"3",
          "choice_content":"gross"
          },
          {
          "choice_id":"4",
          "choice_content":"chill"
          },
          {
          "choice_id":"5",
          "choice_content":"hot"
          },
          ],
          },
          //Q23
              {
          "q_img": "assets/images/english/eng.png",
          "question":"Identify the opposite of  underline adjective below. \n The building is short",
          "answer": "1",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"long"
          },
          {
          "choice_id":"2",
          "choice_content":"big"
          },
          {
          "choice_id":"3",
          "choice_content":"small"
          },
          {
          "choice_id":"4",
          "choice_content":"hard"
          },
          {
          "choice_id":"5",
          "choice_content":"tiny"
          },
          ],
          },
          //Q24
              {
          "q_img": "assets/images/english/eng.png",
          "question":"Identify the opposite of  underline adjective below. \nYour face is clean",
          "answer": "2",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"long"
          },
          {
          "choice_id":"2",
          "choice_content":"dirty"
          },
          {
          "choice_id":"3",
          "choice_content":"hard"
          },
          {
          "choice_id":"4",
          "choice_content":"tiny"
          },
          {
          "choice_id":"5",
          "choice_content":"None of the above"
          },
          ],
          },
          //Q25
              {
          "q_img": "assets/images/english/eng.png",
          "question":"Identify the opposite of  underline adjective below. \n The windows are open.",
          "answer": "5",
          "choices":[
          {
          "choice_id":"1",
          "choice_content":"hot"
          },
          {
          "choice_id":"2",
          "choice_content":"cold"
          },
          {
          "choice_id":"3",
          "choice_content":"weather"
          },
          {
          "choice_id":"4",
          "choice_content":"sunny"
          },
          {
          "choice_id":"5",
          "choice_content":"close"
          },
          ],
          },
            ]
          }
        ]
      },
      
// GRADE3
      {
        "difficulty_name":"Grade 3",
        "grade_desc" : "Third grade is a year of primary education in many countries. It is the third school year of primary school. Students are usually 8–9 years old, depending on when their birthday occurs. ",
        "diff-avatar": "assets/images/grade3.png",
        "content":[
          {
            "type": "easy",
            "questions": [
              //Grade3 questions {}
            ]
          },
          {
            "type": "medium",
            "questions": [

            ]
          },
          {
            "type": "hard",
            "questions": [

            ]
          }
        ]
      },
      // GRADE4
      {
        "difficulty_name":"Grade 4",
        "grade_desc" : "The fourth grade forms the fourth year of Elementary school and children enrolled are typically 9 to 10 years old. Subjects taught include Math, Science, Reading, Writing and Social Studies.",
        "diff-avatar": "assets/images/grade4.png",
        "content":[
          {
            "type": "easy",
            "questions": [
              //Grade3 questions {}
            ]
          },
          {
            "type": "medium",
            "questions": [

            ]
          },
          {
            "type": "hard",
            "questions": [

            ]
          }
        ]
      },
      // GRADE5
      {
        "difficulty_name":"Grade 5",
        "grade_desc" : "The fifth grade is the fifth and last school year of elementary school in most schools. ... Key English Language Arts Common Core standards for 5th grade students include: Ability to determine the theme of a book, story, or poem from details in the text.",
        "diff-avatar": "assets/images/grade5.png",
        "content":[
          {
            "type": "easy",
            "questions": [
              //Grade3 questions {}
            ]
          },
          {
            "type": "medium",
            "questions": [

            ]
          },
          {
            "type": "hard",
            "questions": [

            ]
          }
        ]
      },

      // GRADE6
      {
        "difficulty_name":"Grade 6",
        "grade_desc" : "Sixth grade is a year of education for students ages 11–12. In many nations, it is the first year of middle school or the last year of elementary school. ",
        "diff-avatar": "assets/images/grade6.png",
        "content":[
          {
            "type": "easy",
            "questions": [
              //Grade3 questions {}
            ]
          },
          {
            "type": "medium",
            "questions": [

            ]
          },
          {
            "type": "hard",
            "questions": [

            ]
          }
        ]
      },
    ]
  },
];