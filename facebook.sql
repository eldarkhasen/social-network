-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Сен 08 2016 г., 07:32
-- Версия сервера: 10.1.13-MariaDB
-- Версия PHP: 5.5.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `facebook`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `cities`
--

INSERT INTO `cities` (`id`, `country_id`, `name`) VALUES
(1, 1, 'Almaty'),
(2, 1, 'Astana'),
(3, 1, 'Taldykorgan'),
(4, 1, 'Taraz');

-- --------------------------------------------------------

--
-- Структура таблицы `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `countries`
--

INSERT INTO `countries` (`id`, `name`) VALUES
(1, 'Kazakhstan'),
(2, 'Russia'),
(3, 'USA'),
(4, 'Canada'),
(5, 'UK'),
(6, 'Kyrgyzstan'),
(7, 'Austria'),
(8, 'Australia'),
(9, 'Germany'),
(10, 'France'),
(11, 'Italy'),
(12, 'Portugal'),
(13, 'Spain'),
(14, 'China');

-- --------------------------------------------------------

--
-- Структура таблицы `friends`
--

CREATE TABLE `friends` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `friends`
--

INSERT INTO `friends` (`id`, `user_id`, `friend_id`) VALUES
(55, 12, 13),
(56, 13, 12),
(57, 14, 12),
(58, 12, 14),
(59, 12, 16),
(60, 16, 12);

-- --------------------------------------------------------

--
-- Структура таблицы `friend_requests`
--

CREATE TABLE `friend_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `sent_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`) VALUES
(35, 13, 6),
(36, 13, 20),
(37, 12, 20);

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `message` varchar(250) NOT NULL,
  `readen` int(1) NOT NULL,
  `user_deleted` int(1) NOT NULL,
  `sender_deleted` int(1) NOT NULL,
  `sent_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `friends_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `sender_id`, `message`, `readen`, `user_deleted`, `sender_deleted`, `sent_date`, `friends_id`) VALUES
