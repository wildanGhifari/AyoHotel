-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2023 at 01:17 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ayo-hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id_booking` int(11) NOT NULL,
  `id_user` varchar(11) NOT NULL,
  `id_kamar` varchar(11) NOT NULL,
  `jumlah_tamu` int(2) NOT NULL,
  `tanggal_checkin` date NOT NULL,
  `tanggal_checkout` date NOT NULL,
  `status` enum('waiting','paid','cancel','in','out') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id_booking`, `id_user`, `id_kamar`, `jumlah_tamu`, `tanggal_checkin`, `tanggal_checkout`, `status`) VALUES
(127, '1', '12', 2, '2023-11-09', '2023-11-10', 'paid'),
(128, '1', '12', 2, '2023-11-24', '2023-11-24', 'out'),
(129, '2', '12', 2, '2023-11-27', '2023-11-27', 'paid'),
(130, '2', '12', 2, '2023-12-02', '2023-12-02', 'out'),
(131, '1', '12', 2, '2023-12-30', '2023-12-30', 'out');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id_invoice` int(11) NOT NULL,
  `id_booking` varchar(11) NOT NULL,
  `jumlah` decimal(10,0) NOT NULL,
  `tanggal_pembayaran` datetime NOT NULL,
  `metode_pembayaran` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `id_kamar` int(11) NOT NULL,
  `nama_kamar` varchar(40) NOT NULL,
  `tipe_kamar` varchar(40) NOT NULL,
  `image` varchar(255) NOT NULL,
  `deskripsi` varchar(512) NOT NULL,
  `fasilitas` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`fasilitas`)),
  `harga` decimal(10,0) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`id_kamar`, `nama_kamar`, `tipe_kamar`, `image`, `deskripsi`, `fasilitas`, `harga`, `status`) VALUES
(1, 'Elegant Suite', 'Suite', 'https://plus.unsplash.com/premium_photo-1670360414903-19e5832f8bc4?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Nikmati pengalaman menginap penuh kemewahan di Elegant Suite kami. Kamar ini dirancang dengan sentuhan elegan yang memukau, menciptakan atmosfer yang penuh gaya dan kelas. Dengan interior yang modern dan perabotan berkualitas tinggi, Elegant Suite menyajikan ruang yang luas dan nyaman untuk istirahat yang tak terlupakan. Tidur nyenyak di tempat tidur king-size yang mewah sambil menikmati pemandangan luar jendela yang menakjubkan. Kamar mandi pribadi dilengkapi dengan fasilitas lengkap, termasuk bathtub spa ', '{\r\n  \"wifi\": \"Wi-Fi\",\r\n  \"ac\": \"Air Conditioning\",\r\n  \"tv\": \"Flat-screen TV\",\r\n  \"minibar\": \"Minibar\",\r\n  \"roomService\": \"24-Hour Room Service\",\r\n  \"kingBed\": \"King-size Bed\",\r\n  \"privateBalcony\": \"Private Balcony\",\r\n  \"spaAccess\": \"Access to Spa Facilities\",\r\n  \"workDesk\": \"Work Desk\",\r\n  \"complimentaryBreakfast\": \"Complimentary Breakfast\",\r\n  \"luxuryToiletries\": \"Luxury Toiletries\"\r\n}', '1500000', 1),
(2, 'Superior Room', 'Standard', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?q=80&w=1548&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Superior Room merupakan pilihan yang sempurna untuk para tamu yang menginginkan pengalaman menginap yang nyaman dan tenang. Dengan desain yang elegan dan suasana yang menyenangkan, kamar ini menawarkan ruang yang luas untuk bersantai setelah seharian beraktivitas. Interior yang modern dan perabotan yang nyaman menciptakan suasana hangat dan ramah.', '{\r\n  \"wifi\": \"Free Wi-Fi\",\r\n  \"ac\": \"Air Conditioning\",\r\n  \"tv\": \"HD TV with Cable Channels\",\r\n  \"desk\": \"Workspace Area\",\r\n  \"minibar\": \"Stocked Minibar\",\r\n  \"safe\": \"Electronic Safe\",\r\n  \"phone\": \"Direct Dial Phone\",\r\n  \"shower\": \"Private Bathroom with Shower\",\r\n  \"coffeeMachine\": \"Complimentary Coffee Machine\",\r\n  \"iron\": \"Iron and Ironing Board\",\r\n  \"complimentaryBreakfast\": \"Complimentary Breakfast\",\r\n  \"cityView\": \"City View\",\r\n  \"dailyHousekeeping\": \"Daily Housekeeping Service\"\r\n}\r\n', '800000', 1),
(3, 'Deluxe Ocean View', 'Deluxe', 'https://media.istockphoto.com/id/1254277224/id/foto/dinding-batu-batu-gunung-di-interior-kamar-tidur-utama-apartemen-mewah.jpg?s=1024x1024&w=is&k=20&c=Vu-UqwfeGeocCIwYbl1RnslcyI_t8N3N35jHcvF-FZE=', ' Nikmati pengalaman menginap yang luar biasa dengan Kamar Deluxe Ocean View kami. Terletak di lantai tinggi, kamar ini menawarkan pemandangan laut yang spektakuler. Desain interior yang elegan dan nuansa yang tenang menciptakan lingkungan yang sempurna untuk relaksasi dan kenikmatan. Dilengkapi dengan tempat tidur king-size yang nyaman dan area duduk yang luas, Kamar Deluxe Ocean View adalah pilihan ideal bagi mereka yang menginginkan kemewahan dan kenyamanan.', '{\r\n  \"wifi\": \"Free Wi-Fi\",\r\n  \"ac\": \"Air Conditioning\",\r\n  \"tv\": \"Flat-screen TV with Ocean View Channels\",\r\n  \"balcony\": \"Private Balcony with Ocean View\",\r\n  \"minibar\": \"Stocked Minibar\",\r\n  \"safe\": \"In-room Safe\",\r\n  \"phone\": \"Telephone\",\r\n  \"spa\": \"In-room Spa Services\",\r\n  \"bathrobe\": \"Complimentary Bathrobe and Slippers\",\r\n  \"roomService\": \"24-hour Room Service\"\r\n}\r\n', '1200000', 1),
(4, 'Family Suite', 'Suite', 'https://media.istockphoto.com/id/1181846880/id/foto/panorama-suite-hotel-keluarga-mewah-di-pulau-liburan.jpg?s=1024x1024&w=is&k=20&c=dpRuzv3tWavE8C3cQht9owxST4yU7lGRKpnEu1ZzSnY=', ' Family Suite adalah pilihan ideal untuk liburan keluarga yang tak terlupakan. Dengan desain yang luas dan nyaman, kamar ini menawarkan ruang tamu terpisah, tempat tidur king-size untuk orang tua, dan tempat tidur anak-anak yang nyaman. Suasana hangat dan fasilitas lengkap membuat Family Suite menjadi pilihan utama bagi keluarga yang menginginkan pengalaman menginap yang istimewa', '{\r\n  \"wifi\": \"Wi-Fi\",\r\n  \"ac\": \"Air Conditioning\",\r\n  \"tv\": \"Flat-screen TV\",\r\n  \"suiteLivingRoom\": \"Separate Living Room\",\r\n  \"connectingRooms\": \"Connecting Rooms\",\r\n  \"kitchenette\": \"Kitchenette\",\r\n  \"kidFriendlyAmenities\": \"Kid-Friendly Amenities\",\r\n  \"bathtub\": \"Bathtub\",\r\n  \"babyCrib\": \"Baby Crib\",\r\n  \"familyBoardGames\": \"Family Board Games\"\r\n}\r\n', '1800000', 1),
(5, 'Romantic Hideaway', 'Premium', 'https://media.istockphoto.com/id/909029630/id/foto/bentuk-hati-dari-kelopak-mawar-merah-muda-di-tempat-tidur-putih-dekorasi-kamar-kamar-bulan-madu.jpg?s=1024x1024&w=is&k=20&c=ytvRd2mmIcKhAfdj3QYK1TmdPebYTkl3AoS-oT_LRLM=', 'Romantic Hideaway, sebuah tempat di mana keintiman dan romantisme menyatu dalam satu ruang. Kamar ini menawarkan suasana yang penuh kasih, dengan dekorasi yang lembut dan sentuhan romantis di setiap sudutnya. Terletak di lokasi yang tenang, kamar ini memberikan privasi tanpa batas untuk pasangan yang ingin merayakan momen khusus mereka. Nikmati malam yang romantis di balkon pribadi dengan pemandangan indah, sementara jacuzzi pribadi menambah sentuhan kemewahan pada pengalaman menginap ini.', '{\r\n  \"wifi\": \"Wi-Fi\",\r\n  \"jacuzzi\": \"Private Jacuzzi\",\r\n  \"fireplace\": \"Fireplace\",\r\n  \"kingBed\": \"King-sized Bed\",\r\n  \"candlelightDinner\": \"Candlelight Dinner\",\r\n  \"rosePetals\": \"Rose Petals Decoration\",\r\n  \"spaAccess\": \"Spa Access\",\r\n  \"champagne\": \"Complimentary Champagne\",\r\n  \"romanticMusic\": \"Customizable Romantic Music Playlist\",\r\n  \"roomService\": \"24-hour Room Service\"\r\n}\r\n', '2000000', 1),
(6, 'Business Class', 'Business', 'https://images.unsplash.com/photo-1631049552057-403cdb8f0658?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Diperuntukkan bagi para pebisnis yang menghargai kenyamanan dan produktivitas, kamar Business Class kami menawarkan ruang eksklusif untuk bekerja dan bersantai. Desain modern dan fungsional memberikan suasana yang cocok untuk rapat online atau pekerjaan serius. Dilengkapi dengan meja kerja yang luas, kursi ergonomis, dan konektivitas cepat, kamar ini menjadi tempat ideal untuk menjalankan bisnis Anda. Setelah seharian yang sibuk, nikmati kemewahan tidur di tempat tidur king-size yang nyaman.', '{\r\n  \"wifi\": \"High-speed Wi-Fi\",\r\n  \"ac\": \"Climate Control System\",\r\n  \"tv\": \"Smart TV with Cable Channels\",\r\n  \"desk\": \"Executive Work Desk\",\r\n  \"minibar\": \"Stocked Minibar\",\r\n  \"safe\": \"Digital Safe\",\r\n  \"phone\": \"Direct Dial Telephone\",\r\n  \"shower\": \"Luxurious Shower\",\r\n  \"coffeeMachine\": \"In-room Coffee Machine\",\r\n  \"iron\": \"Iron and Ironing Board\",\r\n  \"workspace\": \"Dedicated Workspace\",\r\n  \"complimentaryBreakfast\": \"Complimentary Breakfast\",\r\n  \"conciergeService\": \"24/7 Concierge Service\",\r\n  \"bathrobeSlippers\": \"Bathrobe and Slippers\",\r\n  \"dailyNewspaper\": \"Daily Newspaper Delivery\"\r\n}', '1300000', 1),
(7, 'Panoramic View', 'Deluxe', 'https://media.istockphoto.com/id/1328934427/id/foto/render-3d-kamar-hotel-mewah.jpg?s=1024x1024&w=is&k=20&c=0eWigKWZh3P7cgc8XjL3LwZHgvJSb1ADRYmbxxNtrTk=', 'Nikmati keindahan alam dengan menginap di kamar Panoramic View kami. Dengan jendela besar yang menghadap langsung ke luar, Anda akan disuguhkan pemandangan spektakuler yang memukau, mulai dari pegunungan yang megah hingga pemandangan laut yang luas. Interior kamar yang modern dan minimalis menambahkan kenyamanan pada pengalaman menginap Anda. Rasakan kedamaian dan keindahan alam yang tak terlupakan sepanjang hari.', '{\r\n  \"wifi\": \"Wi-Fi\",\r\n  \"ac\": \"Air Conditioning\",\r\n  \"tv\": \"Panoramic View TV\",\r\n  \"floorToCeilingWindows\": \"Floor-to-Ceiling Windows\",\r\n  \"kingBed\": \"King-sized Bed\",\r\n  \"minibar\": \"Minibar with Panoramic View Refreshments\",\r\n  \"spaBath\": \"Spa Bath\",\r\n  \"coffeeMachine\": \"Coffee Machine with Scenic Coffee\",\r\n  \"workstation\": \"Scenic Workstation\",\r\n  \"premiumToiletries\": \"Premium Toiletries\",\r\n  \"privateBalcony\": \"Private Balcony with Panoramic View\"\r\n}\r\n', '1100000', 1),
(8, 'Junior Suite', 'Suite', 'https://media.istockphoto.com/id/1183747223/id/foto/3d-render-kamar-tidur-modern.jpg?s=1024x1024&w=is&k=20&c=iaa_7hllJbfWOAA6Sqd3-4ce3oiSBO-AvZkahlfM54M=', 'Junior Suite adalah paduan elegansi dan kenyamanan yang sempurna. Kamar ini menawarkan ruang yang luas dengan desain yang modern dan sentuhan mewah. Dilengkapi dengan area duduk yang nyaman, tempat tidur king-size, dan dekorasi yang berkelas, Junior Suite menciptakan suasana yang cocok untuk tamu yang menginginkan pengalaman menginap yang istimewa. Nikmati kenyamanan lebih dengan fasilitas kamar mandi pribadi dan akses eksklusif ke lounge khusus.', '{\r\n  \"wifi\": \"Wi-Fi\",\r\n  \"ac\": \"Air Conditioning\",\r\n  \"tv\": \"Flat-screen TV\",\r\n  \"kingBed\": \"King Size Bed\",\r\n  \"sofa\": \"Sofa\",\r\n  \"minibar\": \"Minibar\",\r\n  \"safe\": \"In-room Safe\",\r\n  \"phone\": \"Telephone\",\r\n  \"bathrobe\": \"Bathrobe\",\r\n  \"bathtub\": \"Bathtub\",\r\n  \"desk\": \"Work Desk\",\r\n  \"coffeeMachine\": \"Coffee Machine\",\r\n  \"iron\": \"Iron and Ironing Board\"\r\n}\r\n', '1600000', 1),
(9, 'Garden Retreat', 'Premium', 'https://media.istockphoto.com/id/1337309569/id/foto/kamar-tidur-modern-dengan-tampilan-taman-gaya-tropis-render-3d.jpg?s=1024x1024&w=is&k=20&c=iK3UcapiFt-QQ79xhY5YWxcEwZ-Uq72WW3eBec23sNw=', 'Garden Retreat adalah tempat pelarian yang sempurna di tengah-tengah kebun yang indah. Kamar ini menawarkan pengalaman menginap yang tenang dan menyegarkan dengan akses langsung ke taman pribadi. Desain interior yang memikat menciptakan suasana yang damai, sementara jendela-jendela besar memberikan pemandangan langsung ke kebun yang rimbun. Bersantailah di teras pribadi atau jelajahi kebun dengan berjalan kaki santai. Suatu tempat untuk bersantai dan terhubung dengan alam.', '{\r\n  \"wifi\": \"Free Wi-Fi\",\r\n  \"ac\": \"Air Conditioning\",\r\n  \"tv\": \"Smart TV\",\r\n  \"gardenView\": \"Garden View\",\r\n  \"patio\": \"Private Patio\",\r\n  \"minibar\": \"Minibar\",\r\n  \"safe\": \"In-room Safe\",\r\n  \"phone\": \"Telephone\",\r\n  \"bathtub\": \"Luxury Bathtub\",\r\n  \"complimentaryBreakfast\": \"Complimentary Breakfast\",\r\n  \"spaAccess\": \"Access to Spa Facilities\"\r\n}\r\n', '1400000', 1),
(10, 'Executive Suite', 'Suite', 'https://media.istockphoto.com/id/1061316094/id/foto/mature-man-di-kamar-hotel.jpg?s=1024x1024&w=is&k=20&c=rg3UUBG2pBvpbgxyX0Otwi6MxuEt6HPrb5dXrPoK5Wc=', 'Executive Suite menghadirkan pengalaman menginap luar biasa dengan sentuhan kemewahan dan kenyamanan. Kamar ini menawarkan ruang yang luas dan elegan, dilengkapi dengan ruang tamu yang eksklusif dan area kerja yang nyaman. Desain modern dan furnitur bergaya menciptakan atmosfer yang menenangkan. Nikmati kenyamanan tidur dengan tempat tidur king-size dan pemandangan kota yang spektakuler melalui jendela kaca besar. Kamar mandi mewah dengan fasilitas jacuzzi untuk relaksasi total setelah hari yang sibuk.', '{\r\n  \"wifi\": \"High-speed Wi-Fi\",\r\n  \"ac\": \"Central Air Conditioning\",\r\n  \"tv\": \"Smart TV with Streaming Services\",\r\n  \"desk\": \"Executive Work Desk\",\r\n  \"minibar\": \"Deluxe Minibar\",\r\n  \"safe\": \"Electronic Safe\",\r\n  \"phone\": \"Direct Dial Phone\",\r\n  \"shower\": \"Luxurious Rainfall Shower\",\r\n  \"bathtub\": \"Private Bathtub\",\r\n  \"coffeeMachine\": \"Premium Coffee Machine\",\r\n  \"iron\": \"In-room Iron and Ironing Board\",\r\n  \"view\": \"Panoramic City View\"\r\n}\r\n', '1700000', 1),
(11, 'Classic Room', 'Standard', 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aG90ZWwlMjByb29tfGVufDB8fDB8fHww', 'Classic Room menghadirkan sentuhan elegan dan kehangatan yang mengundang. Dengan desain klasik yang timeless, kamar ini memberikan kenyamanan tanpa kompromi. Didekorasi dengan perabotan yang indah dan nuansa warna yang menenangkan, Classic Room menciptakan atmosfer santai yang sempurna untuk istirahat. Kamar ini dilengkapi dengan area kerja yang fungsional, tempat tidur yang nyaman, dan tata ruang yang efisien.', '{\r\n  \"wifi\": \"Wi-Fi\",\r\n  \"ac\": \"Air Conditioning\",\r\n  \"tv\": \"Flat-screen TV\",\r\n  \"desk\": \"Writing Desk\",\r\n  \"minibar\": \"Mini Refrigerator\",\r\n  \"safe\": \"In-room Safe\",\r\n  \"phone\": \"Telephone\",\r\n  \"bathtub\": \"Bathtub\",\r\n  \"complimentaryToiletries\": \"Complimentary Toiletries\",\r\n  \"hairDryer\": \"Hair Dryer\"\r\n}\r\n', '900000', 1),
(12, 'Oceanfront Suite', 'Suite', 'https://images.unsplash.com/photo-1609602126247-4ab7188b4aa1?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Oceanfront Suite menghadirkan kemewahan tepi laut yang tak tertandingi. Dengan pemandangan langsung ke ombak yang gemulai, kamar ini menawarkan pengalaman menginap yang luar biasa. Desain interior yang elegan menciptakan suasana yang tenang, sementara balkon pribadi memungkinkan Anda menikmati keindahan alam laut tanpa batas. Kamar ini dilengkapi dengan area duduk luas, tempat tidur king-size yang nyaman, dan fasilitas modern untuk memastikan kenyamanan maksimal Anda.', '{\r\n  \"wifi\": \"Wi-Fi\",\r\n  \"ac\": \"Air Conditioning\",\r\n  \"oceanView\": \"Ocean View\",\r\n  \"balcony\": \"Private Balcony\",\r\n  \"tv\": \"Flat-screen TV\",\r\n  \"minibar\": \"Minibar\",\r\n  \"safe\": \"In-room Safe\",\r\n  \"phone\": \"Telephone\",\r\n  \"kingBed\": \"King Size Bed\",\r\n  \"bathtub\": \"Luxury Bathtub\",\r\n  \"beachAccess\": \"Direct Beach Access\"\r\n}\r\n', '1900000', 1),
(13, 'Skyline View', 'Deluxe', 'https://images.unsplash.com/photo-1688933758128-83d40ab10b4e?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Nikmati kemewahan melihat kota dari ketinggian di Skyline View. Kamar ini menawarkan pemandangan spektakuler dari langit kota yang berkilauan di malam hari. Desain interior modern yang elegan menciptakan suasana yang trendi dan nyaman. Kamar ini dilengkapi dengan jendela lantai ke langit-langit, memberikan pengalaman unik saat Anda terbangun dengan sinar matahari yang membanjiri kamar. Dengan akses ke balkon pribadi, Anda dapat menikmati angin segar sambil menikmati panorama kota yang memukau.', '{\r\n  \"wifi\": \"Wi-Fi\",\r\n  \"ac\": \"Air Conditioning\",\r\n  \"tv\": \"Flat-screen TV\",\r\n  \"panoramicWindows\": \"Panoramic Windows\",\r\n  \"kingBed\": \"King Size Bed\",\r\n  \"miniFridge\": \"Mini Fridge\",\r\n  \"coffeeMaker\": \"Coffee Maker\",\r\n  \"bathrobe\": \"Bathrobe\",\r\n  \"slippers\": \"Slippers\",\r\n  \"cityGuide\": \"City Guide Book\"\r\n}\r\n', '1250000', 1),
(14, 'Cozy Retreat', 'Deluxe', 'https://images.unsplash.com/photo-1583847268964-b28dc8f51f92?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Cozy Retreat adalah tempat istimewa yang menyediakan kenyamanan maksimal untuk melarikan diri dari kehidupan sehari-hari. Dengan desain interior yang hangat dan nyaman, kamar ini memberikan nuansa rumah yang penuh ketenangan. Tempat tidur yang lembut dan area duduk yang nyaman membuat Anda merasa sepenuhnya rileks. Tambahkan sentuhan kemewahan dengan kamar mandi pribadi yang dilengkapi dengan bathtub spa. Suasana yang tenang dan privasi membuat Cozy Retreat menjadi pilihan ideal untuk melepas penat.', '{\r\n  \"wifi\": \"Free Wi-Fi\",\r\n  \"ac\": \"Air Conditioning\",\r\n  \"tv\": \"Smart TV\",\r\n  \"comfyBed\": \"Comfortable Bed\",\r\n  \"coffeeMaker\": \"Coffee Maker\",\r\n  \"miniFridge\": \"Mini Fridge\",\r\n  \"toiletries\": \"Complimentary Toiletries\",\r\n  \"hairDryer\": \"Hair Dryer\",\r\n  \"workspace\": \"Workspace Area\",\r\n  \"roomService\": \"24-Hour Room Service\"\r\n}', '1500000', 1),
(15, 'Modern Business', 'Business', 'https://images.unsplash.com/photo-1445991842772-097fea258e7b?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Modern Business adalah pilihan sempurna untuk pelancong bisnis yang menginginkan keseimbangan antara kenyamanan dan fungsionalitas. Dengan desain interior yang kontemporer, kamar ini dilengkapi dengan area kerja yang luas dan ergonomic, menciptakan lingkungan yang ideal untuk bekerja. Nikmati konektivitas yang cepat dengan akses Wi-Fi yang stabil dan fasilitas teknologi terbaru. Tempat tidur yang nyaman dan tata letak yang efisien memberikan kenyamanan maksimal setelah hari yang sibuk.', '{\r\n  \"wifi\": \"Wi-Fi\",\r\n  \"ac\": \"Air Conditioning\",\r\n  \"tv\": \"Flat-screen TV\",\r\n  \"desk\": \"Work Desk\",\r\n  \"minibar\": \"Minibar\",\r\n  \"safe\": \"In-room Safe\",\r\n  \"phone\": \"Telephone\",\r\n  \"shower\": \"Rainfall Shower\",\r\n  \"coffeeMachine\": \"Coffee Machine\",\r\n  \"iron\": \"Iron and Ironing Board\"\r\n}', '1350000', 1),
(16, 'Sunset Paradise', 'Premium', 'https://images.unsplash.com/photo-1445019980597-93fa8acb246c?q=80&w=1474&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Sambut keindahan matahari terbenam di Sunset Paradise. Kamar ini menghadirkan pengalaman menginap yang tak terlupakan dengan pemandangan matahari terbenam yang memukau langsung dari kamar Anda. Dengan dekorasi yang terinspirasi alam, ruangan ini menawarkan suasana damai dan romantis. Nikmati kenyamanan tempat tidur king-size dan relaksasi di balkon pribadi Anda. Kamar mandi dilengkapi dengan shower hujan untuk pengalaman mandi yang menyegarkan.', '{\r\n  \"wifi\": \"Wi-Fi\",\r\n  \"ac\": \"Air Conditioning\",\r\n  \"tv\": \"Flat-screen TV\",\r\n  \"minibar\": \"Minibar\",\r\n  \"roomService\": \"24-Hour Room Service\",\r\n  \"kingBed\": \"King-size Bed\",\r\n  \"privateBalcony\": \"Private Balcony\",\r\n  \"spaAccess\": \"Access to Spa Facilities\",\r\n  \"workDesk\": \"Work Desk\",\r\n  \"complimentaryBreakfast\": \"Complimentary Breakfast\",\r\n  \"luxuryToiletries\": \"Luxury Toiletries\"\r\n}', '1700000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `nama_role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id_role`, `nama_role`) VALUES
(1, 'admin'),
(2, 'member'),
(3, 'resepsionis');

-- --------------------------------------------------------

--
-- Table structure for table `testi`
--

CREATE TABLE `testi` (
  `id_testi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_kamar` int(11) NOT NULL,
  `rating` int(1) DEFAULT NULL,
  `testimoni` varchar(160) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `testi`
--

INSERT INTO `testi` (`id_testi`, `id_user`, `id_kamar`, `rating`, `testimoni`) VALUES
(1, 1, 15, 5, 'Suasana Modern Business membuat saya merasa produktif. Coffee machine di kamar adalah sentuhan yang menyenangkan.'),
(2, 3, 15, 5, 'Kamar Modern Business sangat nyaman. Wifi cepat dan AC dingin. Pelayanan ramah, sempurna untuk perjalanan bisnis.'),
(3, 4, 15, 4, 'Fasilitas lengkap, TV besar, dan pemandangan kota yang indah. Saya sangat puas dengan pengalaman menginap saya.'),
(4, 1, 2, 5, 'Saya sangat senang dengan pelayanan dan kenyamanan Superior Room. Kasur yang nyaman dan suasana tenang membuat tidur malam saya sangat baik.'),
(5, 2, 2, 5, 'Pengalaman menginap di Superior Room luar biasa! Kamar bersih, nyaman, dan dilengkapi dengan semua yang dibutuhkan.'),
(6, 5, 2, 5, 'Fasilitas yang lengkap dan desain kamar yang elegan. Staf hotel sangat ramah dan membantu. Sangat merekomendasikan Superior Room!');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `id_role`, `name`, `image`, `email`, `password`, `is_active`) VALUES
(1, 2, 'Wildan Ghifari', 'https://ui-avatars.com/api/?name=Wildan+Ghifari', 'wildghifari@gmail.com', '$2y$10$ng7S4pMIN.Pr/yc9ebRfYeO9mPhqLmo9dS38bQuG7VUqVLkV4zN.m', 1),
(2, 2, 'Agung Peterpan', 'https://ui-avatars.com/api/?name=Agung+Peterpan', 'agung@gmail.com', '$2y$10$aHD6WEAR9/2j/olbPHO7ceD97SpgRWsas60uOk1v8K.HpeSv6BG7C', 1),
(3, 2, 'Wara Damayanti', 'https://ui-avatars.com/api/?name=Wara+Damayanti', 'wara@gmail.com', '$2y$10$5HwpVyAyOhVPF0enVTdX5Ojbcg2eMhvIwlmf6xfOAvn6TlNPoswkW', 1),
(4, 2, 'Indra Cahyadiansyah', 'https://ui-avatars.com/api/?name=Indra+Cahyadiansyah', 'indra@gmail.com', '$2y$10$Pu2MmIo19OGOhh2U6i2jr.BNLDIUkUZLYYbYGa/W8qjAmoF6PfqS6', 1),
(5, 2, 'Meli nofitasari', 'https://ui-avatars.com/api/?name=Meli+nofitasari', 'meli@gmail.com', '$2y$10$SFEu5NlOiQY9FJL855bnwOzrf3VFP2sREqlb9HzGpxUnWpbBOYF52', 1),
(11, 1, 'admin', 'https://ui-avatars.com/api/?name=admin+', 'admin@gmail.com', '$2y$10$p8vwudI2SBzO/uvO4z8c5.RaUYUjv5fLDVokAbgzhPNIyj.1G51PO', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id_booking`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `testi`
--
ALTER TABLE `testi`
  ADD PRIMARY KEY (`id_testi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id_booking` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `testi`
--
ALTER TABLE `testi`
  MODIFY `id_testi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
