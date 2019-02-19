create database escolaES;
use escolaES;
 drop database escolaES;
 -- inserir aluno
  insert into disciplinas(nome) values ('Português'),('Matemática'),('História'),('Geografia');
  insert into notas(codDisciplina,bimestre,notas) values (1,1,5);
  insert into notas(codDisciplina,bimestre,notas) values (2,1,6),(3,1,10),(4,1,8);
  insert into aluno(codNotas,matricula,usuario,senha,tipo,nome,dataNasc,telefone,numero,complemento,cep,situacao) values (1,'AL52145','ed','1234','Aluno','Edison Jr.','1998-01-05','(21)3073-5315',183,'AP 101','26262-131','Aprovado'),(2,'AL52145','ed','1234','Aluno','Edison Jr.','1998-01-05','(21)3073-5315',183,'AP 101','26262-131','Aprovado'),(3,'AL52145','ed','1234','Aluno','Edison Jr.','1998-01-05','(21)3073-5315',183,'AP 101','26262-131','Aprovado'),(4,'AL52145','ed','1234','Aluno','Edison Jr.','1998-01-05','(21)3073-5315',183,'AP 101','26262-131','Aprovado');
  select * from aluno;
-- consultar aluno
select a.matricula,a.tipo,a.nome,a.dataNasc,a.telefone,n.notas,n.bimestre,d.nome,a.situacao 
 from aluno a inner join notas n
 on n.codNotas = a.codNotas
 inner join disciplinas d
 on d.codDisciplina = n.codDisciplina
 and a.matricula='AL52145';
 
 -- calcular media do aluno
 select a.matricula,a.tipo,a.nome,a.dataNasc,a.telefone,n.notas,n.bimestre,a.situacao, sum(notas/4) as media from aluno a inner join notas n
 on n.codNotas = a.codNotas
 inner join disciplinas d
 on d.codDisciplina = n.codDisciplina
 and a.matricula='AL52145';
  
  
  -- inserir secretaria  
 insert into secretaria(codSecretaria,matricula,usuario,senha,tipo,nome,dataNasc,telefone,numero,complemento,cep) values (1,'A521458','admin','admin','Administrador','Edison','1998-01-05','(21)3073-5315',183,'AP 101','26262-131'); 
 select*from secretaria;

 
 -- inserir professor
 insert into professor(codProfessor,matricula,usuario,senha,tipo,nome,dataNasc,telefone,numero,complemento,cep,formacao) values (1,'P521460','ed','12345','Professor','Edison Jr','1998-01-05','(21)3073-5315',183,'AP 101','26262-131','Matemática'),(2,'P521460','ed','12345','Professor','Edison Jr','1998-01-05','(21)3073-5315',183,'AP 101','26262-131','Geografia'); 
 select * from professor;
 
 insert into  cursos(codCurso,codDisciplina,nome) values (1,1,'Ensino Médio'),(2,2,'Ensino Médio'),(3,3,'Ensino Médio'),(4,4,'Ensino Médio');
 insert into turmas(codTurma,codAluno,nome) values (1,1,'Turma 306');
 

create table disciplinas(
	codDisciplina int auto_increment not null,
    nome varchar(60) not null,
    primary key(codDisciplina));
    
create table notas(
	codNotas int auto_increment not null,
    codDisciplina int not null,
    bimestre int not null,
    notas float not null,
    foreign key(codDisciplina) references disciplinas(codDisciplina),
    primary key(codNotas));
    
create table secretaria(
	codSecretaria int not null,
	matricula varchar(80) not null,
    usuario varchar(80) not null,
    senha varchar(80) not null,
    tipo varchar(80) not null,
    nome varchar(80) not null,
    dataNasc date not null,
    telefone varchar(13) not null,
    numero int not null,
    complemento varchar(100) not null,
    cep varchar(9) not null,
    primary key (codSecretaria));
 
 create table aluno(
	codAluno int auto_increment not null,
    codNotas int not null,
    matricula varchar(80) not null,
    usuario varchar(80) not null,
    senha varchar(80) not null,
    tipo varchar(80) not null,
    nome varchar(80) not null,
    dataNasc date not null,
    telefone varchar(13) not null,
    numero int not null,
    complemento varchar(100) not null,
    cep varchar(9) not null,
    situacao varchar(50) not null,
    foreign key (codNotas) references notas(codNotas),
    primary key (codAluno));
    
create table professor(
	codProfessor int not null,
    matricula varchar(80) not null,
    usuario varchar(80) not null,
    senha varchar(80) not null,
    tipo varchar(80) not null,
    nome varchar(80) not null,
    dataNasc date not null,
    telefone varchar(13) not null,
    numero int not null,
    complemento varchar(100) not null,
    cep varchar(9) not null,
    formacao varchar(100) not null,
    primary key (codProfessor));

create table turmas(
	codTurma int not null,
    codAluno int not null,
    nome varchar(60) not null,
    foreign key(codAluno) references aluno(codAluno),
    primary key(codTurma));

create table cursos(
	codCurso int not null,
    codDisciplina int not null,
    nome varchar(60) not null,
    foreign key(codDisciplina) references disciplinas(codDisciplina),
    primary key(codCurso));
    
create table profXturmas(
	cod_profXturmas int not null,
    codTurma int not null,
    codProfessor int not null,
    foreign key(codProfessor) references professor(codProfessor),
    foreign key(codTurma) references turmas(codTurma),
    primary key(cod_profXturmas));
    
create table turmasXcursos(
	cod_turmasXcursos int not null,
    codTurma int not null,
    codCurso int not null,
    foreign key(codTurma) references turmas(codTurma),
    foreign key(codCurso) references cursos(codCurso),
    primary key(cod_turmasXcursos));
    
 -- Inserir relação professor e turmas   
insert into profXturmas(cod_profXturmas,codTurma,codProfessor) values (1,1,1);

-- Inserir relação turmas e curso
insert into turmasXcursos(cod_turmasXcursos,codTurma,codCurso) values (1, 1, 1);

-- consultar a turma do professor
select pf.matricula,pf.tipo,pf.nome,pf.dataNasc,pf.telefone,pf.formacao,t.nome
from professor pf inner join profXturmas pt
on pt.codProfessor = pf.codProfessor
inner join turmas t
on pt.codTurma = t.codTurma
and pf.matricula='P521460';
