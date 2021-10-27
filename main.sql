.header on
.mode column

CREATE TABLE cartao_Vacinacao (
	nome varchar(20), 
	dose1 text,
	unidade text,
	cnes bigint,
	dia datetime,
	lote text,
	fabricante text,
	vacinador text,
	reg_prof bigint,
  FOREIGN KEY (fabricante) REFERENCES fabricante_vacina(nome_frabricante)
);

CREATE TABLE fabricante_vacina (
	codigo bigint,
	nome_frabricante text not null primary key
);

INSERT INTO fabricante_vacina VALUES
  (1001, 'OXFORD'),
  (1002, 'BUTANTAN'),
  (1003, 'VACHINA');

INSERT INTO cartao_Vacinacao VALUES
  ('Pedro ','D1', 'MedCenter', 12345678, '12/01/2021', '2020/001', 'BUTANTAN', 'Socorro', 123),
  ('Mauricio ','D1', 'São Jose', 12345141, '15/01/2021', '2020/005', 'OXFORD', 'Marco', 133),
  ('Alex ','D1', 'MedCenter', 12345342, '21/01/2021', '2020/002', 'VACHINA', 'Andrezza', 213),
  ('Daiane ','D1', 'Medical', 12345567, '26/02/2021', '2020/006', 'BUTANTAN', 'Socorro', 123),
  ('Rony ','D1', 'São Jose', 12345121, '31/01/2021', '2020/002', 'OXFORD', 'Marco', 133),
  ('Penelope ','D1', 'MedCenter', 12443456, '12/01/2021', '2020/001', 'BUTANTAN', 'Socorro', 123),
  ('Matheus ','D1', 'São Jose', 12345758, '15/01/2021', '2020/005', 'OXFORD', 'Marco', 133),
  ('Alexandra ','D1', 'MedCenter', 12345351, '21/01/2021', '2020/002', 'VACHINA', 'Andrezza', 213),
  ('Dayyana','D1', 'Medical', 12345258, '26/02/2021', '2020/006', 'BUTANTAN', 'Socorro', 123),
  ('Ronison','D1', 'São Jose', 12345159, '31/01/2021', '2020/002', 'OXFORD', 'Marco', 133);

.print 'Lista de Pacientes'
select * from cartao_Vacinacao order by nome;
.print

.print 'VACINADOS'
select CV.nome as 'Paciente',
       CV.dia as 'Dia da vacinação',
       FV.nome_frabricante as 'Nome do Frabricante' 
from cartao_Vacinacao CV,fabricante_vacina FV 
where FV.nome_frabricante = CV.fabricante 
and FV.nome_frabricante like 'OXFORD'
order by nome;