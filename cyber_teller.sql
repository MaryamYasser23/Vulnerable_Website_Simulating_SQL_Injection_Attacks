-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2024 at 07:24 PM
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
-- Database: `cyber_teller`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `articleid` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `subContent` text DEFAULT NULL,
  `content` text NOT NULL,
  `Status` enum('visible','hidden') DEFAULT 'visible',
  `Date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`articleid`, `image`, `title`, `subContent`, `content`, `Status`, `Date`) VALUES
(1, 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhgBq63hh3kO_bENYYcgiz4X7yiRISaxrwuXuoMB_SzGTLPgdWCgmaomPXmd_21D9RbO_mBI693ST63F4T2eLaVl53R_g758zgj0Ilo56bV18BMpzOzPxDJcTdMlib8pHGt3Wft3ogn0wJe3VOB4K-w9sXzHTLEZO7HmNSZHWz51HB1hLyVlCbVu7Sr5jKm/s728-', 'Critical WordPress Anti-Spam Plugin Flaws Expose 200,000+ Sites to Remote Attacks', 'Two critical security flaws impacting the Spam protection, Anti-Spam, and FireWall plugin for WordPress could allow an unauthenticated attacker to install and enable malicious plugins on susceptible sites and potentially achieve remote code execution.', 'The vulnerabilities, tracked as CVE-2024-10542 and CVE-2024-10781, carry a CVSS score of 9.8 out of a maximum of 10.0. They were addressed in versions 6.44 and 6.45 released this month. Installed on over 200,000 WordPress sites CleanTalk\'s Spam protection, Anti-Spam, FireWall plugin is advertised as a universal anti-spam plugin that blocks spam comments, registrations, surveys, and more. According to Wordfence, both vulnerabilities concern an authorization bypass issue that could allow a malicious actor to install and activate arbitrary plugins. This could then pave the way for remote code execution if the activated plugin is vulnerable of its own.', 'visible', '2024-12-06 12:00:00'),
(2, 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiRJzDHyUSl0rwbhHdJJhliB49TEylkX0-Gux4fhK3U8dtQQbzMM86fAALWyU7106EKQnfjQ5FMv_LrGbSE9ijqK2Vov7P9j_yYqUHiNOr4FKqOuxjbYugsz8dD0K5EdP-uLiOzLwBM8TVNHhk0OM7KFvWw89Uk4llznLTumISEOuBJh5iudlwt2PD_TJg/s728-r', 'How AI Is Transforming IAM and Identity Security', 'AI and machine learning (ML) are creating a more robust, proactive IAM system that continuously learns from the environment to enhance security.', 'In recent years, artificial intelligence (AI) has begun revolutionizing Identity Access Management (IAM), reshaping how cybersecurity is approached in this crucial field. Leveraging AI in IAM is about tapping into its analytical capabilities to monitor access patterns and identify anomalies that could signal a potential security breach. The focus has expanded beyond merely managing human identities — now, autonomous systems, APIs, and connected devices also fall within the realm of AI-driven IAM, creating a dynamic security ecosystem that adapts and evolves in response to sophisticated cyber threats.\r\n\r\nThe Role of AI and Machine Learning in IAM#\r\nAI and machine learning (ML) are creating a more robust, proactive IAM system that continuously learns from the environment to enhance security. Let\'s explore how AI impacts key IAM components:\r\n\r\nIntelligent Monitoring and Anomaly Detection#\r\nAI enables continuous monitoring of both human and non-human identities, including APIs, service accounts, and other automated systems. Traditional monitoring systems typically miss subtle irregularities in these interactions, but AI\'s analytical prowess uncovers patterns that could be early signs of security threats. By establishing baselines for \"normal\" behavior for each identity, AI can quickly flag deviations, allowing for a fast response to potential threats.\r\n\r\nFor example, in dynamic environments such as containerized applications, AI can detect unusual access patterns or large data transfers, signaling potential security issues before they escalate. This real-time insight minimizes risks and provides a proactive approach to IAM.', 'hidden', '2024-12-06 14:22:37'),
(3, 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj7hK98NiGbj_kzsMjoE2wLbcNhkr_tTIdP7TC_9Frp8-N3Sqj2E6i9YLRjcIgjxw0HrOcB-alACYcm2imeNMMz6x4TgPoxkdvQJHFHMkInJUpjsEML9I9ADsbk0-nqxherjMpIGzSNb1ddXYu472h4uzdrG4fw4ZTRUJqktMgpUMZPSfn9vqoLL87sFhar/s728-', 'THN Recap: Top Cybersecurity Threats, Tools and Tips', 'Ever wonder what happens in the digital world every time you blink? Here\'s something wild - hackers launch about 2,200 attacks every single day, which means someone\'s trying to break into a system somewhere every 39 seconds.', 'Ever wonder what happens in the digital world every time you blink? Here\'s something wild - hackers launch about 2,200 attacks every single day, which means someone\'s trying to break into a system somewhere every 39 seconds.\r\n\r\nAnd get this - while we\'re all worried about regular hackers, there are now AI systems out there that can craft phishing emails so convincingly, that even cybersecurity experts have trouble spotting them. What\'s even crazier? Some of the latest malware is like a digital chameleon - it literally watches how you try to catch it and changes its behavior to slip right past your defenses.\r\n\r\nPretty mind-bending stuff, right? This week\'s roundup is packed with eye-opening developments that\'ll make you see your laptop in a whole new light.\r\n\r\n⚡ Threat of the Week#\r\nT-Mobile Spots Hackers Trying to Break In: U.S. telecom service provider T-Mobile caught some suspicious activity on their network recently - basically, someone was trying to sneak into their systems. The good news? They spotted it early and no customer data was stolen. While T-Mobile isn\'t pointing fingers directly, cybersecurity experts think they know who\'s behind it - a hacking group nicknamed \'Salt Typhoon,\' which apparently has ties to China. What makes this really interesting is that these hackers have a brand new trick up their sleeve: they\'re using a previously unknown backdoor tool called GHOSTSPIDER. Think of it as a skeleton key that no one knew existed until now. They\'ve been using this same tool to target telecom companies across Southeast Asia.', 'visible', '2024-12-07 08:00:00'),
(4, 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi2S9Qj3DnsamWqg1eSxR95cvKRpo59Y93_RJs9ql7UwgwRi71Je6A2ApVGkG-_pDLj8Xl9QV9OJaBOlyoY2kwMHBSXiVwg-kZ15gqmIZFhE1JI-9PpppYBIztVjfGD4OUoLs2Q6I3p-L-1Fnfb4r3Npmf09tJO9z2-N6EkcyV5RguGqxfWcBjPQQsNFhyW/s728-', 'THN Recap: Top Cybersecurity Threats, Tools, and Practices (Nov 04 - Nov 10)', 'Imagine this: the very tools you trust to protect you online—your two-factor authentication, your car\'s tech system, even your security software—turned into silent allies for hackers. Sounds like a scene from a thriller, right? Yet, in 2024, this isn\'t fiction; it\'s the new cyber reality. Today\'s attackers have become so sophisticated that they\'re using our trusted tools as secret pathways, slipping past defenses without a trace.', 'Imagine this: the very tools you trust to protect you online—your two-factor authentication, your car\'s tech system, even your security software—turned into silent allies for hackers. Sounds like a scene from a thriller, right? Yet, in 2024, this isn\'t fiction; it\'s the new cyber reality. Today\'s attackers have become so sophisticated that they\'re using our trusted tools as secret pathways, slipping past defenses without a trace.\r\n\r\nFor banks, this is especially alarming. Today\'s malware doesn\'t just steal codes; it targets the very trust that digital banking relies on. These threats are more advanced and smarter than ever, often staying a step ahead of defenses.\r\n\r\nAnd it doesn\'t stop there. Critical systems that power our cities are at risk too. Hackers are hiding within the very tools that run these essential services, making them harder to detect and harder to stop. It\'s a high-stakes game of hide-and-seek, where each move raises the risk.\r\n\r\nAs these threats grow, let\'s dive into the most urgent security issues, vulnerabilities, and cyber trends this week.\r\nThreat of the Week#\r\nFBI Probes China-Linked Global Hacks: The FBI is urgently calling for public assistance in a global investigation into sophisticated cyber attacks targeting companies and government agencies. Chinese state-sponsored hacking groups—identified as APT31, APT41, and Volt Typhoon—have breached edge devices and computer networks worldwide.\r\n\r\nExploiting zero-day vulnerabilities in edge infrastructure appliances from vendors like Sophos, these threat actors have deployed custom malware to maintain persistent remote access and repurpose compromised devices as stealthy proxies. This tactic allows them to conduct surveillance, espionage, and potentially sabotage operations while remaining undetected.', 'visible', '2024-12-09 09:00:00'),
(5, 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjXTmM2veVJZABNc6GoKJo7t_kOqpddFWDEnSEDn0GLoLGwC4U8XZ4MshZWuwDCHJQ0R8eHFsmV3ZC_NQXLVjfC74DHgrL3hy-9pKXGM4RiDEMoahI4HD2DOK3G8hBBgcsLhnFoJ1WjkUeh9pjQ99aEZIS6iRZmiO9RKREXs_LAeF_YMlQ8F5JKRqNz7mLQ/s728-', 'New Ymir Ransomware Exploits Memory for Stealthy Attacks; Targets Corporate Networks', 'Cybersecurity researchers have flagged a new ransomware family called Ymir that was deployed in an attack two days after systems were compromised by a stealer malware called RustyStealer.', '\"Ymir ransomware introduces a unique combination of technical features and tactics that enhance its effectiveness,\" Russian cybersecurity vendor Kaspersky said.\r\n\r\n\"Threat actors leveraged an unconventional blend of memory management functions – malloc, memmove, and memcmp – to execute malicious code directly in the memory. This approach deviates from the typical sequential execution flow seen in widespread ransomware types, enhancing its stealth capabilities.\"\r\n\r\nKaspersky said it observed the ransomware used in a cyber attack targeting an unnamed organization in Colombia, with the threat actors previously delivering the RustyStealer malware to gather corporate credentials.\r\n\r\nIt\'s believed that the stolen credentials were used to gain unauthorized access to the company\'s network in order to deploy the ransomware. While there typically exists a hand-off between an initial access broker and the ransomware crew, it\'s not clear if that\'s the case here.', 'visible', '2024-12-08 02:00:00'),
(6, 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjycLSqZ1iFtHdxFqsOr8EGd5W3D0kHnn5rLyLifKgk7zRNoqBIy8sG4QLz9xDDzpOTLsOVmHheDhZWuAlDabZ4sBVL7PUsLgSe6Td4HIriXwvIsSEIBb-YzqMcBsNpTK4cDZrbGUbwEE-Sq_U4ENvF2sBh6fUh21FAArEd9HaRjN1vXZPiJIbkTlcA7mU/s728-r', 'How to Plan a New (and Improved!) Password Policy for Real-World Security Challenges', 'Many organizations struggle with password policies that look strong on paper but fail in practice because they\'re too rigid to follow, too vague to enforce, or disconnected from real security needs. Some are so tedious and complex that employees post passwords on sticky notes under keyboards, monitors, or desk drawers', '1. Build compliant password practices#\r\nIs your organization in a regulated industry like healthcare, government, agriculture, or financial services? If so, one of your top priorities should be ensuring you adhere to your sector\'s password management rules. To ensure data security and privacy (and compliance), your organization must follow the password-focused standards that apply to your physical location and industry.\r\n     \r\n2. Review your existing password obligations#\r\nBefore drafting new password requirements, take stock of your existing obligations. If your organization is like many, you may find that you\'ve included password requirements in various business agreements, perhaps with inconsistent standards across documents.\r\n\r\n3. Create a policy based on real data#\r\nToo many organizations jump straight to setting rules without understanding their actual authentication challenges. Before crafting your new password policy, get a clear picture of your security situation. Perform a thorough Active Directory audit to uncover the reality of your environment — from outdated admin accounts to compromised passwords currently in use.', 'visible', '2024-12-02 06:00:00'),
(7, 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEioAwnrCuViuhL6FH4GWN2TPk463nmk-u4bU80a0dLJgrfrtWdn27J1LM_ZWFhW2dRGhCN7L1iEbIZ8nKGW_rJNokyWNHwIHGRvKW3-veIMbJadIOohCgn4_b-uF3LUa9V_DsOThqULxcmZKDpM488R4tjlJiWafR9XZGTMvfL2iJG8_X8gDrM6N9tg-CvA/s728-', 'A Guide to Securing AI App Development: Join This Cybersecurity Webinar', 'Artificial Intelligence (AI) is no longer a far-off dream—it\'s here, changing the way we live. From ordering coffee to diagnosing diseases, it\'s everywhere. But while you\'re creating the next big AI-powered app, hackers are already figuring out ways to break it.', 'Every AI app is an opportunity—and a potential risk. The stakes are huge: data leaks, downtime, and even safety threats if security isn\'t built in. With AI adoption moving fast, securing your projects is no longer optional—it\'s a must.\r\n\r\nJoin Liqian Lim, Senior Product Marketing Manager at Snyk, for an exclusive webinar that\'s all about securing the future of AI development. Titled \"Building Tomorrow, Securely: Securing the Use of AI in App Development \" this session will arm you with the knowledge and tools to tackle the challenges of AI-powered innovation.\r\n\r\nWhat You\'ll Learn:#\r\nGet AI-Ready: How to make your AI projects secure from the start.\r\nSpot Hidden Risks: Uncover threats you might not see coming.\r\nUnderstand the Market: Insights from real-world AI security data.\r\nBuild with Security: Easy ways to add protection to your Software Development Lifecycle (SDLC).\r\nPick the Right Tools: Expert tips for choosing tools to safeguard your AI apps.\r\nThis isn\'t just a webinar—it\'s your action plan for future-proofing your app development. Whether you\'re a developer, tech leader, or cybersecurity pro, you\'ll walk away with strategies you can use right away.', 'hidden', '2024-12-02 06:00:00'),
(8, 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEglOdCHSMyM_XPxwya0Yk9fvfbVZ7u97FZ2cwZLMCRlw2o2EZ5H4_-EzIDQ52CWFR8Wg7wmgz_cwKq3N_rtUlGU4PeQ1EAcCXYzbIvGLxp9t_qNQ0pyQIQLiaJ30JLDaEpbJUi081Tkn_l6OKHxQthlZZLqEw2omSJ6zarKfOlgkyHvz4PojwvP9DHDwjA/s728-r', 'Google\'s AI-Powered OSS-Fuzz Tool Finds 26 Vulnerabilities in Open-Source Projects', 'Google has revealed that its AI-powered fuzzing tool, OSS-Fuzz, has been used to help identify 26 vulnerabilities in various open-source code repositories, including a medium-severity flaw in the OpenSSL cryptographic library.', 'Google, which added the ability to leverage large language models (LLMs) to improve fuzzing coverage in OSS-Fuzz in August 2023, said the vulnerability has likely been present in the codebase for two decades and that it \"wouldn\'t have been discoverable with existing fuzz targets written by humans.\"\r\n\r\nFurthermore, the tech giant noted that the use of AI to generate fuzz targets has improved code coverage across 272 C/C++ projects, adding over 370,000 lines of new code.\r\n\r\n\"One reason that such bugs could remain undiscovered for so long is that line coverage is not a guarantee that a function is free of bugs,\" Google said. \"Code coverage as a metric isn\'t able to measure all possible code paths and states—different flags and configurations may trigger different behaviors, unearthing different bugs.\"\r\n\r\nThese AI-assisted vulnerability discoveries are also made possible by the fact that LLMs are proving to be adept at emulating a developer\'s fuzzing workflow, thereby allowing for more automation.\r\n\r\nThe development comes as the company revealed earlier this month that its LLM-based framework called Big Sleep facilitated the detection of a zero-day vulnerability in the SQLite open-source database engine.\r\n\r\nIn tandem, Google has been working towards transitioning its own codebases to memory-safe languages such as Rust, while also retrofitting mechanisms to address spatial memory safety vulnerabilities – which occur when it\'s possible for a piece of code to access memory that\'s outside of its intended bounds – within existing C++ projects, including Chrome.', 'hidden', '2024-12-03 09:00:00'),
(9, 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjXv44zhmUswskZlIcFC1E_N0ADtP3J5s__qk_PqPsCmAR4a8X0WNBXIU9u0XAxxOylPEY8wH_ohVBWzz4KlgbDVI21W6P_Y0juTzOYE5pX4XNWrhR-6P13ceozwxfo9Vrytlks8JMm76jV9JVqaiP5uxCiKPvFEJm8QAoPpABD6gNayh5HGjUWXdsZnVKs/s728-', 'Warning: Over 2,000 Palo Alto Networks Devices Hacked in Ongoing Attack Campaign', 'As many as 2,000 Palo Alto Networks devices are estimated to have been compromised as part of a campaign abusing the newly disclosed security flaws that have come under active exploitation in the wild.', 'According to statistics shared by the Shadowserver Foundation, a majority of the infections have been reported in the U.S. (554) and India (461), followed by Thailand (80), Mexico (48), Indonesia (43), Turkey (41), the U.K. (39), Peru (36), and South Africa (35).\r\n\r\nEarlier this week, Censys revealed that it had identified 13,324 publicly exposed next-generation firewall (NGFW) management interfaces, with 34% of these exposures located in the U.S. However, it\'s important to note that not all of these exposed hosts are necessarily vulnerable.\r\n       Palo Alto Networks, which is tracking the initial zero-day exploitation of the flaws under the name Operation Lunar Peek, said they are being weaponized to achieve command execution and drop malware, such as PHP-based web shells, on hacked firewalls.\r\n\r\nThe network security vendor has also warned that cyber attacks targeting the security flaws are likely to escalate following the availability of an exploit combining them.\r\n\r\nTo that end, it said it \"assesses with moderate to high confidence that a functional exploit chaining CVE-2024-0012 and CVE-2024-9474 is publicly available, which will enable broader threat activity.\"\r\n\r\nIt further noted that it has observed both manual and automated scanning activity, necessitating that users apply the latest fixes as soon as possible and secure access to the management interface as per recommended best practice deployment guidelines.', 'visible', '2024-12-10 09:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_accounts`
--

CREATE TABLE `user_accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_accounts`
--

INSERT INTO `user_accounts` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(21, 'Maryam', 'admin@admin.com', '123', '2024-12-04 15:56:23'),
(22, 'Farah', 'g@gmail.com', '123', '2024-12-04 15:56:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`articleid`);

--
-- Indexes for table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `articleid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_accounts`
--
ALTER TABLE `user_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
