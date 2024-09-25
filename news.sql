-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Dec 03, 2023 at 06:33 PM
-- Server version: 8.0.1-dmr
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news`
--

-- --------------------------------------------------------

--
-- Table structure for table `aggregators`
--

CREATE TABLE `aggregators` (
  `id` int(11) NOT NULL,
  `name` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aggregators`
--

INSERT INTO `aggregators` (`id`, `name`) VALUES
(2, 'newsapi'),
(1, 'nyt');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(8, 'bookreview'),
(2, 'books'),
(4, 'business'),
(14, 'climate'),
(7, 'culture'),
(6, 'dining'),
(15, 'foreign'),
(11, 'games'),
(1, 'general'),
(22, 'graphics'),
(17, 'insider'),
(19, 'letters'),
(16, 'metro'),
(13, 'national'),
(21, 'obits'),
(3, 'oped'),
(18, 'science'),
(20, 'specialsections'),
(9, 'styles'),
(5, 'summary'),
(10, 'sundaybusiness'),
(12, 'washington'),
(23, 'weather'),
(24, 'world');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`) VALUES
(1, 'us');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`) VALUES
(1, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2023_12_03_182250_create_aggregators_table', 1),
(3, '2023_12_03_182250_create_categories_table', 1),
(4, '2023_12_03_182250_create_countries_table', 1),
(5, '2023_12_03_182250_create_languages_table', 1),
(6, '2023_12_03_182250_create_news_hashes_table', 1),
(7, '2023_12_03_182250_create_news_table', 1),
(8, '2023_12_03_182250_create_publishers_table', 1),
(9, '2023_12_03_182253_add_foreign_keys_to_news_table', 1),
(10, '2023_12_03_182253_add_foreign_keys_to_publishers_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `title` varchar(140) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `aggregator_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `published_at`, `title`, `description`, `url`, `image_url`, `publisher_id`, `aggregator_id`, `category_id`) VALUES
(1, '2023-12-03 10:03:58', 'Paul Lynch Feared His Novel Would End His Career. It Won the Booker.', '“Prophet Song” has earned comparisons to dystopian classics like “1984.” But Lynch downplays the book’s political message. This book, he says, was deeply personal.', 'https://www.nytimes.com/2023/12/03/books/paul-lynch-prophet-song-booker.html', 'https://www.nytimes.com/images/2023/12/01/multimedia/01Lynch-02-jklq/01Lynch-02-jklq-articleLarge.jpg', 1, 1, 2),
(2, '2023-12-02 12:00:23', 'Sam Altman, Sugarcoating the Apocalypse', 'Was the shake-up at OpenAI a farce or a tragedy?', 'https://www.nytimes.com/2023/12/02/opinion/ai-sam-altman-openai.html', 'https://www.nytimes.com/images/2023/12/04/multimedia/02dowd-lzgv/02dowd-lzgv-articleLarge.jpg', 1, 1, 3),
(3, '2023-12-03 01:35:33', 'DeSantis Finishes His Iowa 99, Hoping for a Bump Against Trump', 'The Florida governor said his tour of all the state’s counties was evidence of his commitment to Iowa voters, even as he remained far behind Donald Trump in state polls.', 'https://www.nytimes.com/2023/12/02/us/politics/desantis-iowa-tour-2024.html', 'https://www.nytimes.com/images/2023/12/02/multimedia/02pol-desantis-Iowa-1-qfjc/02pol-desantis-Iowa-1-qfjc-articleLarge.jpg', 1, 1, 4),
(4, '2023-12-03 08:00:32', 'Where Avocados Grow and the People Speak Carefully', 'Times reporters on assignment in Michoacán, Mexico, found a drastically altered landscape and dangers to those who protest deforestation.', 'https://www.nytimes.com/2023/12/03/insider/avocados-mexico-journalists.html', 'https://www.nytimes.com/images/2023/12/03/multimedia/03a2_insider-02-thjk/03a2_insider-02-thjk-articleLarge.jpg', 1, 1, 5),
(5, '2023-12-02 16:00:02', 'Rasta Pasta, Brawny Veggies and All the Cookies', 'With Thai tea tres leches cake for good (holiday) measure.', 'https://www.nytimes.com/2023/12/02/dining/rasta-pasta-brawny-veggies-and-all-the-cookies.html', 'https://www.nytimes.com/images/2023/12/02/multimedia/02cooklettersplash-vmlj/02cooklettersplash-vmlj-articleLarge.jpg', 1, 1, 6),
(6, '2023-12-02 00:06:17', '‘Renaissance: A Film by Beyoncé’ Review: Peak Performance', 'The concert film offers a comprehensive look at a world-conquering tour and rare insight into the process of one of the world’s biggest stars.', 'https://www.nytimes.com/2023/12/01/movies/renaissance-a-film-by-beyonce-review.html', 'https://www.nytimes.com/images/2023/12/01/multimedia/renaissance-2-jkqg/renaissance-2-jkqg-articleLarge.jpg', 1, 1, 7),
(7, '2023-12-03 10:01:21', 'The Best Romances of 2023', 'Here are the novels our columnist loved most.', 'https://www.nytimes.com/2023/12/03/books/review/best-romance-books-2023.html', 'https://www.nytimes.com/images/2023/12/10/books/review/10TenBest-ROMANCE/10TenBest-ROMANCE-articleLarge.jpg', 1, 1, 8),
(8, '2023-12-03 14:00:24', 'What Motivates the Motivators?', 'The life of a fitness instructor involves 4 a.m. starts, too much coffee, exercising for work, exercising for fun, and working in some “me” time.', 'https://www.nytimes.com/2023/12/03/style/fitness-instructor-routine.html', 'https://www.nytimes.com/images/2023/12/03/multimedia/03FITNESS-INSTRUCTOR-RECOVERY-01-wmcq/03FITNESS-INSTRUCTOR-RECOVERY-01-wmcq-articleLarge.jpg', 1, 1, 9),
(9, '2023-12-02 10:02:04', 'When You Call Social Security, Expect to Wait Even Longer', 'The Social Security Administration’s staffing and customer service issues have been mounting, and budget disputes in Congress could make them worse.', 'https://www.nytimes.com/2023/12/02/business/social-security-phone-line-budget-cuts.html', 'https://www.nytimes.com/images/2023/12/03/business/1203RETIRING/1203RETIRING-articleLarge.jpg', 1, 1, 10),
(10, '2023-12-02 08:00:03', 'The Connections Companion', 'In case you need some puzzle help.', 'https://www.nytimes.com/2023/12/02/crosswords/connections-companion.html', 'https://www.nytimes.com/images/2023/11/02/crosswords/02connections-157/02connections-157-articleLarge.jpg', 1, 1, 11),
(11, '2023-12-02 01:26:54', 'A Guide to N.Y.C. Holiday Events: Live Music, Theater, Lights and More', '“The Nutcracker,” ice skating, menorah lighting, and Big Band carols at Lincoln Center: Here are some of our favorite things to do this season.', 'https://www.nytimes.com/2023/12/01/arts/nyc-holiday-guide.html', 'https://www.nytimes.com/images/2023/12/01/multimedia/01HOLIDAY-EVENT-kbjv/01HOLIDAY-EVENT-kbjv-articleLarge.jpg', 1, 1, 7),
(12, '2023-12-03 14:00:25', 'The Books That Explain Where We Are in 2023', 'Most of them didn’t appear this year.', 'https://www.nytimes.com/2023/12/03/opinion/books-list-2023.html', 'https://www.nytimes.com/images/2023/12/03/multimedia/03klein-fphj/03klein-fphj-articleLarge-v3.jpg', 1, 1, 3),
(13, '2023-12-02 08:00:04', 'Spelling Bee Forum', 'Feeling stuck on today’s puzzle? We can help.', 'https://www.nytimes.com/2023/12/02/crosswords/spelling-bee-forum.html', 'https://www.nytimes.com/images/2023/12/02/crosswords/02bee-forum-sat/02bee-forum-sat-articleLarge.jpg', 1, 1, 11),
(14, '2023-12-03 10:03:33', 'At Core of Purdue Pharma Case: Who Can Get Immunity in Settlements?', 'A broad ruling by the Supreme Court could mean the end of a strategy for resolving claims of mass injury in bankruptcy court in which organizations receive expansive legal protections.', 'https://www.nytimes.com/2023/12/03/us/politics/oxycontin-supreme-court-purdue-sacklers.html', 'https://www.nytimes.com/images/2023/12/01/multimedia/00dc-scotus-purdue-01-zgfh/00dc-scotus-purdue-01-zgfh-articleLarge.jpg', 1, 1, 12),
(15, '2023-12-02 10:02:22', 'The Plan to Save a California Island? Shoot All of the Deer.', 'For decades, nonnative animals have ravaged the rare habitat on Catalina. The proposed solution has infuriated local residents and animal lovers.', 'https://www.nytimes.com/2023/12/02/us/santa-catalina-island-california.html', 'https://www.nytimes.com/images/2023/12/02/multimedia/02nat-atc-catalina-01-promo/02nat-atc-catalina-01-kqcg-articleLarge.jpg', 1, 1, 13),
(16, '2023-12-02 08:58:22', '22 Countries Pledge to Triple Nuclear Capacity in Push to Cut Fossil Fuels', 'The group, including Britain, France and the United States, said the agreement was critical to meeting nations’ climate commitments.', 'https://www.nytimes.com/2023/12/02/climate/cop28-nuclear-power.html', 'https://www.nytimes.com/images/2023/12/02/multimedia/02cli-cop28nuclear-fzlc/02cli-cop28nuclear-fzlc-articleLarge.jpg', 1, 1, 14),
(17, '2023-12-02 12:00:22', 'Lessons From Kissinger’s Triumphs and Catastrophes', 'And how we can apply them to China and Gaza today.', 'https://www.nytimes.com/2023/12/02/opinion/kissinger-china-gaza.html', 'https://www.nytimes.com/images/2023/12/03/opinion/02kristof/02kristof-articleLarge.jpg', 1, 1, 3),
(18, '2023-12-03 15:00:16', 'The Climate Summit Embraces A.I., With Reservations', 'The idea of using artificial intelligence to fight emissions has made a splash at COP28, but there’s a catch: The energy it requires could make matters worse.', 'https://www.nytimes.com/2023/12/03/climate/artificial-intelligence-climate-change.html', 'https://www.nytimes.com/images/2023/12/03/multimedia/03cli-COP28-AI-tcmj/03cli-COP28-AI-tcmj-articleLarge.jpg', 1, 1, 14),
(19, '2023-12-03 14:00:10', 'Beyoncé Is the Religious Experience We Need Right Now', 'Her concert tour and her new film “Renaissance” show us what a more inclusive and loving church might look like.', 'https://www.nytimes.com/2023/12/03/opinion/beyonce-renaissance-religion.html', 'https://www.nytimes.com/images/2023/12/03/opinion/03dyson/03dyson-articleLarge-v3.jpg', 1, 1, 3),
(20, '2023-12-02 12:00:13', 'Is South Korea Disappearing?', 'What a dramatic birth dearth portends for Koreans and the world.', 'https://www.nytimes.com/2023/12/02/opinion/south-korea-birth-dearth.html', 'https://www.nytimes.com/images/2023/12/05/opinion/02douthat/02douthat-articleLarge.jpg', 1, 1, 3),
(21, '2023-12-02 05:00:00', 'Quotation of the Day: Santos Expelled as House Issues Historic Rebuke', 'Quotation of the Day for Saturday, December 2, 2023.', 'https://www.nytimes.com/2023/12/02/pageoneplus/quotation-of-the-day-santos-expelled-as-house-issues-historic-rebuke.html', NULL, 1, 1, 5),
(22, '2023-12-03 10:01:01', 'The Critics’ Picks: A Year in Reading', 'The Book Review’s daily critics — Dwight Garner, Alexandra Jacobs and Jennifer Szalai — reflect on the books that stuck with them in 2023.', 'https://www.nytimes.com/2023/12/03/books/review/critics-favorite-books-2023.html', 'https://www.nytimes.com/images/2023/12/10/books/review/10TenBest-CRITICS/10TenBest-CRITICS-articleLarge.jpg', 1, 1, 8),
(23, '2023-12-02 15:55:18', 'Israel Orders Evacuations Amid ‘Intense’ Attacks on Southern Gaza', 'Beleaguered Gazans, having fled the territory’s north, emerged from a night of bombardment wondering where to go next for safety.', 'https://www.nytimes.com/2023/12/02/world/middleeast/israel-gaza-evacuations-war.html', 'https://www.nytimes.com/images/2023/12/02/multimedia/02israel-ledeall-02-wzqg/02israel-ledeall-02-wzqg-articleLarge.jpg', 1, 1, 15),
(24, '2023-12-03 17:25:09', 'U.S. Is Pressing Israel and Hamas to Resume Talks, White House Official Says', 'John Kirby said that Hamas was to blame for the breakdown in the negotiations, and that Israel was heeding U.S. advice on limiting civilian casualties.', 'https://www.nytimes.com/2023/12/03/world/middleeast/israel-hamas-hostages-gaza.html', 'https://www.nytimes.com/images/2023/12/03/multimedia/03israel-hamas-kirby-01-ztjw/03israel-hamas-kirby-01-ztjw-articleLarge.jpg', 1, 1, 12),
(25, '2023-12-02 08:01:02', 'Congestion Pricing’s Impact on New York? These 3 Cities Offer a Glimpse.', 'New York City is on the verge of becoming the first U.S. city to follow London, Stockholm and Singapore in trying to cut traffic by charging some drivers a fee.', 'https://www.nytimes.com/2023/12/02/nyregion/new-york-congestion-pricing-london-stockholm-singapore.html', 'https://www.nytimes.com/images/2023/12/02/multimedia/02congestion-pricing-lessons--01-fcpt/02congestion-pricing-lessons--01-fcpt-articleLarge.jpg', 1, 1, 16),
(26, '2023-12-03 06:00:10', 'Losing Your Life for Doing Your Job', '60 Journalists have been killed in the Israel-Gaza war. My friend was one of them.', 'https://www.nytimes.com/2023/12/03/opinion/journalists-killed-israel-gaza.html', 'https://www.nytimes.com/images/2023/11/29/multimedia/29al-arian-ljcf/29al-arian-ljcf-articleLarge.jpg', 1, 1, 3),
(27, '2023-12-03 08:00:24', 'A Word’s History, Obscured by Snow and Lore', '‘American storms,’ Davy Crockett and a mysterious man called Lightning Ellis: The story behind the word ‘blizzard’ is no less opaque than the visibility during the storm itself.', 'https://www.nytimes.com/2023/12/03/insider/a-words-history-obscured-by-snow-and-lore.html', NULL, 1, 1, 17),
(28, '2023-12-02 07:26:23', 'Southern Gaza girds for the war’s next phase.', 'Gazans were bracing for expanded hostilities on Saturday, a day after the truce between Israel and Hamas ended, as Israel began turning its focus on southern Gaza for the war’s next phase and as the flow of vital supplies of food, water and medicine again slowed to a trickle.', 'https://www.nytimes.com/2023/12/02/world/middleeast/southern-gaza-girds-for-the-wars-next-phase.html', 'https://www.nytimes.com/images/2023/12/01/multimedia/02israel-hamas-early-lead/01israel-hamas-promo-130-wkql-articleLarge.jpg', 1, 1, 15),
(29, '2023-12-02 10:00:39', 'Gambling, Risky Pranks and Lucrative Contracts: Inside the Streaming Site Kick', 'The Twitch competitor has doled out generous deals to content creators. It has also faced criticism for its lax moderation and embrace of online gambling.', 'https://www.nytimes.com/2023/12/02/technology/kick-streaming-twitch-gambling.html', 'https://www.nytimes.com/images/2023/12/03/multimedia/KICK-1-qwlj/KICK-1-qwlj-articleLarge.jpg', 1, 1, 10),
(30, '2023-12-02 10:02:30', 'What to Know About Home Care Services', 'Finding an aide to help an older person stay at home safely takes work. Here’s a guide.', 'https://www.nytimes.com/2023/12/02/health/home-care-explainer.html', 'https://www.nytimes.com/images/2023/11/30/science/01LTC-HOMECARE-SERVICE/00LTC-HOMECARE-workers-02-cmqj-articleLarge.jpg', 1, 1, 18),
(31, '2023-12-03 16:01:51', 'Sharp Views on Dating and Marriage Today', 'Readers discuss a guest essay about why many women are not getting married.', 'https://www.nytimes.com/2023/12/03/opinion/dating-marriage-men-women.html', 'https://www.nytimes.com/images/2023/11/11/opinion/11sussman/11sussman-articleLarge.jpg', 1, 1, 19),
(32, '2023-12-03 03:54:40', 'Explosion at Catholic Mass in Philippines Kills at Least 4 and Injures Dozens', 'The blast occurred in a restive area in the south that was the site of a devastating battle with an Islamic State affiliate six years ago.', 'https://www.nytimes.com/2023/12/02/world/asia/philippines-explosion.html', 'https://www.nytimes.com/images/2023/01/02/multimedia/02philippines-explosion-swap-fmzw/02philippines-explosion-swap-fmzw-articleLarge.jpg', 1, 1, 15),
(33, '2023-12-02 08:01:41', 'What’s Next for George Santos? Court Dates and, Maybe, Reality TV.', 'The New York Republican suggested that his future might include a memoir or a reality television show, not to mention the looming criminal trial in federal court.', 'https://www.nytimes.com/2023/12/02/nyregion/george-santos-future-prison.html', 'https://www.nytimes.com/images/2023/12/02/multimedia/02santos-explainer-01-kjlh/02santos-explainer-01-kjlh-articleLarge.jpg', 1, 1, 16),
(34, '2023-12-03 10:00:32', 'Forging Art From Molten Glass', 'Sini Majuri combines traditional techniques with modern tech to explore human nature.', 'https://www.nytimes.com/2023/12/03/fashion/craftsmanship-glassmaking-sini-majuri-helsinki-fin.html', 'https://www.nytimes.com/images/2023/12/04/multimedia/04sp-crafts-glass-inyt-05-kbzc/04sp-crafts-glass-inyt-05-kbzc-articleLarge.jpg', 1, 1, 20),
(35, '2023-12-02 18:22:44', 'Mica Ertegun, Glamorous Interior Designer and Philanthropist, Dies at 97', 'She and her longtime husband, the music magnate Ahmet Ertegun, were once called “the virtual definition of sophistication.”', 'https://www.nytimes.com/2023/12/02/style/mica-ertegun-dead.html', 'https://www.nytimes.com/images/2022/01/11/obituaries/00ertegun-01/00ertegun-01-articleLarge.jpg', 1, 1, 21),
(36, '2023-12-03 10:03:51', 'Israeli Mothers Knew Their Sons Would Serve. But They Didn’t Expect War.', 'Many mothers are grappling with anxiety as their sons head off to fight in Gaza. “It felt like my children were being taken away, one by one, until no one was left,” one said.', 'https://www.nytimes.com/2023/12/03/world/middleeast/israel-war-mothers.html', 'https://www.nytimes.com/images/2023/12/03/multimedia/03israel-mothers-01-qgwf/03israel-mothers-01-qgwf-articleLarge.jpg', 1, 1, 15),
(37, '2023-12-03 02:55:17', 'Upheaval Continues at DeSantis Super PAC as Another Top Official Departs', 'The firing of the new chief executive creates more uncertainty at the well-funded group that has played a key role in the Florida governor’s effort to win the Republican primary.', 'https://www.nytimes.com/2023/12/02/us/politics/desantis-super-pac-never-back-down-davis.html', 'https://www.nytimes.com/images/2023/12/02/multimedia/02pol-desantis-super-pac-hczf/02pol-desantis-super-pac-hczf-articleLarge.jpg', 1, 1, 12),
(38, '2023-12-02 04:51:49', 'Susan Sarandon Apologizes for Comment About Jews at Rally', 'The Oscar-winning actress said she now regrets “diminishing” the long history of antisemitism in remarks at the rally, which led her agents to part ways with her.', 'https://www.nytimes.com/2023/12/01/arts/susan-sarandon-apology-pro-palestinian-rally.html', 'https://www.nytimes.com/images/2023/12/01/multimedia/01sarandon-apology-hlgz/01sarandon-apology-hlgz-articleLarge.jpg', 1, 1, 7),
(39, '2023-12-03 05:50:51', 'Quotation of the Day: Generation of Women Inspired by O’Connor, in Courtroom and Out', 'Quotation of the Day for Sunday, December 3, 2023.', 'https://www.nytimes.com/2023/12/03/pageoneplus/quotation-of-the-day-generation-of-women-inspired-by-oconnor-in-courtroom-and-out.html', NULL, 1, 1, 5),
(40, '2023-12-02 10:03:35', 'Beyoncé the Auteur Takes Center Stage in ‘Renaissance’', 'She is essentially one on the new film, but she has also demonstrated throughout her career just who is in charge of her art.', 'https://www.nytimes.com/2023/12/02/movies/beyonce-renaissance-auteur.html', 'https://www.nytimes.com/images/2023/12/03/multimedia/03BEYONCE-NOTEBOOK-02-ltkm/03BEYONCE-NOTEBOOK-02-ltkm-articleLarge.jpg', 1, 1, 7),
(41, '2023-12-02 10:00:12', 'I Survived ‘Guiding Light’', 'The long-running CBS soap opera had plenty of drama, onstage and off. A former cast member looks back on its last days.', 'https://www.nytimes.com/2023/12/02/style/i-survived-guiding-light.html', 'https://www.nytimes.com/images/2023/12/03/fashion/02EPISODE-REYES/02EPISODE-REYES-articleLarge.jpg', 1, 1, 9),
(42, '2023-12-02 23:00:08', 'Freestyling', 'Tracy Bennett whips up a Sunday themeless with teeth!', 'https://www.nytimes.com/2023/12/02/crosswords/daily-puzzle-2023-12-03.html', 'https://www.nytimes.com/images/2023/12/03/crosswords/03wordplay-dragon/03wordplay-dragon-articleLarge.jpg', 1, 1, 11),
(43, '2023-12-02 03:00:08', 'Stuff in Microdots', 'Royce Ferguson’s Saturday puzzle takes us on an interesting trip.', 'https://www.nytimes.com/2023/12/01/crosswords/daily-puzzle-2023-12-02.html', 'https://www.nytimes.com/images/2023/12/02/crosswords/02wordplay-baobabs/02wordplay-baobabs-articleLarge.jpg', 1, 1, 11),
(44, '2023-12-03 16:59:23', 'Geordie Walker, Guitarist for Killing Joke, Dies at 64', 'He helped define the look as well as the sound of the enduring British post-punk band, which influenced Nirvana, Metallica and others.', 'https://www.nytimes.com/2023/12/03/arts/music/geordie-walker-dead.html', 'https://www.nytimes.com/images/2023/11/30/multimedia/30walker-zmcp/30walker-zmcp-articleLarge.jpg', 1, 1, 21),
(45, '2023-12-02 21:40:17', 'What the Scale of Displacement in Gaza Looks Like', 'Eighty percent of Gazans are displaced from their homes as Israel orders more evacuations. See where thousands have been sheltering amid the war’s destruction.', 'https://www.nytimes.com/interactive/2023/12/02/world/middleeast/gaza-map-displaced-people.html', 'https://www.nytimes.com/images/2023/12/02/multimedia/2023-11-22-gaza-displaced-index/2023-11-22-gaza-displaced-index-articleLarge.jpg', 1, 1, 22),
(46, '2023-12-02 10:03:30', '2023 Hurricane Season Ends, Marked by Storms That ‘Really Rapidly Intensified’', 'There have been a combined 37 named storms this year in the Atlantic and Eastern Pacific basins. A high proportion of those quickly escalated.', 'https://www.nytimes.com/interactive/2023/12/02/us/hurricane-season-2023-rapid-intensification.html', 'https://www.nytimes.com/images/2023/12/01/multimedia/2023-10-20-all-storms-2023-index/2023-10-20-all-storms-2023-index-articleLarge-v5.jpg', 1, 1, 23),
(47, '2023-12-02 15:38:03', 'Map: 7.6-Magnitude Earthquake Strikes the Philippine Sea', 'View the location of the quake’s epicenter and shake area.', 'https://www.nytimes.com/interactive/2023/12/02/world/asia/earthquake-philippines.html', 'https://www.nytimes.com/images/2023/12/02/multimedia/2023-12-02-earthquake-philippines-index/2023-12-02-earthquake-philippines-index-articleLarge-v19.jpg', 1, 1, 24);

-- --------------------------------------------------------

--
-- Table structure for table `news_hashes`
--

CREATE TABLE `news_hashes` (
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `news_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news_hashes`
--

INSERT INTO `news_hashes` (`hash`, `news_id`) VALUES
('f05f6a3d081a51f7bee0e80ae22b47b07bc968abd7ebc3904c01eb93a15946f4', 1),
('73fb5069cbb243081a00311dc4e9e246706203b1658020204fcf2093f4aa7b5c', 2),
('6cd09a33d744a58d24988be49af9085298c394d6a549bdb6548ba5bbc793eb02', 3),
('3d8bdcc5f692e06bd063f64187f54e64d1ab2535b43287abb9fb746500570d1b', 4),
('0fcdcd618bba32c55bdd043a1390813496a8532b8f57d5a23b45a73d9cd6331e', 5),
('3143e807ce09b9d977e61999c7c2b163ddb9a001f2c5bbc3163d0c1c11467191', 6),
('66310e114a6269c7a4456f6c947c1e23e445046507e3d77cd98d26673a047a48', 7),
('2d0c23bb8c0eb7b6b04993777d6fd464a014299cfe63c7f5a586e303c54bd820', 8),
('ff623d9250c8705f4115c0b9dbe9f2d397b097c26d7a7882e95a818dc73941ab', 9),
('b54a942ae7eaff15a8a972b0ee2ac5f0f242273d28f044869a23de90658f1e32', 10),
('7418f50322304129a871b9d1f1a3c90dfbefb9657eeae9275a78d6917760cd05', 11),
('8272d9861ef496291eac0afd425513ba864bdf878762f802b933e2f3133f79a1', 12),
('6e813b27173f4a1ffc7bdf7146b2b36ebcfa0a6513b7435876ac34f4a141ff6a', 13),
('9887d3a47e5808e015e2224c8cf2967b34bcd8993b68d8f1f473fb11f313e5ac', 14),
('1f312bbe93d813ce0e027709545dd2de62ae81545781567150e20ec9ed9dc99b', 15),
('f795675eda4f9f0c132e9a99eabe12e767ba45bc88925b1d48bdf04c63aeb638', 16),
('03131d5bc650b83296b2f636f1cadc3f9c2bd7f053b908406201c0fd73e8a646', 17),
('2249a0d7ab2cac9fe9f399126601fd2968477d7ff4a705606b7f1615ef053426', 18),
('027f3a8d70a9cc079560a89e20f74be02e29103b1c26d21d360317c2fea1efaf', 19),
('145e467d8aa2a33a5c085227ca17b0760e80a32402304686e42882e823079e97', 20),
('712ea1986c4b5a204a65c032488c4488bf5721a5b020bfe394c8621d50522dee', 21),
('b200e32ecac14f1615b6fa03b2bfa6f638374fddc8aa38749f8771a73b771beb', 22),
('b6c39f545349099591c770a78f9e5b1946c3f9a5dc8941e6d4d3fb2401988fbe', 23),
('5f315b5b740efc373f04711b0fa00daf82b2c81c003476cca4efd48eb13e95fb', 24),
('ab4241a12c8581f62ff5a9a28dc0135958a086e8af4570753812f13f18086ae2', 25),
('fb8dc227ad43a56f0cbfa9ac2ac87b6b902c3aa38d036b04a72b03a15464e2ab', 26),
('3239ffac67d56334230f94488f4b6b2e3df9ea239506b8c4dac20c03e68e3912', 27),
('7b04989d4360b518df715aff4ce00acdfdbc82f3be2b5c419040c8e4b25b6601', 28),
('4606970fa37eba08db5beb0f8a4d66ea3f26a24db8a90a57d6924cb34ec9819e', 29),
('bcf4d4541fc24b7a1da381d83c528da7dfc4f84be0c232385b31ec9a4ab78715', 30),
('61814967a4c591243aec4058a089a6527982651204678e88f5c53959eaaf4d0f', 31),
('88ac29c5bf4a05bdcb453bee1d5e44384d7792a1195864e96e779c81ece52b48', 32),
('0450b7fee93c7bcf8a53f2e8176e80a26174fdb9e9546ad98fdfdd6be6019710', 33),
('fde47a3291198027ef2f2715940f9291bdec3a798d278b378cb0b0a25da7e3d8', 34),
('08fe43b3bb6b1666bc961f1eb97aacb39318035c6a0a5653feac841f070bb2a3', 35),
('48380739fb66ab3cad51bee357d490b6cd7f899850a316e26f6e70f376cce443', 36),
('c9bebdd4d40a981b972055c663c2605149449b12684d3f71e1da14813d295211', 37),
('cbf5cff70894147aca7b59d25e1f9e5092964ba0fb8b92c9a04be07f7152a623', 38),
('8e5398a164afd020678da8ccbde7e3bab415597a823c57e67ab59e564c7efa8c', 39),
('234c67aef8d8ceaa192709a999c0e117f05fefa8c3b8e1ece68035cbcf7d29ce', 40),
('adda260a8d95cd83021ddf4b59f9ab38442861b5e13a9603cf135ef940176267', 41),
('c8259706c0f94f55d3a74964c79b9492d0e1d7e3e4ff5ff0ac32c5dd5dfa73ca', 42),
('193e551ea8ec9b5b7ce00ce02e4286b383b2b51395a365603e45c661a5790ca1', 43),
('08eb5395162e6d17dc66662276454c4166c5184fbaab700478564f45aa9b4b68', 44),
('25022008375e7a7b214d3cd34dc6d859104a608ab6b2059ee523a8753517a38c', 45),
('3ab0aec69c8efb9ba4823b646b0f64537c1787aaf85399a04bb478d4897cf7f6', 46),
('b97f9c80ba42b815b4d35e81c59669c32fea2ec288e3f3779fbdb02ca69b1c96', 47);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`id`, `slug`, `name`, `url`, `category_id`, `country_id`, `language_id`) VALUES
(1, 'the_new_york_times', 'The New York Times', 'https://nytimes.com', 1, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aggregators`
--
ALTER TABLE `aggregators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `publish_time` (`published_at`),
  ADD KEY `title` (`title`),
  ADD KEY `description` (`description`),
  ADD KEY `url` (`url`),
  ADD KEY `publisher_id` (`publisher_id`),
  ADD KEY `aggregator_id` (`aggregator_id`),
  ADD KEY `news_category` (`category_id`);

--
-- Indexes for table `news_hashes`
--
ALTER TABLE `news_hashes`
  ADD PRIMARY KEY (`hash`,`news_id`),
  ADD KEY `news_id` (`news_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `publisher_category_id` (`category_id`),
  ADD KEY `publisher_country_id` (`country_id`),
  ADD KEY `language_id` (`language_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aggregators`
--
ALTER TABLE `aggregators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_aggregator` FOREIGN KEY (`aggregator_id`) REFERENCES `aggregators` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `news_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `news_publisher` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `publishers`
--
ALTER TABLE `publishers`
  ADD CONSTRAINT `publisher_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `publisher_country` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `publisher_language` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
