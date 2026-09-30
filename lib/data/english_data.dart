import '../core/app_models.dart';

const List<LetterItem> englishCapital = <LetterItem>[
  LetterItem(glyph: 'A', roman: 'ay', words: <String>['Apple', 'Ant', 'Arm'], hint: '"ay" as in Ay-yo', emoji: '🍎'),
  LetterItem(glyph: 'B', roman: 'bee', words: <String>['Ball', 'Bear', 'Book'], hint: '"bee"', emoji: '⚽'),
  LetterItem(glyph: 'C', roman: 'see', words: <String>['Cat', 'Car', 'Cup'], hint: '"see"', emoji: '🐱'),
  LetterItem(glyph: 'D', roman: 'dee', words: <String>['Dog', 'Door', 'Duck'], hint: '"dee"', emoji: '🐶'),
  LetterItem(glyph: 'E', roman: 'ee', words: <String>['Egg', 'Elephant', 'Ear'], hint: '"ee"', emoji: '🥚'),
  LetterItem(glyph: 'F', roman: 'eff', words: <String>['Fish', 'Fan', 'Fox'], hint: '"eff"', emoji: '🐟'),
  LetterItem(glyph: 'G', roman: 'jee', words: <String>['Goat', 'Girl', 'Grape'], hint: '"jee"', emoji: '🐐'),
  LetterItem(glyph: 'H', roman: 'aitch', words: <String>['Hat', 'Horse', 'House'], hint: '"aitch"', emoji: '🎩'),
  LetterItem(glyph: 'I', roman: 'eye', words: <String>['Ice', 'Igloo', 'India'], hint: '"eye"', emoji: '🧊'),
  LetterItem(glyph: 'J', roman: 'jay', words: <String>['Jug', 'Jam', 'Jacket'], hint: '"jay"', emoji: '🧃'),
  LetterItem(glyph: 'K', roman: 'kay', words: <String>['King', 'Kite', 'Key'], hint: '"kay"', emoji: '🪁'),
  LetterItem(glyph: 'L', roman: 'el', words: <String>['Lion', 'Lamp', 'Leaf'], hint: '"el"', emoji: '🦁'),
  LetterItem(glyph: 'M', roman: 'em', words: <String>['Moon', 'Milk', 'Mango'], hint: '"em"', emoji: '🌙'),
  LetterItem(glyph: 'N', roman: 'en', words: <String>['Nest', 'Nose', 'Name'], hint: '"en"', emoji: '🪹'),
  LetterItem(glyph: 'O', roman: 'oh', words: <String>['Orange', 'Ox', 'Owl'], hint: '"oh"', emoji: '🦉'),
  LetterItem(glyph: 'P', roman: 'pee', words: <String>['Pen', 'Pig', 'Parrot'], hint: '"pee"', emoji: '🐷'),
  LetterItem(glyph: 'Q', roman: 'cue', words: <String>['Queen', 'Quilt', 'Quiz'], hint: '"cue"', emoji: '👑'),
  LetterItem(glyph: 'R', roman: 'ar', words: <String>['Rose', 'Rabbit', 'Ring'], hint: '"ar"', emoji: '🐇'),
  LetterItem(glyph: 'S', roman: 'ess', words: <String>['Sun', 'Snake', 'School'], hint: '"ess"', emoji: '☀️'),
  LetterItem(glyph: 'T', roman: 'tee', words: <String>['Tree', 'Tiger', 'Table'], hint: '"tee"', emoji: '🌳'),
  LetterItem(glyph: 'U', roman: 'you', words: <String>['Umbrella', 'Up', 'Uncle'], hint: '"you"', emoji: '☂️'),
  LetterItem(glyph: 'V', roman: 'vee', words: <String>['Van', 'Violin', 'Village'], hint: '"vee"', emoji: '🎻'),
  LetterItem(glyph: 'W', roman: 'double-you', words: <String>['Water', 'Watch', 'Window'], hint: '"double-you"', emoji: '💧'),
  LetterItem(glyph: 'X', roman: 'eks', words: <String>['Xylophone', 'Box', 'Fox'], hint: '"eks"', emoji: '🎼'),
  LetterItem(glyph: 'Y', roman: 'why', words: <String>['Yo-yo', 'Yellow', 'Yes'], hint: '"why"', emoji: '💛'),
  LetterItem(glyph: 'Z', roman: 'zee', words: <String>['Zebra', 'Zoo', 'Zero'], hint: '"zee"', emoji: '🦓'),
];

