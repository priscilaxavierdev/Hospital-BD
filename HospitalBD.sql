drop database hospital;
create database hospital;
use hospital;
drop table if exists medicos;
CREATE TABLE if not exists `medicos` (
  `id_medicos` varchar(255) PRIMARY KEY,
  `Nome` varchar(255) NOT NULL,
  `CPF` varchar(255) NOT NULL,
  `RG` numeric(9) NOT NULL,
  `Genero` varchar(255),
  `CRM` varchar(255) NOT NULL,
  `data_nascimento` varchar(10) NOT NULL,
  `telefone` numeric(11) NOT NULL,
  `id_especialidade` int NOT NULL,
  `id_formacao` int NOT NULL
);
drop table if exists especialidade;
CREATE TABLE if not exists `especialidade` (
  `id_especialidade` int PRIMARY KEY AUTO_INCREMENT,
  especialidade_nome varchar(255) not null
);
drop table if exists formacao;
CREATE TABLE if not exists `formacao` (
  `id_formacao` int PRIMARY KEY AUTO_INCREMENT,
  formacao_nome varchar(255) not null
);
drop table if exists paciente;
CREATE TABLE if not exists `paciente` (
  `id_paciente` varchar(255) PRIMARY KEY,
  `nome`varchar(255) not null,
  `data_nascimento` varchar(10) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `telefone` numeric(13) NOT NULL,
  `e_mail` varchar(255) NOT NULL,
  `CPF` varchar(255) NOT NULL,
  `RG` numeric(9) NOT NULL
);
drop table if exists consultas;
CREATE TABLE if not exists `consultas` (
  `id_consultas` int PRIMARY KEY AUTO_INCREMENT,
  `data_hora_realizacao` varchar(16) NOT NULL,
  `id_medicos` varchar(255) NOT NULL,
  `id_paciente` varchar(255) NOT NULL,
  `valor_consulta` varchar(255) NOT NULL,
  `id_convenio` varchar(255) NOT NULL,
  `numero_carteira` varchar(255) NOT NULL,
  `id_especialidade` int NOT NULL,
  `id_receita` varchar(255) NOT NULL
);
drop table if exists convenio;
CREATE TABLE if not exists `convenio`(
  `id_convenio` varchar(255) PRIMARY KEY,
  `nome` varchar(255) NOT NULL,
  `nome_convenio` varchar(255) NOT NULL,
  `CNPJ` varchar(255) NOT NULL,
  `tempo_carencia` varchar(255) NOT NULL
);
drop table if exists receita;
CREATE TABLE if not exists `receita` (
  `id_receita` varchar(255) PRIMARY KEY,
  `medicamentos_receitados` varchar(255) NOT NULL,
  `quantidade` numeric(2) NOT NULL,
  `instrucoes_uso` varchar(255) NOT NULL,
  `imprimir_relatorio` varchar(255),
  `visualizar_internet` varchar(255)
);
drop table if exists internacao;
CREATE TABLE if not exists `internacao` (
  `id_internacao` int primary key auto_increment,
  `id_quarto` varchar(255) not null,
  `id_paciente` varchar(255) NOT NULL,
  `id_medicos` varchar(255) NOT NULL,
  `id_codigo` varchar(255) NOT NULL,
  `id_enfermeiro` varchar(255) NOT NULL,
  `id_enfermeiro2` varchar(255) NOT NULL
);
drop table if exists enfermeiro;
CREATE TABLE if not exists `enfermeiro` (
  `id_enfermeiro` varchar(255) PRIMARY KEY,
  `nome` varchar(255) NOT NULL,
  `CPF` varchar(255) NOT NULL,
  `RG` numeric(9) NOT NULL,
  `data_nascimento` numeric(10) NOT NULL,
  `genero` varchar(255),
  `telefone` numeric(11) NOT NULL,
  `CREA` varchar(255) NOT NULL
);
drop table if exists quarto;
CREATE TABLE if not exists `quarto` (
  `id_quarto` varchar(255) PRIMARY KEY,
  `numero` numeric(4) NOT NULL,
  `id_tipo_quarto` int NOT NULL
);
drop table if exists tipo_quarto;
CREATE TABLE if not exists `tipo_quarto` (
  `id_tipo_quarto` int PRIMARY KEY NOT NULL,
  `descricao` varchar(822) NOT NULL,
  `valor_diaria` numeric(5) NOT NULL
);
drop table if exists codigo_internacao;
CREATE TABLE if not exists `codigo_internacao` (
  `id_codigo` varchar(255) primary key,
  `data_entrada` numeric(8) NOT NULL,
  `data_prev_alta` numeric(8) NOT NULL,
  `data_alta` numeric(8),
  `procedimento` varchar(822) NOT NULL
);

