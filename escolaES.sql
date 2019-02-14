create database escolaES;
use escolaES;
 
 create table pessoa(
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
    primary key (cpf));

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
	codSecretaria int auto_increment not null,
	matricula varchar(80) not null,
    foreign key (matricula) references pessoa(matricula),
    primary key (codSecretaria));
 
 create table aluno(
	codAluno int auto_increment not null,
    codNotas int not null,
    matricula varchar(80) not null,
    situacao varchar(50) not null,
    foreign key (codNotas) references notas(codNotas),
    foreign key (matricula) references pessoa(matricula),
    primary key (codAluno));
    
create table professor(
	codProfessor int auto_increment not null,
    matricula varchar(80) not null,
    formacao varchar(100) not null,
    foreign key (matricula) references pessoa(matricula),
    primary key (codProfessor));

create table turmas(
	codTurma int auto_increment not null,
    codAluno int not null,
    nome varchar(60) not null,
    foreign key(codAluno) references aluno(codAluno),
    primary key(codTurma));

create table cursos(
	codCurso int auto_increment not null,
    codDisciplina int not null,
    nome varchar(60) not null,
    foreign key(codDisciplina) references disciplinas(codDisciplina),
    primary key(codCurso));
    
create table profXturmas(
	cod_profXturmas int auto_increment not null,
    codTurma int not null,
    codProfessor int not null,
    foreign key(codProfessor) references professor(codProfessor),
    foreign key(codTurma) references turmas(codTurma),
    primary key(cod_profXturmas));
    
create table turmasXcursos(
	cod_turmasXcursos int auto_increment not null,
    codTurma int not null,
    codCurso int not null,
    foreign key(codTurma) references turmas(codTurma),
    foreign key(codCurso) references cursos(codCurso),
    primary key(cod_turmasXcursos));
    

