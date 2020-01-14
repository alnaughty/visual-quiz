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
        "content":[
          // Q1
          {
            "q_img": "assets/images/english/sheep.jpg",
            "question":"What noise do sheep make?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"bark"
              },
              {
                "choice_id":"2",
                "choice_content":"cluck"
              },
              {
                "choice_id":"3",
                "choice_content":"bleat"
              },
              {
                "choice_id":"4",
                "choice_content":"mew"
              }
            ],
          },
          // Q2
          {
            "q_img": "assets/images/english/vow.png",
            "question":"Which letter is a vowel?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"e"
              },
              {
                "choice_id":"2",
                "choice_content":"f"
              },
              {
                "choice_id":"3",
                "choice_content":"g"
              },
              {
                "choice_id":"4",
                "choice_content":"h"
              }
            ],
          },
          // Q3
          {
            "q_img": "assets/images/english/vow.png",
            "question":"Which letter is not a vowel?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"i"
              },
              {
                "choice_id":"2",
                "choice_content":"o"
              },
              {
                "choice_id":"3",
                "choice_content":"n"
              },
              {
                "choice_id":"4",
                "choice_content":"u"
              }
            ],
          },
          //Q4
          {
            "q_img": "assets/images/english/tree.png",
            "question":"I ___ good at climbing trees.",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Am"
              },
              {
                "choice_id":"2",
                "choice_content":"Is"
              },
            ],
          },
          //Q5
          {
            "q_img": "assets/images/english/home.png",
            "question":"I have to ___ my homework.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Does"
              },
              {
                "choice_id":"2",
                "choice_content":"Do"
              },
            ],
          },
          //Q6
          {
            "q_img": "assets/images/english/zoo.png",
            "question":"They ___ at the zoo.",
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
            ],
          },
          //Q7
          {
            "q_img": "assets/images/english/boys.png",
            "question":"Jo and Mark ___ not want to go.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Do"
              },
              {
                "choice_id":"2",
                "choice_content":"Does"
              },
            ],
          },
          //Q8
          {
            "q_img": "assets/images/english/ice.png",
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
            ],
          },
          //Q9
          {
            "q_img": "assets/images/english/sport.png",
            "question":"She ___ well at sports.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Do"
              },
              {
                "choice_id":"2",
                "choice_content":"Does"
              },
            ],
          },
          //Q10
          {
            "q_img": "assets/images/english/balls.png",
            "question":"The balls ___ new.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Is"
              },
              {
                "choice_id":"2",
                "choice_content":"Are"
              },
            ],
          },
          // --
        ]
      },

      // GRADE2
       {
        "difficulty_name":"Grade 2",
        "grade_desc" : "In the second grade, children are usually 7 to 8 years old. Students are taught subjects such as Math, Science, Geography and Social Studies. In Math, they are introduced to larger numbers (building up on what was taught to them in the first grade) and fundamental operations such as addition and subtraction.",
        "diff-avatar": "assets/images/grade2.png",
        "content":[
          // Q1
          {
            "q_img": "assets/images/english/Image 14.png",
            "question":"Jono   : ____________ is your name?Johny : My name is Johny.",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"What"
              },
              {
                "choice_id":"2",
                "choice_content":"When"
              },
              {
                "choice_id":"3",
                "choice_content":"Where"
              },
              {
                "choice_id":"4",
                "choice_content":"Why"
              }
            ],
          },
          // Q2
          {
            "q_img": "assets/images/english/Image 15.png",
            "question":"Mr. Zaka: ________ are you late? Sayyaf: I am late because I woke up late. ",
            "answer": "4",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"What"
              },
              {
                "choice_id":"2",
                "choice_content":"When"
              },
              {
                "choice_id":"3",
                "choice_content":"Where"
              },
              {
                "choice_id":"4",
                "choice_content":"Why"
              }
            ],
          },
          // Q3
          {
            "q_img": "assets/images/english/Image 16.png",
            "question":"The correct use of capital letters is in the sentence ____________ . ",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"My name is Kiko."
              },
              {
                "choice_id":"2",
                "choice_content":"My Name is Kiko"
              },
              {
                "choice_id":"3",
                "choice_content":"My Name Is Kiko"
              },
              {
                "choice_id":"4",
                "choice_content":"My name is kiko"
              }
            ],
          },
          //Q4
          {
            "q_img": "assets/images/english/Image 17.png",
            "question":"I like playing soccer.There are _________syllables in the sentence above.",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"4"
              },
              {
                "choice_id":"2",
                "choice_content":"5"
              },
               {
                "choice_id":"3",
                "choice_content":"6"
              },
              {
                "choice_id":"4",
                "choice_content":"7"
              },
            ],
          },
          //Q5
          {
            "q_img": "assets/images/english/Image 18.png",
            "question":"He is sick.The past tense of the sentence above is _____________. ",
            "answer": "4",
            "choices":[
              {
                "choice_id":"2",
                "choice_content":"He were sick"
              },
              {
                "choice_id":"2",
                "choice_content":"He are sick"
              },

               {
                "choice_id":"3",
                "choice_content":"He am sick"
              },
               {
                "choice_id":"4",
                "choice_content":"He was sick"
              },
            ],
          },
          //Q6
          {
            "q_img": "assets/images/english/Image 19.png",
            "question":"My teeth are ___ sharp as knife. ",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"As"
              },
              {
                "choice_id":"2",
                "choice_content":"So"
              },
              {
                "choice_id":"3",
                "choice_content":"But"
              },
              {
                "choice_id":"4",
                "choice_content":"Or"
              },
            ],
          },
          //Q7
          {
            "q_img": "assets/images/english/Image 20.png",
            "question":"Which one do you choose? Reading Qur'an _______ watching TV?The correct joining word is ___________ . ",
            "answer": "4",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"And"
              },
              {
                "choice_id":"2",
                "choice_content":"But"
              },
              {
                "choice_id":"3",
                "choice_content":"Because"
              },
              {
                "choice_id":"4",
                "choice_content":"Or"
              },
            ],
          },
          //Q8
          {
            "q_img": "assets/images/english/Image 21.png",
            "question":"The correct order of words on dictionary is ___________ . ",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Bank-ball-bad"
              },
              {
                "choice_id":"2",
                "choice_content":"Bangkok-bad-ball"
              },
                {
                "choice_id":"3",
                "choice_content":"Bad-ball-Bangkok"
              },
                {
                "choice_id":"4",
                "choice_content":"Ball-bangok-bad"
              },
            ],
          },
          //Q9
          {
            "q_img": "assets/images/english/Image 22.png",
            "question":"I see a falling airplane yesterday.The verb above is incorrect. The correct one is _________. ",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Seed"
              },
              {
                "choice_id":"2",
                "choice_content":"Seeing"
              },
              {
                "choice_id":"3",
                "choice_content":"Saw"
              },
            ],
          },
          //Q10
          {
            "q_img": "assets/images/english/Image 23.png",
            "question":"The opposite of 'new' is _____________________ .",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Young"
              },
              {
                "choice_id":"2",
                "choice_content":"Long"
              },
              {
                "choice_id":"3",
                "choice_content":"Old"
              },
              {
                "choice_id":"4",  
                "choice_content":"Good"
              },
            ],
          },
          // --
        ]
      },
      