ALTER TABLE `medicos` ADD FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id_especialidade`);

ALTER TABLE `medicos` ADD FOREIGN KEY (`id_formacao`) REFERENCES `formacao` (`id_formacao`);

ALTER TABLE `consultas` ADD FOREIGN KEY (`id_convenio`) REFERENCES `convenio` (`id_convenio`);

ALTER TABLE `consultas` ADD FOREIGN KEY (`id_medicos`) REFERENCES `medicos` (`id_medicos`);

ALTER TABLE `consultas` ADD FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`);

ALTER TABLE `consultas` ADD FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id_especialidade`);

ALTER TABLE `consultas` ADD FOREIGN KEY (`id_receita`) REFERENCES `receita` (`id_receita`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`id_quarto`) REFERENCES `quarto` (`id_quarto`);

ALTER TABLE `quarto` ADD FOREIGN KEY (`id_tipo_quarto`) REFERENCES `tipo_quarto` (`id_tipo_quarto`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`id_codigo`) REFERENCES `codigo_internacao` (`id_codigo`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`id_medicos`) REFERENCES `medicos` (`id_medicos`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`id_enfermeiro`) REFERENCES `enfermeiro` (`id_enfermeiro`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`id_enfermeiro2`) REFERENCES `enfermeiro` (`id_enfermeiro`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`);

insert into especialidade (especialidade_nome) values ('Pediatria');
insert into especialidade (especialidade_nome) values ('Clinico_Geral');
insert into especialidade (especialidade_nome) values ('Gastroenterologia');
insert into especialidade (especialidade_nome) values ('Dermatologia');

insert into formacao (formacao_nome) values ('Generalistas');
insert into formacao (formacao_nome) values ('Especialistas');
insert into formacao (formacao_nome) values ('Residentes');

insert into medicos (id_medicos, nome, cpf, rg, genero, crm, data_nascimento, telefone, id_especialidade, id_formacao) values ('1', "Sara Pereira Almeida", "67895736521", "653465792",'Feminino', "CRM 6789/LMN", "01011980", "11123475678", 1, 2);
insert into medicos (id_medicos, nome, cpf, rg, genero, crm, data_nascimento, telefone, id_especialidade, id_formacao) values ('2', "Maria Oliveira", '98765432100','987654321', 'Feminino', 'CRM 5678/DEF', '15051975', '11987654132', "3", '3');
insert into medicos (id_medicos, nome, cpf, rg, genero, crm, data_nascimento, telefone, id_especialidade, id_formacao) values ('3', "Juliana Silva", "12345678900", "123456789", "Feminino", "CRM1234/ABC", "01011980", "11123456789", '2', '1');
insert into medicos (id_medicos, nome, cpf, rg, genero, crm, data_nascimento, telefone, id_especialidade, id_formacao) values ('4', "Lucas Souza", "23456789000", "234567890", "Masculino", "CRM2345/DEF", "02021990", "11234567890", '4', '3');
insert into medicos (id_medicos, nome, cpf, rg, genero, crm, data_nascimento, telefone, id_especialidade, id_formacao) values ('5', "Camila Oliveira", "34567890100", "345678901", "Feminino", "CRM3456/GHI", "03031985", "11345678901", '2', '2');
insert into medicos (id_medicos, nome, cpf, rg, genero, crm, data_nascimento, telefone, id_especialidade, id_formacao) values ('6', "Pedro Alves", "45678901200", "456789012", "Masculino", "CRM4567/JKL", "04041995", "11456789012", '1', '3');
insert into medicos (id_medicos, nome, cpf, rg, genero, crm, data_nascimento, telefone, id_especialidade, id_formacao) values ('7', "Mariana Costa", "56789012300", "567890123", "Feminino", "CRM5678/MNO", "05051985", "11567890123", "3", "1");
insert into medicos (id_medicos, nome, cpf, rg, genero, crm, data_nascimento, telefone, id_especialidade, id_formacao) values ('8', "Laura Santos", "36925814700", "369258147", "Feminino", "CRM1592/PQR", "25061987", "1136925814", '4', '2');
insert into medicos (id_medicos, nome, cpf, rg, genero, crm, data_nascimento, telefone, id_especialidade, id_formacao) values ('9', "Gabriel Augusto", "74185296300", "741852963", "Masculino", "CRM7531/STU", "08101982", "1174185296", '2','1');
insert into medicos (id_medicos, nome, cpf, rg, genero, crm, data_nascimento, telefone, id_especialidade, id_formacao) values ('10', "Beatriz Lima", "25896374100", "258963741", "Feminino", "CRM9632/VWX", "17041990", "1125896374", '4', '1');

