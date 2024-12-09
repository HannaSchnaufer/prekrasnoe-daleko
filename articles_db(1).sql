-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 09, 2024 at 02:02 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `articles_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `faction_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `content`, `image_url`, `faction_id`, `role_id`, `category_id`) VALUES
(1, 'MEADS ', 'The **MEADS (Medium Extended Air Defense System)** is a highly advanced air defense system designed for use by NATO and other allied forces. It combines cutting-edge radar technology, such as the MEADS 360-degree multi-function radar, with powerful missile interceptors to provide defense against a wide range of aerial threats, including aircraft, ballistic missiles, and cruise missiles. Its mobility allows it to be quickly deployed to protect critical assets.\r\n\r\nIn *World in Conflict: Modern Warfare*, MEADS enhances the defense capabilities of NATO forces by intercepting incoming aerial threats, making it an important asset for air superiority and strategic defense.', 'https://media.moddb.com/cache/images/mods/1/16/15836/thumb_620x2000/meads_mfcr_screen.jpg', 1, 3, 1),
(2, 'Leopard 2', 'The Leopard 2A6 is an advanced German main battle tank that is widely regarded for its formidable firepower, mobility, and protection. Equipped with a Rheinmetall 120 mm L/55 smoothbore gun, this tank offers exceptional range and penetration power, enabling it to engage enemy armored targets effectively. Its composite armor and advanced protection systems provide strong defense against a variety of threats, while its upgraded turret design ensures enhanced survivability. The Leopard 2A6\'s powerful engine allows for excellent mobility in various combat environments.\r\n\r\nIn *World in Conflict: Modern Warfare*, the Leopard 2A6 serves as one of the most powerful ground units, capable of breaking through enemy lines with its strong offensive capabilities and robust defense. It is an ideal unit for dominating the battlefield, offering both versatility and reliability. The tank\'s high mobility makes it effective in maneuvering around enemies and seizing key locations quickly, while its superior armor ensures it remains a persistent threat against opposing forces', 'https://media.moddb.com/cache/images/mods/1/16/15836/thumb_620x2000/leopard2a6_screen_02.jpg', 1, 2, 1),
(3, 'Tank Buster', 'The \"Tank Buster\" in *World in Conflict: Modern Warfare* typically refers to aircraft or weaponry designed specifically to destroy armored targets effectively. One such iconic \"Tank Buster\" is the **A-10 Thunderbolt II**—a close air support aircraft renowned for its durability and effectiveness against tanks. Equipped with the GAU-8/A Avenger rotary cannon, the A-10 can deliver precision strikes with its armor-piercing rounds, making it one of the most feared anti-armor platforms.\r\n\r\nIn the mod, the Tank Buster role might involve deploying such aircraft or specific tactical aids to counter heavy armor threats on the battlefield. By utilizing these assets, players can strategically weaken enemy tank columns, protect their forces, and turn the tide of engagements. This capability highlights the game\'s emphasis on combined arms and modern military realism.', 'https://media.moddb.com/cache/images/mods/1/16/15836/thumb_620x2000/22.jpg', NULL, NULL, 2),
(4, 'Tor-M1 ', 'In *World in Conflict: Modern Warfare*, the **Tor-M1** serves as a short-range air defense system for REDFOR (Russian forces). Its primary role is to protect ground units and critical locations from aerial threats, including aircraft, helicopters, and precision-guided munitions like cruise missiles. The Tor-M1 operates as a self-propelled unit, combining radar tracking, missile launch, and mobility in one platform.\r\n\r\n### In-Game Characteristics:\r\n1. **Anti-Air Role:**\r\n   - Specializes in intercepting low-flying, fast-moving targets, including drones and aircraft, within a range of about 15 kilometers.\r\n   - Highly effective against NATO air units that rely on overwhelming ground forces with air support.\r\n\r\n2. **Mobility and Deployment:**\r\n   - Deployed as a mobile SAM unit capable of relocating quickly to avoid counter-attacks.\r\n   - Works well when used in tandem with other air defense systems for layered protection.\r\n\r\n3. **Weaponry:**\r\n   - Armed with multiple short-range missiles designed to engage aerial targets with precision.\r\n   - Its advanced radar system tracks multiple targets, ensuring high engagement success rates.\r\n\r\nIn the game, the Tor-M1 is an essential defensive unit for countering NATO\'s air superiority tactics, ensuring the safety of high-value assets on the battlefield. Players use it strategically to deny enemy airspace and secure their ground operations.', 'https://media.moddb.com/cache/images/mods/1/16/15836/thumb_620x2000/tor1.jpg', 2, 3, 1),
(5, 'M1A2 Abrams', 'The **M1A2 Abrams** is a modernized version of the iconic American main battle tank, renowned for its exceptional combination of firepower, protection, and mobility. Designed for modern battlefield challenges, the M1A2 features numerous upgrades over its predecessors, making it one of the most advanced tanks in service today.\r\n\r\n### Real-World Features:\r\n1. **Firepower:**\r\n   - Equipped with a 120mm M256 smoothbore cannon capable of firing a variety of ammunition types, including armor-piercing fin-stabilized discarding sabot (APFSDS) rounds and high-explosive anti-tank (HEAT) rounds.\r\n   - Secondary armament includes a .50 caliber machine gun and two 7.62mm machine guns.\r\n\r\n2. **Armor and Protection:**\r\n   - Uses composite armor enhanced with depleted uranium for superior protection against kinetic and chemical energy threats.\r\n   - Features active and passive defensive systems, such as the Trophy Active Protection System (on some variants), which intercepts incoming projectiles.\r\n\r\n3. **Mobility:**\r\n   - Powered by a Honeywell AGT1500 gas turbine engine, providing a top speed of approximately 42 mph (67 km/h) on roads.\r\n   - Designed for maneuverability in a variety of terrains, from deserts to urban environments.\r\n\r\n4. **Technology:**\r\n   - Includes a digital battlefield management system, thermal imaging, and laser rangefinders for superior targeting and situational awareness.\r\n\r\n---\r\n\r\n### In *World in Conflict: Modern Warfare*:\r\nThe **M1A2 Abrams** is a centerpiece of NATO ground forces, excelling in direct engagements and providing unparalleled firepower and durability on the battlefield.\r\n\r\n1. **Offensive Role:**\r\n   - Dominates enemy armor with its powerful 120mm cannon, capable of engaging heavily armored REDFOR units like the T-90 or T-80 tanks.\r\n   - Effective against both armored and soft targets, making it versatile for various combat scenarios.\r\n\r\n2. **Defensive Capabilities:**\r\n   - Its robust armor ensures survivability against a range of threats, including enemy artillery and anti-tank missiles.\r\n   - When paired with supporting infantry or air units, it becomes a formidable obstacle for enemy advances.\r\n\r\n3. **Tactical Usage:**\r\n   - Players deploy the Abrams to spearhead offensives or hold critical positions, using its firepower to suppress enemy forces.\r\n   - Synergy with reconnaissance units allows the Abrams to engage targets with precision at range, leveraging its battlefield technology.\r\n\r\nThe M1A2 Abrams in-game mirrors its real-world reputation as a game-changing asset, offering players a blend of raw power and advanced technology to dominate the battlefield.', 'https://media.moddb.com/cache/images/mods/1/16/15836/thumb_620x2000/m14.jpg', 1, 2, 1),
(6, 'M270 MLRS', 'The **M270 Multiple Launch Rocket System (MLRS)** in *World in Conflict: Modern Warfare* serves as a critical heavy artillery unit for NATO forces. Known for its devastating firepower and strategic utility, the M270 delivers long-range rocket bombardment to suppress or destroy enemy forces and infrastructure.\r\n\r\n### Key Features in the Game:\r\n1. **Heavy Artillery Role:**\r\n   - Equipped with guided M31A1 rockets featuring GPS/INS guidance for precision strikes.\r\n   - Provides area denial and softens enemy positions before assaults.\r\n\r\n2. **Tactical Impact:**\r\n   - Effective against clustered enemy units, supply depots, and lightly armored vehicles.\r\n   - Useful for breaking entrenched defenses or halting advancing forces.\r\n\r\n3. **Deployment and Usage:**\r\n   - Players must position it carefully, as the M270 excels in indirect fire support but is vulnerable to direct attacks.\r\n   - Coordination with recon units ensures accurate targeting of enemy positions.\r\n\r\nThe M270 MLRS embodies NATO\'s doctrine of leveraging advanced technology to deliver precise and overwhelming force, making it a game-changing asset in the hands of a skilled commander.', 'https://media.moddb.com/cache/images/mods/1/16/15836/thumb_620x2000/mlrs2.jpg', 1, 3, 1),
(7, 'Iron Dome', 'The **Iron Dome** in *World in Conflict: Modern Warfare* mod plays a critical role as an advanced air defense system. Modeled after Israel\'s real-world Iron Dome, this unit is designed to intercept and neutralize incoming rocket and artillery threats, providing critical protection for friendly units and bases.\r\n\r\n### Key Features in the Game:\r\n1. **Defensive Role:**\r\n   - Primarily defends against incoming missile and artillery attacks, such as rocket barrages from M270 MLRS or similar threats.\r\n   - Automatically engages detected threats within its operational range, creating a protective bubble for vulnerable units and structures.\r\n\r\n2. **Deployment:**\r\n   - Functions as a stationary or semi-mobile defense unit placed strategically to protect key assets on the battlefield.\r\n   - Requires coordination with other air defense systems like Patriot or MEADS for comprehensive coverage against diverse threats.\r\n\r\n3. **Tactical Impact:**\r\n   - Effective against massed rocket and missile fire, denying enemy efforts to overwhelm defenses through artillery.\r\n   - Can alter enemy strategies by rendering indirect fire less effective, forcing direct engagements.\r\n\r\nIn-game, the Iron Dome emphasizes defensive tactics and the importance of securing critical areas against REDFOR\'s artillery-based strategies. Its integration into NATO\'s arsenal adds a layer of strategic complexity, highlighting the balance between offensive firepower and robust defensive measures.', 'https://media.moddb.com/cache/images/mods/1/16/15836/thumb_620x2000/01.jpg', 1, 3, 1),
(8, 'LAV-AD', 'The **LAV-AD** (Light Armored Vehicle-Air Defense) in *World in Conflict: Modern Warfare* mod serves as a mobile anti-aircraft unit for the BLUFOR faction. This amphibious vehicle is equipped with a GAU-12/U 25mm Gatling gun and Stinger missiles, making it capable of engaging helicopters, drones, and fixed-wing aircraft effectively. \r\n\r\nIn the game, the LAV-AD is primarily used to defend critical areas from aerial threats, providing reliable and flexible air defense. Its mobility also allows it to adapt to rapidly changing battlefield conditions', 'https://media.moddb.com/cache/images/mods/1/16/15836/thumb_620x2000/400.jpg', 1, 1, 1),
(9, 'BMP-3M', 'The **BMP-3** in *World in Conflict: Modern Warfare* is a Russian infantry fighting vehicle equipped with a powerful 100mm gun, a 30mm autocannon, and machine guns, making it effective against infantry, light vehicles, and armored targets. It serves as both a transport and fire support unit for REDFOR, capable of maneuvering in diverse terrains. With its amphibious capabilities, the BMP-3 is a versatile asset for providing suppression and supporting infantry in offensive and defensive roles.', 'https://media.moddb.com/cache/images/mods/1/16/15836/thumb_620x2000/bmp3m.jpg', 2, 1, 1),
(10, 'GAZ Tigr', 'The **GAZ Tigr**, a highly versatile Russian infantry mobility vehicle, is equipped in *World in Conflict: Modern Warfare* mod to serve as a mobile anti-tank and light reconnaissance platform. In its Kornet-equipped configuration, it can effectively engage armored targets at long ranges, leveraging its speed to reposition and avoid counterattacks. \r\n\r\nThis light unit is ideal for ambushes or supporting infantry by providing precise firepower against heavier enemy vehicles. Its balance of mobility and lethality makes it a key tactical tool for REDFOR forces in the game.', 'https://media.moddb.com/cache/images/mods/1/16/15836/thumb_620x2000/matv_02.jpg', 2, 1, 1),
(11, 'MV-22B Osprey', 'The **MV-22B Osprey** in *World in Conflict: Modern Warfare* serves as a versatile aircraft with the ability to both transport troops and perform air assault missions. In the game, it is typically used to deploy infantry into battle zones, offering the flexibility to insert forces into areas that might be inaccessible to traditional vehicles due to terrain or enemy presence.\r\n\r\n### Key Features:\r\n1. **Dual-Role Capabilities:**\r\n   - The Osprey can hover and take off vertically like a helicopter but can also transition to horizontal flight, providing greater range and speed compared to conventional transport helicopters.\r\n   - In addition to troop deployment, it is capable of carrying various weapons or equipment, such as anti-air or anti-vehicle payloads.\r\n\r\n2. **Tactical Impact:**\r\n   - The Osprey\'s ability to quickly deploy infantry behind enemy lines can be a game-changer, especially for launching surprise assaults or providing quick reinforcements.\r\n   - It is best used in support of ground operations, offering tactical flexibility and the ability to transport vital support units where they are most needed.\r\n\r\nIn-game, the Osprey is a valuable asset for rapid insertion, offering both mobility and fire support, making it a key element of modern warfare strategies in *World in Conflict: Modern Warfare*.', 'https://media.moddb.com/cache/images/mods/1/16/15836/thumb_620x2000/mwm46_osprey.jpg ', 1, 4, 1),
(12, 'SS26 Iskander', 'The **MV-22B Osprey** in *World in Conflict: Modern Warfare* serves as a versatile aircraft with the ability to both transport troops and perform air assault missions. In the game, it is typically used to deploy infantry into battle zones, offering the flexibility to insert forces into areas that might be inaccessible to traditional vehicles due to terrain or enemy presence.\r\n\r\n### Key Features:\r\n1. **Dual-Role Capabilities:**\r\n   - The Osprey can hover and take off vertically like a helicopter but can also transition to horizontal flight, providing greater range and speed compared to conventional transport helicopters.\r\n   - In addition to troop deployment, it is capable of carrying various weapons or equipment, such as anti-air or anti-vehicle payloads.\r\n\r\n2. **Tactical Impact:**\r\n   - The Osprey\'s ability to quickly deploy infantry behind enemy lines can be a game-changer, especially for launching surprise assaults or providing quick reinforcements.\r\n   - It is best used in support of ground operations, offering tactical flexibility and the ability to transport vital support units where they are most needed.\r\n\r\nIn-game, the Osprey is a valuable asset for rapid insertion, offering both mobility and fire support, making it a key element of modern warfare strategies in *World in Conflict: Modern Warfare*.\r\n\r\nThe **SS-26 Iskander**, also known as **Iskander-M**, is a Russian short-range tactical ballistic missile that plays a significant role in *World in Conflict: Modern Warfare* as a powerful strike option for the REDFOR faction. The Iskander is highly accurate and capable of striking both stationary and mobile targets. It has the ability to maneuver mid-flight, evading most air defense systems, making it a formidable weapon against high-value targets like enemy command centers, air defense systems, and other key infrastructure.', 'https://media.moddb.com/cache/images/mods/1/16/15836/thumb_620x2000/43_1.jpg', 2, 3, 1),
(13, 'AH-64D Longbow', 'The AH-64D Apache Longbow is a crucial and highly advanced attack helicopter in *World in Conflict: Modern Warfare* for the BLUFOR faction. It is equipped with cutting-edge radar and targeting systems, including the Longbow radar, which allows it to engage multiple targets simultaneously while remaining at a safe distance.\r\n\r\nIn the game, the AH-64D is primarily used to provide air support in combat, using its primary weapon, the **AGM-114 Hellfire missiles**, to take out heavily armored vehicles like tanks. The helicopter\'s ability to fire from a distance, combined with its high survivability, makes it a deadly asset in the air, capable of swiftly neutralizing enemy threats on the battlefield.\r\n\r\nIts tactical advantage lies in its versatile attack capabilities and its ability to operate effectively in complex environments. This makes the AH-64D a key asset for supporting ground operations, providing anti-armor capabilities, and maintaining air superiority.', 'https://media.moddb.com/cache/images/mods/1/16/15836/thumb_620x2000/md_wake_apache092012.jpg', 1, 4, 1),
(14, 'M1128 MGS Stryker', 'The **M1128 Stryker Mobile Gun System (MGS)** is a key armored vehicle in *World in Conflict: Modern Warfare*. It is based on the Stryker family of vehicles, designed for rapid mobility and fire support. The M1128 mounts a **105mm gun**, which provides potent firepower, especially against armored targets, making it an effective support unit for infantry. Its low profile allows it to stay concealed while delivering powerful long-range fire. This wheeled vehicle is deployed for both offensive and defensive operations, combining mobility with substantial firepower.', 'https://media.moddb.com/cache/images/mods/1/16/15836/thumb_620x2000/hdr2.jpg', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Units'),
(2, 'tactical_points');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `author_name` varchar(255) NOT NULL,
  `comment_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `article_id`, `author_name`, `comment_text`, `created_at`) VALUES
(1, 2, 'whiskey delta', 'also leo assault skill is &quot;Engage with everything we’ve got!&quot; so your artillery ammo goes &#039;zummp&#039; gone, danger close!', '2024-12-08 10:36:06'),
(2, 5, 'sierra tango', 'abrums', '2024-12-08 14:34:12'),
(3, 13, 'hawk 2 ', 'buy the expert one with 2000 supplies (Longbow) and watch the whole enemy tanks column get depleted from half afar away', '2024-12-08 14:36:09');

-- --------------------------------------------------------

--
-- Table structure for table `factions`
--

CREATE TABLE `factions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `factions`
--

INSERT INTO `factions` (`id`, `name`) VALUES
(1, 'NATO'),
(2, 'USSR');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Infantry'),
(2, 'Armor'),
(3, 'Support'),
(4, 'Air');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faction_id` (`faction_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `fk_category_id` (`category_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_id` (`article_id`);

--
-- Indexes for table `factions`
--
ALTER TABLE `factions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `factions`
--
ALTER TABLE `factions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`faction_id`) REFERENCES `factions` (`id`),
  ADD CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