// GRADE3
      {
        "difficulty_name":"Grade 3",
        "grade_desc" : "Third grade is a year of primary education in many countries. It is the third school year of primary school. Students are usually 8–9 years old, depending on when their birthday occurs. ",
        "diff-avatar": "assets/images/grade3.png",
        "content":[
          // Q1
          {
            "q_img": "assets/images/english/Image 24.png",
            "question":"What is the plural form a knife?",
            "answer": "4",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Knifes"
              },
              {
                "choice_id":"2",
                "choice_content":"Nifes"
              },
              {
                "choice_id":"3",
                "choice_content":"Nives"
              },
              {
                "choice_id":"4",
                "choice_content":"Knives"
              }
            ],
          },
          // Q2
          {
            "q_img": "assets/images/english/Image 25.png",
            "question":"What is past tense of  place?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Placed"
              },
              {
                "choice_id":"2",
                "choice_content":"Plased"
              },
              {
                "choice_id":"3",
                "choice_content":"Plasis"
              },
              {
                "choice_id":"4",
                "choice_content":"Placing"
              }
            ],
          },
          // Q3
          {
            "q_img": "assets/images/english/Image 27.png",
            "question":"What is the verb in the following sentence. \n I set the glass on the table.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"glass"
              },
              {
                "choice_id":"2",
                "choice_content":"set"
              },
              {
                "choice_id":"3",
                "choice_content":"on"
              },
              {
                "choice_id":"4",
                "choice_content":"table"
              }
            ],
          },
          //Q4
          {
            "q_img": "assets/images/english/Group 356.png",
            "question":"Wat is the verb? \n I ran out of the room.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"I"
              },
              {
                "choice_id":"2",
                "choice_content":"Run"
              },
            ],
          },
          //Q5
          {
            "q_img": "assets/images/english/Image 29.png",
            "question":"What is the helping verb?\n Sidney has helped stray cats before.",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Has"
              },
              {
                "choice_id":"2",
                "choice_content":"Cats"
              },
               {
                "choice_id":"3",
                "choice_content":"Helped"
              },
              {
                "choice_id":"4",
                "choice_content":"Before"
              },
            ],
          },
          //Q6
          {
            "q_img": "assets/images/english/Image 30.png",
            "question":"She ... your new teacher.",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Is"
              },
              {
                "choice_id":"2",
                "choice_content":"Are"
              },
            ],
          },
          //Q7
          {
            "q_img": "assets/images/english/Image 31.png",
            "question":"... are ten students in my class.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Their"
              },
              {
                "choice_id":"2",
                "choice_content":"There"
              },
              {
                "choice_id":"3",
                "choice_content":"These"
              },
              {
                "choice_id":"4",
                "choice_content":"Them"
              },
            ],
          },
          //Q8
          {
            "q_img": "assets/images/english/Image 32.png",
            "question":".. the time? It's 9 o'clock.",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"What's"
              },
              {
                "choice_id":"2",
                "choice_content":"When's"
              },
              {
                "choice_id":"3",
                "choice_content":"Where's"
              },
              {
                "choice_id":"4",
                "choice_content":"How's"
              },
            ],
          },
          //Q9
          {
            "q_img": "assets/images/english/Image 33.png",
            "question":"I ... twenty years old.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Is"
              },
              {
                "choice_id":"2",
                "choice_content":"Am"
              },
               {
                "choice_id":"3",
                "choice_content":"Be"
              },
              {
                "choice_id":"4",
                "choice_content":"Have"
              },
            ],
          },
          //Q10
          {
            "q_img": "assets/images/english/Image 34.png",
            "question":"He ... ten cigarettes a day.",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Smokes"
              },
              {
                "choice_id":"2",
                "choice_content":"Smoking"
              },
               {
                "choice_id":"3",
                "choice_content":"Is smoking"
              },
              {
                "choice_id":"4",
                "choice_content":"Smoke"
              },
            ],
          },
          // --
        ]
      },
      // GRADE4
      {
        "difficulty_name":"Grade 4",
        "grade_desc" : "The fourth grade forms the fourth year of Elementary school and children enrolled are typically 9 to 10 years old. Subjects taught include Math, Science, Reading, Writing and Social Studies.",
        "diff-avatar": "assets/images/grade4.png",
        "content":[
          // Q1
          {
            "q_img": "assets/images/english/Image 26.png",
            "question":"Which one is not a synonym for happy?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Delighted"
              },
              {
                "choice_id":"2",
                "choice_content":"Joyful"
              },
              {
                "choice_id":"3",
                "choice_content":"Haughty"
              },
              {
                "choice_id":"4",
                "choice_content":"Glad"
              }
            ],
          },
          // Q2
          {
            "q_img": "assets/images/english/english.png",
            "question":"What is the past tense of put? ",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Put"
              },
              {
                "choice_id":"2",
                "choice_content":"Putted"
              },
              {
                "choice_id":"3",
                "choice_content":"Puted"
              },
              {
                "choice_id":"4",
                "choice_content":"Puts"
              }
            ],
          },
          // Q3
          {
            "q_img": "assets/images/english/Image 36.png",
            "question":"I eat ... apple every morning.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"A"
              },
              {
                "choice_id":"2",
                "choice_content":"An"
              },
              {
                "choice_id":"3",
                "choice_content":"The"
              },
              {
                "choice_id":"4",
                "choice_content":"None"
              }
            ],
          },
          //Q4
          {
            "q_img": "assets/images/english/Image 37.png",
            "question":"Its my first time playing football. Which word is incorrect?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Its"
              },
              {
                "choice_id":"2",
                "choice_content":"My"
              },
              {
                "choice_id":"1",
                "choice_content":"Time"
              },
              {
                "choice_id":"2",
                "choice_content":"Playing"
              },
            ],
          },
          //Q5
          {
            "q_img": "assets/images/english/Image 38.png",
            "question":"Which one is NOT a type of sentence? ",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Exclamatory sentence"
              },
              {
                "choice_id":"2",
                "choice_content":"Derogatory sentence"
              },
            ],
          },
          //Q6
          {
            "q_img": "assets/images/english/Image 39.png",
            "question":"Pick the correct spelling..",
            "answer": "4",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Patkol"
              },
              {
                "choice_id":"2",
                "choice_content":"Patyol"
              },
               {
                "choice_id":"3",
                "choice_content":"Pateol"
              },
              {
                "choice_id":"4",
                "choice_content":"Patrol"
              },
            ],
          },
          //Q7
          {
            "q_img": "assets/images/english/Image 40.png",
            "question":"Unscramble \"ulipp\"",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Pipul"
              },
              {
                "choice_id":"2",
                "choice_content":"Pupil"
              },
            ],
          },
          //Q8
          {
            "q_img": "assets/images/english/Image 41.png",
            "question":"What is faint?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Barely perceptible"
              },
              {
                "choice_id":"2",
                "choice_content":"Having the form of a curve"
              },
            ],
          },
          //Q9
          {
            "q_img": "assets/images/english/Image 41.png",
            "question":"Pick the correct spelling.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Selffish"
              },
              {
                "choice_id":"2",
                "choice_content":"Selfish"
              },
            ],
          },
          //Q10
          {
            
            "q_img": "assets/images/english/Image 42.png",
            "question":"Make (someone) a little angry",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Annoy"
              },
              {
                "choice_id":"2",
                "choice_content":"Anger"
              },
               {
                "choice_id":"3",
                "choice_content":"Slant"
              },
              {
                "choice_id":"4",
                "choice_content":"Curse"
              },
            ],
          },
          // --
        ]
      },
      // GRADE5
      {
        "difficulty_name":"Grade 5",
        "grade_desc" : "The fifth grade is the fifth and last school year of elementary school in most schools. ... Key English Language Arts Common Core standards for 5th grade students include: Ability to determine the theme of a book, story, or poem from details in the text.",
        "diff-avatar": "assets/images/grade5.png",
        "content":[
          // Q1
          {
            "q_img": "assets/images/english/eng.png",
            "question":"Find TWO words from the following group of five words that are the CLOSEST in meaning.",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"long, thin, narrow, wide, width"
              },
              {
                "choice_id":"2",
                "choice_content":"long, width"
              },
              {
                "choice_id":"3",
                "choice_content":"thin, narrow"
              },
              {
                "choice_id":"4",
                "choice_content":"wide, width"
              }
            ],
          },
          // Q2
          {
            "q_img": "assets/images/english/5.2.png",
            "question":"What does the word mean?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"A billion of something"
              },
              {
                "choice_id":"2",
                "choice_content":"The act of growing old"
              },
              {
                "choice_id":"3",
                "choice_content":"Agriculture based on the soil"
              },
              {
                "choice_id":"4",
                "choice_content":"A message that was written"
              }
            ],
          },
          // Q3
          {
            "q_img": "assets/images/english/5.3.png",
            "question":"Read each sentence and decide where the commas belong.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Mum asked me to remember the butter the cheese and the bread."
              },
              {
                "choice_id":"2",
                "choice_content":"Mom asked me to remember the butter, the cheese and the bread."
              },
            ],
          },
          //Q4
          {
            "q_img": "assets/images/english/5.4.png",
            "question":"We can list the things we like, separating each item with a comma. Which sentence is correct?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"I like apples bananas and oranges."
              },
              {
                "choice_id":"2",
                "choice_content":"I like apples, bananas and oranges."
              },
            ],
          },
          //Q5
          {
            "q_img": "assets/images/english/5.5.png",
            "question":"What is the meaning of the capitalized word in the sentence below? \n \"The counter is GRIZI,\" my southern cousin said as she went to get a rag to wipe it off.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Soapy"
              },
              {
                "choice_id":"2",
                "choice_content":"Oily and dirty"
              },
            ],
          },
          //Q6
          {
            "q_img": "assets/images/english/5.6.png",
            "question":"What is the meaning of the following science word?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"The speed and direction of something"
              },
              {
                "choice_id":"2",
                "choice_content":"The weight that something gains"
              },
            ],
          },
          //Q7
          {
            "q_img": "assets/images/english/eng.png",
            "question":"Choose the best correlative conjunctions to fill the gaps. \n He is ___ honest ___ loyal.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"although-yet"
              },
              {
                "choice_id":"2",
                "choice_content":"neither-nor"
              },
            ],
          },
          //Q8
          {
            "q_img": "assets/images/english/5.8.png",
            "question":"What is the meaning of the CAPITALIZED word in the sentence below? \n Since we had not had chocolate in days, we CRAVED it now.",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Yearn for something"
              },
              {
                "choice_id":"2",
                "choice_content":"Disgusted by something"
              },
            ],
          },
          //Q9
          {
            "q_img": "assets/images/english/5.9.png",
            "question":"What does the capitalized simile mean in the sentence below? \n After getting sick, my face was AS PALE AS A GHOST due to throwing up so much.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Dressed up as a ghost"
              },
              {
                "choice_id":"2",
                "choice_content":"Very white"
              },
            ],
          },
          //Q10
          {
            "q_img": "assets/images/english/5.10.png",
            "question":"'Please put this in the mail.' Which word is a homophone?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"this"
              },
              {
                "choice_id":"2",
                "choice_content":"mail"
              },
            ],
          },
          // --
        ]
      },

      // GRADE6
      {
        "difficulty_name":"Grade 6",
        "grade_desc" : "Sixth grade is a year of education for students ages 11–12. In many nations, it is the first year of middle school or the last year of elementary school. ",
        "diff-avatar": "assets/images/grade6.png",
        "content":[
          // Q1
          {
            "q_img": "assets/images/english/eng.png",
            "question":"For the sentence below, determine which answer shows the correct abbreviation for the underlined word.\n He was looking for John Peters Senior rather than his son.",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Sr."
              },
              {
                "choice_id":"2",
                "choice_content":"S."
              },
              {
                "choice_id":"3",
                "choice_content":"Sn."
              },
              {
                "choice_id":"4",
                "choice_content":"Snr."
              }
            ],
          },
          // Q2
          {
            "q_img": "assets/images/english/eng.png",
            "question":"For the sentence below, find the correct coordinate adjectives that would best describe the noun.\n My father loves to drive on _____________ roads in the mountains.",
            "answer": "4",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"slippery, terrain"
              },
              {
                "choice_id":"2",
                "choice_content":"winter, crooked"
              },
              {
                "choice_id":"3",
                "choice_content":"hidden, open"
              },
              {
                "choice_id":"4",
                "choice_content":"narrow, windy"
              }
            ],
          },
          // Q3
          {
            "q_img": "assets/images/english/eng.png",
            "question":"Select the adjectives in the following sentence. \n The road comprised large houses and a tiny shop.",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"comprised, and"
              },
              {
                "choice_id":"2",
                "choice_content":"houses, shop"
              },
              {
                "choice_id":"3",
                "choice_content":"large, tiny"
              },
              {
                "choice_id":"4",
                "choice_content":"road, large"
              }
            ],
          },
          //Q4
          {
            "q_img": "assets/images/english/eng.png",
            "question":"He ran quickly in last year's race.",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"last year's"
              },
              {
                "choice_id":"2",
                "choice_content":"race"
              },
               {
                "choice_id":"3",
                "choice_content":"quickly"
              },
              {
                "choice_id":"4",
                "choice_content":"He ran"
              },
            ],
          },
          //Q5
          {
            "q_img": "assets/images/english/6.5.png",
            "question":"The ....... ....... are in the middle aisle next to the vegetables.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"boxed fish"
              },
              {
                "choice_id":"2",
                "choice_content":"frozen fish"
              },

               {
                "choice_id":"3",
                "choice_content":"large fish"
              },
               {
                "choice_id":"4",
                "choice_content":"pre-cooked fish"
              },
            ],
          },
          //Q6
          {
            "q_img": "assets/images/english/6.6.png",
            "question":"Which of the following lists is not in alphabetical order?",
            "answer": "4",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Differ, different, differentiate"
              },
              {
                "choice_id":"2",
                "choice_content":"Eat, eaten, eats"
              },
              {
                "choice_id":"3",
                "choice_content":"Stop, stopped, stopping"
              },
              {
                "choice_id":"4",
                "choice_content":"Understood, understand, understanding"
              },
            ],
          },
          //Q7
          {
            "q_img": "assets/images/english/6.7.png",
            "question":"Empty",
            "answer": "4",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Drained"
              },
              {
                "choice_id":"2",
                "choice_content":"Vacant"
              },
              {
                "choice_id":"3",
                "choice_content":"Poured out"
              },
              {
                "choice_id":"4",
                "choice_content":"Full"
              },
            ],
          },
          //Q8
          {
            "q_img": "assets/images/english/6.8.png",
            "question":"The correct order of words on dictionary is ___________ . ",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Who is."
              },
              {
                "choice_id":"2",
                "choice_content":"Whois"
              },
                {
                "choice_id":"3",
                "choice_content":"Who's"
              },
                {
                "choice_id":"4",
                "choice_content":"Whos'"
              },
            ],
          },
          //Q9
          {
            "q_img": "assets/images/english/6.9.png",
            "question":"Ryland High School has the best teachers in the county.",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Begins the sentence"
              },
              {
                "choice_id":"2",
                "choice_content":"Is in the middle of the sentence"
              },
              {
                "choice_id":"3",
                "choice_content":"Contains a simple adjective"
              },
            ],
          },
          //Q10
          {
            
            "q_img": "assets/images/english/eng.png",
            "question":"She was brave _ a lion. What's the missing word?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"before"
              },
              {
                "choice_id":"2",
                "choice_content":"because"
              },
              {
                "choice_id":"3",
                "choice_content":"as"
              },
              {
                "choice_id":"4",
                "choice_content":"so"
              },
            ],
          },
          // --
        ]
      },
    ]
  },

  //Math
  {
    "category_name":"Math",
    "category_img":"assets/images/cmath.png",
    "difficulty":[
      {
        "difficulty_name":"Grade 1",
        "grade_desc" : "The first grade is the first school year in Elementary school after Kindergarten. Children who are usually 6 to 7 years old are enrolled for this grade. ... Additionally, first graders are taught basic reading skills with the focus on reading and writing simple statements.",
        "diff-avatar": "assets/images/grade1.png",
        "content":[
          // Q1
          {
            "q_img": "assets/images/math/1.1.png",
            "question":"What shape is around these snooker balls?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"A circle"
              },
              {
                "choice_id":"2",
                "choice_content":"A square"
              },
              {
                "choice_id":"3",
                "choice_content":"A triangle"
              },
              {
                "choice_id":"4",
                "choice_content":"An oblong"
              }
            ],
          },
          // Q2
          {
            "q_img": "assets/images/math/math.png",
            "question":"What is 5 + 32?",
            "answer": "4",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"73"
              },
              {
                "choice_id":"2",
                "choice_content":"32"
              },
              {
                "choice_id":"3",
                "choice_content":"325"
              },
              {
                "choice_id":"4",
                "choice_content":"37"
              }
            ],
          },
          // Q3
          {
            "q_img": "assets/images/math/math.png",
            "question":"Which of the following is to do with addition?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"sharing"
              },
              {
                "choice_id":"2",
                "choice_content":"put together"
              },
              {
                "choice_id":"3",
                "choice_content":"take away"
              },
              {
                "choice_id":"4",
                "choice_content":"multiply"
              }
            ],
          },
          //Q4
          {
            "q_img": "assets/images/math/math.png",
            "question":"A table has 4 legs. How many legs do 4 tables have?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"16"
              },
              {
                "choice_id":"2",
                "choice_content":"44"
              },
            ],
          },
          //Q5
          {
            "q_img": "assets/images/math/math.png",
            "question":"What is the total of 2, 15 and 3?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"19"
              },
              {
                "choice_id":"2",
                "choice_content":"20"
              },
            ],
          },
          //Q6
          {
            "q_img": "assets/images/math/math.png",
            "question":"10 - 9",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"1"
              },
              {
                "choice_id":"2",
                "choice_content":"2"
              },
            ],
          },
          //Q7
          {
            "q_img": "assets/images/math/math.png",
            "question":"Which number should come at the end of this sequence: 5, 10, 15, 20, __?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"50"
              },
              {
                "choice_id":"2",
                "choice_content":"25"
              },
            ],
          },
          //Q8
          {
            "q_img": "assets/images/math/1.8.png",
            "question":"Sonny and Baek  ___  eating ice cream.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"16"
              },
              {
                "choice_id":"2",
                "choice_content":"10"
              },
            ],
          },
          //Q9
          {
            "q_img": "assets/images/math/math.png",
            "question":"Which number isn't even?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"27"
              },
              {
                "choice_id":"2",
                "choice_content":"36"
              },
            ],
          },
          //Q10
          {
            "q_img": "assets/images/math/math.png",
            "question":"Which number is odd",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"13"
              },
              {
                "choice_id":"2",
                "choice_content":"10"
              },
            ],
          },
          // --
        ]
      },

      // GRADE2
       {
        "difficulty_name":"Grade 2",
        "grade_desc" : "In the second grade, children are usually 7 to 8 years old. Students are taught subjects such as Math, Science, Geography and Social Studies. In Math, they are introduced to larger numbers (building up on what was taught to them in the first grade) and fundamental operations such as addition and subtraction.",
        "diff-avatar": "assets/images/grade2.png",
        "content":[
          // Q1
          {
            "q_img": "assets/images/math/2.1.png",
            "question":"All these containers can hold the same amount of liquid even though they are different ___ .",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"shapes and sizes"
              },
              {
                "choice_id":"2",
                "choice_content":"colours"
              },
              {
                "choice_id":"3",
                "choice_content":"liquids"
              },
              {
                "choice_id":"4",
                "choice_content":"materials"
              }
            ],
          },
          // Q2
          {
            "q_img": "assets/images/math/2.2.png",
            "question":"This glass is ____ .",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"empty"
              },
              {
                "choice_id":"2",
                "choice_content":"half full"
              },
              {
                "choice_id":"3",
                "choice_content":"full"
              },
              {
                "choice_id":"4",
                "choice_content":"broken"
              }
            ],
          },
          // Q3
          {
            "q_img": "assets/images/math/2.3.png",
            "question":"What does this symbol mean",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Multiplication"
              },
              {
                "choice_id":"2",
                "choice_content":"Addition or adding"
              },
              {
                "choice_id":"3",
                "choice_content":"Subtracting or subtraction"
              },
              {
                "choice_id":"4",
                "choice_content":"Division"
              }
            ],
          },
          //Q4
          {
            "q_img": "assets/images/math/math.png",
            "question":"Which symbol is missing from this calculation: 3 ? 6 = 9",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"="
              },
              {
                "choice_id":"2",
                "choice_content":"-"
              },
               {
                "choice_id":"3",
                "choice_content":"+"
              },
              {
                "choice_id":"4",
                "choice_content":"x"
              },
            ],
          },
          //Q5
          {
            "q_img": "assets/images/math/2.5.png",
            "question":"Cars have to drive ______ a roundabout.",
            "answer": "4",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Around"
              },
              {
                "choice_id":"2",
                "choice_content":"Over"
              },

               {
                "choice_id":"3",
                "choice_content":"Under"
              },
               {
                "choice_id":"4",
                "choice_content":"Through"
              },
            ],
          },
          //Q6
          {
            "q_img": "assets/images/math/2.6.png",
            "question":"What should you do to set the timer for 30 minutes?",
            "answer": "4",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Turn it a quarter of the way round clockwise"
              },
              {
                "choice_id":"2",
                "choice_content":"Turn it clockwise halfway round"
              },
              {
                "choice_id":"3",
                "choice_content":"Turn it all the way round counterclockwis"
              },
              {
                "choice_id":"4",
                "choice_content":"Turn it quarter of the way round counterclockwise"
              },
            ],
          },
          //Q7
          {
            "q_img": "assets/images/math/2.7.png",
            "question":"It is half past 5. What time will it be in half an hour?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"6 o'clock"
              },
              {
                "choice_id":"2",
                "choice_content":"5 o'clock"
              },
              {
                "choice_id":"3",
                "choice_content":"Half past 6"
              },
              {
                "choice_id":"4",
                "choice_content":"Half past 4"
              },
            ],
          },
          //Q8
          {
            "q_img": "assets/images/math/2.8.png",
            "question":"What time will it be in 15 minutes?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Quarter past 5"
              },
              {
                "choice_id":"2",
                "choice_content":"Quarter to 2"
              },
                {
                "choice_id":"3",
                "choice_content":"Quarter past 6"
              },
                {
                "choice_id":"4",
                "choice_content":"Half past 6"
              },
            ],
          },
          //Q9
          {
            "q_img": "assets/images/math/math.png",
            "question":"What is the next number in this sequence: 15, 20, 25, 30",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"53"
              },
              {
                "choice_id":"2",
                "choice_content":"54"
              },
              {
                "choice_id":"3",
                "choice_content":"35"
              },
            ],
          },
          //Q10
          {
            "q_img": "assets/images/math/math.png",
            "question":"What is the missing number: 12 + ? = 20",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"18"
              },
              {
                "choice_id":"2",
                "choice_content":"5"
              },
              {
                "choice_id":"3",
                "choice_content":"8"
              },
              {
                "choice_id":"4",
                "choice_content":"22"
              },
            ],
          },
          // --
        ]
      },
      
