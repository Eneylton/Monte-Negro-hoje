-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16-Set-2021 às 04:57
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_montenegro6`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargos`
--

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargos`
--

INSERT INTO `cargos` (`id`, `descricao`) VALUES
(1, 'Asssistente de Logística'),
(2, 'Coordenadora de Logística'),
(3, 'Asssistente de Logística'),
(4, 'Supervisor de Operações Logísticas Interior'),
(5, 'Encarregada de Expedição'),
(6, 'Assistente da qualidade'),
(7, 'Auxiliar de Logística'),
(8, 'Diretora'),
(9, 'Assistente Financeiro'),
(10, 'Coordenadora de RH');

-- --------------------------------------------------------

--
-- Estrutura da tabela `carteira`
--

CREATE TABLE `carteira` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `qtd` int(11) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `cod_id` int(11) DEFAULT NULL,
  `entregadores_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `telefone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `cnpj` varchar(45) DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL,
  `usuarios_id` int(11) NOT NULL,
  `servicos_id` int(11) NOT NULL,
  `setores_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `data`, `telefone`, `email`, `cnpj`, `foto`, `usuarios_id`, `servicos_id`, `setores_id`) VALUES
(7, 'HAPVIDA', '2021-07-03 00:04:14', NULL, NULL, NULL, NULL, 7, 3, 3),
(8, 'GFL', '2021-07-05 19:01:25', NULL, NULL, NULL, NULL, 7, 1, 1),
(9, 'DBA', '2021-07-05 19:25:30', NULL, NULL, NULL, NULL, 7, 1, 1),
(10, 'NT LOG', '2021-07-05 19:35:18', NULL, NULL, NULL, NULL, 7, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `devolucao`
--

CREATE TABLE `devolucao` (
  `id` int(11) NOT NULL,
  `cod_id` int(11) DEFAULT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `qtd` int(11) DEFAULT NULL,
  `ocorrencias_id` int(11) NOT NULL,
  `logisticas_id` int(11) NOT NULL,
  `entregadores_id` int(11) NOT NULL,
  `receber_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `entrega`
--

CREATE TABLE `entrega` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `cod_id` int(11) DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL,
  `logisticas_id` int(11) NOT NULL,
  `entregadores_id` int(11) NOT NULL,
  `receber_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `entregadores`
--

CREATE TABLE `entregadores` (
  `id` int(11) NOT NULL,
  `nome` varchar(225) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `banco` varchar(45) DEFAULT NULL,
  `agencia` varchar(45) DEFAULT NULL,
  `conta` varchar(45) DEFAULT NULL,
  `pix` varchar(100) DEFAULT NULL,
  `cnh` varchar(45) DEFAULT NULL,
  `renavam` varchar(45) DEFAULT NULL,
  `apelido` varchar(100) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `usuarios_id` int(11) NOT NULL,
  `rotas_id` int(11) NOT NULL,
  `regioes_id` int(11) NOT NULL,
  `veiculos_id` int(11) NOT NULL,
  `forma_pagamento_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `entregadores`
--

INSERT INTO `entregadores` (`id`, `nome`, `telefone`, `cpf`, `email`, `banco`, `agencia`, `conta`, `pix`, `cnh`, `renavam`, `apelido`, `tipo`, `usuarios_id`, `rotas_id`, `regioes_id`, `veiculos_id`, `forma_pagamento_id`) VALUES
(37, 'Clodoaldo Ferreira de Sousa', '', '760.774.383-91', '', '', '', '', '', '', '', 'CLODOALDO', 'CLT', 7, 33, 74, 1, 4),
(38, 'Ademir Neres Mertins', '', '887.223.368-53', '', '', '', '', '', '', '', 'Ademir', 'CLT', 7, 34, 74, 1, 4),
(39, 'Alessandro Freire Caldas', '', '602.008.083-89', '', '', '', '', '', '', '', 'ALESSANDRO', 'CLT', 7, 35, 74, 1, 4),
(40, 'Antonio Marcos Sodré de Sousa', '', '853.301.403-15', '', '237-Bradesco', '1168-1', '515340-7', '', '', '', 'SODRÉ', 'CLT', 7, 36, 74, 1, 4),
(41, 'Denilson Costa Vieira', '', '', '', '', '', '', '', '', '', 'Denilson Costa', 'CLT', 7, 38, 74, 1, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_pagamento`
--

CREATE TABLE `forma_pagamento` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `forma_pagamento`
--

INSERT INTO `forma_pagamento` (`id`, `nome`) VALUES
(4, 'Dinheiro'),
(5, 'Pix');

-- --------------------------------------------------------

--
-- Estrutura da tabela `gaiola`
--

CREATE TABLE `gaiola` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `gaiola`
--

INSERT INTO `gaiola` (`id`, `data`, `nome`) VALUES
(1, '2021-09-02 23:33:51', '01'),
(2, '2021-09-02 23:33:51', '02'),
(3, '2021-09-02 23:33:51', '03'),
(6, '2021-09-15 13:49:06', '04'),
(7, '2021-09-15 13:49:12', '05'),
(8, '2021-09-15 13:49:25', '06'),
(10, '2021-09-15 13:49:39', '08'),
(13, '2021-09-15 13:50:07', '07'),
(16, '2021-09-15 13:57:45', '100'),
(17, '2021-09-15 13:57:54', '101'),
(18, '2021-09-15 13:58:01', '102'),
(19, '2021-09-15 13:58:07', '103'),
(20, '2021-09-15 13:58:15', '104'),
(21, '2021-09-15 13:58:24', '105'),
(22, '2021-09-15 13:58:30', '106'),
(23, '2021-09-15 13:58:37', '107'),
(24, '2021-09-15 13:58:45', '108'),
(25, '2021-09-15 13:58:54', '109'),
(26, '2021-09-15 13:59:00', '110'),
(27, '2021-09-15 13:59:06', '111'),
(28, '2021-09-15 13:59:14', '112'),
(29, '2021-09-15 13:59:22', '113'),
(30, '2021-09-15 13:59:27', '114'),
(31, '2021-09-15 13:59:35', '115'),
(32, '2021-09-15 13:59:42', '116'),
(33, '2021-09-15 13:59:48', '117'),
(34, '2021-09-15 13:59:55', '118'),
(35, '2021-09-15 14:00:02', '119'),
(36, '2021-09-15 14:00:09', '120'),
(37, '2021-09-15 14:00:16', '121'),
(38, '2021-09-15 14:00:22', '122'),
(39, '2021-09-15 14:00:29', '123'),
(40, '2021-09-15 14:00:36', '124'),
(41, '2021-09-15 14:11:42', '09'),
(42, '2021-09-15 14:11:50', '10'),
(43, '2021-09-15 14:11:56', '11'),
(44, '2021-09-15 14:12:02', '12'),
(45, '2021-09-15 14:12:07', '13'),
(46, '2021-09-15 14:12:13', '14'),
(47, '2021-09-15 14:12:19', '15'),
(48, '2021-09-15 14:12:24', '16'),
(49, '2021-09-15 14:12:30', '17'),
(50, '2021-09-15 14:12:36', '18'),
(51, '2021-09-15 14:12:43', '20'),
(52, '2021-09-15 14:12:59', '19'),
(53, '2021-09-15 14:13:11', '50'),
(54, '2021-09-15 14:13:16', '51'),
(55, '2021-09-15 14:13:22', '52'),
(56, '2021-09-15 14:13:28', '53'),
(57, '2021-09-15 14:13:34', '54'),
(58, '2021-09-15 14:13:40', '55'),
(59, '2021-09-15 14:13:55', '55'),
(60, '2021-09-15 14:14:02', '56'),
(61, '2021-09-15 14:14:08', '57'),
(62, '2021-09-15 14:14:16', '58');

-- --------------------------------------------------------

--
-- Estrutura da tabela `logisticas`
--

CREATE TABLE `logisticas` (
  `id` int(11) NOT NULL,
  `cod_id` int(11) DEFAULT NULL,
  `data` timestamp NULL DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL,
  `clientes_id` int(11) NOT NULL,
  `entregadores_id` int(11) NOT NULL,
  `servicos_id` int(11) NOT NULL,
  `regioes_id` int(11) NOT NULL,
  `receber_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `logisticas`
--

INSERT INTO `logisticas` (`id`, `cod_id`, `data`, `data_inicio`, `data_fim`, `qtd`, `clientes_id`, `entregadores_id`, `servicos_id`, `regioes_id`, `receber_id`) VALUES
(165, 12304780, '2021-09-15 23:35:31', '2021-09-15', '2021-09-15', 2, 10, 37, 1, 74, 71),
(166, 16342128, '2021-09-15 23:37:53', '2021-09-15', '2021-09-15', 50, 9, 37, 1, 74, 72);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ocorrencias`
--

CREATE TABLE `ocorrencias` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `usuarios_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `ocorrencias`
--

INSERT INTO `ocorrencias` (`id`, `nome`, `usuarios_id`) VALUES
(1, 'Endereço não encotrado', 4),
(2, 'Dificil acesso', 4),
(3, 'Moto apreendida', 7),
(6, 'Ausente', 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `receber`
--

CREATE TABLE `receber` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `qtd` int(11) DEFAULT NULL,
  `recebido` int(11) DEFAULT NULL,
  `usuarios_id` int(11) NOT NULL,
  `clientes_id` int(11) NOT NULL,
  `regioes_id` int(11) NOT NULL,
  `rotas_id` int(11) NOT NULL,
  `gaiola_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `receber`
--

INSERT INTO `receber` (`id`, `data`, `qtd`, `recebido`, `usuarios_id`, `clientes_id`, `regioes_id`, `rotas_id`, `gaiola_id`) VALUES
(71, '2021-09-02 14:16:12', 0, 2, 4, 10, 76, 64, 18),
(72, '2021-09-17 23:36:13', 50, 100, 4, 9, 74, 34, 27);

-- --------------------------------------------------------

--
-- Estrutura da tabela `regioes`
--

CREATE TABLE `regioes` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `regioes`
--

INSERT INTO `regioes` (`id`, `nome`) VALUES
(74, 'Grande Ilha'),
(76, 'COCAIS'),
(77, 'LENÇÓIS'),
(78, 'CENTRAL'),
(79, 'BAIXADA'),
(80, 'PARNAÍBA'),
(81, 'SUL DO MARANHÃO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `rotas`
--

CREATE TABLE `rotas` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `regioes_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `rotas`
--

INSERT INTO `rotas` (`id`, `nome`, `regioes_id`) VALUES
(33, 'ROTA 01 - PAÇO', 74),
(34, 'ROTA 02 - ELDORADO', 74),
(35, 'ROTA 03 - RECANTO', 74),
(36, 'ROTA 04 - VINHAIS', 74),
(37, 'ROTA 05 - ANIL', 74),
(38, 'ROTA 06 - VILA PALMEIRA', 74),
(39, 'ROTA 07 - COROADINHO', 74),
(40, 'ROTA 08 - SÃO FRANCISCO', 74),
(41, 'ROTA 09 - PONTA DO FAROL', 74),
(42, 'ROTA 10 - CIDADE OPERÁRIA', 74),
(43, 'ROTA 11 - COHATRAC', 74),
(44, 'ROTA 12 - LIBERDADE', 74),
(45, 'ROTA 13 - COHAB', 74),
(46, 'ROTA 14 - ARAÇAGY', 74),
(47, 'ROTA 15 - BR', 74),
(48, 'ROTA 16 - SÃO CRISTÓVÃO', 74),
(49, 'ROTA 17 - ANJO DA GUARDA', 74),
(50, 'ROTA 18 - RENASCENÇA', 74),
(51, 'ROTA 19 - TURU', 74),
(52, 'ROTA 20 - OLHO DÁGUA', 74),
(53, 'rota 50 - cantinho do céu', 74),
(54, 'rota 51 - divinéia', 74),
(55, 'rota 52 - centro', 74),
(56, 'rota 53 - vila embratel', 74),
(57, 'rota 54 - tirirical', 74),
(58, 'rota 55 - ponta da areia', 74),
(59, 'rota 56 - forquilha', 74),
(60, 'rota 57 - cidade olímpica', 74),
(61, 'rota 58 - são josé de ribamar', 74),
(62, 'ROTA 100 - Bacabal', 76),
(63, 'ROTA 101 - Lago da Pedra', 76),
(64, 'ROTA 102 - Barra do Corda', 76),
(65, 'ROTA 103 - Coroatá', 76),
(66, 'ROTA 104 - Colinas', 76),
(67, 'ROTA 105 - Dom Pedro', 76),
(68, 'ROTA 106 - Pres. Dutra/Tuntum', 76),
(69, 'ROTA 107 - Pedreiras/Trizidela', 76),
(70, 'ROTA 108 - São Mateus', 76),
(71, 'ROTA 109 - Rosário', 77),
(72, 'Rota 110 - Barreirinhas', 77),
(73, 'ROTA 111 - Zé Doca', 78),
(74, 'ROTA 112 - Santa Inês', 78),
(75, 'ROTA 113 - Santa Luzia', 78),
(76, 'ROTA 114 - Viana/Arari', 79),
(77, 'ROTA 115 - São Bento', 79),
(78, 'ROTA 116 - Pinheiro', 79),
(79, 'ROTA 117 - Cururupu', 79),
(80, 'ROTA 121 - Carolina/Estreito/Grajaú/J.Lisboa/Porto Franco/Riachão/Campestre/Divinópolis', 81),
(81, 'ROTA 122 - Imperatriz', 81),
(82, 'ROTA 123 - Balsas', 81),
(83, 'ROTA 124 - Açailândia', 81);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `servicos`
--

INSERT INTO `servicos` (`id`, `nome`) VALUES
(1, 'Pequenos volumes'),
(3, 'boletos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `setores`
--

CREATE TABLE `setores` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `setores`
--

INSERT INTO `setores` (`id`, `nome`) VALUES
(1, 'E- commerce'),
(3, 'Editorial');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `cargos_id` int(11) NOT NULL,
  `acessos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `cargos_id`, `acessos_id`) VALUES
(4, 'admin', 'admin@eneylton.com', '$2y$10$JZR7X2ZpplGhF4dtchAhJedF/Y0/4ynAOd8VBlR4ehJfLOKHX4mLG', 1, 1),
(7, 'ene', 'eneylton@hotmail.com', '$2y$10$JZR7X2ZpplGhF4dtchAhJedF/Y0/4ynAOd8VBlR4ehJfLOKHX4mLG', 1, 2),
(13, 'enexs', 'enex@gmail.com.br', '202cb962ac59075b964b07152d234b70', 1, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculos`
--

CREATE TABLE `veiculos` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `veiculos`
--

INSERT INTO `veiculos` (`id`, `nome`) VALUES
(1, 'MOTO'),
(2, 'CARRO'),
(3, 'CAMINHÃO'),
(5, 'BIKE');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `entregadores`
--
ALTER TABLE `entregadores`
  ADD KEY `fk_entregadores_forma_pagamento_idx` (`forma_pagamento_id`);

--
-- Índices para tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