const List<LetterItem> englishSmall = <LetterItem>[
  LetterItem(glyph: 'a', roman: 'a', words: <String>['apple', 'ant', 'arm'], hint: 'round mouth, short sound', emoji: '🍎'),
  LetterItem(glyph: 'b', roman: 'b', words: <String>['ball', 'bear', 'book'], hint: 'lips together, then hum', emoji: '⚽'),
  LetterItem(glyph: 'c', roman: 'k', words: <String>['cat', 'car', 'cup'], hint: 'kiss your hand then whisper', emoji: '🐱'),
  LetterItem(glyph: 'd', roman: 'd', words: <String>['dog', 'door', 'duck'], hint: 'tap the tongue on teeth', emoji: '🐶'),
  LetterItem(glyph: 'e', roman: 'e', words: <String>['egg', 'elephant', 'ear'], hint: 'smile and say "eh"', emoji: '🥚'),
  LetterItem(glyph: 'f', roman: 'f', words: <String>['fish', 'fan', 'fox'], hint: 'teeth on lip, blow air', emoji: '🐟'),
  LetterItem(glyph: 'g', roman: 'g', words: <String>['goat', 'girl', 'grape'], hint: 'throat sound, short', emoji: '🐐'),
  LetterItem(glyph: 'h', roman: 'h', words: <String>['hat', 'horse', 'house'], hint: 'just breathe out', emoji: '🎩'),
  LetterItem(glyph: 'i', roman: 'i', words: <String>['ice', 'igloo', 'India'], hint: 'smile wide, short sound', emoji: '🧊'),
  LetterItem(glyph: 'j', roman: 'j', words: <String>['jug', 'jam', 'jacket'], hint: '"juh" with a smile', emoji: '🧃'),
  LetterItem(glyph: 'k', roman: 'k', words: <String>['king', 'kite', 'key'], hint: 'back of the throat', emoji: '🪁'),
  LetterItem(glyph: 'l', roman: 'l', words: <String>['lion', 'lamp', 'leaf'], hint: 'tongue to roof', emoji: '🦁'),
  LetterItem(glyph: 'm', roman: 'm', words: <String>['moon', 'milk', 'mango'], hint: 'lips closed, hum', emoji: '🌙'),
  LetterItem(glyph: 'n', roman: 'n', words: <String>['nest', 'nose', 'name'], hint: 'same as m, but voice on', emoji: '🪹'),
  LetterItem(glyph: 'o', roman: 'o', words: <String>['orange', 'ox', 'owl'], hint: 'big round mouth', emoji: '🦉'),
  LetterItem(glyph: 'p', roman: 'p', words: <String>['pen', 'pig', 'parrot'], hint: 'pop the sound, no hum', emoji: '🐷'),
  LetterItem(glyph: 'q', roman: 'kw', words: <String>['queen', 'quilt', 'quiz'], hint: '"kw" together', emoji: '👑'),
  LetterItem(glyph: 'r', roman: 'r', words: <String>['rose', 'rabbit', 'ring'], hint: 'curl the tongue back', emoji: '🐇'),
  LetterItem(glyph: 's', roman: 's', words: <String>['sun', 'snake', 'school'], hint: 'snake sound "sss"', emoji: '☀️'),
  LetterItem(glyph: 't', roman: 't', words: <String>['tree', 'tiger', 'table'], hint: 'tap tongue behind teeth', emoji: '🌳'),
  LetterItem(glyph: 'u', roman: 'u', words: <String>['umbrella', 'up', 'uncle'], hint: 'small round mouth', emoji: '☂️'),
  LetterItem(glyph: 'v', roman: 'v', words: <String>['van', 'violin', 'village'], hint: 'teeth on lip, voice on', emoji: '🎻'),
  LetterItem(glyph: 'w', roman: 'w', words: <String>['water', 'watch', 'window'], hint: 'round the lips, small', emoji: '💧'),
  LetterItem(glyph: 'x', roman: 'ks', words: <String>['xylophone', 'box', 'fox'], hint: 'k and s together', emoji: '🎼'),
  LetterItem(glyph: 'y', roman: 'y', words: <String>['yo-yo', 'yellow', 'yes'], hint: 'tongue to roof, voice on', emoji: '💛'),
  LetterItem(glyph: 'z', roman: 'z', words: <String>['zebra', 'zoo', 'zero'], hint: 'air over teeth "zzz"', emoji: '🦓'),
];

