create database escolaES;
use escolaES;
 
 create table pessoa(
	cpf varchar(14) not null,
    nome varchar(80) not null,
    dataNasc date not null,
    telefone varchar(13) not null,
    numero int not null,
    complemento varchar(100) not null,
    cep varchar(9) not null,
    primary key (cpf));
    
create table secretaria(
	codSecretaria int auto_increment not null,
    usuario varchar(80) not null,
    senha varchar(80) not null,
    primary key (codSecretaria));
 
 create table aluno(
	codAluno int auto_increment not null,
    usuario varchar(80) not null,
    senha varchar(80) not null,
    notas float not null,
    situacao varchar(50) not null,
    cpf varchar(14) not null,
    foreign key (cpf) references pessoa(cpf),
    primary key (codAluno));
    
create table professor(
	codProfessor int auto_increment not null,
    usuario varchar(80) not null,
    senha varchar(80) not null,
    cpf varchar(14) not null,
    formacao varchar(100) not null,
    foreign key (cpf) references pessoa(cpf),
    primary key (codProfessor));

create table cursos(
	codCurso int auto_increment not null,
    nome varchar(60) not null,
    codAluno int not null,
    foreign key(codAluno) references aluno(codAluno),
    primary key(codCurso));
    
create table disciplinas(
	codDisciplina int auto_increment not null,
    codCurso int not null,
    nome varchar(60) not null,
    foreign key(codCurso) references cursos(codCurso),
    primary key(codDisciplina));
    
create table turmas(
	codTurma int auto_increment not null,
    codCurso int not null,
    nome varchar(60) not null,
    foreign key(codCurso) references cursos(codCurso),
    primary key(codTurma));
    
create table notas(
	codNotas int auto_increment not null,
    codAluno int not null,
    codTurma int not null,
    codDisciplina int not null,
    bimestre int not null,
    nota float not null,
    foreign key(codAluno) references aluno(codAluno),
    foreign key(codTurma) references turmas(codTurma),
    foreign key(codDisciplina) references disciplinas(codDisciplina),
    primary key(codNotas));