insert into paciente (id_paciente, nome, data_nascimento, endereco, telefone, e_mail, cpf, rg) values ('1', "João da Silva","10032000","Rua das Flores 123","9912345678","joao.silva@email.com","12345678900","123456789");
insert into paciente (id_paciente, nome, data_nascimento, endereco, telefone, e_mail, cpf, rg) values ('2', "Maria Souza","05081990","Avenida dos Sonhos 456","8898765432","maria.souza@email.com","98765432100","987654321");
insert into paciente (id_paciente, nome, data_nascimento, endereco, telefone, e_mail, cpf, rg) values ('3', "Carlos Oliveira","15111982","Rua das Palmeiras 789","7723456789","carlos.oliveira@email.com","45678912300","456789123");
insert into paciente (id_paciente, nome, data_nascimento, endereco, telefone, e_mail, cpf, rg) values ('4', "Ana Santos","20021995","Travessa das Estrelas 321","6687654321","ana.santos@email.com","78912345600","789123456");
insert into paciente (id_paciente, nome, data_nascimento, endereco, telefone, e_mail, cpf, rg) values ('5', "Pedro Rocha","12071988","Avenida das Águas 654","5556789012","pedro.rocha@email.com","32165498700","321654987");
insert into paciente (id_paciente, nome, data_nascimento, endereco, telefone, e_mail, cpf, rg) values ('6', "Laura Fernandes","25091992","Rua das Montanhas 987","4489012345","laura.fernandes@email.com","65432198700","654321987");
insert into paciente (id_paciente, nome, data_nascimento, endereco, telefone, e_mail, cpf, rg) values ('7', "André Almeida","03041987","Avenida das Flores 234","3345678901","andre.almeida@email.com","98765432100","987654321");
insert into paciente (id_paciente, nome, data_nascimento, endereco, telefone, e_mail, cpf, rg) values ('8', "Sofia Lima","28121993","Rua dos Bosques 567","2290123456","sofia.lima@email.com","45678912300","456789123");
insert into paciente (id_paciente, nome, data_nascimento, endereco, telefone, e_mail, cpf, rg) values ('9', "Gabriela Martins","11051990","Rua das Palmas 789","7765432109","gabriela.martins@email.com","09876543210","876543210");
insert into paciente (id_paciente, nome, data_nascimento, endereco, telefone, e_mail, cpf, rg) values ('10', "Rafaela Costa","25031888","Avenida das Pedras 456","5598765432","rafaela.costa@email.com","01234567890","765432109");
insert into paciente (id_paciente, nome, data_nascimento, endereco, telefone, e_mail, cpf, rg) values ('11', "Lucas Pereira","07121992","Travessa das Oliveiras 321","6612345678","lucas.pereira@email.com","54321098765","654321098");
insert into paciente (id_paciente, nome, data_nascimento, endereco, telefone, e_mail, cpf, rg) values ('12', "Fernando Oliveira","01012000","Rua dos Pinheiros 654","2245678901","fernando.oliveira@email.com","21098765432","543210987");
insert into paciente (id_paciente, nome, data_nascimento, endereco, telefone, e_mail, cpf, rg) values ('13', "Juliana Santos","14041985","Avenida das Rosas 123","1189012345","juliana.santos@email.com","76543210987","432109876");
insert into paciente (id_paciente, nome, data_nascimento, endereco, telefone, e_mail, cpf, rg) values ('14', "Mariana Silva","30062001","Rua das Violetas 987","4423456789","mariana.silva@email.com","09876543210","654321098");
insert into paciente (id_paciente, nome, data_nascimento, endereco, telefone, e_mail, cpf, rg) values ('15', "Rodrigo Almeida","09091994","Avenida das Orquídeas 234","9956789012","rodrigo.almeida@email.com","54321098765","210987654");

