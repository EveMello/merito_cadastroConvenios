CREATE TABLE convenio 
( 
 id_convenio INT PRIMARY KEY,  
 data_inicio INT,  
 data_fim INT,  
 status INT,  
 observacao INT,  
 idempresa INT,  
 idcurso INT,  
); 

CREATE TABLE empresa 
( 
 id_empresa INT PRIMARY KEY,  
 nome_razao INT,  
 nome_fantasia INT,  
 cnpj INT,  
 endereco INT,  
 telefone INT,  
 email INT,  
 nome_campus(enum) INT,  
 id_cidade INT,  
 idvagas INT,  
 nome_representante INT,  
 cpf_representante INT,  
 telefone_representante INT,  
 nome_contato INT,  
 cpf_contato INT,  
 email_representante INT,  
 email_contato INT,  
 telefone_contato INT,  
); 

CREATE TABLE curso 
( 
 id_curso INT,  
 nome INT,  
 modalidade INT,  
 campus INT,  
 idconvenio INT,  
 idcampus INT,  
 fase INT,  
); 

CREATE TABLE cidades 
( 
 id_cidade INT PRIMARY KEY,  
 nome INT,  
 id_uf INT,  
 idempresa INT,  
 uf(enum) INT,  
); 

CREATE TABLE usuario 
( 
 id_usuario INT PRIMARY KEY,  
 nome INT,  
 email INT,  
 senha INT,  
 tipo INT,  
 cpf INT,  
 id_curso INT,  
 ativo INT,  
 id_empresa INT,  
 telefone INT,  
); 

CREATE TABLE curriculo 
( 
 id_curriculo INT PRIMARY KEY,  
 formacao INT,  
 objetivo INT,  
 experiencias INT,  
 habilidades INT,  
 id_usuario INT,  
 observacao INT,  
); 

CREATE TABLE vagas 
( 
 id_vaga INT PRIMARY KEY,  
 curso_alvo INT,  
 regime(enum) INT,  
 carga_horaria INT,  
 descricao INT,  
 requisitos INT,  
 beneficios INT,  
 status INT,  
 data_publicacao INT,  
 data_validade INT,  
 cargo INT,  
 salario INT,  
 modalidade INT,  
 id_empresa INT,  
); 

CREATE TABLE inscricao 
( 
 id_inscricao INT PRIMARY KEY,  
 data_inscricao INT,  
 status_candidatura INT,  
 id_usuario INT,  
 id_vaga INT,  
); 

ALTER TABLE convenio ADD FOREIGN KEY(idempresa) REFERENCES empresa (idempresa)
ALTER TABLE convenio ADD FOREIGN KEY(idcurso) REFERENCES curso (idcurso)
ALTER TABLE empresa ADD FOREIGN KEY(id_cidade) REFERENCES cidades (id_cidade)
ALTER TABLE empresa ADD FOREIGN KEY(idvagas) REFERENCES vagas (idvagas)
ALTER TABLE curso ADD FOREIGN KEY(idconvenio) REFERENCES convenio (idconvenio)
ALTER TABLE curso ADD FOREIGN KEY(idcampus) REFERENCES undefined (idcampus)
ALTER TABLE cidades ADD FOREIGN KEY(id_uf) REFERENCES undefined (id_uf)
ALTER TABLE cidades ADD FOREIGN KEY(idempresa) REFERENCES empresa (idempresa)
ALTER TABLE usuario ADD FOREIGN KEY(id_curso) REFERENCES curso (id_curso)
ALTER TABLE usuario ADD FOREIGN KEY(id_empresa) REFERENCES empresa (id_empresa)
ALTER TABLE curriculo ADD FOREIGN KEY(id_usuario) REFERENCES usuario (id_usuario)
ALTER TABLE vagas ADD FOREIGN KEY(id_empresa) REFERENCES empresa (id_empresa)
ALTER TABLE inscricao ADD FOREIGN KEY(id_usuario) REFERENCES usuario (id_usuario)
ALTER TABLE inscricao ADD FOREIGN KEY(id_vaga) REFERENCES vagas (id_vaga)
