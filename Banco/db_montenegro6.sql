-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Set-2021 às 23:08
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
-- Estrutura da tabela `acessos`
--

CREATE TABLE `acessos` (
  `id` int(11) NOT NULL,
  `nivel` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `acessos`
--

INSERT INTO `acessos` (`id`, `nivel`) VALUES
(1, 'admin'),
(2, 'Assitente'),
(3, 'Coordenador'),
(4, 'Auxiliar'),
(6, NULL),
(7, NULL);

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
(7, 'HAPIVIDA', '2021-07-03 00:04:14', NULL, NULL, NULL, NULL, 7, 3, 3),
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
  `usuarios_id` int(11) NOT NULL,
  `rotas_id` int(11) NOT NULL,
  `regioes_id` int(11) NOT NULL,
  `veiculos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, '2021-09-02 23:33:51', '01 a 20'),
(2, '2021-09-02 23:33:51', '21 a 40'),
(3, '2021-09-02 23:33:51', '41 a 60');

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
(74, 'Grande Ilha');

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
(33, 'ROTA-01', 74);

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
-- Índices para tabela `acessos`
--
ALTER TABLE `acessos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `carteira`
--
ALTER TABLE `carteira`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_carteira_entregadores1_idx` (`entregadores_id`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_clientes_usuarios1_idx` (`usuarios_id`),
  ADD KEY `fk_clientes_servicos1_idx` (`servicos_id`),
  ADD KEY `fk_clientes_setores1_idx` (`setores_id`);

--
-- Índices para tabela `devolucao`
--
ALTER TABLE `devolucao`
  ADD PRIMARY KEY (`id`,`receber_id`),
  ADD KEY `fk_devolucao_ocorrencias1_idx` (`ocorrencias_id`),
  ADD KEY `fk_devolucao_logisticas1_idx` (`logisticas_id`),
  ADD KEY `fk_devolucao_entregadores1_idx` (`entregadores_id`),
  ADD KEY `fk_devolucao_receber1_idx` (`receber_id`);

--
-- Índices para tabela `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_entrada_logisticas1_idx` (`logisticas_id`),
  ADD KEY `fk_entrega_entregadores1_idx` (`entregadores_id`),
  ADD KEY `fk_entrega_receber1_idx` (`receber_id`);

--
-- Índices para tabela `entregadores`
--
ALTER TABLE `entregadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_entregador_usuarios1_idx` (`usuarios_id`),
  ADD KEY `fk_entregadores_rotas1_idx` (`rotas_id`),
  ADD KEY `fk_entregadores_regioes1_idx` (`regioes_id`),
  ADD KEY `fk_entregadores_veiculos1_idx` (`veiculos_id`);

--
-- Índices para tabela `gaiola`
--
ALTER TABLE `gaiola`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `logisticas`
--
ALTER TABLE `logisticas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_logistica_clientes1_idx` (`clientes_id`),
  ADD KEY `fk_logistica_entregadores1_idx` (`entregadores_id`),
  ADD KEY `fk_logisticas_servicos1_idx` (`servicos_id`),
  ADD KEY `fk_logisticas_regioes1_idx` (`regioes_id`),
  ADD KEY `fk_logisticas_receber1_idx` (`receber_id`);

--
-- Índices para tabela `ocorrencias`
--
ALTER TABLE `ocorrencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ocorrencias_usuarios1_idx` (`usuarios_id`);

--
-- Índices para tabela `receber`
--
ALTER TABLE `receber`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_receber_usuarios1_idx` (`usuarios_id`),
  ADD KEY `fk_receber_clientes1_idx` (`clientes_id`),
  ADD KEY `fk_receber_regioes1_idx` (`regioes_id`),
  ADD KEY `fk_receber_rotas1_idx` (`rotas_id`),
  ADD KEY `fk_receber_gaiola1_idx` (`gaiola_id`);

--
-- Índices para tabela `regioes`
--
ALTER TABLE `regioes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `rotas`
--
ALTER TABLE `rotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rotas_regioes1_idx` (`regioes_id`);

--
-- Índices para tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `setores`
--
ALTER TABLE `setores`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_usuarios_cargos_idx` (`cargos_id`),
  ADD KEY `fk_usuarios_acessos1_idx` (`acessos_id`);

--
-- Índices para tabela `veiculos`
--
ALTER TABLE `veiculos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acessos`
--
ALTER TABLE `acessos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `carteira`
--
ALTER TABLE `carteira`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `devolucao`
--
ALTER TABLE `devolucao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT de tabela `entrega`
--
ALTER TABLE `entrega`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT de tabela `entregadores`
--
ALTER TABLE `entregadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de tabela `gaiola`
--
ALTER TABLE `gaiola`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `logisticas`
--
ALTER TABLE `logisticas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT de tabela `ocorrencias`
--
ALTER TABLE `ocorrencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `receber`
--
ALTER TABLE `receber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de tabela `regioes`
--
ALTER TABLE `regioes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de tabela `rotas`
--
ALTER TABLE `rotas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `setores`
--
ALTER TABLE `setores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `veiculos`
--
ALTER TABLE `veiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `carteira`
--
ALTER TABLE `carteira`
  ADD CONSTRAINT `fk_carteira_entregadores1` FOREIGN KEY (`entregadores_id`) REFERENCES `entregadores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_clientes_servicos1` FOREIGN KEY (`servicos_id`) REFERENCES `servicos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_clientes_setores1` FOREIGN KEY (`setores_id`) REFERENCES `setores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_clientes_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `devolucao`
--
ALTER TABLE `devolucao`
  ADD CONSTRAINT `fk_devolucao_entregadores1` FOREIGN KEY (`entregadores_id`) REFERENCES `entregadores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_devolucao_logisticas1` FOREIGN KEY (`logisticas_id`) REFERENCES `logisticas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_devolucao_ocorrencias1` FOREIGN KEY (`ocorrencias_id`) REFERENCES `ocorrencias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_devolucao_receber1` FOREIGN KEY (`receber_id`) REFERENCES `receber` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `entrega`
--
ALTER TABLE `entrega`
  ADD CONSTRAINT `fk_entrada_logisticas1` FOREIGN KEY (`logisticas_id`) REFERENCES `logisticas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_entrega_entregadores1` FOREIGN KEY (`entregadores_id`) REFERENCES `entregadores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_entrega_receber1` FOREIGN KEY (`receber_id`) REFERENCES `receber` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `entregadores`
--
ALTER TABLE `entregadores`
  ADD CONSTRAINT `fk_entregador_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_entregadores_regioes1` FOREIGN KEY (`regioes_id`) REFERENCES `regioes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_entregadores_rotas1` FOREIGN KEY (`rotas_id`) REFERENCES `rotas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_entregadores_veiculos1` FOREIGN KEY (`veiculos_id`) REFERENCES `veiculos` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `logisticas`
--
ALTER TABLE `logisticas`
  ADD CONSTRAINT `fk_logistica_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_logistica_entregadores1` FOREIGN KEY (`entregadores_id`) REFERENCES `entregadores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_logisticas_receber1` FOREIGN KEY (`receber_id`) REFERENCES `receber` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_logisticas_regioes1` FOREIGN KEY (`regioes_id`) REFERENCES `regioes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_logisticas_servicos1` FOREIGN KEY (`servicos_id`) REFERENCES `servicos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `ocorrencias`
--
ALTER TABLE `ocorrencias`
  ADD CONSTRAINT `fk_ocorrencias_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `receber`
--
ALTER TABLE `receber`
  ADD CONSTRAINT `fk_receber_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_receber_gaiola1` FOREIGN KEY (`gaiola_id`) REFERENCES `gaiola` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_receber_regioes1` FOREIGN KEY (`regioes_id`) REFERENCES `regioes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_receber_rotas1` FOREIGN KEY (`rotas_id`) REFERENCES `rotas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_receber_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `rotas`
--
ALTER TABLE `rotas`
  ADD CONSTRAINT `fk_rotas_regioes1` FOREIGN KEY (`regioes_id`) REFERENCES `regioes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_acessos1` FOREIGN KEY (`acessos_id`) REFERENCES `acessos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarios_cargos` FOREIGN KEY (`cargos_id`) REFERENCES `cargos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