const List<SoundItem> englishPhonics = <SoundItem>[
  SoundItem(key: 'a', type: 'Short vowel', examples: <String>['cat', 'bat', 'hat', 'map', 'sad'], hint: 'mouth wide open, quick', emoji: '📗'),
  SoundItem(key: 'e', type: 'Short vowel', examples: <String>['pen', 'hen', 'bed', 'ten', 'red'], hint: 'smile a little', emoji: '📘'),
  SoundItem(key: 'i', type: 'Short vowel', examples: <String>['pig', 'big', 'sit', 'win', 'pin'], hint: 'smile wide', emoji: '📙'),
  SoundItem(key: 'o', type: 'Short vowel', examples: <String>['dog', 'log', 'box', 'hot', 'top'], hint: 'round mouth', emoji: '📕'),
  SoundItem(key: 'u', type: 'Short vowel', examples: <String>['sun', 'run', 'bus', 'cup', 'fun'], hint: 'small round lips', emoji: '📓'),

  SoundItem(key: 'a_e', type: 'Magic e (long a)', examples: <String>['cake', 'name', 'game', 'lake', 'tape', 'late'], hint: 'a..e says the letter name A', emoji: '🎂'),
  SoundItem(key: 'e_e', type: 'Magic e (long e)', examples: <String>['these', 'complete', 'scene', 'theme', 'even'], hint: 'e..e says the letter name E', emoji: '🎬'),
  SoundItem(key: 'i_e', type: 'Magic e (long i)', examples: <String>['bike', 'time', 'line', 'kite', 'nine', 'rice'], hint: 'i..e says the letter name I', emoji: '🚲'),
  SoundItem(key: 'o_e', type: 'Magic e (long o)', examples: <String>['note', 'home', 'rose', 'bone', 'nose', 'cone'], hint: 'o..e says the letter name O', emoji: '🌹'),
  SoundItem(key: 'u_e', type: 'Magic e (long u)', examples: <String>['cube', 'cute', 'tube', 'mute', 'flute', 'June'], hint: 'u..e says the letter name U', emoji: '🎵'),

  SoundItem(key: 'sh', type: 'Digraph', examples: <String>['ship', 'fish', 'shop', 'wish', 'shell'], hint: 'quiet "shh"', emoji: '🤫'),
  SoundItem(key: 'ch', type: 'Digraph', examples: <String>['chair', 'lunch', 'chip', 'cheese', 'much'], hint: '"ch" like a train', emoji: '🚂'),
  SoundItem(key: 'th', type: 'Digraph', examples: <String>['three', 'this', 'bath', 'math', 'thin'], hint: 'tongue between teeth', emoji: '🦷'),
  SoundItem(key: 'ck', type: 'Digraph', examples: <String>['duck', 'sock', 'rock', 'back', 'kick'], hint: 'short k after a', emoji: '🪨'),
  SoundItem(key: 'll', type: 'Double letter', examples: <String>['bell', 'hill', 'call', 'full', 'sell'], hint: 'l l together', emoji: '🔔'),
  SoundItem(key: 'ss', type: 'Double letter', examples: <String>['miss', 'class', 'grass', 'dress', 'press'], hint: 's s together', emoji: '🍃'),
  SoundItem(key: 'ff', type: 'Double letter', examples: <String>['coffee', 'off', 'staff', 'buffalo', 'cliff'], hint: 'f f together', emoji: '☕'),
  SoundItem(key: 'zz', type: 'Double letter', examples: <String>['fizz', 'buzz', 'jazz', 'puzzle', 'fuzz'], hint: 'z z together', emoji: '🐝'),
  SoundItem(key: 'tt', type: 'Double letter', examples: <String>['letter', 'butter', 'little', 'bottle', 'kitten'], hint: 't t together', emoji: '✉️'),
  SoundItem(key: 'pp', type: 'Double letter', examples: <String>['apple', 'puppy', 'happy', 'cup', 'map'], hint: 'p p together', emoji: '🐶'),
  SoundItem(key: 'nn', type: 'Double letter', examples: <String>['run', 'fun', 'dinner', 'manner', 'pen'], hint: 'n n together', emoji: '🏃'),
  SoundItem(key: 'mm', type: 'Double letter', examples: <String>['mum', 'summer', 'swim', 'hammer', 'jam'], hint: 'm m together', emoji: '🏊'),
  SoundItem(key: 'ee', type: 'Double letter', examples: <String>['bee', 'tree', 'green', 'sleep', 'feet'], hint: 'e e together', emoji: '🐝'),
  SoundItem(key: 'oo', type: 'Double letter', examples: <String>['book', 'moon', 'food', 'zoo', 'look'], hint: 'long "oo" with round lips', emoji: '🌙'),

  SoundItem(key: 'igh', type: 'Trigraph', examples: <String>['night', 'light', 'right', 'sight', 'bright'], hint: '"eye" sound at the end', emoji: '💡'),
  SoundItem(key: 'ear', type: 'Trigraph', examples: <String>['ear', 'hear', 'near', 'year', 'tear'], hint: 'ear, hear, near', emoji: '👂'),
  SoundItem(key: 'air', type: 'Trigraph', examples: <String>['air', 'chair', 'hair', 'stair', 'fair'], hint: 'air, chair, hair', emoji: '💨'),
  SoundItem(key: 'ure', type: 'Trigraph', examples: <String>['sure', 'cure', 'pure', 'picture', 'future'], hint: 'ends with "er"', emoji: '📷'),
  SoundItem(key: 'tch', type: 'Trigraph', examples: <String>['watch', 'match', 'kitchen', 'catch', 'witch'], hint: 't + ch, short a', emoji: '⌚'),
  SoundItem(key: 'dge', type: 'Trigraph', examples: <String>['bridge', 'edge', 'badge', 'ledge', 'judge'], hint: 'j sound at the end', emoji: '🌉'),

  SoundItem(key: 'ai', type: 'Vowel team', examples: <String>['rain', 'train', 'mail', 'paint', 'wait'], hint: 'long a', emoji: '🌧️'),
  SoundItem(key: 'ay', type: 'Vowel team', examples: <String>['day', 'play', 'say', 'stay', 'May'], hint: 'long a, word ends', emoji: '📅'),
  SoundItem(key: 'ee', type: 'Vowel team', examples: <String>['see', 'tree', 'free', 'three', 'green'], hint: 'long e', emoji: '🌳'),
  SoundItem(key: 'ea', type: 'Vowel team', examples: <String>['eat', 'read', 'seat', 'teach', 'clean'], hint: 'long e', emoji: '🍽️'),
  SoundItem(key: 'ie', type: 'Vowel team', examples: <String>['pie', 'tie', 'lie', 'die', 'kite'], hint: 'long i', emoji: '🥧'),
  SoundItem(key: 'igh', type: 'Vowel team', examples: <String>['high', 'sigh', 'light', 'night', 'right'], hint: 'long i', emoji: '🔼'),
  SoundItem(key: 'oa', type: 'Vowel team', examples: <String>['boat', 'coat', 'road', 'goat', 'boat'], hint: 'long o', emoji: '⛵'),
  SoundItem(key: 'ow', type: 'Vowel team', examples: <String>['cow', 'how', 'now', 'down', 'flower'], hint: 'long o (cow) / ou (now)', emoji: '🐄'),
  SoundItem(key: 'oo', type: 'Vowel team', examples: <String>['food', 'moon', 'room', 'zoo', 'spoon'], hint: 'long oo', emoji: '🥄'),
  SoundItem(key: 'ue', type: 'Vowel team', examples: <String>['blue', 'true', 'clue', 'glue', 'value'], hint: 'long oo', emoji: '🔵'),
  SoundItem(key: 'ou', type: 'Vowel team', examples: <String>['out', 'house', 'mouse', 'cloud', 'about'], hint: 'ou as in "ouch"', emoji: '🏠'),
  SoundItem(key: 'oi', type: 'Vowel team', examples: <String>['coin', 'oil', 'boil', 'join', 'point'], hint: 'oy sound', emoji: '🪙'),
  SoundItem(key: 'oy', type: 'Vowel team', examples: <String>['boy', 'toy', 'joy', 'enjoy', 'ploy'], hint: 'oy sound, word ends', emoji: '🧸'),
  SoundItem(key: 'au', type: 'Vowel team', examples: <String>['august', 'sauce', 'haunt', 'vault', 'fraud'], hint: 'aw sound', emoji: '🔊'),
  SoundItem(key: 'aw', type: 'Vowel team', examples: <String>['saw', 'draw', 'law', 'drawer', 'straw'], hint: 'aw sound', emoji: '🪚'),

  SoundItem(key: 'ar', type: 'R-controlled', examples: <String>['car', 'star', 'farm', 'park', 'hard'], hint: 'r changes the a', emoji: '🚗'),
  SoundItem(key: 'er', type: 'R-controlled', examples: <String>['her', 'bird', 'shirt', 'turn', 'nurse'], hint: 'r changes the e', emoji: '👕'),
  SoundItem(key: 'ir', type: 'R-controlled', examples: <String>['bird', 'girl', 'first', 'skirt', 'thirteen'], hint: 'r changes the i', emoji: '👧'),
  SoundItem(key: 'or', type: 'R-controlled', examples: <String>['for', 'horse', 'corn', 'short', 'morning'], hint: 'r changes the o', emoji: '🐴'),
  SoundItem(key: 'ur', type: 'R-controlled', examples: <String>['nurse', 'turn', 'hurt', 'purple', 'turtle'], hint: 'r changes the u', emoji: '🐢'),

  SoundItem(key: 'kn', type: 'Silent letter', examples: <String>['knee', 'know', 'knife', 'knock', 'kneel'], hint: 'k is silent', emoji: '🦵'),
  SoundItem(key: 'wr', type: 'Silent letter', examples: <String>['write', 'wrong', 'wrist', 'wrap', 'wreck'], hint: 'w is silent', emoji: '✍️'),
  SoundItem(key: 'mb', type: 'Silent letter', examples: <String>['comb', 'lamb', 'climb', 'thumb', 'bomb'], hint: 'b is silent', emoji: '🐑'),
  SoundItem(key: 'gh', type: 'Silent letter', examples: <String>['night', 'light', 'high', 'through', 'daughter'], hint: 'gh is silent', emoji: '🌃'),
  SoundItem(key: 'gn', type: 'Silent letter', examples: <String>['gnome', 'gnat', 'gnaw', 'design', 'sign'], hint: 'g is silent', emoji: '🧙'),
];

