-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 21 2019 г., 17:27
-- Версия сервера: 5.7.19
-- Версия PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `myblog`
--
CREATE DATABASE IF NOT EXISTS `myblog` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `myblog`;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Программирование', 'programmirovanie', '2019-05-14 03:39:22', '2019-05-14 03:39:22'),
(2, 'Вёрстка', 'verstka', '2019-05-14 03:39:38', '2019-05-14 03:39:38'),
(3, 'Дизайн', 'dizayn', '2019-05-14 03:39:48', '2019-05-14 03:39:48'),
(4, 'Города', 'goroda', '2019-05-14 03:40:01', '2019-05-14 03:40:01');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `text`, `user_id`, `post_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Пишите если будут вопросы', 1, 10, 1, '2019-05-14 05:22:56', '2019-05-14 05:23:03'),
(2, 'Хорошо. Будем писать.', 2, 10, 1, '2019-05-14 05:42:46', '2019-05-14 05:43:13');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(17, '2014_10_12_000000_create_users_table', 1),
(18, '2014_10_12_100000_create_password_resets_table', 1),
(19, '2019_05_05_180143_create_categories_table', 1),
(20, '2019_05_05_182238_create_tags_table', 1),
(21, '2019_05_05_182353_create_comments_table', 1),
(22, '2019_05_05_182429_create_posts_table', 1),
(23, '2019_05_05_182512_create_subscriptions_table', 1),
(24, '2019_05_05_183600_create_posts_tags_table', 1),
(25, '2019_05_10_190807_add_avatar_column_to_users', 2),
(26, '2019_05_10_200349_make_password_nullable', 3),
(27, '2019_05_12_140926_add_date_to_post', 4),
(28, '2019_05_12_142912_add_image_to_post', 5),
(29, '2019_05_12_170613_add_description_to_posts', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0',
  `is_featured` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `date` date DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `content`, `category_id`, `user_id`, `status`, `views`, `is_featured`, `created_at`, `updated_at`, `date`, `image`, `description`) VALUES
(1, 'Статья PHP', 'statya-php', '<p>Язык PHP специально предназначен для веб-программирования. PHP сочетает достоинства языков C и Perl и при этом весьма прост в изучении и обладает значительными преимуществами перед традиционными языками программирования.</p>\r\n\r\n<p>Синтаксис PHP очень напоминает синтаксис языка C и во многом заимствован из таких языков как Java и Perl.</p>\r\n\r\n<p>Программист С очень быстро освоит язык PHP и сможет использовать его с максимальной эффективностью.<br />\r\nВ принципе, в PHP есть практически все операторы и функции, имеющиеся в стандартном GNU С (или их аналоги), например есть циклы (while, for), операторы выбора (if, switch), функции работы с файловой системой и процессами (fopen, *dir, stat, unlink, popen, exec), функции ввода-вывода (fgets,fputs,printf) и множество других...</p>\r\n\r\n<p>Цель данного раздела - краткое ознакомление с основами синтаксиса языка PHP. Более подробную информацию по конкретным составляющим синтаксиса PHP вы найдете в соответствующих разделах.</p>', 1, 1, 1, 0, 0, '2019-05-14 03:50:14', '2019-05-14 04:56:38', '2019-04-18', 'VEsKkz8T6N.jpeg', '<p>Язык PHP специально предназначен для веб-программирования.</p>'),
(2, 'Статья Laravel', 'statya-laravel', '<p>В Laravel каждое уведомление представлено одним классом (обычно хранящимся в папке <kbd>app/Notifications</kbd>). Если у вас в приложении нет такой папки &mdash; не беда, она будет создана для вас при выполнении Artisan-команды <code>make:notification</code>:</p>\r\n\r\n<pre>\r\nphp artisan make:notification InvoicePaid\r\n</pre>\r\n\r\n<p>Эта команда поместит новый класс уведомления в папку <kbd>app/Notifications</kbd>. Класс каждого уведомления содержит метод <code>via()</code> и разное число методов создания сообщения (таких как <code>toMail()</code> и <code>toDatabase()</code>), которые конвертируют уведомление в сообщение, оптимизированное под определённый канал.</p>\r\n\r\n<p>&nbsp;</p>', 1, 1, 1, 11, 0, '2019-05-14 03:56:05', '2019-05-14 03:56:05', '2019-05-01', 'j6OzcQfhc2.jpeg', '<p>В Laravel каждое уведомление представлено одним классом</p>'),
(3, 'Статья MySQL', 'statya-mysql', '<p>База данных MySQL &mdash; это самая популярная в мире база данных с открытым кодом. Благодаря своей проверенной производительности, надежности и простоте использования база данных MySQL наиболее часто используется для веб-приложений на таких ресурсах, как Facebook, Twitter, YouTube и все пять из пяти лучших веб-сайтов*. Кроме того, ее особенно часто выбирают в качестве встроенной базы данных, распространяемой тысячами поставщиков программного обеспечения и производителей оборудования.</p>', 1, 1, 1, 0, 1, '2019-05-14 03:59:58', '2019-05-14 03:59:58', '2019-04-24', 'QJoiqUkG27.jpeg', '<p>База данных MySQL &mdash; это самая популярная в мире база данных с открытым кодом.</p>\r\n\r\n<div class=\"s3gt_translate_tooltip_mini_box\" id=\"s3gt_translate_tooltip_mini\" is_mini=\"true\" style=\"background: initial !important; border: initial !important; border-radius: initial !important; border-spacing: initial !important; border-collapse: initial !important; direction: ltr !important; flex-direction: initial !important; font-weight: initial !important; height: initial !important; letter-spacing: initial !important; min-width: initial !important; max-width: initial !important; min-height: initial !important; max-height: initial !important; margin: auto !important; outline: initial !important; padding: initial !important; position: absolute; table-layout: initial !important; text-align: initial !important; text-shadow: initial !important; width: initial !important; word-break: initial !important; word-spacing: initial !important; overflow-wrap: initial !important; box-sizing: initial !important; display: initial !important; color: inherit !important; font-size: 13px !important; font-family: X-LocaleSpecific, sans-serif, Tahoma, Helvetica !important; line-height: 13px !important; vertical-align: top !important; white-space: inherit !important; left: 1092px; top: 35px; opacity: 0.75;\">\r\n<div class=\"s3gt_translate_tooltip_mini\" id=\"s3gt_translate_tooltip_mini_logo\" title=\"Перевести выделенный фрагмент\">&nbsp;</div>\r\n\r\n<div class=\"s3gt_translate_tooltip_mini\" id=\"s3gt_translate_tooltip_mini_sound\" title=\"Прослушать\" title_play=\"Прослушать\" title_stop=\"Остановить\">&nbsp;</div>\r\n\r\n<div class=\"s3gt_translate_tooltip_mini\" id=\"s3gt_translate_tooltip_mini_copy\" title=\"Скопировать текст в буфер обмена\">&nbsp;</div>\r\n</div>\r\n<link href=\"moz-extension://a3173e34-376d-4282-a6cb-b16f4275c2b5/skin/s3gt_tooltip_mini.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n<style media=\"print\" type=\"text/css\">#s3gt_translate_tooltip_mini { display: none !important; }\r\n</style>'),
(4, 'Статья vue js', 'statya-vue-js', '<p>Vue (произносится /vjuː/, примерно как <strong>view</strong>) &mdash; это <strong>прогрессивный фреймворк</strong> для создания пользовательских интерфейсов. В отличие от фреймворков-монолитов, Vue создан пригодным для постепенного внедрения. Его ядро в первую очередь решает задачи уровня представления (view), что упрощает интеграцию с другими библиотеками и существующими проектами. С другой стороны, Vue полностью подходит и для создания сложных одностраничных приложений (SPA, Single-Page Applications), если использовать его совместно с <a href=\"https://ru.vuejs.org/v2/guide/single-file-components.html\">современными инструментами</a> и <a href=\"https://github.com/vuejs/awesome-vue#components--libraries\" target=\"_blank\">дополнительными библиотеками</a>.</p>', 2, 1, 1, 865, 1, '2019-05-14 04:03:54', '2019-05-14 04:31:18', '2019-03-05', 'EkBAbZUfRa.jpeg', '<p>Vue &mdash; это фреймворк для создания пользовательских интерфейсов.</p>'),
(5, 'Статья HTML', 'statya-html', '<p>HTML (от англ. HyperText Markup Language &mdash; &laquo;язык гипертекстовой разметки&raquo;) &mdash; стандартизированный язык разметки документов во Всемирной паутине. Большинство веб-страниц содержат описание разметки на языке HTML (или XHTML). Язык HTML интерпретируется браузерами; полученный в результате интерпретации форматированный текст отображается на экране монитора компьютера или мобильного устройства.</p>\r\n\r\n<p>Язык HTML до 5-й версии определялся как приложение SGML (стандартного обобщённого языка разметки по стандарту ISO 8879). Спецификации HTML5 формулируются в терминах DOM (объектной модели документа).</p>\r\n\r\n<p>Язык XHTML является более строгим вариантом HTML, он следует синтаксису XML и является приложением языка XML в области разметки гипертекста.</p>\r\n\r\n<p>Во всемирной паутине HTML-страницы, как правило, передаются браузерам от сервера по протоколам HTTP или HTTPS, в виде простого текста или с использованием шифрования.</p>', 2, 1, 1, 0, 0, '2019-05-14 04:07:22', '2019-05-14 04:07:23', '2019-04-17', '0lAQSkDiUi.jpeg', '<p>HTML &mdash; стандартизированный язык разметки документов во Всемирной паутине.</p>'),
(6, 'Статья Corel', 'statya-corel', '<p><strong>CorelDRAW</strong>&nbsp;&mdash; графический редактор векторной графики, разработанный канадской корпорацией Corel.</p>\r\n\r\n<p>В пакет CorelDRAW также входит редактор растровой графики Corel Photo-Paint и другие программы&nbsp;&mdash; например, для захвата изображений с экрана&nbsp;&mdash; Corel Capture. Программа векторизации растровой графики Corel Trace до 12 версии входила в пакет как самостоятельная программа.</p>', 3, 1, 1, 0, 1, '2019-05-14 04:11:39', '2019-05-14 04:30:52', '2019-04-08', '9gk9ixVgEi.jpeg', '<p><strong>CorelDRAW</strong>&nbsp;&mdash; графический редактор векторной графики.</p>'),
(7, 'Статья Photoshop', 'statya-photoshop', '<p><strong>Adobe Photoshop</strong> &mdash; многофункциональный графический редактор, разработанный и распространяемый фирмой Adobe Systems. В основном работает с растровыми изображениями, однако имеет некоторые векторные инструменты. Продукт является лидером рынка в области коммерческих средств редактирования растровых изображений и наиболее известным продуктом фирмы Adobe.</p>', 3, 1, 1, 498, 0, '2019-05-14 04:13:11', '2019-05-14 04:13:11', '2019-04-01', 'T6ZI2SPu3Q.jpeg', '<p><strong>Adobe Photoshop</strong> &mdash; многофункциональный графический редактор.</p>'),
(8, 'Статья 1', 'statya-1', '<p>Венеция (итал. Venezia [veˈnɛttsia] Информация о файле слушать, вен. Venesia) &mdash; город на северо-востоке Италии. Административный центр области Венеция и провинции Венеция. Образует коммуну, разделённую на 6 самоуправляемых районов. Покровителем города считается апостол Марк, евангелист, чьи мощи хранятся здесь же в Соборе Св. Марка, в связи с чем в город всегда приезжало много паломников-христиан со всего мира.</p>\r\n\r\n<p>Население &mdash; 261 905 человек (31 декабря 2016 года)[1]. Расположена на материке (после объединения с городом Местре в 1926 году) и 118 островах Венецианской лагуны Адриатического моря. Подвержена осенним наводнениям от нагонной волны со стороны моря.</p>', 4, 1, 1, 0, 1, '2019-05-14 04:22:28', '2019-05-14 04:30:27', '2019-05-01', 'WukN10EMFP.jpeg', '<p>Венеция &mdash; это город расположенный на северо-востоке Италии.</p>'),
(9, 'Статья 2', 'statya-2', '<p>Кня́жество Мона́ко (фр. Principaut&eacute; de Monaco, монег. Principatu de M&ugrave;negu) &mdash; карликовое государство, ассоциированное с Францией, расположенное на юге Европы на берегу Лигурийского моря; на суше граничит с Францией[7]. Является одной из самых маленьких и наиболее густонаселённых стран мира. Княжество широко известно благодаря казино в Монте-Карло и проводимому здесь этапу чемпионата Формулы-1 &mdash; &laquo;Гран-при Монако&raquo;.</p>', 4, 1, 1, 0, 1, '2019-05-14 04:23:51', '2019-05-14 04:23:51', '2019-04-30', 'f3sdQjbxkp.jpeg', '<p>Кня́жество Мона́ко (фр. Principaut&eacute; de Monaco, монег. Principatu de M&ugrave;negu).</p>'),
(10, 'Статья 3', 'statya-3', '<p>Столица &mdash; город Афины. Государственный язык &mdash; греческий.</p>\r\n\r\n<p>Унитарная, парламентская республика. В марте 2015 года пост президента занял Прокопис Павлопулос. Подразделяется на 13 регионов.</p>\r\n\r\n<p>Страна расположена на Балканском полуострове и многочисленных островах. Омывается Эгейским (включая Икарийское и Фракийское моря) морем на востоке, Ионическим на западе, на юге &mdash; Средиземным и Критским морями.</p>', 4, 1, 1, 987, 0, '2019-05-14 04:25:14', '2019-05-14 04:25:14', '2019-04-16', '5d8vd5zNkR.jpeg', '<p>Столица &mdash; город Афины. Государственный язык &mdash; греческий.</p>'),
(11, 'Статья 4', 'statya-4', '<p>Нью-Йорк включает пять административных округов (районов, боро): Бронкс, Бруклин, Куинс, Манхэттен и Статен-Айленд. Основные достопримечательности расположены в боро Манхэттен. Среди них: исторические небоскрёбы (Эмпайр-стейт-билдинг, Крайслер-билдинг), Рокфеллеровский центр, Вулворт-билдинг, художественный Метрополитен-музей, Метрополитен-опера, Карнеги-холл, Музей Соломона Гуггенхайма (живопись), Американский музей естественной истории (скелеты динозавров и планетарий), отель &laquo;Плаза&raquo;, отель &laquo;Уолдорф-Астория&raquo;, отель &laquo;Челси&raquo;, штаб-квартира ООН, Гарлем.</p>', 4, 1, 1, 0, 0, '2019-05-14 04:26:37', '2019-05-14 04:26:37', '2019-05-05', 'E1XfzTUPUe.jpeg', '<p>Нью-Йорк включает пять административных округов.</p>');

-- --------------------------------------------------------

--
-- Структура таблицы `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `post_tags`
--

