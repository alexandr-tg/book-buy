-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 20 2020 г., 02:27
-- Версия сервера: 5.6.43
-- Версия PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bookbuy`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(4, 'Computers'),
(5, 'Cooking'),
(6, 'Education'),
(1, 'fiction'),
(7, 'Health'),
(8, 'Mathematics'),
(9, 'Medical'),
(2, 'non_fiction'),
(3, 'other'),
(10, 'Reference'),
(11, 'Science');

-- --------------------------------------------------------

--
-- Структура таблицы `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `maincat`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `maincat` (
`id` int(11)
,`title` varchar(45)
,`image` varchar(100)
,`price` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT 'order in progress',
  `create_time` datetime NOT NULL,
  `ship_address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sum` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `status`, `create_time`, `ship_address`, `sum`) VALUES
(154, 58, 'order in progress', '2020-02-19 16:25:12', '', 222),
(155, 58, 'order in progress', '2020-02-19 18:49:59', '', 122),
(156, 58, 'order in progress', '2020-02-19 18:51:16', '', 122);

-- --------------------------------------------------------

--
-- Структура таблицы `order_products`
--

CREATE TABLE `order_products` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spec` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `quantity` int(10) UNSIGNED NOT NULL,
  `visible` bit(1) DEFAULT b'1',
  `price` int(10) UNSIGNED NOT NULL,
  `subcategories_id` int(11) NOT NULL,
  `sold` int(11) DEFAULT '0',
  `descrip` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `title`, `spec`, `image`, `quantity`, `visible`, `price`, `subcategories_id`, `sold`, `descrip`) VALUES
(137, 'A Killer\'s Wife', 'Print Length: 362 pages /Publisher: Thomas & Mercer (March 1, 2020) /Publication Date: March 1, 2020', '5e4db523367d7.jpeg', 99, b'1', 16, 1, 0, 'We all have an ex we regret—but Jessica Yardley’s ex-husband, Eddie, is everyone’s nightmare. Finding out your husband is a murderer isn’t something you ever get over.\r\n\r\nAs an attorney, Jessica has spent years fighting injustice for others and making sure she and her daughter still have the safest and best life possible. But when a copycat killer mimicking Eddie’s MO enters the scene, Jessica knows law enforcement may not be able to catch him. Forced to confront her fears and the only source who truly understands the murderer, she visits her ex-husband. But doing so puts her and her daughter’s lives at risk...Eddie has his own agenda for the family he claims he never stopped loving.\r\n\r\nSometimes to find the answer, you need the help of your worst enemy. Now not only must Jessica stop a serial killer on the loose, she must also protect her daughter and herself from one behind bars. A Killer’s Wife is a chilling tale with twists and turns I didn’t see coming. It’s a thriller that stays with you long after the last page.'),
(139, '12 Rules for Life: An Antidote to Chaos', 'Publisher: Random House Canada / Version: Unabridged / Language: English', '5e4db779503ed.jpeg', 99, b'1', 15, 11, 0, 'What does everyone in the modern world need to know? Renowned psychologist Jordan B. Peterson\'s answer to this most difficult of questions uniquely combines the hard-won truths of ancient tradition with the stunning revelations of cutting-edge scientific research.  Humorous, surprising, and informative, Dr. Peterson tells us why skateboarding boys and girls must be left alone, what terrible fate awaits those who criticize too easily, and why you should always pet a cat when you meet one on the street.  What does the nervous system of the lowly lobster have to tell us about standing up straight (with our shoulders back) and about success in life? Why did ancient Egyptians worship the capacity to pay careful attention as the highest of gods? What dreadful paths do people tread when they become resentful, arrogant, and vengeful? Dr. Peterson journeys broadly, discussing discipline, freedom, adventure, and responsibility, distilling the world\'s wisdom into 12 practical and profound rules for life. 12 Rules for Life shatters the modern commonplaces of science, faith, and human nature while transforming and ennobling the mind and spirit of its listeners.'),
(140, 'Harry Potter and the Order of the Phoenix', 'Print Length: 412 pages /Publisher: Pottermore Publishing (December 8, 2015) /Publication Date: December 8, 2015 /Language: English', '5e4db92491ef0.jpeg', 18, b'1', 13, 24, 0, '\'You are sharing the Dark Lord\'s thoughts and emotions. The Headmaster thinks it inadvisable for this to continue. He wishes me to teach you how to close your mind to the Dark Lord.\'  Dark times have come to Hogwarts. After the Dementors\' attack on his cousin Dudley, Harry Potter knows that Voldemort will stop at nothing to find him. There are many who deny the Dark Lord\'s return, but Harry is not alone: a secret order gathers at Grimmauld Place to fight against the Dark forces. Harry must allow Professor Snape to teach him how to protect himself from Voldemort\'s savage assaults on his mind. But they are growing stronger by the day and Harry is running out of time ...'),
(141, 'Where the Crawdads Sing', 'Print Length: 379 pages /Publisher: G.P. Putnam\'s Sons (August 14, 2018) /Publication Date: August 14, 2018 /Sold by: Penguin Group (USA) LLC /Language: English', '5e4db9dae563d.jpeg', 22, b'1', 10, 8, 0, 'For years, rumors of the \"Marsh Girl\" have haunted Barkley Cove, a quiet town on the North Carolina coast. So in late 1969, when handsome Chase Andrews is found dead, the locals immediately suspect Kya Clark, the so-called Marsh Girl. But Kya is not what they say. Sensitive and intelligent, she has survived for years alone in the marsh that she calls home, finding friends in the gulls and lessons in the sand. Then the time comes when she yearns to be touched and loved. When two young men from town become intrigued by her wild beauty, Kya opens herself to a new life--until the unthinkable happens.  Where the Crawdads Sing is at once an exquisite ode to the natural world, a heartbreaking coming-of-age story, and a surprising tale of possible murder. Owens reminds us that we are forever shaped by the children we once were, and that we are all subject to the beautiful and violent secrets that nature keeps.'),
(143, 'The Giver of Stars: A Novel', 'Print Length: 399 pages /Publisher: Pamela Dorman Books (October 8, 2019) /Publication Date: October 8, 2019 /Sold by: Penguin Group (USA) LLC /Language: English', '5e4dbaedb3b07.jpeg', 45, b'1', 19, 8, 0, 'Alice Wright marries handsome American Bennett Van Cleve hoping to escape her stifling life in England. But small-town Kentucky quickly proves equally claustrophobic, especially living alongside her overbearing father-in-law. So when a call goes out for a team of women to deliver books as part of Eleanor Roosevelt’s new traveling library, Alice signs on enthusiastically. The leader, and soon Alice\'s greatest ally, is Margery, a smart-talking, self-sufficient woman who\'s never asked a man\'s permission for anything. They will be joined by three other singular women who become known as the Packhorse Librarians of Kentucky. What happens to them--and to the men they love--becomes an unforgettable drama of loyalty, justice, humanity and passion. These heroic women refuse to be cowed by men or by convention. And though they face all kinds of dangers in a landscape that is at times breathtakingly beautiful, at others brutal, they’re committed to their job: bringing books to people who have never had any, arming them with facts that will change their lives. Based on a true story rooted in America’s past, The Giver of Stars is unparalleled in its scope and epic in its storytelling. Funny, heartbreaking, enthralling, it is destined to become a modern classic--a richly rewarding novel of women’s friendship, of true love, and of what happens when we reach beyond our grasp for the great beyond.'),
(144, 'Valkyrie (Expeditionary Force Book 9)', 'Print Length: 570 pages Simultaneous Device Usage: Unlimited /Publication Date: December 19, 2019 /Language: English', '5e4dbb95f0e69.jpeg', 23, b'1', 12, 2, 0, 'After saving the world many times, the Merry Band of Pirates have accepted the inevitable: Earth is doomed. All they can do is try to bring a few thousand people to safety, before vicious aliens arrive to destroy humanity\'s homeworld. No. There is one other thing they can do: hit the enemy so hard that the aliens will regret they ever heard of humans.'),
(145, 'Golden in Death: An Eve Dallas Novel', 'Print Length: 377 pages /Publisher: St. Martin\'s Press (February 4, 2020)/ Publication Date: February 4, 2020 /Sold by: Macmillan /Language: English', '5e4dbc17f0c02.jpeg', 34, b'1', 14, 4, 0, 'In the latest thriller in the #1 New York Times bestselling series, homicide detective Eve Dallas investigates a murder with a mysterious motive—and a terrifying weapon.  Pediatrician Kent Abner received the package on a beautiful April morning. Inside was a cheap trinket, a golden egg that could be opened into two halves. When he pried it apart, highly toxic airborne fumes entered his body—and killed him.  After Eve Dallas calls the hazmat team—and undergoes testing to reassure both her and her husband that she hasn’t been exposed—it’s time to look into Dr. Abner’s past and relationships. Not every victim Eve encounters is an angel, but it seems that Abner came pretty close—though he did ruffle some feathers over the years by taking stands for the weak and defenseless. While the lab tries to identify the deadly toxin, Eve hunts for the sender. But when someone else dies in the same grisly manner, it becomes clear that she’s dealing with either a madman—or someone who has a hidden and elusive connection to both victims.'),
(146, 'American Dirt', 'Print Length: 387 pages /Publisher: Flatiron Books (January 21, 2020) /Publication Date: January 21, 2020 /Sold by: Amazon.com Services LLC /Language: English', '5e4dbcb2ccb68.jpeg', 22, b'1', 13, 8, 0, 'Lydia Quixano Pérez lives in the Mexican city of Acapulco. She runs a bookstore. She has a son, Luca, the love of her life, and a wonderful husband who is a journalist. And while there are cracks beginning to show in Acapulco because of the drug cartels, her life is, by and large, fairly comfortable.  Even though she knows they’ll never sell, Lydia stocks some of her all-time favorite books in her store. And then one day a man enters the shop to browse and comes up to the register with a few books he would like to buy—two of them her favorites. Javier is erudite. He is charming. And, unbeknownst to Lydia, he is the jefe of the newest drug cartel that has gruesomely taken over the city. When Lydia’s husband’s tell-all profile of Javier is published, none of their lives will ever be the same.  Forced to flee, Lydia and eight-year-old Luca soon find themselves miles and worlds away from their comfortable middle-class existence. Instantly transformed into migrants, Lydia and Luca ride la bestia—trains that make their way north toward the United States, which is the only place Javier’s reach doesn’t extend. As they join the countless people trying to reach el norte, Lydia soon sees that everyone is running from something. But what exactly are they running to?  American Dirt will leave readers utterly changed. It is a literary achievement filled with poignancy, drama, and humanity on every page. It is one of the most important books for our times.  Already being hailed as \"a Grapes of Wrath for our times\" and \"a new American classic,\" Jeanine Cummins\'s American Dirt is a rare exploration into the inner hearts of people willing to sacrifice everything for a glimmer of hope.'),
(147, 'Last Day', 'Print Length: 402 pages /Publisher: Thomas & Mercer (February 1, 2020) /Publication Date: February 1, 2020 /Sold by: Amazon.com Services LLC /Language: English', '5e4dbd0bb14de.jpeg', 22, b'1', 15, 4, 0, 'Years ago, Beth Lathrop and her sister Kate suffered what they thought would be the worst tragedy of their lives the night both the famous painting Moonlight and their mother were taken. The detective assigned to the case, Conor Reid, swore to protect the sisters from then on.  Beth moved on, throwing herself fully into the art world, running the family gallery, and raising a beautiful daughter with her husband Pete. Kate, instead, retreated into herself and took to the skies as a pilot, always on the run. When Beth is found strangled in her home, and Moonlight goes missing again, Detective Reid can’t help but feel a sense of déjà vu.  Reid immediately suspects Beth’s husband, whose affair is a poorly kept secret. He has an airtight alibi—but he also has a motive, and the evidence seems to point to him. Kate and Reid, along with the sisters’ closest childhood friends, struggle to make sense of Beth’s death, but they only find more questions: Who else would have wanted Beth dead? What’s the significance of Moonlight?  Twenty years ago, Reid vowed to protect Beth and Kate—and he’s failed. Now solving the case is turning into an obsession . . .'),
(148, 'The Guardians: A Novel', 'Print Length: 371 pages /Publisher: Doubleday (October 15, 2019) /Publication Date: October 15, 2019 /Sold by: Random House LLC /Language: English', '5e4dbe753db1f.jpeg', 11, b'1', 19, 4, 0, 'In the small Florida town of Seabrook, a young lawyer named Keith Russo was shot dead at his desk as he worked late one night. The killer left no clues. There were no witnesses, no one with a motive. But the police soon came to suspect Quincy Miller, a young black man who was once a client of Russo’s.   Quincy was tried, convicted, and sent to prison for life. For twenty-two years he languished in prison, maintaining his innocence.  But no one was listening.  He had no lawyer, no advocate on the outside. In desperation, he writes a letter to Guardian Ministries, a small nonprofit run by Cullen Post, a lawyer who is also an Episcopal minister.  Guardian accepts only a few innocence cases at a time.  Cullen Post travels the country fighting wrongful convictions and taking on clients forgotten by the system. With Quincy Miller, though, he gets far more than he bargained for. Powerful, ruthless people murdered Keith Russo, and they do not want Quincy Miller exonerated.  They killed one lawyer twenty-two years ago, and they will kill another without a second thought.'),
(149, 'The Last Wish: Introducing the Witcher', 'Print Length: 353 pages /Publisher: Orbit (December 2, 2008) /Publication Date: December 14, 2008 /Sold by: Hachette Book Group /Language: English', '5e4dbedf6c2e6.jpeg', 44, b'1', 16, 2, 0, 'Geralt the Witcher -- revered and hated -- holds the line against the monsters plaguing humanity in this collection of adventures in the NYT bestselling series that inspired the blockbuster video games. Geralt is a Witcher, a man whose magic powers, enhanced by long training and a mysterious elixir, have made him a brilliant fighter and a merciless assassin. Yet he is no ordinary murderer: his targets are the multifarious monsters and vile fiends that ravage the land and attack the innocent. But not everything monstrous-looking is evil and not everything fair is good...and in every fairy tale there is a grain of truth. Andrzej Sapkowski, winner of the World Fantasy Lifetime Achievement award, started an international phenomenon with his Witcher series. The Last Wish short story collection is the perfect introduction to this one of a kind fantasy world.  Witcher collectionsThe Last WishSword of Destiny Witcher novelsBlood of Elves The Time of Contempt Baptism of Fire The Tower of SwallowsLady of the LakeSeason of Storms The Malady and Other Stories: An Andrzej Sapkowski Sampler (e-only)  Translated from original Polish by Danusia Stok'),
(150, 'A Very Stable Genius: Donald J. Trump\'s Testi', 'Print Length: 480 pages /Publisher: Penguin Press (January 21, 2020) /Publication Date: January 21, 2020 /Sold by: Amazon.com Services LLC /Language: English', '5e4dbf8c0943d.jpeg', 33, b'1', 14, 28, 0, 'Washington Post national investigative reporter Carol Leonnig and White House bureau chief Philip Rucker, both Pulitzer Prize winners, provide the definitive insider narrative of Donald Trump\'s unique presidency with shocking new reporting and insight into its implications.  “I alone can fix it.” So went Donald J. Trump’s march to the presidency on July 21, 2016, when he accepted the Republican presidential nomination in Cleveland, promising to restore what he described as a fallen nation. Yet over the subsequent years, as he has undertaken the actual work of the commander in chief, it has been hard to see beyond the daily chaos of scandal, investigation, and constant bluster. It would be all too easy to mistake Trump’s first term for one of pure and uninhibited chaos, but there were patterns to his behavior and that of his associates. The universal value of the Trump administration is loyalty - not to the country, but to the president himself - and Trump’s North Star has been the perpetuation of his own power, even when it meant imperiling our shaky and mistrustful democracy.  Leonnig and Rucker, with deep and unmatched sources throughout Washington, D.C., tell of rages and frenzies but also moments of courage and perseverance. Relying on scores of exclusive new interviews with some of the most senior members of the Trump administration and other firsthand witnesses, the authors reveal the forty-fifth president up close, taking readers inside Robert Mueller’s Russia investigation as well as the president’s own haphazard but ultimately successful legal defense. Here for the first time certain officials who have felt honor-bound not to publicly criticize a sitting president or to divulge what they witnessed in a position of trust tell the truth for the benefit of history.  This peerless and gripping narrative reveals President Trump at his most unvarnished and exposes how decision making in his administration has been driven by a reflexive logic of self-preservation and self-aggrandizement - but a logic nonetheless. This is the story of how an unparalleled president has scrambled to survive and tested the strength of America’s democracy and its common heart as a nation.'),
(151, 'A Very Stable Genius: Donald J. Trump\'s Testi', 'Print Length: 480 pages /Publisher: Penguin Press (January 21, 2020) /Publication Date: January 21, 2020 /Sold by: Amazon.com Services LLC /Language: English', '5e4dbf8c0943d.jpeg', 33, b'1', 14, 28, 0, 'Washington Post national investigative reporter Carol Leonnig and White House bureau chief Philip Rucker, both Pulitzer Prize winners, provide the definitive insider narrative of Donald Trump\'s unique presidency with shocking new reporting and insight into its implications.  “I alone can fix it.” So went Donald J. Trump’s march to the presidency on July 21, 2016, when he accepted the Republican presidential nomination in Cleveland, promising to restore what he described as a fallen nation. Yet over the subsequent years, as he has undertaken the actual work of the commander in chief, it has been hard to see beyond the daily chaos of scandal, investigation, and constant bluster. It would be all too easy to mistake Trump’s first term for one of pure and uninhibited chaos, but there were patterns to his behavior and that of his associates. The universal value of the Trump administration is loyalty - not to the country, but to the president himself - and Trump’s North Star has been the perpetuation of his own power, even when it meant imperiling our shaky and mistrustful democracy.  Leonnig and Rucker, with deep and unmatched sources throughout Washington, D.C., tell of rages and frenzies but also moments of courage and perseverance. Relying on scores of exclusive new interviews with some of the most senior members of the Trump administration and other firsthand witnesses, the authors reveal the forty-fifth president up close, taking readers inside Robert Mueller’s Russia investigation as well as the president’s own haphazard but ultimately successful legal defense. Here for the first time certain officials who have felt honor-bound not to publicly criticize a sitting president or to divulge what they witnessed in a position of trust tell the truth for the benefit of history.  This peerless and gripping narrative reveals President Trump at his most unvarnished and exposes how decision making in his administration has been driven by a reflexive logic of self-preservation and self-aggrandizement - but a logic nonetheless. This is the story of how an unparalleled president has scrambled to survive and tested the strength of America’s democracy and its common heart as a nation.'),
(152, 'A Killer\'s Wife', 'Print Length: 362 pages /Publisher: Thomas & Mercer (March 1, 2020) /Publication Date: March 1, 2020', '5e4db523367d7.jpeg', 99, b'1', 16, 1, 0, 'We all have an ex we regret—but Jessica Yardley’s ex-husband, Eddie, is everyone’s nightmare. Finding out your husband is a murderer isn’t something you ever get over.\r\n\r\nAs an attorney, Jessica has spent years fighting injustice for others and making sure she and her daughter still have the safest and best life possible. But when a copycat killer mimicking Eddie’s MO enters the scene, Jessica knows law enforcement may not be able to catch him. Forced to confront her fears and the only source who truly understands the murderer, she visits her ex-husband. But doing so puts her and her daughter’s lives at risk...Eddie has his own agenda for the family he claims he never stopped loving.\r\n\r\nSometimes to find the answer, you need the help of your worst enemy. Now not only must Jessica stop a serial killer on the loose, she must also protect her daughter and herself from one behind bars. A Killer’s Wife is a chilling tale with twists and turns I didn’t see coming. It’s a thriller that stays with you long after the last page.'),
(153, '12 Rules for Life: An Antidote to Chaos', 'Publisher: Random House Canada / Version: Unabridged / Language: English', '5e4db779503ed.jpeg', 99, b'1', 15, 11, 0, 'What does everyone in the modern world need to know? Renowned psychologist Jordan B. Peterson\'s answer to this most difficult of questions uniquely combines the hard-won truths of ancient tradition with the stunning revelations of cutting-edge scientific research.  Humorous, surprising, and informative, Dr. Peterson tells us why skateboarding boys and girls must be left alone, what terrible fate awaits those who criticize too easily, and why you should always pet a cat when you meet one on the street.  What does the nervous system of the lowly lobster have to tell us about standing up straight (with our shoulders back) and about success in life? Why did ancient Egyptians worship the capacity to pay careful attention as the highest of gods? What dreadful paths do people tread when they become resentful, arrogant, and vengeful? Dr. Peterson journeys broadly, discussing discipline, freedom, adventure, and responsibility, distilling the world\'s wisdom into 12 practical and profound rules for life. 12 Rules for Life shatters the modern commonplaces of science, faith, and human nature while transforming and ennobling the mind and spirit of its listeners.'),
(154, 'Harry Potter and the Order of the Phoenix', 'Print Length: 412 pages /Publisher: Pottermore Publishing (December 8, 2015) /Publication Date: December 8, 2015 /Language: English', '5e4db92491ef0.jpeg', 18, b'1', 13, 24, 0, '\'You are sharing the Dark Lord\'s thoughts and emotions. The Headmaster thinks it inadvisable for this to continue. He wishes me to teach you how to close your mind to the Dark Lord.\'  Dark times have come to Hogwarts. After the Dementors\' attack on his cousin Dudley, Harry Potter knows that Voldemort will stop at nothing to find him. There are many who deny the Dark Lord\'s return, but Harry is not alone: a secret order gathers at Grimmauld Place to fight against the Dark forces. Harry must allow Professor Snape to teach him how to protect himself from Voldemort\'s savage assaults on his mind. But they are growing stronger by the day and Harry is running out of time ...'),
(155, 'Where the Crawdads Sing', 'Print Length: 379 pages /Publisher: G.P. Putnam\'s Sons (August 14, 2018) /Publication Date: August 14, 2018 /Sold by: Penguin Group (USA) LLC /Language: English', '5e4db9dae563d.jpeg', 22, b'1', 10, 8, 0, 'For years, rumors of the \"Marsh Girl\" have haunted Barkley Cove, a quiet town on the North Carolina coast. So in late 1969, when handsome Chase Andrews is found dead, the locals immediately suspect Kya Clark, the so-called Marsh Girl. But Kya is not what they say. Sensitive and intelligent, she has survived for years alone in the marsh that she calls home, finding friends in the gulls and lessons in the sand. Then the time comes when she yearns to be touched and loved. When two young men from town become intrigued by her wild beauty, Kya opens herself to a new life--until the unthinkable happens.  Where the Crawdads Sing is at once an exquisite ode to the natural world, a heartbreaking coming-of-age story, and a surprising tale of possible murder. Owens reminds us that we are forever shaped by the children we once were, and that we are all subject to the beautiful and violent secrets that nature keeps.'),
(156, 'The Giver of Stars: A Novel', 'Print Length: 399 pages /Publisher: Pamela Dorman Books (October 8, 2019) /Publication Date: October 8, 2019 /Sold by: Penguin Group (USA) LLC /Language: English', '5e4dbaedb3b07.jpeg', 45, b'1', 19, 8, 0, 'Alice Wright marries handsome American Bennett Van Cleve hoping to escape her stifling life in England. But small-town Kentucky quickly proves equally claustrophobic, especially living alongside her overbearing father-in-law. So when a call goes out for a team of women to deliver books as part of Eleanor Roosevelt’s new traveling library, Alice signs on enthusiastically. The leader, and soon Alice\'s greatest ally, is Margery, a smart-talking, self-sufficient woman who\'s never asked a man\'s permission for anything. They will be joined by three other singular women who become known as the Packhorse Librarians of Kentucky. What happens to them--and to the men they love--becomes an unforgettable drama of loyalty, justice, humanity and passion. These heroic women refuse to be cowed by men or by convention. And though they face all kinds of dangers in a landscape that is at times breathtakingly beautiful, at others brutal, they’re committed to their job: bringing books to people who have never had any, arming them with facts that will change their lives. Based on a true story rooted in America’s past, The Giver of Stars is unparalleled in its scope and epic in its storytelling. Funny, heartbreaking, enthralling, it is destined to become a modern classic--a richly rewarding novel of women’s friendship, of true love, and of what happens when we reach beyond our grasp for the great beyond.'),
(157, 'Valkyrie (Expeditionary Force Book 9)', 'Print Length: 570 pages Simultaneous Device Usage: Unlimited /Publication Date: December 19, 2019 /Language: English', '5e4dbb95f0e69.jpeg', 23, b'1', 12, 2, 0, 'After saving the world many times, the Merry Band of Pirates have accepted the inevitable: Earth is doomed. All they can do is try to bring a few thousand people to safety, before vicious aliens arrive to destroy humanity\'s homeworld. No. There is one other thing they can do: hit the enemy so hard that the aliens will regret they ever heard of humans.'),
(158, 'Golden in Death: An Eve Dallas Novel', 'Print Length: 377 pages /Publisher: St. Martin\'s Press (February 4, 2020)/ Publication Date: February 4, 2020 /Sold by: Macmillan /Language: English', '5e4dbc17f0c02.jpeg', 34, b'1', 14, 4, 0, 'In the latest thriller in the #1 New York Times bestselling series, homicide detective Eve Dallas investigates a murder with a mysterious motive—and a terrifying weapon.  Pediatrician Kent Abner received the package on a beautiful April morning. Inside was a cheap trinket, a golden egg that could be opened into two halves. When he pried it apart, highly toxic airborne fumes entered his body—and killed him.  After Eve Dallas calls the hazmat team—and undergoes testing to reassure both her and her husband that she hasn’t been exposed—it’s time to look into Dr. Abner’s past and relationships. Not every victim Eve encounters is an angel, but it seems that Abner came pretty close—though he did ruffle some feathers over the years by taking stands for the weak and defenseless. While the lab tries to identify the deadly toxin, Eve hunts for the sender. But when someone else dies in the same grisly manner, it becomes clear that she’s dealing with either a madman—or someone who has a hidden and elusive connection to both victims.'),
(159, 'American Dirt', 'Print Length: 387 pages /Publisher: Flatiron Books (January 21, 2020) /Publication Date: January 21, 2020 /Sold by: Amazon.com Services LLC /Language: English', '5e4dbcb2ccb68.jpeg', 22, b'1', 13, 8, 0, 'Lydia Quixano Pérez lives in the Mexican city of Acapulco. She runs a bookstore. She has a son, Luca, the love of her life, and a wonderful husband who is a journalist. And while there are cracks beginning to show in Acapulco because of the drug cartels, her life is, by and large, fairly comfortable.  Even though she knows they’ll never sell, Lydia stocks some of her all-time favorite books in her store. And then one day a man enters the shop to browse and comes up to the register with a few books he would like to buy—two of them her favorites. Javier is erudite. He is charming. And, unbeknownst to Lydia, he is the jefe of the newest drug cartel that has gruesomely taken over the city. When Lydia’s husband’s tell-all profile of Javier is published, none of their lives will ever be the same.  Forced to flee, Lydia and eight-year-old Luca soon find themselves miles and worlds away from their comfortable middle-class existence. Instantly transformed into migrants, Lydia and Luca ride la bestia—trains that make their way north toward the United States, which is the only place Javier’s reach doesn’t extend. As they join the countless people trying to reach el norte, Lydia soon sees that everyone is running from something. But what exactly are they running to?  American Dirt will leave readers utterly changed. It is a literary achievement filled with poignancy, drama, and humanity on every page. It is one of the most important books for our times.  Already being hailed as \"a Grapes of Wrath for our times\" and \"a new American classic,\" Jeanine Cummins\'s American Dirt is a rare exploration into the inner hearts of people willing to sacrifice everything for a glimmer of hope.'),
(160, 'Last Day', 'Print Length: 402 pages /Publisher: Thomas & Mercer (February 1, 2020) /Publication Date: February 1, 2020 /Sold by: Amazon.com Services LLC /Language: English', '5e4dbd0bb14de.jpeg', 22, b'1', 15, 4, 0, 'Years ago, Beth Lathrop and her sister Kate suffered what they thought would be the worst tragedy of their lives the night both the famous painting Moonlight and their mother were taken. The detective assigned to the case, Conor Reid, swore to protect the sisters from then on.  Beth moved on, throwing herself fully into the art world, running the family gallery, and raising a beautiful daughter with her husband Pete. Kate, instead, retreated into herself and took to the skies as a pilot, always on the run. When Beth is found strangled in her home, and Moonlight goes missing again, Detective Reid can’t help but feel a sense of déjà vu.  Reid immediately suspects Beth’s husband, whose affair is a poorly kept secret. He has an airtight alibi—but he also has a motive, and the evidence seems to point to him. Kate and Reid, along with the sisters’ closest childhood friends, struggle to make sense of Beth’s death, but they only find more questions: Who else would have wanted Beth dead? What’s the significance of Moonlight?  Twenty years ago, Reid vowed to protect Beth and Kate—and he’s failed. Now solving the case is turning into an obsession . . .'),
(161, 'The Guardians: A Novel', 'Print Length: 371 pages /Publisher: Doubleday (October 15, 2019) /Publication Date: October 15, 2019 /Sold by: Random House LLC /Language: English', '5e4dbe753db1f.jpeg', 11, b'1', 19, 4, 0, 'In the small Florida town of Seabrook, a young lawyer named Keith Russo was shot dead at his desk as he worked late one night. The killer left no clues. There were no witnesses, no one with a motive. But the police soon came to suspect Quincy Miller, a young black man who was once a client of Russo’s.   Quincy was tried, convicted, and sent to prison for life. For twenty-two years he languished in prison, maintaining his innocence.  But no one was listening.  He had no lawyer, no advocate on the outside. In desperation, he writes a letter to Guardian Ministries, a small nonprofit run by Cullen Post, a lawyer who is also an Episcopal minister.  Guardian accepts only a few innocence cases at a time.  Cullen Post travels the country fighting wrongful convictions and taking on clients forgotten by the system. With Quincy Miller, though, he gets far more than he bargained for. Powerful, ruthless people murdered Keith Russo, and they do not want Quincy Miller exonerated.  They killed one lawyer twenty-two years ago, and they will kill another without a second thought.'),
(162, 'The Last Wish: Introducing the Witcher', 'Print Length: 353 pages /Publisher: Orbit (December 2, 2008) /Publication Date: December 14, 2008 /Sold by: Hachette Book Group /Language: English', '5e4dbedf6c2e6.jpeg', 44, b'1', 16, 2, 0, 'Geralt the Witcher -- revered and hated -- holds the line against the monsters plaguing humanity in this collection of adventures in the NYT bestselling series that inspired the blockbuster video games. Geralt is a Witcher, a man whose magic powers, enhanced by long training and a mysterious elixir, have made him a brilliant fighter and a merciless assassin. Yet he is no ordinary murderer: his targets are the multifarious monsters and vile fiends that ravage the land and attack the innocent. But not everything monstrous-looking is evil and not everything fair is good...and in every fairy tale there is a grain of truth. Andrzej Sapkowski, winner of the World Fantasy Lifetime Achievement award, started an international phenomenon with his Witcher series. The Last Wish short story collection is the perfect introduction to this one of a kind fantasy world.  Witcher collectionsThe Last WishSword of Destiny Witcher novelsBlood of Elves The Time of Contempt Baptism of Fire The Tower of SwallowsLady of the LakeSeason of Storms The Malady and Other Stories: An Andrzej Sapkowski Sampler (e-only)  Translated from original Polish by Danusia Stok'),
(163, 'A Very Stable Genius: Donald J. Trump\'s Testi', 'Print Length: 480 pages /Publisher: Penguin Press (January 21, 2020) /Publication Date: January 21, 2020 /Sold by: Amazon.com Services LLC /Language: English', '5e4dbf8c0943d.jpeg', 33, b'1', 14, 28, 0, 'Washington Post national investigative reporter Carol Leonnig and White House bureau chief Philip Rucker, both Pulitzer Prize winners, provide the definitive insider narrative of Donald Trump\'s unique presidency with shocking new reporting and insight into its implications.  “I alone can fix it.” So went Donald J. Trump’s march to the presidency on July 21, 2016, when he accepted the Republican presidential nomination in Cleveland, promising to restore what he described as a fallen nation. Yet over the subsequent years, as he has undertaken the actual work of the commander in chief, it has been hard to see beyond the daily chaos of scandal, investigation, and constant bluster. It would be all too easy to mistake Trump’s first term for one of pure and uninhibited chaos, but there were patterns to his behavior and that of his associates. The universal value of the Trump administration is loyalty - not to the country, but to the president himself - and Trump’s North Star has been the perpetuation of his own power, even when it meant imperiling our shaky and mistrustful democracy.  Leonnig and Rucker, with deep and unmatched sources throughout Washington, D.C., tell of rages and frenzies but also moments of courage and perseverance. Relying on scores of exclusive new interviews with some of the most senior members of the Trump administration and other firsthand witnesses, the authors reveal the forty-fifth president up close, taking readers inside Robert Mueller’s Russia investigation as well as the president’s own haphazard but ultimately successful legal defense. Here for the first time certain officials who have felt honor-bound not to publicly criticize a sitting president or to divulge what they witnessed in a position of trust tell the truth for the benefit of history.  This peerless and gripping narrative reveals President Trump at his most unvarnished and exposes how decision making in his administration has been driven by a reflexive logic of self-preservation and self-aggrandizement - but a logic nonetheless. This is the story of how an unparalleled president has scrambled to survive and tested the strength of America’s democracy and its common heart as a nation.'),
(164, 'A Very Stable Genius: Donald J. Trump\'s Testi', 'Print Length: 480 pages /Publisher: Penguin Press (January 21, 2020) /Publication Date: January 21, 2020 /Sold by: Amazon.com Services LLC /Language: English', '5e4dbf8c0943d.jpeg', 33, b'1', 14, 28, 0, 'Washington Post national investigative reporter Carol Leonnig and White House bureau chief Philip Rucker, both Pulitzer Prize winners, provide the definitive insider narrative of Donald Trump\'s unique presidency with shocking new reporting and insight into its implications.  “I alone can fix it.” So went Donald J. Trump’s march to the presidency on July 21, 2016, when he accepted the Republican presidential nomination in Cleveland, promising to restore what he described as a fallen nation. Yet over the subsequent years, as he has undertaken the actual work of the commander in chief, it has been hard to see beyond the daily chaos of scandal, investigation, and constant bluster. It would be all too easy to mistake Trump’s first term for one of pure and uninhibited chaos, but there were patterns to his behavior and that of his associates. The universal value of the Trump administration is loyalty - not to the country, but to the president himself - and Trump’s North Star has been the perpetuation of his own power, even when it meant imperiling our shaky and mistrustful democracy.  Leonnig and Rucker, with deep and unmatched sources throughout Washington, D.C., tell of rages and frenzies but also moments of courage and perseverance. Relying on scores of exclusive new interviews with some of the most senior members of the Trump administration and other firsthand witnesses, the authors reveal the forty-fifth president up close, taking readers inside Robert Mueller’s Russia investigation as well as the president’s own haphazard but ultimately successful legal defense. Here for the first time certain officials who have felt honor-bound not to publicly criticize a sitting president or to divulge what they witnessed in a position of trust tell the truth for the benefit of history.  This peerless and gripping narrative reveals President Trump at his most unvarnished and exposes how decision making in his administration has been driven by a reflexive logic of self-preservation and self-aggrandizement - but a logic nonetheless. This is the story of how an unparalleled president has scrambled to survive and tested the strength of America’s democracy and its common heart as a nation.'),
(165, 'Hire Me If You Can', 'Print Length: 362 pages /Publisher: Thomas & Mercer (March 1, 2020) /Publication Date: March 1, 2020', '5e4dc24846dc8.jpeg', 23, b'1', 3, 11, 3, 'We all have an ex we regret—but Jessica Yardley’s ex-husband, Eddie, is everyone’s nightmare. Finding out your husband is a murderer isn’t something you ever get over. As an attorney, Jessica has spent years fighting injustice for others and making sure she and her daughter still have the safest and best life possible. But when a copycat killer mimicking Eddie’s MO enters the scene, Jessica knows law enforcement may not be able to catch him. Forced to confront her fears and the only source who truly understands the murderer, she visits her ex-husband. But doing so puts her and her daughter’s lives at risk...Eddie has his own agenda for the family he claims he never stopped loving. Sometimes to find the answer, you need the help of your worst enemy. Now not only must Jessica stop a serial killer on the loose, she must also protect her daughter and herself from one behind bars. A Killer’s Wife is a chilling tale with twists and turns I didn’t see coming. It’s a thriller that stays with you long after the last page.'),
(166, 'A Very Stable Genius: Donald J. Trump\'s Testi', 'Print Length: 480 pages /Publisher: Penguin Press (January 21, 2020) /Publication Date: January 21, 2020 /Sold by: Amazon.com Services LLC /Language: English', '5e4dbf8c0943d.jpeg', 33, b'1', 14, 28, 0, 'Washington Post national investigative reporter Carol Leonnig and White House bureau chief Philip Rucker, both Pulitzer Prize winners, provide the definitive insider narrative of Donald Trump\'s unique presidency with shocking new reporting and insight into its implications.  “I alone can fix it.” So went Donald J. Trump’s march to the presidency on July 21, 2016, when he accepted the Republican presidential nomination in Cleveland, promising to restore what he described as a fallen nation. Yet over the subsequent years, as he has undertaken the actual work of the commander in chief, it has been hard to see beyond the daily chaos of scandal, investigation, and constant bluster. It would be all too easy to mistake Trump’s first term for one of pure and uninhibited chaos, but there were patterns to his behavior and that of his associates. The universal value of the Trump administration is loyalty - not to the country, but to the president himself - and Trump’s North Star has been the perpetuation of his own power, even when it meant imperiling our shaky and mistrustful democracy.  Leonnig and Rucker, with deep and unmatched sources throughout Washington, D.C., tell of rages and frenzies but also moments of courage and perseverance. Relying on scores of exclusive new interviews with some of the most senior members of the Trump administration and other firsthand witnesses, the authors reveal the forty-fifth president up close, taking readers inside Robert Mueller’s Russia investigation as well as the president’s own haphazard but ultimately successful legal defense. Here for the first time certain officials who have felt honor-bound not to publicly criticize a sitting president or to divulge what they witnessed in a position of trust tell the truth for the benefit of history.  This peerless and gripping narrative reveals President Trump at his most unvarnished and exposes how decision making in his administration has been driven by a reflexive logic of self-preservation and self-aggrandizement - but a logic nonetheless. This is the story of how an unparalleled president has scrambled to survive and tested the strength of America’s democracy and its common heart as a nation.'),
(167, 'Hire Me If You Can', 'Print Length: 362 pages /Publisher: Thomas & Mercer (March 1, 2020) /Publication Date: March 1, 2020', '5e4dc24846dc8.jpeg', 23, b'1', 3, 11, 3, 'We all have an ex we regret—but Jessica Yardley’s ex-husband, Eddie, is everyone’s nightmare. Finding out your husband is a murderer isn’t something you ever get over. As an attorney, Jessica has spent years fighting injustice for others and making sure she and her daughter still have the safest and best life possible. But when a copycat killer mimicking Eddie’s MO enters the scene, Jessica knows law enforcement may not be able to catch him. Forced to confront her fears and the only source who truly understands the murderer, she visits her ex-husband. But doing so puts her and her daughter’s lives at risk...Eddie has his own agenda for the family he claims he never stopped loving. Sometimes to find the answer, you need the help of your worst enemy. Now not only must Jessica stop a serial killer on the loose, she must also protect her daughter and herself from one behind bars. A Killer’s Wife is a chilling tale with twists and turns I didn’t see coming. It’s a thriller that stays with you long after the last page.'),
(168, 'Hire Me If You Can', 'Print Length: 362 pages /Publisher: Thomas & Mercer (March 1, 2020) /Publication Date: March 1, 2020', '5e4dc24846dc8.jpeg', 23, b'1', 3, 11, 3, 'We all have an ex we regret—but Jessica Yardley’s ex-husband, Eddie, is everyone’s nightmare. Finding out your husband is a murderer isn’t something you ever get over. As an attorney, Jessica has spent years fighting injustice for others and making sure she and her daughter still have the safest and best life possible. But when a copycat killer mimicking Eddie’s MO enters the scene, Jessica knows law enforcement may not be able to catch him. Forced to confront her fears and the only source who truly understands the murderer, she visits her ex-husband. But doing so puts her and her daughter’s lives at risk...Eddie has his own agenda for the family he claims he never stopped loving. Sometimes to find the answer, you need the help of your worst enemy. Now not only must Jessica stop a serial killer on the loose, she must also protect her daughter and herself from one behind bars. A Killer’s Wife is a chilling tale with twists and turns I didn’t see coming. It’s a thriller that stays with you long after the last page.'),
(169, 'Hire Me If You Can', 'Print Length: 362 pages /Publisher: Thomas & Mercer (March 1, 2020) /Publication Date: March 1, 2020', '5e4dc24846dc8.jpeg', 23, b'1', 3, 11, 3, 'We all have an ex we regret—but Jessica Yardley’s ex-husband, Eddie, is everyone’s nightmare. Finding out your husband is a murderer isn’t something you ever get over. As an attorney, Jessica has spent years fighting injustice for others and making sure she and her daughter still have the safest and best life possible. But when a copycat killer mimicking Eddie’s MO enters the scene, Jessica knows law enforcement may not be able to catch him. Forced to confront her fears and the only source who truly understands the murderer, she visits her ex-husband. But doing so puts her and her daughter’s lives at risk...Eddie has his own agenda for the family he claims he never stopped loving. Sometimes to find the answer, you need the help of your worst enemy. Now not only must Jessica stop a serial killer on the loose, she must also protect her daughter and herself from one behind bars. A Killer’s Wife is a chilling tale with twists and turns I didn’t see coming. It’s a thriller that stays with you long after the last page.'),
(170, 'Hire Me If You Can', 'Print Length: 362 pages /Publisher: Thomas & Mercer (March 1, 2020) /Publication Date: March 1, 2020', '5e4dc24846dc8.jpeg', 23, b'1', 3, 11, 3, 'We all have an ex we regret—but Jessica Yardley’s ex-husband, Eddie, is everyone’s nightmare. Finding out your husband is a murderer isn’t something you ever get over. As an attorney, Jessica has spent years fighting injustice for others and making sure she and her daughter still have the safest and best life possible. But when a copycat killer mimicking Eddie’s MO enters the scene, Jessica knows law enforcement may not be able to catch him. Forced to confront her fears and the only source who truly understands the murderer, she visits her ex-husband. But doing so puts her and her daughter’s lives at risk...Eddie has his own agenda for the family he claims he never stopped loving. Sometimes to find the answer, you need the help of your worst enemy. Now not only must Jessica stop a serial killer on the loose, she must also protect her daughter and herself from one behind bars. A Killer’s Wife is a chilling tale with twists and turns I didn’t see coming. It’s a thriller that stays with you long after the last page.'),
(171, 'Hire Me If You Can', 'Print Length: 362 pages /Publisher: Thomas & Mercer (March 1, 2020) /Publication Date: March 1, 2020', '5e4dc24846dc8.jpeg', 23, b'1', 3, 11, 0, 'We all have an ex we regret—but Jessica Yardley’s ex-husband, Eddie, is everyone’s nightmare. Finding out your husband is a murderer isn’t something you ever get over. As an attorney, Jessica has spent years fighting injustice for others and making sure she and her daughter still have the safest and best life possible. But when a copycat killer mimicking Eddie’s MO enters the scene, Jessica knows law enforcement may not be able to catch him. Forced to confront her fears and the only source who truly understands the murderer, she visits her ex-husband. But doing so puts her and her daughter’s lives at risk...Eddie has his own agenda for the family he claims he never stopped loving. Sometimes to find the answer, you need the help of your worst enemy. Now not only must Jessica stop a serial killer on the loose, she must also protect her daughter and herself from one behind bars. A Killer’s Wife is a chilling tale with twists and turns I didn’t see coming. It’s a thriller that stays with you long after the last page.');

-- --------------------------------------------------------

--
-- Структура таблицы `product_review`
--

CREATE TABLE `product_review` (
  `id` int(11) NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `subcategoris`
--

CREATE TABLE `subcategoris` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `subcategoris`
--

INSERT INTO `subcategoris` (`id`, `name`, `categories_id`) VALUES
(1, 'Crime', 1),
(2, 'Science Fiction', 1),
(3, 'Fantasy', 1),
(4, 'Mystery', 1),
(5, 'Romance', 1),
(6, 'Horror', 1),
(7, 'Poetry', 1),
(8, 'Literature', 1),
(9, 'Comic', 2),
(10, 'Cook', 2),
(11, 'Psychology', 2),
(12, 'Medical', 2),
(13, 'Art', 2),
(14, 'Photography', 2),
(15, 'Law', 2),
(16, 'History', 2),
(17, 'Business', 2),
(18, 'Computer', 2),
(19, 'Baby', 3),
(20, 'Sex', 3),
(21, 'Travel', 3),
(22, 'Science', 3),
(23, 'Sports', 3),
(24, 'Children', 1),
(28, 'Biography', 2),
(29, 'Diaries Letters Journals', 3),
(30, 'Memoirs', 2),
(31, 'True Stories', 2),
(32, 'Generic Exams', 3),
(33, 'GK Titles', 3),
(34, 'Medical Entrance', 3),
(35, 'Other Entrance Exams', 3),
(36, 'PG Entrance Examinations', 3),
(37, 'Self-help Titles', 2),
(38, 'Sociology', 2),
(39, 'Academic and Reference', 2),
(40, 'Business Trade', 2),
(41, 'Engineering and Computer Science', 2),
(42, 'Humanities, Social Sciences and Languages', 2),
(43, 'Introduction to Computers', 2),
(44, 'Science and Maths', 2),
(45, 'English Language & Literature', 2),
(46, 'English Language Teaching', 2),
(47, 'Environment Awareness', 2),
(48, 'Environment Protection', 2),
(49, 'Production structure', 2),
(60, 'Men\'S Adventure', 1),
(61, 'Lesbian ', 1),
(62, 'Legal', 3),
(63, 'Interactive', 3),
(64, 'Humorous', 1),
(65, 'Gay', 3),
(66, 'Earth Sciences', 2),
(67, 'Regional and Area Planning   ', 2),
(68, 'The Environment  ', 2),
(69, 'Geography', 2),
(70, 'Mathematics', 2),
(71, 'Statistics', 2),
(72, 'Topology', 2),
(73, 'Stochastic And Random Processes', 2),
(74, 'Statistical Methods/data Analysis ', 2),
(75, 'Probability', 2),
(76, 'Numerical Analysis  ', 2),
(77, 'Fourier Analysis ', 2),
(78, 'Discrete Mathematics ', 2),
(79, 'Differential Equations ', 2),
(80, 'Algebra', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `f_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable` bit(1) NOT NULL DEFAULT b'1',
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `f_name`, `l_name`, `password`, `enable`, `status`, `image`) VALUES
(58, '1@admin.com', 'Admin', 'Admin', '$2y$10$ftYchjn4i/7XFEGgPwVWaOpyULtpC9e4rhjRk4JoA93gNIdtSCjfa', b'1', 'admin', 'default.png'),
(62, 'Like@like.ia', 'Create', 'Account', '$2y$10$UsRTbqz5jQ6D54bFT5orheLX3O/tiCNu4f3Kc.cGuBcZD.VGjZiCu', b'1', 'user', 'default.png');

-- --------------------------------------------------------

--
-- Структура таблицы `user_cart`
--

CREATE TABLE `user_cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура для представления `maincat`
--
DROP TABLE IF EXISTS `maincat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `maincat`  AS  select `products`.`id` AS `id`,`products`.`title` AS `title`,`products`.`image` AS `image`,`products`.`price` AS `price` from `products` ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Индексы таблицы `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_idx` (`user_id`),
  ADD KEY `product_id_idx` (`product_id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_idx` (`user_id`);

--
-- Индексы таблицы `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id_idx` (`product_id`),
  ADD KEY `order_id_idx` (`order_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcat_id_idx` (`subcategories_id`);

--
-- Индексы таблицы `product_review`
--
ALTER TABLE `product_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_idx` (`user_id`),
  ADD KEY `product_id_idx` (`product_id`);

--
-- Индексы таблицы `subcategoris`
--
ALTER TABLE `subcategoris`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD KEY `catg_id_idx` (`categories_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Индексы таблицы `user_cart`
--
ALTER TABLE `user_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `u_id_idx` (`user_id`),
  ADD KEY `produ_id_idx` (`product_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT для таблицы `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT для таблицы `product_review`
--
ALTER TABLE `product_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `subcategoris`
--
ALTER TABLE `subcategoris`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT для таблицы `user_cart`
--
ALTER TABLE `user_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `prod_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `use_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `subcategry_id` FOREIGN KEY (`subcategories_id`) REFERENCES `subcategoris` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `product_review`
--
ALTER TABLE `product_review`
  ADD CONSTRAINT `p_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `u_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `subcategoris`
--
ALTER TABLE `subcategoris`
  ADD CONSTRAINT `catg_id` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_cart`
--
ALTER TABLE `user_cart`
  ADD CONSTRAINT `produ_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `uer_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