const List<String> englishSightWords = <String>[
  'I', 'you', 'he', 'she', 'it', 'we', 'they',
  'the', 'a', 'an', 'and', 'but', 'in', 'on', 'at',
  'to', 'for', 'of', 'with', 'my', 'your', 'his', 'her',
  'is', 'am', 'are', 'was', 'were', 'be', 'been', 'being',
  'have', 'has', 'had', 'do', 'does', 'did', 'will', 'would',
  'can', 'could', 'should', 'may', 'might', 'must', 'shall',
  'this', 'that', 'these', 'those', 'there', 'here', 'where',
  'when', 'why', 'how', 'what', 'who', 'which', 'if', 'so',
  'not', 'no', 'yes', 'up', 'down', 'out', 'about', 'into',
  'over', 'under', 'again', 'then', 'than', 'some', 'very',
  'said', 'was', 'were', 'been', 'have', 'them', 'they',
  'one', 'two', 'three', 'like', 'little', 'down', 'now',
];

const Map<String, List<WordItem>> englishWordGroups = <String, List<WordItem>>{
  '1-2 letters': <WordItem>[
    WordItem('I', 'me', sentence: 'I am happy.', emoji: '🙋'
    WordItem('am', 'is', sentence: 'I am here.', emoji: '✅'
    WordItem('an', 'one', sentence: 'This is an apple.', emoji: '🍎'
    WordItem('as', 'like', sentence: 'He runs as fast.', emoji: '🏃'
    WordItem('at', 'on', sentence: 'Look at me.', emoji: '👁️'
    WordItem('be', 'to be', sentence: 'I will be there.', emoji: '🧩'
    WordItem('by', 'near', sentence: 'Come by here.', emoji: '📍'
    WordItem('do', 'to do', sentence: 'I do my work.', emoji: '🛠️'
    WordItem('go', 'to go', sentence: 'Let us go.', emoji: '🚶'
    WordItem('he', 'he', sentence: 'He is my friend.', emoji: '👦'
    WordItem('if', 'if', sentence: 'If you work, you win.', emoji: '🔀'
    WordItem('in', 'inside', sentence: 'I am in the room.', emoji: '📦'
    WordItem('is', 'is', sentence: 'This is my book.', emoji: '📘'
    WordItem('it', 'it', sentence: 'It is a cat.', emoji: '🐱'
    WordItem('me', 'me', sentence: 'Tell me the truth.', emoji: '🗣️'
    WordItem('my', 'my', sentence: 'My name is Ram.', emoji: '📛'
    WordItem('no', 'not', sentence: 'No, I am busy.', emoji: '🚫'
    WordItem('of', 'of', sentence: 'A cup of tea.', emoji: '☕'
    WordItem('on', 'on', sentence: 'Book on the desk.', emoji: '🔝'
    WordItem('or', 'or', sentence: 'Tea or coffee?', emoji: '🔀'
    WordItem('so', 'so', sentence: 'It is so cold.', emoji: '🥶'
    WordItem('to', 'to', sentence: 'Go to school.', emoji: '🏫'
    WordItem('up', 'up', sentence: 'Look up!', emoji: '⬆️'
    WordItem('us', 'us', sentence: 'Come with us.', emoji: '👥'
    WordItem('we', 'we', sentence: 'We are friends.', emoji: '🤝'
    WordItem('so', 'so', sentence: 'So, let us start.', emoji: '🎬'
  ],
  '3-4 letters': <WordItem>[
    WordItem('cat', 'a small animal', sentence: 'The cat is black.', emoji: '🐈'
    WordItem('dog', 'an animal that barks', sentence: 'My dog is happy.', emoji: '🐕'
    WordItem('sun', 'the star that gives light', sentence: 'The sun is hot.', emoji: '☀️'
    WordItem('moon', 'the night light', sentence: 'The moon is round.', emoji: '🌙'
    WordItem('tree', 'a tall plant', sentence: 'The tree is tall.', emoji: '🌳'
    WordItem('bird', 'an animal that flies', sentence: 'A bird is singing.', emoji: '🐦'
    WordItem('fish', 'an animal that swims in water', sentence: 'The fish swims.', emoji: '🐟'
    WordItem('milk', 'a white drink from a cow', sentence: 'I drink milk.', emoji: '🥛'
    WordItem('rice', 'a grain we eat', sentence: 'We eat rice.', emoji: '🍚'
    WordItem('book', 'we read it', sentence: 'This book is good.', emoji: '📕'
    WordItem('door', 'we enter through it', sentence: 'Close the door.', emoji: '🚪'
    WordItem('hand', 'we hold with it', sentence: 'Wash your hand.', emoji: '✋'
    WordItem('home', 'our house', sentence: 'I go home.', emoji: '🏠'
    WordItem('name', 'what we are called', sentence: 'My name is Asha.', emoji: '🏷️'
    WordItem('rain', 'water falling from clouds', sentence: 'The rain is coming.', emoji: '🌧️'
    WordItem('road', 'we walk on it', sentence: 'Cross the road.', emoji: '🛣️'
    WordItem('song', 'music we sing', sentence: 'I like this song.', emoji: '🎵'
    WordItem('water', 'we drink it', sentence: 'Water is life.', emoji: '💧'
    WordItem('happy', 'feeling good', sentence: 'I am happy today.', emoji: '😄'
    WordItem('good', 'of fine quality', sentence: 'You are good.', emoji: '👍'
  ],
  '5-6 letters': <WordItem>[
    WordItem('apple', 'a red or green fruit', sentence: 'The apple is red.', emoji: '🍎'
    WordItem('table', 'furniture with a flat top', sentence: 'The book is on the table.', emoji: '🪑'
    WordItem('chair', 'we sit on it', sentence: 'Sit on the chair.', emoji: '🪑'
    WordItem('tiger', 'a big wild cat', sentence: 'The tiger is strong.', emoji: '🐯'
    WordItem('horse', 'an animal we ride', sentence: 'The horse runs fast.', emoji: '🐴'
    WordItem('sheep', 'a farm animal that gives wool', sentence: 'The sheep is white.', emoji: '🐑'
    WordItem('bread', 'food made from flour', sentence: 'I eat bread.', emoji: '🍞'
    WordItem('sugar', 'the sweet white thing', sentence: 'Do not add sugar.', emoji: '🍬'
    WordItem('flower', 'a colorful plant part', sentence: 'The flower is beautiful.', emoji: '🌸'
    WordItem('mother', 'our female parent', sentence: 'My mother cooks well.', emoji: '👩'
    WordItem('father', 'our male parent', sentence: 'My father works hard.', emoji: '👨'
    WordItem('sister', 'our female sibling', sentence: 'My sister is kind.', emoji: '👧'
    WordItem('brother', 'our male sibling', sentence: 'My brother is tall.', emoji: '👦'
    WordItem('school', 'where we learn', sentence: 'I go to school.', emoji: '🏫'
    WordItem('India', 'our country', sentence: 'India is my country.', emoji: '🇮🇳'
    WordItem('friend', 'a person we like', sentence: 'He is my friend.', emoji: '🤝'
    WordItem('happy', 'feeling good', sentence: 'We are happy.', emoji: '😊'
    WordItem('morning', 'early part of the day', sentence: 'Good morning!', emoji: '🌅'
    WordItem('evening', 'after sunset', sentence: 'Good evening!', emoji: '🌆'
    WordItem('question', 'something we ask', sentence: 'May I ask a question?', emoji: '❓'
  ],
  '7-10 letters': <WordItem>[
    WordItem('elephant', 'a very big animal', sentence: 'The elephant is very big.', emoji: '🐘'
    WordItem('butterfly', 'an insect with big wings', sentence: 'A butterfly is pretty.', emoji: '🦋'
    WordItem('grandmother', 'our mother's mother', sentence: 'My grandmother tells stories.', emoji: '👵'
    WordItem('grandfather', 'our father's father', sentence: 'My grandfather reads the paper.', emoji: '👴'
    WordItem('beautiful', 'very nice to look at', sentence: 'What a beautiful day!', emoji: '🌈'
    WordItem('different', 'not the same', sentence: 'We are different.', emoji: '🔀'
    WordItem('together', 'with each other', sentence: 'Let us work together.', emoji: '🤝'
    WordItem('important', 'matters a lot', sentence: 'This is important.', emoji: '❗'
    WordItem('yesterday', 'the day before today', sentence: 'I came yesterday.', emoji: '📅'
    WordItem('tomorrow', 'the day after today', sentence: 'See you tomorrow.', emoji: '⏭️'
    WordItem('breakfast', 'first meal of the day', sentence: 'I eat breakfast at eight.', emoji: '🍳'
    WordItem('newspaper', 'printed news daily', sentence: 'My father reads a newspaper.', emoji: '📰'
    WordItem('telephone', 'a phone', sentence: 'The telephone is ringing.', emoji: '📞'
    WordItem('happiness', 'feeling of joy', sentence: 'Happiness is free.', emoji: '😄'
    WordItem('beautiful', 'very nice to look at', sentence: 'Her smile is beautiful.', emoji: '😊'
  ],
};

const List<String> englishSentences = <String>[
  'I am a boy.',
  'You are a girl.',
  'He is my father.',
  'She is my mother.',
  'It is a cat.',
  'We are friends.',
  'They are happy.',
  'This is my book.',
  'That is a red ball.',
  'I go to school.',
  'She reads a book.',
  'The sun is bright.',
  'The dog is running.',
  'I like mangoes.',
  'She likes apples.',
  'Do you like tea?',
  'Yes, I do.',
  'No, I do not.',
  'What is your name?',
  'My name is Ravi.',
  'How are you?',
  'I am fine, thank you.',
  'Where is the school?',
  'It is near the park.',
  'How old are you?',
  'I am eight years old.',
  'It is raining today.',
  'Please close the window.',
  'Sit down, please.',
  'Stand up, please.',
  'Come here, please.',
  'Go home now.',
  'The cat is under the table.',
  'My mother is in the kitchen.',
  'We read books every day.',
  'Birds fly in the sky.',
  'Fish swim in the water.',
  'I want to become a teacher.',
  'Knowledge is power.',
  'Practice makes a man perfect.',
  'Honesty is the best policy.',
  'Time and tide wait for none.',
  'Hard work never goes unpaid.',
  'A friend in need is a friend indeed.',
  'Better late than never.',
  'The early bird catches the worm.',
  'Actions speak louder than words.',
  'United we stand, divided we fall.',
  'Every cloud has a silver lining.',
  'Where there is a will, there is a way.',
];

const List<LessonBlock> englishGrammar = <LessonBlock>[
  LessonBlock('Noun', 'A naming word — person, place, thing, animal, idea.', example: 'Ram, Delhi, book, dog, love', emoji: '🏷️'),
  LessonBlock('Proper Noun', 'The special name of a person or place. Always capital.', example: 'Ravi, India, Monday', emoji: '📛'),
  LessonBlock('Common Noun', 'A general name, written small.', example: 'boy, city, river', emoji: '📦'),
  LessonBlock('Collective Noun', 'A name for a group.', example: 'team, class, herd of cows, bunch of keys', emoji: '👥'),
  LessonBlock('Pronoun', 'A word used in place of a noun.', example: 'I, you, he, she, it, we, they', emoji: '👤'),
  LessonBlock('Adjective', 'A word that describes a noun.', example: 'a tall boy, a red bag', emoji: '🎨'),
  LessonBlock('Article', 'A, an, the.', example: 'a cat / an apple / the sun', emoji: '🔤'),
  LessonBlock('Verb', 'A word that shows action or being.', example: 'run, eat, is, was, become', emoji: '🏃'),
  LessonBlock('Adverb', 'A word that describes a verb, adjective or another adverb.', example: 'He runs fast. She sings beautifully.', emoji: '💨'),
  LessonBlock('Preposition', 'A word that shows the place, time or direction.', example: 'in, on, at, under, between, since', emoji: '📍'),
  LessonBlock('Conjunction', 'A word that joins two sentences or words.', example: 'and, but, or, because, although', emoji: '🔗'),
  LessonBlock('Interjection', 'A word that shows strong feeling.', example: 'Oh! Ah! Hurrah! Alas!', emoji: '❗'),
  LessonBlock('Present Tense', 'Happening now or always.', example: 'I play. She plays. We play.', emoji: '⏰'),
  LessonBlock('Past Tense', 'Happened before.', example: 'I played. He went. They ate.', emoji: '⏪'),
  LessonBlock('Future Tense', 'Going to happen.', example: 'I will play. She will come.', emoji: '⏩'),
  LessonBlock('Voice', 'Active (the doer) and Passive (the action).', example: 'Ravi wrote a letter. A letter was written by Ravi.', emoji: '🔊'),
  LessonBlock('Narration', 'Telling events: direct and indirect speech.', example: 'He said, "I am fine." -> He said that he was fine.', emoji: '💬'),
  LessonBlock('Punctuation', 'Marks that make meaning clear.', example: '. , ? ! : ; - " \' ( )', emoji: '.,!?'),
  LessonBlock('Synonyms', 'Words with similar meanings.', example: 'big = large, happy = glad', emoji: '🔁'),
  LessonBlock('Antonyms', 'Words with opposite meanings.', example: 'hot = cold, up = down', emoji: '↔️'),
  LessonBlock('Idioms', 'Phrases with a hidden meaning.', example: 'Let the cat out of the bag.', emoji: '🎭'),
  LessonBlock('Essay', 'A short piece of writing on a topic.', example: 'My Village', emoji: '📄'),
  LessonBlock('Letter', 'Formal and informal letters.', example: 'Dear Sir / Dear Ramesh, Regards.', emoji: '✉️'),
];

const Map<String, List<WordItem>> englishDaily = <String, List<WordItem>>{
  'Greetings': <WordItem>[
    WordItem('Hello', '', sentence: 'Hello, how are you?', emoji: '👋'
    WordItem('Hi', '', sentence: 'Hi, Ram!', emoji: '🙋'
    WordItem('Good morning', '', sentence: 'Good morning, sir.', emoji: '🌅'
    WordItem('Good afternoon', '', sentence: 'Good afternoon!', emoji: '🌞'
    WordItem('Good evening', '', sentence: 'Good evening, all.', emoji: '🌆'
    WordItem('Good night', '', sentence: 'Good night, sleep well.', emoji: '🌙'
    WordItem('Goodbye', '', sentence: 'Goodbye, see you.', emoji: '👋'
    WordItem('Welcome', '', sentence: 'Welcome to our school.', emoji: '🤗'
    WordItem('Farewell', '', sentence: 'Farewell, my friend.', emoji: '🧳'
  ],
  'Politeness': <WordItem>[
    WordItem('Please', '', sentence: 'Please sit down.', emoji: '🙏'
    WordItem('Thank you', '', sentence: 'Thank you very much.', emoji: '💐'
    WordItem('Sorry', '', sentence: 'Sorry, I am late.', emoji: '😅'
    WordItem('Excuse me', '', sentence: 'Excuse me, may I pass?', emoji: '🙇'
    WordItem('You are welcome', '', sentence: 'You are welcome.', emoji: '😊'
    WordItem('May I', '', sentence: 'May I come in?', emoji: '❓'
    WordItem('After you', '', sentence: 'After you, please.', emoji: '🚪'
    WordItem('Never mind', '', sentence: 'Never mind, it is fine.', emoji: '👌'
  ],
  'Questions': <WordItem>[
    WordItem('What', '', sentence: 'What is your name?', emoji: '❓'
    WordItem('Who', '', sentence: 'Who is that man?', emoji: '🧑'
    WordItem('Where', '', sentence: 'Where do you live?', emoji: '📍'
    WordItem('When', '', sentence: 'When do you come?', emoji: '⏰'
    WordItem('Why', '', sentence: 'Why are you sad?', emoji: '❔'
    WordItem('How', '', sentence: 'How are you?', emoji: '🤔'
    WordItem('Which', '', sentence: 'Which one do you like?', emoji: '🔀'
    WordItem('Whose', '', sentence: 'Whose bag is this?', emoji: '🎒'
  ],
  'Answers': <WordItem>[
    WordItem('Yes', '', sentence: 'Yes, I can do it.', emoji: '✅'
    WordItem('No', '', sentence: 'No, I cannot.', emoji: '❌'
    WordItem('Maybe', '', sentence: 'Maybe I will come.', emoji: '🤷'
    WordItem('I do not know', '', sentence: 'I do not know.', emoji: '❓'
    WordItem('I think so', '', sentence: 'I think so.', emoji: '💭'
    WordItem('Of course', '', sentence: 'Of course, I will help.', emoji: '👍'
    WordItem('Certainly', '', sentence: 'Certainly, sir.', emoji: '🎖️'
  ],
  'Family': <WordItem>[
    WordItem('Family', '', sentence: 'My family is small.', emoji: '👨‍👩‍👧'
    WordItem('Father', '', sentence: 'My father is a farmer.', emoji: '👨'
    WordItem('Mother', '', sentence: 'My mother is a teacher.', emoji: '👩'
    WordItem('Brother', '', sentence: 'My brother is ten.', emoji: '👦'
    WordItem('Sister', '', sentence: 'My sister is six.', emoji: '👧'
    WordItem('Grandfather', '', sentence: 'Grandfather reads the newspaper.', emoji: '👴'
    WordItem('Grandmother', '', sentence: 'Grandmother tells me stories.', emoji: '👵'
    WordItem('Uncle', '', sentence: 'My uncle lives in Delhi.', emoji: '🧔'
    WordItem('Aunt', '', sentence: 'My aunt is kind.', emoji: '👩‍🦰'
  ],
  'Food': <WordItem>[
    WordItem('Water', '', sentence: 'Drink water every day.', emoji: '💧'
    WordItem('Bread', '', sentence: 'I eat bread for breakfast.', emoji: '🍞'
    WordItem('Rice', '', sentence: 'Rice is our main food.', emoji: '🍚'
    WordItem('Milk', '', sentence: 'Milk is good for health.', emoji: '🥛'
    WordItem('Fruit', '', sentence: 'Eat fruit every day.', emoji: '🍎'
    WordItem('Vegetable', '', sentence: 'Vegetables keep us strong.', emoji: '🥦'
    WordItem('Tea', '', sentence: 'My father drinks tea.', emoji: '🍵'
    WordItem('Lunch', '', sentence: 'Lunch is at one o\'clock.', emoji: '🍱'
    WordItem('Dinner', '', sentence: 'We eat dinner together.', emoji: '🍽️'
  ],
  'Numbers and Days': <WordItem>[
    WordItem('Monday', '', sentence: 'Monday is the first day.', emoji: '1️⃣'
    WordItem('Tuesday', '', sentence: 'Tuesday is busy.', emoji: '2️⃣'
    WordItem('Wednesday', '', sentence: 'Wednesday is here.', emoji: '3️⃣'
    WordItem('Thursday', '', sentence: 'Thursday is almost Friday.', emoji: '4️⃣'
    WordItem('Friday', '', sentence: 'Friday is my favourite day.', emoji: '5️⃣'
    WordItem('Saturday', '', sentence: 'Saturday is a holiday.', emoji: '6️⃣'
    WordItem('Sunday', '', sentence: 'Sunday is a rest day.', emoji: '7️⃣'
    WordItem('January', '', sentence: 'January is the first month.', emoji: '🗓️'
    WordItem('Month', '', sentence: 'A month has many days.', emoji: '📅'
    WordItem('Year', '', sentence: 'A year has twelve months.', emoji: '🎊'
  ],
  'Colours and Shapes': <WordItem>[
    WordItem('Red', '', sentence: 'The rose is red.', emoji: '🔴'
    WordItem('Blue', '', sentence: 'The sky is blue.', emoji: '🔵'
    WordItem('Green', '', sentence: 'The leaf is green.', emoji: '🟢'
    WordItem('Yellow', '', sentence: 'The banana is yellow.', emoji: '🟡'
    WordItem('White', '', sentence: 'Milk is white.', emoji: '⚪'
    WordItem('Black', '', sentence: 'Night is black.', emoji: '⚫'
    WordItem('Circle', '', sentence: 'Draw a circle.', emoji: '⭕'
    WordItem('Square', '', sentence: 'This is a square.', emoji: '🟦'
    WordItem('Triangle', '', sentence: 'A triangle has three sides.', emoji: '🔺'
    WordItem('Rectangle', '', sentence: 'The door is a rectangle.', emoji: '▭'
  ],
};
