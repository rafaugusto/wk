CREATE TABLE `clientes` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `cidade` varchar(200) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8

CREATE TABLE `produtos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(200) NOT NULL,
  `precovenda` decimal(5,2) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8

CREATE TABLE `pedidos_gerais` (
  `numero` int(11) NOT NULL AUTO_INCREMENT,
  `data_emissao` date DEFAULT NULL,
  `cod_cliente` int(11) NOT NULL,
  `valor` decimal(5,2) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `pedidos_gerais_FK` (`cod_cliente`),
  CONSTRAINT `pedidos_gerais_FK` FOREIGN KEY (`cod_cliente`) REFERENCES `clientes` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8


CREATE TABLE `pedidos_produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `cod_produto` int(11) NOT NULL,
  `quantidade` smallint(6) NOT NULL,
  `vlr_unitario` decimal(5,2) NOT NULL,
  `vlr_total` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedidos_produtos_FK_1` (`cod_produto`),
  KEY `pedidos_produtos_FK_2` (`num_pedido`),
  CONSTRAINT `pedidos_produtos_FK` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos_gerais` (`numero`),
  CONSTRAINT `pedidos_produtos_FK_1` FOREIGN KEY (`cod_produto`) REFERENCES `produtos` (`codigo`),
  CONSTRAINT `pedidos_produtos_FK_2` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos_gerais` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8

INSERT INTO wk.clientes
(codigo, nome, cidade, uf)
VALUES(1, 'João da Silva', 'Americana', 'SP');
INSERT INTO wk.clientes
(codigo, nome, cidade, uf)
VALUES(2, 'Emanuel Nogueira', 'Americana', 'SP');
INSERT INTO wk.clientes
(codigo, nome, cidade, uf)
VALUES(3, 'Rafael Augusto', 'Santa Bárbara dOeste', 'SP');
INSERT INTO wk.clientes
(codigo, nome, cidade, uf)
VALUES(4, 'Michelli Aparecida', 'Santa Bárbara dOeste', 'SP');
INSERT INTO wk.clientes
(codigo, nome, cidade, uf)
VALUES(5, 'Agnaldo Rogério', 'Limeira', 'SP');
INSERT INTO wk.clientes
(codigo, nome, cidade, uf)
VALUES(6, 'Felipe Gomes', 'Gramado', 'RS');
INSERT INTO wk.clientes
(codigo, nome, cidade, uf)
VALUES(7, 'Marina Bárbara', 'Santa Bárbara dOeste', 'SP');
INSERT INTO wk.clientes
(codigo, nome, cidade, uf)
VALUES(8, 'Roberto Silva', 'Limeira', 'SP');
INSERT INTO wk.clientes
(codigo, nome, cidade, uf)
VALUES(9, 'Daniela Santos', 'São Paulo', 'SP');
INSERT INTO wk.clientes
(codigo, nome, cidade, uf)
VALUES(10, 'Benedita Gonçalves', 'São Paulo', 'SP');
INSERT INTO wk.clientes
(codigo, nome, cidade, uf)
VALUES(11, 'Marcos Antonio', 'Jundiaí', 'SP');
INSERT INTO wk.clientes
(codigo, nome, cidade, uf)
VALUES(12, 'Antonio Carlos', 'Limeira', 'SP');
INSERT INTO wk.clientes
(codigo, nome, cidade, uf)
VALUES(13, 'Miguel Souza', 'São Paulo', 'SP');
INSERT INTO wk.clientes
(codigo, nome, cidade, uf)
VALUES(14, 'Laura Albuquerque', 'Fortaleza', 'CE');
INSERT INTO wk.clientes
(codigo, nome, cidade, uf)
VALUES(15, 'José Alberto', 'Nova Odessa', 'SP');
INSERT INTO wk.clientes
(codigo, nome, cidade, uf)
VALUES(16, 'Paulo César', 'Santa Bárbara dOeste', 'SP');
INSERT INTO wk.clientes
(codigo, nome, cidade, uf)
VALUES(17, 'Raimundo Nonato', 'São Carlos', 'SP');
INSERT INTO wk.clientes
(codigo, nome, cidade, uf)
VALUES(18, 'Diego Abelardo', 'São Carlos', 'SP');
INSERT INTO wk.clientes
(codigo, nome, cidade, uf)
VALUES(19, 'Catarina Almeida', 'Limeira', 'SP');
INSERT INTO wk.clientes
(codigo, nome, cidade, uf)
VALUES(20, 'Ana Elisa', 'Americana', 'SP');

INSERT INTO wk.produtos
(codigo, descricao, precovenda)
VALUES(1, 'Arroz', 14.90);
INSERT INTO wk.produtos
(codigo, descricao, precovenda)
VALUES(2, 'Feijão', 10.00);
INSERT INTO wk.produtos
(codigo, descricao, precovenda)
VALUES(3, 'Tomate', 10.00);
INSERT INTO wk.produtos
(codigo, descricao, precovenda)
VALUES(4, 'Alface', 10.00);
INSERT INTO wk.produtos
(codigo, descricao, precovenda)
VALUES(5, 'Frango', 10.00);
INSERT INTO wk.produtos
(codigo, descricao, precovenda)
VALUES(6, 'Linguiça', 10.00);
INSERT INTO wk.produtos
(codigo, descricao, precovenda)
VALUES(7, 'Presunto', 10.00);
INSERT INTO wk.produtos
(codigo, descricao, precovenda)
VALUES(8, 'Queijo', 10.00);
INSERT INTO wk.produtos
(codigo, descricao, precovenda)
VALUES(9, 'Ovo', 10.00);
INSERT INTO wk.produtos
(codigo, descricao, precovenda)
VALUES(10, 'Couve', 10.00);
INSERT INTO wk.produtos
(codigo, descricao, precovenda)
VALUES(11, 'Repolho', 10.00);
INSERT INTO wk.produtos
(codigo, descricao, precovenda)
VALUES(12, 'Manga', 10.00);
INSERT INTO wk.produtos
(codigo, descricao, precovenda)
VALUES(13, 'Uva', 10.00);
INSERT INTO wk.produtos
(codigo, descricao, precovenda)
VALUES(14, 'Guaraná Lata', 4.50);
INSERT INTO wk.produtos
(codigo, descricao, precovenda)
VALUES(15, 'Cerveja Lata', 10.00);
INSERT INTO wk.produtos
(codigo, descricao, precovenda)
VALUES(16, 'Salgadinho', 10.00);
INSERT INTO wk.produtos
(codigo, descricao, precovenda)
VALUES(17, 'Café ', 10.00);
INSERT INTO wk.produtos
(codigo, descricao, precovenda)
VALUES(18, 'Papel higiênico', 10.00);
INSERT INTO wk.produtos
(codigo, descricao, precovenda)
VALUES(19, 'Shampoo', 13.90);
INSERT INTO wk.produtos
(codigo, descricao, precovenda)
VALUES(20, 'Detergente', 10.00);
INSERT INTO wk.produtos
(codigo, descricao, precovenda)
VALUES(21, 'Desodorante', 10.00);