(23, 12, 13, 'lol', 1, 0, 0, '2016-08-24 06:04:11', 0),
(24, 13, 12, 'hello!', 1, 0, 0, '2016-08-24 06:04:30', 0),
(25, 13, 12, 'jiberdim', 0, 0, 0, '2016-08-26 11:04:31', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `email`, `active`) VALUES
(12, 'Eldar', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'eldar@bitlab.kz', 1),
(13, 'Ernar', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Ernar@gmail.com', 1),
(14, 'phone', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'phone@mail.ru', 1),
(15, 'Bolat', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Bolat@mail.ru', 1),
(16, 'qwerty', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'qwerty@mail.ru', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user_pictures`
--

CREATE TABLE `user_pictures` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_avatar` int(1) NOT NULL,
  `active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `user_pictures`
--

INSERT INTO `user_pictures` (`id`, `user_id`, `url`, `post_date`, `is_avatar`, `active`) VALUES
(22, 13, 'img/9260e944fa2aaadfe51a73af779a741239bf22e7.jpeg', '2016-08-17 13:11:34', 0, 0),
(23, 13, 'img/a9bef4a22df5782df53223b07a65930d0f6e264c.jpeg', '2016-08-17 12:43:43', 0, 0),
(24, 13, 'img/db409c1d3acc980b63338f6941aaa6aba4a9df66.jpeg', '2016-08-17 16:28:11', 1, 1),
(25, 13, 'img/7f31157fa6b9ce4ff6504214f2bf1b6431c3b848.jpeg', '2016-08-17 13:16:03', 0, 1),
(26, 13, 'img/bb02c36ce176c9526a89a7205f2bf3b28e272ee7.jpeg', '2016-08-17 16:28:11', 0, 1),
(27, 12, 'img/4cdc7d93481c0575487d55fd5d74f206dd008eab.jpeg', '2016-08-18 16:57:32', 0, 0),
(28, 12, 'img/0a2c66ddb5e00b2cb41faeeee807d2319990abc3.jpeg', '2016-08-18 05:21:03', 0, 0),
(29, 14, 'img/f9cce24ef5a74e998667cafc03bcc67d9bad0746.jpeg', '2016-08-18 05:12:47', 1, 0),
(30, 12, 'img/c70dfb07dc67c9dd6a8bc01130acf68d1fbf035f.jpeg', '2016-08-18 05:20:42', 0, 0),
(31, 12, 'img/af18806c15d58534fa6cfebcdbe29a54842bf1ba.jpeg', '2016-08-26 11:37:06', 0, 1),
(32, 12, 'img/dd08f520504c4eca2c9745321b26c6f00b679e2c.jpeg', '2016-08-26 11:37:06', 1, 1),
(33, 15, 'img/92225dcb7d0ee55ac6a9069a8a09dc97d247b2f7.jpeg', '2016-08-18 16:55:25', 0, 0),
(34, 15, 'img/7d45b10fd6511cec0aa5dc595766526970a617a8.jpeg', '2016-08-18 16:55:15', 0, 1),
(35, 15, 'img/5db36d30fb0039bb681e96c65660b9b473fc1791.jpeg', '2016-08-18 16:55:25', 1, 1),
(36, 16, 'img/ffe05f041211f1d2b427d6789521eddf91ebad5f.jpeg', '2016-08-23 08:54:34', 0, 0),
(37, 16, 'img/4e09628da925a6d474f1700841b7fdba51d53090.jpeg', '2016-08-23 08:54:34', 1, 1),
(38, 16, 'img/34c0ed704be66e9c03b6d2b796f6807cbfb9b5e4.jpeg', '2016-08-23 08:53:40', 0, 1),
(39, 12, 'img/eeb1057ac8044e8292f0fb97a96e78c575447c95.jpeg', '2016-09-05 05:39:20', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user_profile`
--

CREATE TABLE `user_profile` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `surname` varchar(40) NOT NULL,
  `birth_date` datetime NOT NULL,
  `country_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `age` int(4) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `avatar_url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `user_profile`
--

INSERT INTO `user_profile` (`id`, `user_id`, `name`, `surname`, `birth_date`, `country_id`, `city_id`, `age`, `gender`, `avatar_url`) VALUES
(2, 12, 'Eldar', 'Khasen', '1998-02-05 00:00:00', 1, 1, 18, 'male', 'img/dd08f520504c4eca2c9745321b26c6f00b679e2c.jpeg'),
(3, 13, 'Ernar', 'Khasen', '2003-07-02 00:00:00', 1, 3, 13, 'male', 'img/db409c1d3acc980b63338f6941aaa6aba4a9df66.jpeg'),
(4, 14, 'Ernar', 'Phone', '2009-03-08 00:00:00', 1, 2, 7, 'male', 'img/f9cce24ef5a74e998667cafc03bcc67d9bad0746.jpeg'),
(5, 15, 'Bolat', 'Shayahmetov', '1998-10-17 00:00:00', 1, 1, 17, 'male', 'img/5db36d30fb0039bb681e96c65660b9b473fc1791.jpeg'),
(6, 16, 'Qwerty', 'Qwerty', '1960-07-11 00:00:00', 1, 2, 56, 'male', 'img/4e09628da925a6d474f1700841b7fdba51d53090.jpeg');

-- --------------------------------------------------------

--
-- Структура таблицы `user_status`
--

CREATE TABLE `user_status` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `user_status`
--

INSERT INTO `user_status` (`id`, `user_id`, `status_value`) VALUES
(7, 13, 'Heeey LOL\r\n'),
(8, 12, ')))\r\n'),
(9, 14, 'status'),
(10, 15, 'Ð­Ñ‚Ð¾ ÑÑ‚Ð°Ñ‚ÑƒÑ\r\n'),
(11, 16, 'qwertyuio');

-- --------------------------------------------------------

--
-- Структура таблицы `walls`
--

CREATE TABLE `walls` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_text` varchar(255) NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` int(1) NOT NULL,
  `like_value` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `walls`
--

INSERT INTO `walls` (`id`, `user_id`, `post_text`, `post_date`, `active`, `like_value`) VALUES
(2, 13, 'Hey This is second post', '2016-08-17 16:55:00', 0, 0),
(3, 13, 'Hey THis is 3 post', '2016-08-17 16:54:57', 0, 0),
(4, 13, 'edited', '2016-08-17 16:54:52', 0, 0),
(5, 12, 'Hello,people! This is my edited post!', '2016-08-26 08:53:19', 1, 1),
(6, 13, 'HEEEEY! THIS IS MY FIRST POST!', '2016-09-02 10:02:45', 0, 1),
(7, 15, 'Ð¸Ð·Ð¼ÐµÐ½ÐµÐ½Ð½Ñ‹Ð¹ Ð¿Ð¾Ð¾Ð¾ÑÑ‚!!!', '2016-08-18 16:56:17', 1, 0),
(8, 16, 'THis ', '2016-08-23 08:53:02', 1, 0),
(9, 12, 'second post edit!', '2016-08-26 09:01:52', 0, 1),
(10, 12, 'new post!', '2016-08-26 09:12:13', 0, 1),
(11, 12, 'what??', '2016-08-26 09:18:53', 0, 1),
(12, 12, 'psot\r\n', '2016-08-26 09:19:00', 1, 1),
(13, 12, 'asdf', '2016-08-26 10:33:37', 0, 1),
(14, 12, 'lol', '2016-08-26 10:46:57', 0, 1),
(15, 12, 'qwer', '2016-08-26 10:46:05', 0, 1),
(16, 12, 'whooooch!!!!???', '2016-08-26 10:49:07', 1, 1),
(17, 12, 'asdf', '2016-08-26 10:59:58', 1, 1),
(18, 12, 'asdf', '2016-08-26 11:02:06', 1, 1),
(19, 12, 'what', '2016-08-26 11:35:48', 1, 1),
(20, 13, 'HEEEEEY!!!!!!!', '2016-09-02 10:03:39', 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `wall_comments`
--

CREATE TABLE `wall_comments` (
  `id` int(11) NOT NULL,
  `wall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` varchar(250) NOT NULL,
  `comment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `wall_comments`
--

INSERT INTO `wall_comments` (`id`, `wall_id`, `user_id`, `comment`, `comment_date`, `active`) VALUES
(9, 4, 13, 'lol', '2016-08-17 16:21:54', 1),
(10, 6, 12, 'wow', '2016-08-18 10:26:49', 1),
(11, 6, 12, 'this is my comment', '2016-08-18 10:37:04', 1),
(12, 7, 15, 'Ð­Ñ‚Ð¾ ÐºÐ¾Ð¼Ð¼ÐµÐ½Ñ‚', '2016-08-18 16:56:04', 1),
(13, 6, 15, 'ÐšÐ¾Ð¼Ð¼ÐµÐ½Ñ‚!', '2016-08-18 16:56:46', 1),
(14, 8, 16, 'comment!!', '2016-08-23 08:53:12', 1),
(15, 18, 12, 'asdfgh', '2016-08-26 11:36:13', 1),
(16, 20, 12, 'COmment!', '2016-09-05 05:38:43', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_pictures`
--
ALTER TABLE `user_pictures`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_status`
--
ALTER TABLE `user_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `walls`
--
ALTER TABLE `walls`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `wall_comments`
--
ALTER TABLE `wall_comments`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT для таблицы `friend_requests`
--
ALTER TABLE `friend_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `user_pictures`
--
ALTER TABLE `user_pictures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT для таблицы `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `user_status`
--
ALTER TABLE `user_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `walls`
--
ALTER TABLE `walls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT для таблицы `wall_comments`
--
ALTER TABLE `wall_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