insert into convenio (id_convenio, nome, nome_convenio, cnpj, tempo_carencia) values ('1', "1", 'Convenio A', "24681357000102", '180');
insert into convenio (id_convenio, nome, nome_convenio, cnpj, tempo_carencia) values ('2', "2", 'Convenio B', '13579246800103', '180');
insert into convenio (id_convenio, nome, nome_convenio, cnpj, tempo_carencia) values ('3', "3", 'Convenio C', '12345678000100', '180');
insert into convenio (id_convenio, nome, nome_convenio, cnpj, tempo_carencia) values ('4', "4", 'Convenio D', '98765432000101', '180');
insert into convenio (id_convenio, nome, nome_convenio, cnpj, tempo_carencia) values ('Sem Convenio', 'Sem Convenio', 'Sem Convenio', 'Sem Convenio', 'Sem Convenio');

insert into receita (id_receita, medicamentos_receitados, quantidade, instrucoes_uso, imprimir_relatorio, visualizar_internet) values ('#1234567890', 'dipirona', '1', 'Tome o remedio', 'não', 'sim');
insert into receita (id_receita, medicamentos_receitados, quantidade, instrucoes_uso, imprimir_relatorio, visualizar_internet) values ('#0987654321', 'dipirona', '1', 'Tome o remedio', 'não', 'sim');
insert into receita (id_receita, medicamentos_receitados, quantidade, instrucoes_uso, imprimir_relatorio, visualizar_internet) values ('#2468135710', 'dipirona', '1', 'Tome o remedio', 'não', 'sim');
insert into receita (id_receita, medicamentos_receitados, quantidade, instrucoes_uso, imprimir_relatorio, visualizar_internet) values ('#9876543260', 'dipirona', '1', 'Tome o remedio', 'não', 'sim');
insert into receita (id_receita, medicamentos_receitados, quantidade, instrucoes_uso, imprimir_relatorio, visualizar_internet) values ('#1357924680', 'dipirona', '1', 'Tome o remedio', 'não', 'sim');
insert into receita (id_receita, medicamentos_receitados, quantidade, instrucoes_uso, imprimir_relatorio, visualizar_internet) values ('#0123456789', 'dipirona', '1', 'Tome o remedio', 'não', 'sim');
insert into receita (id_receita, medicamentos_receitados, quantidade, instrucoes_uso, imprimir_relatorio, visualizar_internet) values ('#9876543210', 'dipirona', '1', 'Tome o remedio', 'não', 'sim');
insert into receita (id_receita, medicamentos_receitados, quantidade, instrucoes_uso, imprimir_relatorio, visualizar_internet) values ('#2468235790', 'dipirona', '1', 'Tome o remedio', 'não', 'sim');
insert into receita (id_receita, medicamentos_receitados, quantidade, instrucoes_uso, imprimir_relatorio, visualizar_internet) values ('#5432167890', 'dipirona', '1', 'Tome o remedio', 'não', 'sim');
insert into receita (id_receita, medicamentos_receitados, quantidade, instrucoes_uso, imprimir_relatorio, visualizar_internet) values ('#9876543910', 'dipirona', '1', 'Tome o remedio', 'não', 'sim');
insert into receita (id_receita, medicamentos_receitados, quantidade, instrucoes_uso, imprimir_relatorio, visualizar_internet) values ('#1357924600', 'dipirona', '1', 'Tome o remedio', 'não', 'sim');
insert into receita (id_receita, medicamentos_receitados, quantidade, instrucoes_uso, imprimir_relatorio, visualizar_internet) values ('#4321098765', 'dipirona', '1', 'Tome o remedio', 'não', 'sim');
insert into receita (id_receita, medicamentos_receitados, quantidade, instrucoes_uso, imprimir_relatorio, visualizar_internet) values ('#3210987654', 'dipirona', '1', 'Tome o remedio', 'não', 'sim');
insert into receita (id_receita, medicamentos_receitados, quantidade, instrucoes_uso, imprimir_relatorio, visualizar_internet) values ('#6789012345', 'dipirona', '1', 'Tome o remedio', 'não', 'sim');
insert into receita (id_receita, medicamentos_receitados, quantidade, instrucoes_uso, imprimir_relatorio, visualizar_internet) values ('#2345678901', 'dipirona', '1', 'Tome o remedio', 'não', 'sim');
insert into receita (id_receita, medicamentos_receitados, quantidade, instrucoes_uso, imprimir_relatorio, visualizar_internet) values ('#7654321098', 'dipirona', '1', 'Tome o remedio', 'não', 'sim');
insert into receita (id_receita, medicamentos_receitados, quantidade, instrucoes_uso, imprimir_relatorio, visualizar_internet) values ('#9870123456', 'dipirona', '1', 'Tome o remedio', 'não', 'sim');
insert into receita (id_receita, medicamentos_receitados, quantidade, instrucoes_uso, imprimir_relatorio, visualizar_internet) values ('#2468135790', 'dipirona', '1', 'Tome o remedio', 'não', 'sim');
insert into receita (id_receita, medicamentos_receitados, quantidade, instrucoes_uso, imprimir_relatorio, visualizar_internet) values ('#5678901234', 'dipirona', '1', 'Tome o remedio', 'não', 'sim');
insert into receita (id_receita, medicamentos_receitados, quantidade, instrucoes_uso, imprimir_relatorio, visualizar_internet) values ('#0987654351', 'dipirona', '1', 'Tome o remedio', 'não', 'sim');