// GRADE3
      {
        "difficulty_name":"Grade 3",
        "grade_desc" : "Third grade is a year of primary education in many countries. It is the third school year of primary school. Students are usually 8–9 years old, depending on when their birthday occurs. ",
        "diff-avatar": "assets/images/grade3.png",
        "content":[
          // Q1
          {
            "q_img": "assets/images/math/math.png",
            "question":"Find the number that will complete the sum below correctly. \n 35 - ? = 4 x 4",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"18"
              },
              {
                "choice_id":"2",
                "choice_content":"17"
              },
              {
                "choice_id":"3",
                "choice_content":"19"
              },
              {
                "choice_id":"4",
                "choice_content":"20"
              }
            ],
          },
          // Q2
          {
            "q_img": "assets/images/math/math.png",
            "question":"How many months are there in a decade?",
            "answer": "4",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"1,200 months"
              },
              {
                "choice_id":"2",
                "choice_content":"100 months"
              },
              {
                "choice_id":"3",
                "choice_content":"12 months"
              },
              {
                "choice_id":"4",
                "choice_content":"120 months"
              }
            ],
          },
          // Q3
          {
            "q_img": "assets/images/math/math.png",
            "question":"In Western civilization, what is the name given to the dates recorded before the birth of Christ?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Pre-Christ (PC)"
              },
              {
                "choice_id":"2",
                "choice_content":"Before Christ (BC)"
              },
              {
                "choice_id":"3",
                "choice_content":"Ante-Christ (AC)"
              },
              {
                "choice_id":"4",
                "choice_content":"Prior-Christ (PC)"
              }
            ],
          },
          //Q4
          {
            "q_img": "assets/images/math/math.png",
            "question":"Which one of the following is the same as 7 days?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"A decade"
              },
              {
                "choice_id":"2",
                "choice_content":"A week"
              },
            ],
          },
          //Q5
          {
            "q_img": "assets/images/math/math.png",
            "question":"Which unit of time would you use to measure how long it takes for an acorn to grow into a large tree?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Hours"
              },
              {
                "choice_id":"2",
                "choice_content":"Months"
              },
            ],
          },
          //Q6
          {
            "q_img": "assets/images/math/math.png",
            "question":"Find the number that will complete the sum below correctly. \n 14 ÷ 2 = 63 ÷ ?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"9"
              },
              {
                "choice_id":"2",
                "choice_content":"5"
              },
            ],
          },
          //Q7
          {
            "q_img": "assets/images/math/math.png",
            "question":"How many days in a year?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"200 days"
              },
              {
                "choice_id":"2",
                "choice_content":"365 days"
              },
            ],
          },
          //Q8
          {
            "q_img": "assets/images/math/math.png",
            "question":"What is 3,335 rounded to the nearest 100?",
            "answer": "2",  
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"3,400"
              },
              {
                "choice_id":"2",
                "choice_content":"3,300"
              },
            ],
          },
          //Q9
          {
            "q_img": "assets/images/math/math.png",
            "question":"How many digits are there in our number system?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"11"
              },
              {
                "choice_id":"2",
                "choice_content":"10"
              },
            ],
          },
          //Q10
          {
            "q_img": "assets/images/math/math.png",
            "question":"Which of these is the largest number?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"-4"
              },
              {
                "choice_id":"2",
                "choice_content":"-1"
              },
            ],
          },
          // --
        ]
      },
      // GRADE4
      {
        "difficulty_name":"Grade 4",
        "grade_desc" : "The fourth grade forms the fourth year of Elementary school and children enrolled are typically 9 to 10 years old. Subjects taught include Math, Science, Reading, Writing and Social Studies.",
        "diff-avatar": "assets/images/grade4.png",
        "content":[
          // Q1
          {
            "q_img": "assets/images/math/4.1.png",
            "question":"The roman numeral for 18 is ______.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"XXVIII"
              },
              {
                "choice_id":"2",
                "choice_content":"XVIII"
              },
              {
                "choice_id":"3",
                "choice_content":"IVIII"
              },
              {
                "choice_id":"4",
                "choice_content":"VVVIII"
              }
            ],
          },
          // Q2
          {
            "q_img": "assets/images/math/4.2.png",
            "question":"The smallest 4-digit number formed by using the digits 0, 3, 5, 6 is _____.",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"3056"
              },
              {
                "choice_id":"2",
                "choice_content":"6035"
              },
              {
                "choice_id":"3",
                "choice_content":"6530"
              },
              {
                "choice_id":"4",
                "choice_content":"0356"
              }
            ],
          },
          // Q3
          {
            "q_img": "assets/images/math/4.3.png",
            "question":"The predecessor of the smallest 5-digit number is ____.",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"9999"
              },
              {
                "choice_id":"2",
                "choice_content":"99999"
              },
              {
                "choice_id":"3",
                "choice_content":"10001"
              },
              {
                "choice_id":"4",
                "choice_content":"100001"
              }
            ],
          },
          //Q4
          {
            "q_img": "assets/images/math/4.4.png",
            "question":"The smallest single digit composite number is ____.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"9"
              },
              {
                "choice_id":"2",
                "choice_content":"4"
              },
            ],
          },
          //Q5
          {
            "q_img": "assets/images/math/4.5.png",
            "question":"The improper fraction among the following is ____.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"4/7"
              },
              {
                "choice_id":"2",
                "choice_content":"3/3"
              },
            ],
          },
          //Q6
          {
            "q_img": "assets/images/math/4.6.jpng_____.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"2 and 3"
              },
              {
                "choice_id":"2",
                "choice_content":"3 and 4"
              },
            ],
          },
          //Q7
          {
            "q_img": "assets/images/math/4.7.png",
            "question":"How many one-sixths make 2?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"3"
              },
              {
                "choice_id":"2",
                "choice_content":"12"
              },
            ],
          },
          //Q8
          {
            "q_img": "assets/images/math/4.8.png",
            "question":"3 hundredths can be written as ____.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"0.003"
              },
              {
                "choice_id":"2",
                "choice_content":"0.03"
              },
            ],
          },
          //Q9
          {
            "q_img": "assets/images/math/4.9.png",
            "question":"0.07 = ____",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"7/10"
              },
              {
                "choice_id":"2",
                "choice_content":"7/100"
              },
            ],
          },
          //Q10
          {
            
            "q_img": "assets/images/math/4.10.png",
            "question":"3 hrs 40 mins equals ____.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"120 mins"
              },
              {
                "choice_id":"2",
                "choice_content":"220 mins"
              },
            ],
          },
          // --
        ]
      },
      // GRADE5
      {
        "difficulty_name":"Grade 5",
        "grade_desc" : "The fifth grade is the fifth and last school year of elementary school in most schools. ... Key English Language Arts Common Core standards for 5th grade students include: Ability to determine the theme of a book, story, or poem from details in the text.",
        "diff-avatar": "assets/images/grade5.png",
        "content":[
          // Q1
          {
            "q_img": "assets/images/math/5.1.png",
            "question":"Use the slash in writing fractions such as 3/11 for three-elevenths.",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"15/15"
              },
              {
                "choice_id":"2",
                "choice_content":"13/15"
              },
              {
                "choice_id":"3",
                "choice_content":"13/20"
              },
              {
                "choice_id":"4",
                "choice_content":"20/20"
              }
            ],
          },
          // Q2
          {
            "q_img": "assets/images/math/5.2.png",
            "question":"What is  of 72?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"27"
              },
              {
                "choice_id":"2",
                "choice_content":"28"
              },
              {
                "choice_id":"3",
                "choice_content":"72"
              },
              {
                "choice_id":"4",
                "choice_content":"14"
              }
            ],
          },
          // Q3
          {
            "q_img": "assets/images/math/5.3.png",
            "question":"What fraction of the figure is shaded?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"1/3"
              },
              {
                "choice_id":"2",
                "choice_content":"1/2"
              },
              {
                "choice_id":"3",
                "choice_content":"2/3"
              },
              {
                "choice_id":"4",
                "choice_content":"1"
              }
            ],
          },
          //Q4
          {
            "q_img": "assets/images/math/math.png",
            "question":"9 x 9",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"84"
              },
              {
                "choice_id":"2",
                "choice_content":"81"
              },
            ],
          },
          //Q5
          {
            "q_img": "assets/images/math/math.png",
            "question":"11 x 11",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"111"
              },
              {
                "choice_id":"2",
                "choice_content":"121"
              },
            ],
          },
          //Q6
          {
            "q_img": "assets/images/math/math.png",
            "question":"(5 + 6) x 7",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"77"
              },
              {
                "choice_id":"2",
                "choice_content":"66"
              },
            ],
          },
          //Q7
          {
            "q_img": "assets/images/math/math.png",
            "question":"5 + (6 x 7)",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"112"
              },
              {
                "choice_id":"2",
                "choice_content":"115"
              },
                {
                "choice_id":"3",
                "choice_content":"117"
              },
            ],
          },
          //Q8
          {
            "q_img": "assets/images/math/math.png",
            "question":"10 - x = 5",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"10"
              },
              {
                "choice_id":"2",
                "choice_content":"5"
              },
            ],
          },
          //Q9
          {
            "q_img": "assets/images/math/math.png",
            "question":"5x - 10 = 100",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"33"
              },
              {
                "choice_id":"2",
                "choice_content":"22"
              },
               {
                "choice_id":"3",
                "choice_content":"44"
              },
               {
                "choice_id":"4",
                "choice_content":"11"
              },
            ],
          },
          //Q10
          {
            "q_img": "assets/images/math/math.png",
            "question":"10x + 3x = 169",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"14"
              },
              {
                "choice_id":"2",
                "choice_content":"13"
              },
            ],
          },
          // --
        ]
      },
      // GRADE6
      {
        "difficulty_name":"Grade 6",
        "grade_desc" : "Sixth grade is a year of education for students ages 11–12. In many nations, it is the first year of middle school or the last year of elementary school. ",
        "diff-avatar": "assets/images/grade6.png",
        "content":[
          // Q1
          {
            "q_img": "assets/images/math/6.1.png",
            "question":"158=___ + 106. What number will come in the blank to make the number sentence correct?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"43"
              },
              {
                "choice_id":"2",
                "choice_content":"54"
              },
              {
                "choice_id":"3",
                "choice_content":"52"
              },
              {
                "choice_id":"4",
                "choice_content":"50"
              }
            ],
          },
          // Q2
          {
            "q_img": "assets/images/math/6.2.png",
            "question":"Shown below is a part of a triangle with one of its angles missing. The measure of the missing angle is:",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Less than 90"
              },
              {
                "choice_id":"2",
                "choice_content":"Equal 90"
              },
              {
                "choice_id":"3",
                "choice_content":"More than 90"
              },
              {
                "choice_id":"4",
                "choice_content":"More than 80"
              }
            ],
          },
          // Q3
          {
            "q_img": "assets/images/math/6.3.png",
            "question":"Faizal has 918 marbles. He wants to make packets of marbles, with nine marbles in each pack. How many packs will he be able to make?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"12"
              },
              {
                "choice_id":"2",
                "choice_content":"102"
              },
              {
                "choice_id":"3",
                "choice_content":"120"
              },
              {
                "choice_id":"4",
                "choice_content":"1062"
              }
            ],
          },
          //Q4
          {
            "q_img": "assets/images/math/6.4.png",
            "question":"Which of these lies between 6.3 and 6.6?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"6.2"
              },
              {
                "choice_id":"2",
                "choice_content":"6.9"
              },
               {
                "choice_id":"3",
                "choice_content":"6.41"
              },
              {
                "choice_id":"4",
                "choice_content":"6.05"
              },
            ],
          },
          //Q5
          {
            "q_img": "assets/images/math/6.5.png",
            "question":"A teacher brought some toffees to her class. After giving three toffees each to 15 students who had completed their assignments, she has 60 toffees left with her. How many toffees did she bring to the class?",
            "answer": "4",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"15"
              },
              {
                "choice_id":"2",
                "choice_content":"45"
              },

               {
                "choice_id":"3",
                "choice_content":"78"
              },
               {
                "choice_id":"4",
                "choice_content":"105"
              },
            ],
          },
          //Q6
          {
            "q_img": "assets/images/math/6.6.png",
            "question":"Which of these numbers have only two factors, 1 and the number itself?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"37X1"
              },
              {
                "choice_id":"2",
                "choice_content":"37+1"
              },
              {
                "choice_id":"3",
                "choice_content":"37+37"
              },
              {
                "choice_id":"4",
                "choice_content":"37X37"
              },
            ],
          },
          //Q7
          {
            "q_img": "assets/images/math/6.7.png",
            "question":"Meena divides a number by 2. She then divides the answer by 2. This is the same as dividing the original number by:",
            "answer": "4",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"1"
              },
              {
                "choice_id":"2",
                "choice_content":"2"
              },
              {
                "choice_id":"3",
                "choice_content":"3"
              },
              {
                "choice_id":"4",
                "choice_content":"4"
              },
            ],
          },
          //Q8
          {
            "q_img": "assets/images/math/6.8.png",
            "question":"John has stamps from different countries. 1/3rd of them are India stamps. if he has 36 Indian stamps, how many stamps does he have in total?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"12"
              },
              {
                "choice_id":"2",
                "choice_content":"36"
              },
                {
                "choice_id":"3",
                "choice_content":"108"
              },
                {
                "choice_id":"4",
                "choice_content":"48"
              },
            ],
          },
          //Q9
          {
            "q_img": "assets/images/math/6.9.png",
            "question":"1024+1025+___=1025+1025+1025 What number will come in the blank to make the number sentence correct?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"1024"
              },
              {
                "choice_id":"2",
                "choice_content":"1025"
              },
              {
                "choice_id":"3",
                "choice_content":"1026"
              },
               {
                "choice_id":"3",
                "choice_content":"1036"
              },
            ],
          },
          //Q10
          {
            
            "q_img": "assets/images/math/math.png",
            "question":"Meena has bought six pens. The cost of each pen was between Rs.25 and Rs. 30. Which of these could be the total cost of the pens?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Rs.55"
              },
              {
                "choice_id":"2",
                "choice_content":"Rs.126"
              },
              {
                "choice_id":"3",
                "choice_content":"Rs.173"
              },
              {
                "choice_id":"4",
                "choice_content":"Rs.330"
              },
            ],
          },
          // --
        ]
      },
    ]
  },

  // Science
  {
    "category_name":"Science",
    "category_img":"assets/images/science.png",
    "difficulty":[
      {
        "difficulty_name":"Grade 1",
        "grade_desc" : "The first grade is the first school year in Elementary school after Kindergarten. Children who are usually 6 to 7 years old are enrolled for this grade. ... Additionally, first graders are taught basic reading skills with the focus on reading and writing simple statements.",
        "diff-avatar": "assets/images/grade1.png",
        "content":[
          // Q1
          {
            "q_img": "assets/images/science/1.1.png",
            "question":"Which animal lays eggs?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Dog"
              },
              {
                "choice_id":"2",
                "choice_content":"Cat"
              },
              {
                "choice_id":"3",
                "choice_content":"Duck"
              },
              {
                "choice_id":"4",
                "choice_content":"Sheep"
              }
            ],
          },
          // Q2
          {
            "q_img": "assets/images/science/1.2.png",
            "question":"A male cow is called?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Ox"
              },
              {
                "choice_id":"2",
                "choice_content":"Dog"
              },
              {
                "choice_id":"3",
                "choice_content":"Sheep"
              },
              {
                "choice_id":"4",
                "choice_content":"Monkey"
              }
            ],
          },
          // Q3
          {
            "q_img": "assets/images/science/1.3.png",
            "question":"All animals need food, air, and ____ to survive.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"House"
              },
              {
                "choice_id":"2",
                "choice_content":"Water"
              },
              {
                "choice_id":"3",
                "choice_content":"Chocolate"
              },
              {
                "choice_id":"4",
                "choice_content":"Fruits"
              }
            ],
          },
          //Q4
          {
            "q_img": "assets/images/science/1.4.png",
            "question":"Which one is a fur-bearing animal?.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Hen"
              },
              {
                "choice_id":"2",
                "choice_content":"Cat"
              },
            ],
          },
          //Q5
          {
            "q_img": "assets/images/science/1.5.png",
            "question":"What is Earth’s only natural satellite?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Sun"
              },
              {
                "choice_id":"2",
                "choice_content":"Moon"
              },
            ],
          },
          //Q6
          {
            "q_img": "assets/images/science/1.6.png",
            "question":"The tree has a branch filled with green _____.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"hair"
              },
              {
                "choice_id":"2",
                "choice_content":"Leaves"
              },
            ],
          },
          //Q7
          {
            "q_img": "assets/images/science/1.7.png",
            "question":"What part of the body helps you move?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Eyes"
              },
              {
                "choice_id":"2",
                "choice_content":"Muscles"
              },
            ],
          },
          //Q8
          {
            "q_img": "assets/images/science/1.8.png",
            "question":"The two holes of the nose are called?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Nostrils"
              },
              {
                "choice_id":"2",
                "choice_content":"Nais"
              },
            ],
          },
          //Q9
          {
            "q_img": "assets/images/science/1.9.png",
            "question":"What star shines in the day and provides light?.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Moon"
              },
              {
                "choice_id":"2",
                "choice_content":"Sun"
              },
            ],
          },
          //Q10
          {
            "q_img": "assets/images/science/1.10.png",
            "question":"Legs have feet and arms have ___.",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"hands"
              },
              {
                "choice_id":"2",
                "choice_content":"Ankles"
              },
            ],
          },
          // --
        ]
      },

      // GRADE2
       {
        "difficulty_name":"Grade 2",
        "grade_desc" : "In the second grade, children are usually 7 to 8 years old. Students are taught subjects such as Math, Science, Geography and Social Studies. In Math, they are introduced to larger numbers (building up on what was taught to them in the first grade) and fundamental operations such as addition and subtraction.",
        "diff-avatar": "assets/images/grade2.png",
        "content":[
          // Q1
          {
            "q_img": "assets/images/science/sci.png",
            "question":"Which organ covers the entire body and protects it?.",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Liver"
              },
              {
                "choice_id":"2",
                "choice_content":"Heart"
              },
              {
                "choice_id":"3",
                "choice_content":"Skin"
              },
              {
                "choice_id":"4",
                "choice_content":"Brain"
              }
            ],
          },
          // Q2
          {
            "q_img": "assets/images/science/sci.png",
            "question":"Which shape is a round?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Rectangle"
              },
              {
                "choice_id":"2",
                "choice_content":"Square"
              },
              {
                "choice_id":"3",
                "choice_content":"Circle"
              },
              {
                "choice_id":"4",
                "choice_content":"Triangle"
              }
            ],
          },
          // Q3
          {
            "q_img": "assets/images/science/sci.png",
            "question":"Who invented the first functional telephone?",
            "answer": "4",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Albert Einstein"
              },
              {
                "choice_id":"2",
                "choice_content":"Nikola Tesla"
              },
              {
                "choice_id":"3",
                "choice_content":"Thomas Alva Edison"
              },
              {
                "choice_id":"4",
                "choice_content":"Alexander Graham Bell"
              }
            ],
          },
          //Q4
          {
            "q_img": "assets/images/science/sci.png",
            "question":"What is the young one of a cow called?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Puppy"
              },
              {
                "choice_id":"2",
                "choice_content":"Kitten"
              },
               {
                "choice_id":"3",
                "choice_content":"Calf"
              },
              {
                "choice_id":"4",
                "choice_content":"Baby"
              },
            ],
          },
          //Q5
          {
            "q_img": "assets/images/science/sci.png",
            "question":"Dark rain clouds can give out lightning and ____.",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Thunder"
              },
              {
                "choice_id":"2",
                "choice_content":"Snow"
              },

               {
                "choice_id":"3",
                "choice_content":"Sunlight"
              },
               {
                "choice_id":"4",
                "choice_content":"Wind"
              },
            ],
          },
          //Q6
          {
            "q_img": "assets/images/science/sci.png",
            "question":"Your hands have four fingers and a ____.",
            "answer": "4",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Knee"
              },
              {
                "choice_id":"2",
                "choice_content":"Ankle"
              },
              {
                "choice_id":"3",
                "choice_content":"Elbow"
              },
              {
                "choice_id":"4",
                "choice_content":"Thumb"
              },
            ],
          },
          //Q7
          {
            "q_img": "assets/images/science/sci.png",
            "question":"Which part of the bird lets it fly high in the sky?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Beak"
              },
              {
                "choice_id":"2",
                "choice_content":"Feet"
              },
              {
                "choice_id":"3",
                "choice_content":"Wings"
              },
              {
                "choice_id":"4",
                "choice_content":"Claws"
              },
            ],
          },
          //Q8
          {
            "q_img": "assets/images/science/sci.png",
            "question":"Animals that suckle their young one are called ____.",
            "answer": "4",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Reptiles"
              },
              {
                "choice_id":"2",
                "choice_content":"Birds"
              },
                {
                "choice_id":"3",
                "choice_content":"Amphibians"
              },
                {
                "choice_id":"4",
                "choice_content":"Mammals"
              },
            ],
          },
          //Q9
          {
            "q_img": "assets/images/science/sci.png",
            "question":"What part of the plant conducts photosynthesis?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Branch"
              },
              {
                "choice_id":"2",
                "choice_content":"Leaf"
              },
              {
                "choice_id":"3",
                "choice_content":"Root"
              },
              {
                "choice_id":"4",
                "choice_content":"Trunk"
              },
            ],
          },
          //Q10
          {
            "q_img": "assets/images/science/sci.png",
            "question":"What is the boiling point of water?",
            "answer": "4",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"25°C"
              },
              {
                "choice_id":"2",
                "choice_content":"50°C"
              },
              {
                "choice_id":"3",
                "choice_content":"75°C"
              },
              {
                "choice_id":"4",
                "choice_content":"100°C"
              },
            ],
          },
          // --
        ]
      },
      
