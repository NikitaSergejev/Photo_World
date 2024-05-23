-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 21 2024 г., 18:42
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `photo_world_jktv22`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `body_text` text NOT NULL,
  `postId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id`, `body_text`, `postId`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, 'красивая фотография', 7, 1, '2024-04-10 21:52:11', '2024-04-10 21:52:11'),
(2, 'красиво', 7, 1, '2024-04-13 13:06:53', '2024-04-13 13:06:53'),
(3, 'Красота', 19, 3, '2024-04-13 13:11:09', '2024-04-13 13:11:09');

-- --------------------------------------------------------

--
-- Структура таблицы `galery`
--

CREATE TABLE `galery` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `generId` int(11) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `galery`
--

INSERT INTO `galery` (`id`, `title`, `generId`, `description`, `image`, `userId`, `createdAt`, `updatedAt`) VALUES
(7, 'Пейзаж', 1, 'Лавандавое поле', 'landscape1.jpg', 1, '2023-12-04 11:21:27', '2023-12-04 11:21:27'),
(8, 'макрофото бабочки', 3, 'бабочка на цветке', 'macrofoto1.jpg', 3, '2023-12-04 12:07:29', '2023-12-04 12:07:29'),
(10, 'Лесной пейзаж ', 1, 'озеро, лес, горы.', 'landscape2.jpg', 2, '2023-12-04 12:09:28', '2023-12-04 12:09:28'),
(18, 'Пейзаж с горами и озером', 1, 'Док под пасмурным небом во время заката.', 'lakeWithMountains.jpg', 1, '2024-01-06 12:52:24', '2024-01-08 16:03:57'),
(19, 'Панорамная фотография зелёного поля', 1, 'Атмосферная фотография зелёного поля', 'greenAndBlue.jpg', 1, '2024-01-06 12:52:40', '2024-01-08 16:01:28');

-- --------------------------------------------------------

--
-- Структура таблицы `geners`
--

CREATE TABLE `geners` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `geners`
--