insert into consultas (data_hora_realizacao, id_medicos, id_paciente, valor_consulta, id_convenio, numero_carteira, id_especialidade, id_receita) values ("071020151200", "8", "1", '265,00', "4", "6372", '3',"#1234567890");
insert into consultas (data_hora_realizacao, id_medicos, id_paciente, valor_consulta, id_convenio, numero_carteira, id_especialidade, id_receita) values ("120620161530", "1", "10", "390,00", "1", "7362", "1","#0987654321");
insert into consultas (data_hora_realizacao, id_medicos, id_paciente, valor_consulta, id_convenio, numero_carteira, id_especialidade, id_receita) values ("280920171830", "6", "15", "736,00", "3", '1822', '1', "#2468135790");
insert into consultas (data_hora_realizacao, id_medicos, id_paciente, valor_consulta, id_convenio, numero_carteira, id_especialidade, id_receita) values ("250820161015", "4", "7", '123,90', "Sem Convenio", '1876', '4', "#9876543210");
insert into consultas (data_hora_realizacao, id_medicos, id_paciente, valor_consulta, id_convenio, numero_carteira, id_especialidade, id_receita) values ("180120191200", "2", "8", '231,87', "2", '9866', '3', "#1357924680");
insert into consultas (data_hora_realizacao, id_medicos, id_paciente, valor_consulta, id_convenio, numero_carteira, id_especialidade, id_receita) values ("040320181930", "10", "12", '376,90', "1", '1763', '4', "#0123456789");
insert into consultas (data_hora_realizacao, id_medicos, id_paciente, valor_consulta, id_convenio, numero_carteira, id_especialidade, id_receita) values ("300520201045", "9", "9", '254,00', "3", '1930', '2', "#9876543210");
insert into consultas (data_hora_realizacao, id_medicos, id_paciente, valor_consulta, id_convenio, numero_carteira, id_especialidade, id_receita) values ("210720171800", "4", "11", '172,09', "2", '8266', '2', "#2468135790");
insert into consultas (data_hora_realizacao, id_medicos, id_paciente, valor_consulta, id_convenio, numero_carteira, id_especialidade, id_receita) values ("151020201230", "5", "4", '736,23', "Sem Convenio", '1373', '2', "#5432167890");
insert into consultas (data_hora_realizacao, id_medicos, id_paciente, valor_consulta, id_convenio, numero_carteira, id_especialidade, id_receita) values ("090320161100", "3", "9", '198,09', "4", '1930', '2', "#9876543210");
insert into consultas (data_hora_realizacao, id_medicos, id_paciente, valor_consulta, id_convenio, numero_carteira, id_especialidade, id_receita) values ("080520181015", "4", "10", '287,30', "4", '7362', '4', "#1357924680");
insert into consultas (data_hora_realizacao, id_medicos, id_paciente, valor_consulta, id_convenio, numero_carteira, id_especialidade, id_receita) values ("010420201400", "5", "11", '542,19', "2", '8266', '2', "#4321098765");
insert into consultas (data_hora_realizacao, id_medicos, id_paciente, valor_consulta, id_convenio, numero_carteira, id_especialidade, id_receita) values ("190720161930", "6", "12", '456,90', "1", '1763', '1', "#3210987654");
insert into consultas (data_hora_realizacao, id_medicos, id_paciente, valor_consulta, id_convenio, numero_carteira, id_especialidade, id_receita) values ("300820181045", "7", "4", '213,23', "4", '1373', '3', "#6789012345");
insert into consultas (data_hora_realizacao, id_medicos, id_paciente, valor_consulta, id_convenio, numero_carteira, id_especialidade, id_receita) values ("240620171200", "8", "3", '293,70', "2", '9373', '4', "#2345678901");
insert into consultas (data_hora_realizacao, id_medicos, id_paciente, valor_consulta, id_convenio, numero_carteira, id_especialidade, id_receita) values ("140920201830", "9", "14", '383,70', "3", '8432', '2', "#7654321098");
insert into consultas (data_hora_realizacao, id_medicos, id_paciente, valor_consulta, id_convenio, numero_carteira, id_especialidade, id_receita) values ("070220151015", "10", "5", '322,23', "1", '0863', '4', "#9870123456");
insert into consultas (data_hora_realizacao, id_medicos, id_paciente, valor_consulta, id_convenio, numero_carteira, id_especialidade, id_receita) values ("221120181200", "1", "7", '123,90', "Sem Convenio", '1876', '1', "#2468135790");
insert into consultas (data_hora_realizacao, id_medicos, id_paciente, valor_consulta, id_convenio, numero_carteira, id_especialidade, id_receita) values ("130620161030", "2", "3", '216,70', "2", '9373', '3', "#5678901234");
insert into consultas (data_hora_realizacao, id_medicos, id_paciente, valor_consulta, id_convenio, numero_carteira, id_especialidade, id_receita) values ("250120221415", "3", "5", '273,80', "4", '0863', '2', "#0987654321");