// GRADE3
      {
        "difficulty_name":"Grade 3",
        "grade_desc" : "Third grade is a year of primary education in many countries. It is the third school year of primary school. Students are usually 8–9 years old, depending on when their birthday occurs. ",
        "diff-avatar": "assets/images/grade3.png",
        "content":[
          // Q1
          {
            "q_img": "assets/images/science/sci.png",
            "question":"Which is the largest land animal?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Lion"
              },
              {
                "choice_id":"2",
                "choice_content":"Tiger"
              },
              {
                "choice_id":"3",
                "choice_content":"Elephant"
              },
              {
                "choice_id":"4",
                "choice_content":"Rhinoceros"
              }
            ],
          },
          // Q2
          {
            "q_img": "assets/images/science/sci.pnng",
            "question":"____ helps pump blood through the entire body",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Lungs"
              },
              {
                "choice_id":"2",
                "choice_content":"Kidneys"
              },
              {
                "choice_id":"3",
                "choice_content":"Heart"
              },
              {
                "choice_id":"4",
                "choice_content":"Brain"
              }
            ],
          },
          // Q3
          {
            "q_img": "assets/images/science/sci.png",
            "question":"How does a dog express happiness?",
            "answer": "4",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Twitching ears"
              },
              {
                "choice_id":"2",
                "choice_content":"Moving head"
              },
              {
                "choice_id":"3",
                "choice_content":"Closing eyes"
              },
              {
                "choice_id":"4",
                "choice_content":"Wagging tail"
              }
            ],
          },
          //Q4
          {
            "q_img": "assets/images/science/sci.png",
            "question":"hich material from the following has the highest transparency?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Metal"
              },
              {
                "choice_id":"2",
                "choice_content":"Glass"
              },
            ],
          },
          //Q5
          {
            "q_img": "assets/images/science/sci.png",
            "question":"What are the three states of matter?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Small, Gas, Liquid"
              },
              {
                "choice_id":"2",
                "choice_content":"Solid, Liquid, Gas"
              },
            ],
          },
          //Q6
          {
            "q_img": "assets/images/science/sci.png",
            "question":"Frog is a ___ .",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Reptile"
              },
              {
                "choice_id":"2",
                "choice_content":"Amphibian"
              },
            ],
          },
          //Q7
          {
            "q_img": "assets/images/science/sci.png",
            "question":"If one boils water it will convert into ____.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Mist"
              },
              {
                "choice_id":"2",
                "choice_content":"Steam"
              },
            ],
          },
          //Q8
          {
            "q_img": "assets/images/science/sci.png",
            "question":"When you push something, you apply ____.",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Force"
              },
              {
                "choice_id":"2",
                "choice_content":"Mass"
              },
            ],
          },
          //Q9
          {
            "q_img": "assets/images/science/sci.png",
            "question":"Which group of animals have scales?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Mammals"
              },
              {
                "choice_id":"2",
                "choice_content":"Reptiles"
              },
            ],
          },
          //Q10
          {
            "q_img": "assets/images/science/sci.png",
            "question":"Where does our food collect after we chew and swallow it?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Liver"
              },
              {
                "choice_id":"2",
                "choice_content":"Stomach"
              },
            ],
          },
          // --
        ]
      },
      // GRADE4
      {
        "difficulty_name":"Grade 4",
        "grade_desc" : "The fourth grade forms the fourth year of Elementary school and children enrolled are typically 9 to 10 years old. Subjects taught include Math, Science, Reading, Writing and Social Studies.",
        "diff-avatar": "assets/images/grade4.png",
        "content":[
          // Q1
          {
            "q_img": "assets/images/science/sci.png",
            "question":"Which animal from the below list is best adapted to the desert?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Tiger"
              },
              {
                "choice_id":"2",
                "choice_content":"Cheetah"
              },
              {
                "choice_id":"3",
                "choice_content":"Camel"
              },
              {
                "choice_id":"4",
                "choice_content":"Deer"
              }
            ],
          },
          // Q2
          {
            "q_img": "assets/images/science/sheep.jpg",
            "question":"What is the name of a frog’s young one?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Infant"
              },
              {
                "choice_id":"2",
                "choice_content":"Puppy"
              },
              {
                "choice_id":"3",
                "choice_content":"Tadpole"
              },
              {
                "choice_id":"4",
                "choice_content":"Todpole"
              }
            ],
          },
          // Q3
          {
            "q_img": "assets/images/science/sci.png",
            "question":"Which pigment gives the leaves its green color?",
            "answer": "4",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Carotenoids"
              },
              {
                "choice_id":"2",
                "choice_content":"Anthocyanins"
              },
              {
                "choice_id":"3",
                "choice_content":"Roots"
              },
              {
                "choice_id":"4",
                "choice_content":"Chlorophyll"
              }
            ],
          },
          //Q4
          {
            "q_img": "assets/images/science/sci.png",
            "question":"What part of the skeletal system protects the brain?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Spine"
              },
              {
                "choice_id":"2",
                "choice_content":"Skull"
              },
            ],
          },
          //Q5
          {
            "q_img": "assets/images/science/sci.png",
            "question":"What tissue connects muscles to bones?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Skin"
              },
              {
                "choice_id":"2",
                "choice_content":"Tendon"
              },
            ],
          },
          //Q6
          {
            "q_img": "assets/images/science/sci.png",
            "question":"Which nutrient plays an essential role in muscle-building?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Protein"
              },
              {
                "choice_id":"2",
                "choice_content":"Carbohydrate"
              },
            ],
          },
          //Q7
          {
            "q_img": "assets/images/science/sci.png",
            "question":"Plants need which gas to perform photosynthesis?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Hydrogen"
              },
              {
                "choice_id":"2",
                "choice_content":"Carbon dioxide"
              },
            ],
          },
          //Q8
          {
            "q_img": "assets/images/science/sci.png",
            "question":"Which scientist proposed the three laws of motion?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Isaac Newton"
              },
              {
                "choice_id":"2",
                "choice_content":"Albert Einstein"
              },
            ],
          },
          //Q9
          {
            "q_img": "assets/images/science/sci.png",
            "question":"Albert Einstein",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Hydrosphere"
              },
              {
                "choice_id":"2",
                "choice_content":"Atmosphere"
              },
            ],
          },
          //Q10
          {
            
            "q_img": "assets/images/science/sci.png",
            "question":"Which system of the body controls the senses?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Circulatory system"
              },
              {
                "choice_id":"2",
                "choice_content":"Nervous system"
              },
            ],
          },
          // --
        ]
      },
      // GRADE5
      {
        "difficulty_name":"Grade 5",
        "grade_desc" : "The fifth grade is the fifth and last school year of elementary school in most schools. ... Key English Language Arts Common Core standards for 5th grade students include: Ability to determine the theme of a book, story, or poem from details in the text.",
        "diff-avatar": "assets/images/grade5.png",
        "content":[
          // Q1
          {
            "q_img": "assets/images/science/sci.png",
            "question":"Which is the largest animal on earth?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Shark"
              },
              {
                "choice_id":"2",
                "choice_content":"Elephant"
              },
              {
                "choice_id":"3",
                "choice_content":"Blue whale"
              },
              {
                "choice_id":"4",
                "choice_content":"Giraffe"
              }
            ],
          },
          // Q2
          {
            "q_img": "assets/images/science/sci.png",
            "question":"Similar body cells group together to form a ___.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Organ"
              },
              {
                "choice_id":"2",
                "choice_content":"Tissue"
              },
              {
                "choice_id":"3",
                "choice_content":"Blood vessels"
              },
              {
                "choice_id":"4",
                "choice_content":"Joints"
              }
            ],
          },
          // Q3
          {
            "q_img": "assets/images/science/sci.png",
            "question":"What energy emerges from motion?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Potential energy"
              },
              {
                "choice_id":"2",
                "choice_content":"Electrical energy"
              },
              {
                "choice_id":"3",
                "choice_content":"Kinetic energy"
              },
              {
                "choice_id":"4",
                "choice_content":"Gravitational energy"
              }
            ],
          },
          //Q4
          {
            "q_img": "assets/images/science/sci.png",
            "question":"The standard unit of measurement for energy is ____.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Newton"
              },
              {
                "choice_id":"2",
                "choice_content":"Joule"
              },
            ],
          },
          //Q5
          {
            "q_img": "assets/images/science/sci.png",
            "question":"Which is the strongest sense in a dog?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Hearing"
              },
              {
                "choice_id":"2",
                "choice_content":"Smell"
              },
            ],
          },
          //Q6
          {
            "q_img": "assets/images/science/sci.png",
            "question":"Which biologist proposed the theory of evolution through natural selection?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Stephen Hawking"
              },
              {
                "choice_id":"2",
                "choice_content":"Charles Darwin"
              },
            ],
          },
          //Q7
          {
            "q_img": "assets/images/science/sci.png",
            "question":"“For every action, there is an equal and opposite reaction.”  It is which of Newton’s law of motion?.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"First Law"
              },
              {
                "choice_id":"2",
                "choice_content":"Third Law"
              },
            ],
          },
          //Q8
          {
            "q_img": "assets/images/science/sci.png",
            "question":"Which cell organelle is also called powerhouse of the cell?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Ribosome"
              },
              {
                "choice_id":"2",
                "choice_content":"Mitochondria"
              },
            ],
          },
          //Q9
          {
            "q_img": "assets/images/science/sci.png",
            "question":"The bending of light through a glass prism is called ____.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Reflection"
              },
              {
                "choice_id":"2",
                "choice_content":"Refraction"
              },
            ],
          },
          //Q10
          {
            "q_img": "assets/images/science/sci.png",
            "question":"A lion is most closely related to which of the following animals?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Dog"
              },
              {
                "choice_id":"2",
                "choice_content":"Leopard"
              },
            ],
          },
          // --
        ]
      },
      // GRADE6
      {
        "difficulty_name":"Grade 6",
        "grade_desc" : "Sixth grade is a year of education for students ages 11–12. In many nations, it is the first year of middle school or the last year of elementary school. ",
        "diff-avatar": "assets/images/grade6.png",
        "content":[
          // Q1
          {
            "q_img": "assets/images/science/sci.png",
            "question":"What color is universal indicator in a neutral solution?.",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Green"
              },
              {
                "choice_id":"2",
                "choice_content":"Blue"
              },
              {
                "choice_id":"3",
                "choice_content":"Red"
              },
              {
                "choice_id":"4",
                "choice_content":"Orange"
              }
            ],
          },
          // Q2
          {
            "q_img": "assets/images/science/sci.png",
            "question":"Which of these features protects seaweed from being damaged by powerful waves?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Seaweed's green color"
              },
              {
                "choice_id":"2",
                "choice_content":"Seaweed's toughness and flexibility"
              },
              {
                "choice_id":"3",
                "choice_content":"Seaweed's slimy texture"
              },
              {
                "choice_id":"4",
                "choice_content":"Seaweed's nutritional value"
              }
            ],
          },
          // Q3
          {
            "q_img": "assets/images/science/sci.png",
            "question":"The area in which an organism lives is called ...",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"A habitat."
              },
              {
                "choice_id":"2",
                "choice_content":"A river"
              },
              {
                "choice_id":"3",
                "choice_content":"A wood"
              },
              {
                "choice_id":"4",
                "choice_content":"An environment"
              }
            ],
          },
          //Q4
          {
            "q_img": "assets/images/science/sci.png",
            "question":"These supply the body’s movement abilities.",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Tendons"
              },
              {
                "choice_id":"2",
                "choice_content":"Periosteum"
              },
               {
                "choice_id":"3",
                "choice_content":"Muscles"
              },
              {
                "choice_id":"4",
                "choice_content":"Musculoskeletal system"
              },
            ],
          },
          //Q5
          {
            "q_img": "assets/images/science/sci.png",
            "question":"The ellipsoid joint is more commonly known as the ________.",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Wrist"
              },
              {
                "choice_id":"2",
                "choice_content":"Thumb"
              },

               {
                "choice_id":"3",
                "choice_content":"Ankle"
              },
               {
                "choice_id":"4",
                "choice_content":"Fingers & Toes"
              },
            ],
          },
          //Q6
          {
            "q_img": "assets/images/science/sci.png",
            "question":"The heart is divided into ______.",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"4 chambers"
              },
              {
                "choice_id":"2",
                "choice_content":"4 aortas"
              },
              {
                "choice_id":"3",
                "choice_content":"4 valves"
              },
              {
                "choice_id":"4",
                "choice_content":"4 arteries"
              },
            ],
          },
          //Q7
          {
            "q_img": "assets/images/science/sci.png",
            "question":"White blood cells are also known as _________.",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"leukocytes"
              },
              {
                "choice_id":"2",
                "choice_content":"cytoplasm"
              },
              {
                "choice_id":"3",
                "choice_content":"neutrophils"
              },
              {
                "choice_id":"4",
                "choice_content":"basophils"
              },
            ],
          },
          //Q8
          {
            "q_img": "assets/images/science/sci.png",
            "question":"These are small, rounded masses of lymphatic tissue located in the pharynx and in the passage from the mouth to the pharynx.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Adenoids"
              },
              {
                "choice_id":"2",
                "choice_content":"Tonsils"
              },
                {
                "choice_id":"3",
                "choice_content":"Spleen"
              },
                {
                "choice_id":"4",
                "choice_content":"Glands"
              },
            ],
          },
          //Q9
          {
            "q_img": "assets/images/science/sci.png",
            "question":"The beginning stage of adolescence is known as _____.",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"meiosis"
              },
              {
                "choice_id":"2",
                "choice_content":"menstruation"
              },
              {
                "choice_id":"3",
                "choice_content":"puberty"
              },
            ],
          },
          //Q10
          {
            
            "q_img": "assets/images/science/sci.png",
            "question":"Humans have how many chromosomes?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"27"
              },
              {
                "choice_id":"2",
                "choice_content":"23"
              },
              {
                "choice_id":"3",
                "choice_content":"46"
              },
              {
                "choice_id":"4",
                "choice_content":"36"
              },
            ],
          },
          // --
        ]
      },
    ]
  },
  //History
    {
    "category_name":"History",
    "category_img":"assets/images/history.png",
    "difficulty":[
      // GRADE4
      {
        "difficulty_name":"Grade 4",
        "grade_desc" : "The fourth grade forms the fourth year of Elementary school and children enrolled are typically 9 to 10 years old. Subjects taught include Math, Science, Reading, Writing and Social Studies.",
        "diff-avatar": "assets/images/grade4.png",
        "content":[
          // Q1
          {
            "q_img": "assets/images/histo/his.png",
            "question":"Between what years did the Orang Dampuans come to the Philippines?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Between 600 A.D. and 900 A.D."
              },
              {
                "choice_id":"2",
                "choice_content":"Between 900 A.D. and 1200 A.D."
              },
              {
                "choice_id":"3",
                "choice_content":"Between 700 A.D. and 1200 A.D."
              },
              {
                "choice_id":"4",
                "choice_content":"Between 400 A.D. and 500 A.D."
              }
            ],
          },
          // Q2
          {
            "q_img": "assets/images/histo/his.png",
            "question":"Who was credited with naming the Philippines \"Felipinas\"?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Garcia Jofre de Loasa"
              },
              {
                "choice_id":"2",
                "choice_content":"Ruy Lopez de Villalobos"
              },
              {
                "choice_id":"3",
                "choice_content":"Sebastian Cabot"
              },
              {
                "choice_id":"4",
                "choice_content":"Alvaro de Saavedra"
              }
            ],
          },
          // Q3
          {
            "q_img": "assets/images/histo/his.png",
            "question":"When did Dr. Jose Rizal die?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"December 30, 1896"
              },
              {
                "choice_id":"2",
                "choice_content":"January 20, 1897"
              },
              {
                "choice_id":"3",
                "choice_content":"June 4, 1894"
              },
              {
                "choice_id":"4",
                "choice_content":"May 25, 1900"
              }
            ],
          },
          //Q4
          {
            "q_img": "assets/images/histo/his.png",
            "question":"When was Manuel L. Quezon inaugurated?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"November 14, 1935"
              },
              {
                "choice_id":"2",
                "choice_content":"November 15, 1935"
              },
            ],
          },
          //Q5
          {
            "q_img": "assets/images/histo/his.png",
            "question":"When did Corregidor fall into the hands of the Japanese?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"January 2, 1942"
              },
              {
                "choice_id":"2",
                "choice_content":"May 6, 1942"
              },
            ],
          },
          //Q6
          {
            "q_img": "assets/images/his/his.png",
            "question":"When did the Japanese attack the Philippines?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"December 8, 1941"
              },
              {
                "choice_id":"2",
                "choice_content":"May 6, 1942"
              },
            ],
          },
          //Q7
          {
            "q_img": "assets/images/histo/his.png",
            "question":"When did Bataan fall into the hands of the Japanese?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"January 2, 1942"
              },
              {
                "choice_id":"2",
                "choice_content":"April 9, 1942"
              },
            ],
          },
          //Q8
          {
            "q_img": "assets/images/histo/his.png",
            "question":"Who was the third and last military governor of the Philippines?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"General Elwell Otis"
              },
              {
                "choice_id":"2",
                "choice_content":"General Arthur MacArthur"
              },
            ],
          },
          //Q9
          {
            "q_img": "assets/images/histo/his.png",
            "question":"When did a civilian government replace the military government?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"July 4, 1901"
              },
              {
                "choice_id":"2",
                "choice_content":"August 8, 1901"
              },
            ],
          },
          //Q10
          {
            
            "q_img": "assets/images/science/sci.png",
            "question":"Who proposed the idea of the Philippine Autonomy Act?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Manuel L. Quezon"
              },
              {
                "choice_id":"2",
                "choice_content":"William Atkinson Jones"
              },
            ],
          },
          // --
        ]
      },
      // GRADE5
      {
        "difficulty_name":"Grade 5",
        "grade_desc" : "The fifth grade is the fifth and last school year of elementary school in most schools. ... Key English Language Arts Common Core standards for 5th grade students include: Ability to determine the theme of a book, story, or poem from details in the text.",
        "diff-avatar": "assets/images/grade5.png",
        "content":[
          // Q1
          {
            "q_img": "assets/images/histo/his.png",
            "question":"Who founded the la Liga Filipina?",
            "answer": "3",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Apolinario Mabini"
              },
              {
                "choice_id":"2",
                "choice_content":"Andres Bonifacio"
              },
              {
                "choice_id":"3",
                "choice_content":"Jose Rizal"
              },
              {
                "choice_id":"4",
                "choice_content":"Fidel Ramos"
              }
            ],
          },
          // Q2
          {
            "q_img": "assets/images/histo/his.png",
            "question":"In 1851, the first commercial bank in the Philippines and the far East, was established. What is the present name of this bank?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Bank of the Philippine Islands"
              },
              {
                "choice_id":"2",
                "choice_content":"Bangko De Oro"
              },
              {
                "choice_id":"3",
                "choice_content":"Allied Bank"
              },
              {
                "choice_id":"4",
                "choice_content":"Land Bank of the Philippines"
              }
            ],
          },
          // Q3
          {
            "q_img": "assets/images/histo/his.png",
            "question": "He arrived in Cebu in 1565 to establish the first Spanish settlement in the Philippines, marking the beginning of Spain's colonization and Christianization of the archipelago. Who was he?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Miguel Lopez de Legazpi"
              },
              {
                "choice_id":"2",
                "choice_content":"Magellan"
              },
              {
                "choice_id":"3",
                "choice_content":"Jose Rizal"
              },
              {
                "choice_id":"4",
                "choice_content":"General Mc Arthur"
              }
            ],
          },
          //Q4
          {
            "q_img": "assets/images/histo/his.png",
            "question":"Who was the founder of the KKK?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Emilio Aguinaldo"
              },
              {
                "choice_id":"2",
                "choice_content":"Andres Bonifacio"
              },
            ],
          },
          //Q5
          {
            "q_img": "assets/images/histo/his.png",
            "question":"Considered as the first Philippine hero.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Ferdinand Magellan"
              },
              {
                "choice_id":"2",
                "choice_content":"Lapu-Lapu"
              },
            ],
          },
          //Q6
          {
            "q_img": "assets/images/histo/his.png",
            "question":"What is the timeline of the Philippine-American war?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"February 4, 1899 to July 2, 1902"
              },
              {
                "choice_id":"2",
                "choice_content":"Feb 4, 1819 to July 2, 1831"
              },
            ],
          },
          //Q7
          {
            "q_img": "assets/images/histo/his.png",
            "question":"The first and youngest president of First Philippine Republic? ",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Manuel A. Roxas"
              },
              {
                "choice_id":"2",
                "choice_content":"Emilio Aguinaldo"
              },
            ],
          },
          //Q8
          {
            "q_img": "assets/images/histo/his.png",
            "question":"Davao is known as \"City of Golden Friendship\".",
            "answer": "2",
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
          //Q9
          {
            "q_img": "assets/images/histo/his.png",
            "question":"Katipunan was anchored on the political platform of separating the country from Spain.",
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
            "q_img": "assets/images/histo/his.png",
            "question":"Under the Naic Military Agreement, Bonifacio made it clear that he was organizing an army in support of Aguinaldo's revolutionary forces.",
            "answer": "2",
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
          // --
        ]
      },
      // GRADE6
      {
        "difficulty_name":"Grade 6",
        "grade_desc" : "Sixth grade is a year of education for students ages 11–12. In many nations, it is the first year of middle school or the last year of elementary school. ",
        "diff-avatar": "assets/images/grade6.png",
        "content":[
          // Q1
          {
            "q_img": "assets/images/histo/his.png",
            "question":"Sinong lider ng pinakamatagal na rebelyon?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Jose Rizal"
              },
              {
                "choice_id":"2",
                "choice_content":"Francisco Dagohoy"
              },
              {
                "choice_id":"3",
                "choice_content":"Emilio Aguinaldo"
              },
              {
                "choice_id":"4",
                "choice_content":"Andres Bonifacio"
              }
            ],
          },
          // Q2
          {
            "q_img": "assets/images/histo/his.png",
            "question":"Sino ang ginang ni Ferdinand Marcos?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Imelda Papin"
              },
              {
                "choice_id":"2",
                "choice_content":"Imelda Marcos"
              },
              {
                "choice_id":"3",
                "choice_content":"Imelda Cuanco Marcos"
              },
              {
                "choice_id":"4",
                "choice_content":"Gregoria Marcos"
              }
            ],
          },
          // Q3
          {
            "q_img": "assets/images/histo/his.png",
            "question":"Ang _______ ay makabagong katipunan ng mga kamaradang aktibong umuusig sa prinsipyong pang-pulitika at iba pa.",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"krus"
              },
              {
                "choice_id":"2",
                "choice_content":"arawkrus"
              },
              {
                "choice_id":"3",
                "choice_content":"krusade"
              },
              {
                "choice_id":"4",
                "choice_content":"krusada"
              }
            ],
          },
          //Q4
          {
            "q_img": "assets/images/histo/his.png",
            "question":"Ang tawag sa mga tage rehiyon VII ay Cebuano",
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
          //Q5
          {
            "q_img": "assets/images/histo/his.png",
            "question":"Heneral _______.taga Tacloban ,,dumaong sa red beach,Polo, Leyte ang kanyang grupo.",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"MacArthur"
              },
              {
                "choice_id":"2",
                "choice_content":"Jose"
              },

               {
                "choice_id":"3",
                "choice_content":"Bonefacio"
              },
               {
                "choice_id":"4",
                "choice_content":"Juan"
              },
            ],
          },
          //Q6
          {
            "q_img": "assets/images/histo/his.png",
            "question":"Ilan ang barkong Nakabalik Sa Espanya?",
            "answer": "2",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"4"
              },
              {
                "choice_id":"2",
                "choice_content":"1"
              },
              {
                "choice_id":"3",
                "choice_content":"3"
              },
              {
                "choice_id":"4",
                "choice_content":"2"
              },
            ],
          },
          //Q7
          {
            "q_img": "assets/images/histo/his.png",
            "question":"Anong barko ang nakabalik sa Espanya?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Victoria"
              },
              {
                "choice_id":"2",
                "choice_content":"Espanya"
              },
              {
                "choice_id":"3",
                "choice_content":"Merry"
              },
              {
                "choice_id":"4",
                "choice_content":"Bangka"
              },
            ],
          },
          //Q8
          {
            "q_img": "assets/images/histo/his.png",
            "question":"Anong unang paaralan ng mga kababaihan ang tinatag sa Pilipinas?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Santa potenciana"
              },
              {
                "choice_id":"2",
                "choice_content":"Sana Jose"
              },
                {
                "choice_id":"3",
                "choice_content":"Santa Cruz"
              },
                {
                "choice_id":"4",
                "choice_content":"Santa Claus"
              },
            ],
          },
          //Q9
          {
            "q_img": "assets/images/histo/his.png",
            "question":"Pinakamaliit na isda sa Pilipinas?",
            "answer": "1",
            "choices":[
              {
                "choice_id":"1",
                "choice_content":"Pandaca Pygmea"
              },
              {
                "choice_id":"2",
                "choice_content":"Dilis"
              },
              {
                "choice_id":"3",
                "choice_content":"Bulinaw"
              },
            ],
          },
          //Q10
          {
            
            "q_img": "assets/images/histo/his.png",
            "question":"Sa  San Juan Batangas ba Kilala ang Lambayok/Lambanog Festival?At naririto rin ang mga magagandang binibini na sinasabing pinaglihi ng mga ninuno sa ilang-ilang ?",
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
          // --
        ]
      },
    ]
  },
];