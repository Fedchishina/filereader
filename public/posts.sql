-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 05 2017 г., 14:10
-- Версия сервера: 5.7.13
-- Версия PHP: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `posts`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) unsigned NOT NULL COMMENT 'первичный ключ',
  `name` varchar(80) NOT NULL COMMENT 'название категории',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'дата создания',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'дата последнего изменения'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='категории постов';

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'спорт', NULL, NULL),
(2, 'кулинария', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL COMMENT 'первичный ключ',
  `name` varchar(80) NOT NULL COMMENT 'название поста',
  `description` varchar(80) NOT NULL COMMENT 'описание поста',
  `content` text NOT NULL COMMENT 'контент поста',
  `category_id` int(11) unsigned NOT NULL COMMENT 'категория, к которой относится пост',
  `user_id` int(11) unsigned NOT NULL COMMENT 'пользователь, создавший пост',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'дата создания',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'дата последнего изменения'
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='посты';

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `name`, `description`, `content`, `category_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'о спорте', 'ываываывсывмым', 'выывавыавыаыва', 1, 1, NULL, NULL),
(2, 'кухня', 'кухня', 'кухня', 2, 2, NULL, NULL),
(3, 'тестовый курс', 'cfdgdfg', '<p>dfgdfg</p>\r\n', 1, 1, '2017-12-04 14:00:38', '2017-12-04 14:00:38'),
(4, 'тестовый курс', 'cfdgdfg', '<p>dfgdfg</p>\r\n', 1, 1, '2017-12-04 14:00:43', '2017-12-04 14:00:43'),
(5, 'sdasd', 'asdad', '<p>asdasd</p>\r\n', 1, 1, '2017-12-04 14:05:24', '2017-12-04 14:05:24'),
(6, 'sfdfs', 'sdfsdf', '<p>sdfsdf</p>\r\n', 1, 1, '2017-12-04 14:05:51', '2017-12-04 14:05:51'),
(7, 'dfgdfg', 'dfgdfg', '<p>dfgdfg</p>\r\n', 1, 1, '2017-12-04 14:07:16', '2017-12-04 14:07:16'),
(8, 'sdfsf', 'sdfsdf', '<p>sdfsdf</p>\r\n', 1, 1, '2017-12-04 14:10:04', '2017-12-04 14:10:04'),
(9, 'sdfsdf', 'sdfsf', '<p>sdfsdf</p>\r\n', 1, 1, '2017-12-04 14:11:00', '2017-12-04 14:11:00'),
(10, 'dfgdfg', 'dfgdg', '<p>dfgdfg</p>\r\n', 1, 1, '2017-12-04 14:13:26', '2017-12-04 14:13:26'),
(11, 'ffffffffffffff', 'fffffffffffff', '<p>ffffffffffffff</p>\r\n', 1, 1, '2017-12-04 14:13:42', '2017-12-04 14:13:42'),
(12, 'ddddddddd', 'dddddddd', '<p>dddddddd</p>\r\n', 1, 1, '2017-12-04 14:17:09', '2017-12-04 14:17:09'),
(13, 'cbcvb', 'cvbcvbcv', '<p>bcvb</p>\r\n', 1, 1, '2017-12-04 14:21:09', '2017-12-04 14:21:09'),
(14, 'sss', 'sss', '<p>sss</p>\r\n', 1, 1, '2017-12-04 14:28:39', '2017-12-04 14:28:39'),
(15, 'gffghfgh', 'fghfhfgh', '<p><img alt="" src="http://minionomaniya.ru/wp-content/uploads/2016/01/%D0%9A%D0%B5%D0%B2%D0%B8%D0%BD.jpg" style="height:100px; width:133px" />Привет)))</p>\r\n', 1, 1, '2017-12-04 14:36:45', '2017-12-04 14:36:45');

-- --------------------------------------------------------

--
-- Структура таблицы `posts_likes`
--

CREATE TABLE IF NOT EXISTS `posts_likes` (
  `id` int(11) NOT NULL COMMENT 'первичный ключ',
  `post_id` int(10) unsigned NOT NULL COMMENT 'ключ поста',
  `user_id` int(10) unsigned NOT NULL COMMENT 'ключ пользователя, поставившего лайк',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'дата создания',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'дата последнего изменения'
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='лайки постов';

--
-- Дамп данных таблицы `posts_likes`
--

INSERT INTO `posts_likes` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(10, 13, 1, '2017-12-05 09:44:23', '2017-12-05 09:44:23');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL COMMENT 'первичный ключ ',
  `name` varchar(80) NOT NULL COMMENT 'имя пользователя',
  `password` varchar(80) NOT NULL COMMENT 'пароль пользователя',
  `email` varchar(80) NOT NULL COMMENT 'email пользователя',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'дата создания',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'дата последнего изменения'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='пользователи сайта';

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `created_at`, `updated_at`) VALUES
(1, 'user', 'e10adc3949ba59abbe56e057f20f883e', 'user@user.ru', '2017-12-03 12:31:32', '2017-12-03 12:31:32'),
(2, ' 123', 'e10adc3949ba59abbe56e057f20f883e', 'user1@user.ru', '2017-12-03 13:04:02', '2017-12-03 13:04:02'),
(3, 'user555', 'e10adc3949ba59abbe56e057f20f883e', 'user555@user.ru', '2017-12-03 13:05:01', '2017-12-03 13:05:01'),
(4, '123ddd', 'e10adc3949ba59abbe56e057f20f883e', 'usedddr@user.ru', '2017-12-03 15:58:09', '2017-12-03 15:58:09');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `posts_likes`
--
ALTER TABLE `posts_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'первичный ключ',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'первичный ключ',AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT для таблицы `posts_likes`
--
ALTER TABLE `posts_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'первичный ключ',AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'первичный ключ ',AUTO_INCREMENT=5;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