INSERT INTO `post_tags` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 3, NULL, NULL),
(3, 2, 1, NULL, NULL),
(4, 2, 2, NULL, NULL),
(5, 3, 3, NULL, NULL),
(6, 4, 4, NULL, NULL),
(7, 4, 5, NULL, NULL),
(8, 5, 4, NULL, NULL),
(9, 6, 6, NULL, NULL),
(10, 7, 7, NULL, NULL),
(11, 8, 8, NULL, NULL),
(12, 8, 9, NULL, NULL),
(13, 9, 8, NULL, NULL),
(14, 9, 9, NULL, NULL),
(15, 10, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'php', 'php', '2019-05-14 03:40:20', '2019-05-14 03:40:20'),
(2, 'laravel', 'laravel', '2019-05-14 03:40:27', '2019-05-14 03:40:27'),
(3, 'mysql', 'mysql', '2019-05-14 03:40:34', '2019-05-14 03:40:34'),
(4, 'html', 'html', '2019-05-14 03:40:48', '2019-05-14 03:40:48'),
(5, 'css', 'css', '2019-05-14 03:40:52', '2019-05-14 03:40:52'),
(6, 'coreldraw', 'coreldraw', '2019-05-14 03:41:18', '2019-05-14 03:41:18'),
(7, 'photoshop', 'photoshop', '2019-05-14 03:41:36', '2019-05-14 03:41:36'),
(8, 'путешевствия', 'puteshevstviya', '2019-05-14 03:41:58', '2019-05-14 03:41:58'),
(9, 'развлечения', 'razvlecheniya', '2019-05-14 03:42:18', '2019-05-14 03:42:18');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_admin`, `status`, `remember_token`, `created_at`, `updated_at`, `avatar`) VALUES
(1, 'Артём', 'kopitnik_artyom@mail.ru', NULL, '$2y$10$wkU3uEuPJdY8RP9QUxPGkulOWTWJTbmFyWLs6cs6bo2FNoaaNfCj.', 1, 0, NULL, '2019-05-14 03:37:11', '2019-05-14 05:25:51', 'k7WwtpS2nS.jpeg'),
(2, 'Витя', 'test@mail.ru', NULL, '$2y$10$vl.DfP6Mk7QKFzkCN96Yk.8KgW8ve.Q8ZV7teRcXtOcIK0duTTglC', 0, 0, NULL, '2019-05-14 05:41:36', '2019-05-14 05:41:54', 'ciHiTChbn1.jpeg');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`(191));

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT для таблицы `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