insert into tipo_quarto (id_tipo_quarto, descricao, valor_diaria) values ("1",'Apartamento', "230");
insert into tipo_quarto (id_tipo_quarto, descricao, valor_diaria) values ('2','Quarto Duplo', "150");
insert into tipo_quarto (id_tipo_quarto, descricao, valor_diaria) values ('3','Enfermaria','100');

insert into quarto (id_quarto, numero, id_tipo_quarto) values ('1', '281','1');
insert into quarto (id_quarto, numero, id_tipo_quarto) values ('2', '282','2');
insert into quarto (id_quarto, numero, id_tipo_quarto) values ('3', '283','3');
insert into quarto (id_quarto, numero, id_tipo_quarto) values ('4', '284','1');
insert into quarto (id_quarto, numero, id_tipo_quarto) values ('5', '285','3');
insert into quarto (id_quarto, numero, id_tipo_quarto) values ('6', '286','3');
insert into quarto (id_quarto, numero, id_tipo_quarto) values ('7', '287','1');

insert into codigo_internacao (id_codigo, data_entrada, data_prev_alta, data_alta, procedimento) values ('1', '02082015', '10082015', '11082015', 'Cirurgia');
insert into codigo_internacao (id_codigo, data_entrada, data_prev_alta, data_alta, procedimento) values ('2', '09092015', '17102015', '24112015', 'Cirurgia');
insert into codigo_internacao (id_codigo, data_entrada, data_prev_alta, data_alta, procedimento) values ('3', '01022016', '20042016', '01032016', 'Cirurgia');
insert into codigo_internacao (id_codigo, data_entrada, data_prev_alta, data_alta, procedimento) values ('4', '17052017', '21062017', '09062017', 'Cirurgia');
insert into codigo_internacao (id_codigo, data_entrada, data_prev_alta, data_alta, procedimento) values ('5', '19012018', '20012018', '28022018', 'Cirurgia');
insert into codigo_internacao (id_codigo, data_entrada, data_prev_alta, data_alta, procedimento) values ('6', '08102019', '24102019', '24102019', 'Cirurgia');
insert into codigo_internacao (id_codigo, data_entrada, data_prev_alta, data_alta, procedimento) values ('7', '15042022', '16052022', '17052022', 'Cirurgia');

