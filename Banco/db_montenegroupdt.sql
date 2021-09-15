-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Set-2021 às 23:11
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

UPDATE `acessos` SET `id` = 1,`nivel` = 'admin' WHERE `acessos`.`id` = 1;
UPDATE `acessos` SET `id` = 2,`nivel` = 'Assitente' WHERE `acessos`.`id` = 2;
UPDATE `acessos` SET `id` = 3,`nivel` = 'Coordenador' WHERE `acessos`.`id` = 3;
UPDATE `acessos` SET `id` = 4,`nivel` = 'Auxiliar' WHERE `acessos`.`id` = 4;
UPDATE `acessos` SET `id` = 6,`nivel` = NULL WHERE `acessos`.`id` = 6;
UPDATE `acessos` SET `id` = 7,`nivel` = NULL WHERE `acessos`.`id` = 7;

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

UPDATE `cargos` SET `id` = 1,`descricao` = 'Asssistente de Logística' WHERE `cargos`.`id` = 1;
UPDATE `cargos` SET `id` = 2,`descricao` = 'Coordenadora de Logística' WHERE `cargos`.`id` = 2;
UPDATE `cargos` SET `id` = 3,`descricao` = 'Asssistente de Logística' WHERE `cargos`.`id` = 3;
UPDATE `cargos` SET `id` = 4,`descricao` = 'Supervisor de Operações Logísticas Interior' WHERE `cargos`.`id` = 4;
UPDATE `cargos` SET `id` = 5,`descricao` = 'Encarregada de Expedição' WHERE `cargos`.`id` = 5;
UPDATE `cargos` SET `id` = 6,`descricao` = 'Assistente da qualidade' WHERE `cargos`.`id` = 6;
UPDATE `cargos` SET `id` = 7,`descricao` = 'Auxiliar de Logística' WHERE `cargos`.`id` = 7;
UPDATE `cargos` SET `id` = 8,`descricao` = 'Diretora' WHERE `cargos`.`id` = 8;
UPDATE `cargos` SET `id` = 9,`descricao` = 'Assistente Financeiro' WHERE `cargos`.`id` = 9;
UPDATE `cargos` SET `id` = 10,`descricao` = 'Coordenadora de RH' WHERE `cargos`.`id` = 10;

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

UPDATE `clientes` SET `id` = 7,`nome` = 'HAPIVIDA',`data` = '2021-07-03 00:04:14',`telefone` = NULL,`email` = NULL,`cnpj` = NULL,`foto` = NULL,`usuarios_id` = 7,`servicos_id` = 3,`setores_id` = 3 WHERE `clientes`.`id` = 7;
UPDATE `clientes` SET `id` = 8,`nome` = 'GFL',`data` = '2021-07-05 19:01:25',`telefone` = NULL,`email` = NULL,`cnpj` = NULL,`foto` = NULL,`usuarios_id` = 7,`servicos_id` = 1,`setores_id` = 1 WHERE `clientes`.`id` = 8;
UPDATE `clientes` SET `id` = 9,`nome` = 'DBA',`data` = '2021-07-05 19:25:30',`telefone` = NULL,`email` = NULL,`cnpj` = NULL,`foto` = NULL,`usuarios_id` = 7,`servicos_id` = 1,`setores_id` = 1 WHERE `clientes`.`id` = 9;
UPDATE `clientes` SET `id` = 10,`nome` = 'NT LOG',`data` = '2021-07-05 19:35:18',`telefone` = NULL,`email` = NULL,`cnpj` = NULL,`foto` = NULL,`usuarios_id` = 7,`servicos_id` = 1,`setores_id` = 1 WHERE `clientes`.`id` = 10;

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

UPDATE `gaiola` SET `id` = 1,`data` = '2021-09-02 23:33:51',`nome` = '01 a 20' WHERE `gaiola`.`id` = 1;
UPDATE `gaiola` SET `id` = 2,`data` = '2021-09-02 23:33:51',`nome` = '21 a 40' WHERE `gaiola`.`id` = 2;
UPDATE `gaiola` SET `id` = 3,`data` = '2021-09-02 23:33:51',`nome` = '41 a 60' WHERE `gaiola`.`id` = 3;

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

UPDATE `ocorrencias` SET `id` = 1,`nome` = 'Endereço não encotrado',`usuarios_id` = 4 WHERE `ocorrencias`.`id` = 1;
UPDATE `ocorrencias` SET `id` = 2,`nome` = 'Dificil acesso',`usuarios_id` = 4 WHERE `ocorrencias`.`id` = 2;
UPDATE `ocorrencias` SET `id` = 3,`nome` = 'Moto apreendida',`usuarios_id` = 7 WHERE `ocorrencias`.`id` = 3;
UPDATE `ocorrencias` SET `id` = 6,`nome` = 'Ausente',`usuarios_id` = 7 WHERE `ocorrencias`.`id` = 6;

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

UPDATE `regioes` SET `id` = 74,`nome` = 'Grande Ilha' WHERE `regioes`.`id` = 74;

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

UPDATE `rotas` SET `id` = 33,`nome` = 'ROTA-01',`regioes_id` = 74 WHERE `rotas`.`id` = 33;

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

UPDATE `servicos` SET `id` = 1,`nome` = 'Pequenos volumes' WHERE `servicos`.`id` = 1;
UPDATE `servicos` SET `id` = 3,`nome` = 'boletos' WHERE `servicos`.`id` = 3;

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

UPDATE `setores` SET `id` = 1,`nome` = 'E- commerce' WHERE `setores`.`id` = 1;
UPDATE `setores` SET `id` = 3,`nome` = 'Editorial' WHERE `setores`.`id` = 3;

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

UPDATE `usuarios` SET `id` = 4,`nome` = 'admin',`email` = 'admin@eneylton.com',`senha` = '$2y$10$JZR7X2ZpplGhF4dtchAhJedF/Y0/4ynAOd8VBlR4ehJfLOKHX4mLG',`cargos_id` = 1,`acessos_id` = 1 WHERE `usuarios`.`id` = 4;
UPDATE `usuarios` SET `id` = 7,`nome` = 'ene',`email` = 'eneylton@hotmail.com',`senha` = '$2y$10$JZR7X2ZpplGhF4dtchAhJedF/Y0/4ynAOd8VBlR4ehJfLOKHX4mLG',`cargos_id` = 1,`acessos_id` = 2 WHERE `usuarios`.`id` = 7;
UPDATE `usuarios` SET `id` = 13,`nome` = 'enexs',`email` = 'enex@gmail.com.br',`senha` = '202cb962ac59075b964b07152d234b70',`cargos_id` = 1,`acessos_id` = 3 WHERE `usuarios`.`id` = 13;

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

UPDATE `veiculos` SET `id` = 1,`nome` = 'MOTO' WHERE `veiculos`.`id` = 1;
UPDATE `veiculos` SET `id` = 2,`nome` = 'CARRO' WHERE `veiculos`.`id` = 2;
UPDATE `veiculos` SET `id` = 3,`nome` = 'CAMINHÃO' WHERE `veiculos`.`id` = 3;
UPDATE `veiculos` SET `id` = 5,`nome` = 'BIKE' WHERE `veiculos`.`id` = 5;

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
