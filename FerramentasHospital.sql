use hospital;

-- select * from medicos;

-- alter table hospital.medicos add column em_atividade varchar(255);

-- update hospital.medicos set em_atividade = 'Ativo';

-- update hospital.medicos set em_atividade = 'Inativo' where id_medicos = 1;

-- update hospital.medicos set em_atividade = 'Inativo' where id_medicos = 7;

-- select * from consultas where data_hora_realizacao like "%2020%";
-- SELECT AVG (valor_consulta) as media from consultas;1257

select * from codigo_internacao where data_prev_alta < data_alta;

select * from internacao where id_codigo = '1';

select *from consultas;
select * from receita where id_receita = '#1234567890';

select min(valor_consulta) as menor_valor from consultas;
select * from consultas where valor_consulta = '123,90';

select * from consultas where valor_consulta = '736,23';

select * from internacao;

select * from quarto;

select * from tipo_quarto;

select * from codigo_internacao;

select datediff ('20220415','20220516');

select * from internacao;
select data_entrada, data_alta, procedimento from codigo_internacao;
select * from quarto where id_tipo_quarto = 1;

select * from consultas;

select * from paciente;

select * from medicos where id_formacao = 2;
select * from internacao where id_medicos = 8;
select * from quarto;
select * from paciente;

select id_medicos from consultas where id_medicos = 10;
select nome from medicos;

select * from medicos where nome like '%Gabriel%';2 6 4 10

select * from internacao;
select * from enfermeiro;