insert into enfermeiro (id_enfermeiro, nome, CPF, RG, data_nascimento, genero, telefone, CREA) values ('1', 'Gabriele Camargo', '98753716390', '827653982', '09102003', 'Feminino', '11983046527', '944838476');
insert into enfermeiro (id_enfermeiro, nome, CPF, RG, data_nascimento, genero, telefone, CREA) values ('2', 'Guilherme Camargo', '37462597624', '428974802', '10021987','Masculino', '11982736473', '394843287');
insert into enfermeiro (id_enfermeiro, nome, CPF, RG, data_nascimento, genero, telefone, CREA) values ('3', "Maria Santos", "98765432101", "543210987", "15051985", "Feminino", "11987654321", "0987654321");
insert into enfermeiro (id_enfermeiro, nome, CPF, RG, data_nascimento, genero, telefone, CREA) values ('4', "Pedro Oliveira", "45678912345", "654321098", "02071992", "Masculino", "11976543210", "5678901234");
insert into enfermeiro (id_enfermeiro, nome, CPF, RG, data_nascimento, genero, telefone, CREA) values ('5', "Ana Pereira", "78912345678", "321098765", "11031980", "Feminino", "11965432109", "9876543210");
insert into enfermeiro (id_enfermeiro, nome, CPF, RG, data_nascimento, genero, telefone, CREA) values ('6', "Lucas Mendes", "56789123456", "908765432", "25081988", "Masculino", "11954321098", "8765432109");
insert into enfermeiro (id_enfermeiro, nome, CPF, RG, data_nascimento, genero, telefone, CREA) values ('7', "Laura Souza", "23456789123", "109876543", "18071995", "Feminino", "11943210987", "7654321098");
insert into enfermeiro (id_enfermeiro, nome, CPF, RG, data_nascimento, genero, telefone, CREA) values ('8', "Guilherme Costa", "90123456789", "210987654", "05021987", "Masculino", "11932109876", "6543210987");
insert into enfermeiro (id_enfermeiro, nome, CPF, RG, data_nascimento, genero, telefone, CREA) values ('9', "Camila Ferreira", "67891234567", "876543210", "30061991", "Feminino", "11921098765", "5432109876");
insert into enfermeiro (id_enfermeiro, nome, CPF, RG, data_nascimento, genero, telefone, CREA) values ('10', "Gabriela Silva", "12345678912", "987654321", "30041987", "Feminino", "11987654321", "7654321098");

insert into internacao (id_internacao, id_quarto, id_paciente, id_medicos, id_codigo, id_enfermeiro, id_enfermeiro2) values ('1', '1', '7', '2', '1', '2', '1');
insert into internacao (id_internacao, id_quarto, id_paciente, id_medicos, id_codigo, id_enfermeiro, id_enfermeiro2) values ('2', '2', '9', '7', '2', '3', '4');
insert into internacao (id_internacao, id_quarto, id_paciente, id_medicos, id_codigo, id_enfermeiro, id_enfermeiro2) values ('3', '3', '7', '10', '3', '5', '6');
insert into internacao (id_internacao, id_quarto, id_paciente, id_medicos, id_codigo, id_enfermeiro, id_enfermeiro2) values ('4', '4', '10', '5', '4', '7', '8');
insert into internacao (id_internacao, id_quarto, id_paciente, id_medicos, id_codigo, id_enfermeiro, id_enfermeiro2) values ('5', '5', '15', '8', '5', '9', '10');
insert into internacao (id_internacao, id_quarto, id_paciente, id_medicos, id_codigo, id_enfermeiro, id_enfermeiro2) values ('6', '6', '2', '3', '6', '2', '6');
insert into internacao (id_internacao, id_quarto, id_paciente, id_medicos, id_codigo, id_enfermeiro, id_enfermeiro2) values ('7', '7',  '9', '1', '7', '4', '10');