INSERT INTO `geners` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Пейзаж', '2023-12-04 10:40:19', '2023-12-04 10:40:19'),
(2, 'Портрет', '2023-12-04 10:40:19', '2023-12-04 10:40:19'),
(3, 'Макрофото', '2023-12-04 10:40:19', '2023-12-04 10:40:19');

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `title`, `description`, `image`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, 'Представлена вспышка Godox Lux Cadet Retro за $95', 'Новая вспышка Lux Cadet Retro от Godox выполнена в винтажном стиле и продолжает прошлогоднюю серию накамерных вспышек Lux Junior и Lux Senior. \r\nGodox Lux Cadet имеет ведущее число 10 при ISO 100 (28 мм) и оснащен неповоротной головкой вспышки. Цветовая температура Lux Cadet составляет 6200К (+/- 300К). Вспышка перезаряжается примерно за 2,5 секунды при полной мощности, а встроенная перезаряжаемая батарея обеспечивает около 620 срабатываний при максимальной яркости.\r\nЧто касается контроля экспозиции, то у Lux Cadet есть автоматический и ручной режимы, но без TTL. Мощность варьируется от 1/1 до 1/64, предлагая семь различных уровней. Вспышку можно синхронизировать через горячий башмак или с помощью прилагаемого кабеля синхронизации.', 'Photowebexpo-retrovspishka-Godox-Lux-Cadet-0.jpg', 1, '2023-11-30 10:41:17', '2023-12-04 11:03:31'),
(2, 'PTZ-камера OBSBOT Tail Air на базе ИИ', 'PTZ-камеры стремительно набирают популярность не только в профессиональном сегменте, но среди блогеров для проведения прямых трансляций. PTZ – это аббревиатура от Pan-tilt-zoom, то есть панорамирование, наклон и зум. Традиционно камеры PTZ-систем управляются оператором, однако в наш век искусственного интеллекта появляются автоматические, именно такую камеру представила компания OBSBOT – Tail Air с разрешением 4K, особенностью которой являются множество автоматических функций работы. \r\nИнтересно, что OBSBOT – это название компании, а не “бот для OBS”, как можно было бы предположить, хотя… возможно, именно этим вдохновлялись создатели бренда. Камера Tail Air имеет разрешение 4K, размер пикселя 2 мкм, что в связке с диафрагмой f/1,8 обещает хорошую работу в условиях низкой освещённости. В оптической схеме объектива 8 качественных линз.\r\n\r\nПроизводители буквально в каждой строчке подчёркивают функции ИИ в камере, разработанные специально для потоковой передачи.\r\n\r\nВо-первых, это функция отслеживания, которая способна отслеживать людей, домашних животных и другие движущиеся объекты, в том числе позволяет одновременно отслеживать несколько объектов.\r\nВо-вторых, это технология TOF (Time of Flight) которая измеряет расстояние между камерой и объектом съёмки для эффективной фокусировки.\r\nВо-третьих, это инструмент AI Director Grids, который создаёт различные ракурсы, имитируя съёмку с нескольких камер. Несмотря на то, что съёмка с нескольких камер на то и называется с НЕСКОЛЬКИХ, что позволяет показывать зрителю актёров или предметы с разных точек зрения, а не кроп одной и той же картинки, тем не менее, инструмент интересный.\r\nВ-четвёртых, это технология передачи данных с малой задержкой NDI|HX3. OBSBOT Tail Air имеет встроенные порты Wi-Fi и Ethernet, USB-C, Micro HDMI и функцию PoE (питание через Ethernet), интегрируясь таким образом практически в любой сетап.\r\nВ-пятых, это система управления жестами Gesture Control 2.0, которая позволяет блогеру самостоятельно управлять устройством при помощи жестов пальцев и кистей рук.\r\nВ-шестых, это приложение OBSBOT Start для потоковой передачи, которое способно работать со всеми популярными платформами, в том числе с несколькими камерами Tail Air одновременно. Заявлена поддержка YouTube, OBS (кто бы сомневался) и ещё нескольких запрещённых в нашей стране сервисов.', 'OBSBOT-Tail-Air_01.jpg', 1, '2023-12-04 11:03:31', '2023-12-04 11:03:31'),
(3, 'Технология внутрикамерной аутентификации Sony прошла испытания в агентстве AP', 'Sony и Associated Press (AP) завершили тестирование передовой технологии проверки подлинности в камере, обещая остановить волну фейковых изображений и обеспечить фотографов инструментарием, подтверждающим достоверность файлов.\r\n\r\nВ условиях быстрого совершенствования технологий искусственного интеллекта (ИИ) потребность в инструментах проверки подлинности контента актуальна как никогда. Хотя Sony присоединилась к Коалиции по вычислению аутентичности контента (C2PA) в прошлом году, переход к практическим улучшениям в способах \r\nаутентификации и проверки контента пользователями занял некоторое время.\r\nПосле обширного тестирования, которое продолжается, AP, которое с 2020 года снабжает своих фотографов исключительно оборудованием Sony, и Sony работали вместе, чтобы добиться того, что называется «значительным прогрессом в решении проблемы аутентичности контента».\r\n\r\nРешение Sony создает цифровую подпись во время съемки, и, в отличие от Leica M11-P, решение Sony проблемы «фейковых новостей» не требует специального оборудования внутри камер. Существующие камеры, такие как Sony α1 и α7S III, будут поддерживать встроенную подпись и аутентификацию C2PA наряду с будущей Sony α9 III, которая станет новой камерой, привлекательной для многих фотожурналистов. \r\nБлагодаря внедрению новой технологии аутентификации при фотосъемке создается неразрывная цифровая цепочка, гарантирующая, что новостные агентства и люди, которых они обслуживают, смогут увидеть, является ли изображение, на которое они смотрят, подлинным или измененным.', 'Photowebexpo-autentifikacii-Sony-proshla-ispitaniya-v-agentstve.jpg', 1, '2023-11-23 10:41:17', '2023-12-04 11:03:31');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `avatarUrl` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `avatarUrl`, `role`, `createdAt`, `updatedAt`) VALUES
(1, 'admin', 'admin@ee.ee', '$2b$10$W2mu7OcuLkXGUQEGlYKB/OdvREGDb9FoxW9/u9SwIUX1GUJbQVy7.', 'https://cdn-icons-png.flaticon.com/128/2202/2202112.png', 'admin', '2023-12-04 09:34:49', '2023-12-04 09:34:49'),
(2, 'pupil', 'pupil@ee.ee', '$2b$10$W2mu7OcuLkXGUQEGlYKB/OdvREGDb9FoxW9/u9SwIUX1GUJbQVy7.', 'https://cdn-icons-png.flaticon.com/128/4333/4333609.png', 'user', '2023-12-04 09:34:49', '2023-12-04 09:34:49'),
(3, 'Ivan', 'user@ee.ee', '$2b$10$W2mu7OcuLkXGUQEGlYKB/OdvREGDb9FoxW9/u9SwIUX1GUJbQVy7.', 'https://cdn-icons-png.flaticon.com/128/149/149071.png', 'user', '2023-12-04 09:38:12', '2023-12-04 09:38:12'),
(4, 'Nikita', 'test@ee.ee', '$2b$10$W2mu7OcuLkXGUQEGlYKB/OdvREGDb9FoxW9/u9SwIUX1GUJbQVy7.', 'https://cdn-icons-png.flaticon.com/128/149/149071.png', 'user', '2023-12-05 08:57:13', '2023-12-05 08:57:13'),
(5, 'test', 'test@ee.ee', '$2b$10$X0SHLq26MfJ9ra3QbxNi3uJTTnBQ5FEcdy/nGARkWdihddB47j/uO', '', 'user', '2023-12-19 08:30:33', '2023-12-19 08:30:33');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postId` (`postId`),
  ADD KEY `userId` (`userId`);

--
-- Индексы таблицы `galery`
--
ALTER TABLE `galery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galery_geners` (`generId`),
  ADD KEY `galery_users` (`userId`) USING BTREE;

--
-- Индексы таблицы `geners`
--
ALTER TABLE `geners`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_users` (`userId`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `galery`
--
ALTER TABLE `galery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `geners`
--
ALTER TABLE `geners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`postId`) REFERENCES `galery` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `galery`
--
ALTER TABLE `galery`
  ADD CONSTRAINT `galery_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `galery_ibfk_2` FOREIGN KEY (`generId`) REFERENCES `geners` (`id`);

--
-- Ограничения внешнего ключа таблицы `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
