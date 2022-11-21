-- Trabalho Final
-- Criar Base de dados
    create database Pokedex;

-- Criar tabelas

    create table Geracao(
        Num varchar(4) not null primary key
    );
    create table Categoria (
        Num int not null primary key auto_increment,
        Nome varchar(20) not null unique,
        Icon varchar(300) not null unique
    );
    create table Variante (
        Num int not null primary key auto_increment,
        Nome varchar(20) not null unique
    );
    create table Elemento (
        Nome varchar(20) not null primary key,
        Icon varchar(300) not null unique
    );
    create table Atributo (
        Num int not null primary key auto_increment,
        Nome varchar(20) not null unique
    );
    create table Natureza (
        Num int not null primary key auto_increment,
        Nome varchar(20) not null unique,
        Aumenta varchar(20) references Atributo(Nome),
        AumValor decimal(2,1),
        Diminui varchar(20) references Atributo(Nome),
        DimValor decimal(2,1)
    );
    create table Efetividade (
        ElementoAtaque varchar(20) not null references Elemento(Nome),
        ElementoDefesa varchar(20) not null references Elemento(Nome),
        Valor decimal(2,1) not null default(1),
        primary key (ElementoAtaque, ElementoDefesa)
    );
    create table Habilidade (
        Num int not null primary key,
        Nome varchar(40) not null,
        Pontaria int not null,
        Poder int not null,
        PP int not null,
        Elemento varchar(20) not null references Elemento(Nome),
        Categoria varchar(20) not null references Categoria(Nome),
        Geracao varchar(3) not null references Geracao(Num)
    );
    create table Pokemon (
        Num int not null primary key,
        Nome varchar(40) not null,
        Forma varchar(20) references Variante(Nome),
        Geracao varchar(3) not null references Geracao(Num)
    );
    create table Tem (
        Pokemon int references Pokemon(Num),
        Atributo varchar(20) references Atributo(Nome),
        Valor int not null,
        primary key (Pokemon, Atributo)
    );
    create table Elemento1 (
        Pokemon int references Pokemon(Num),
        Elemento varchar(20) not null references Elemento(Nome),
        primary key (Pokemon, Elemento)
    );
    create table Usa (
        Pokemon int references Pokemon(Num),
        Habilidade int references Habilidade(Num),
        primary key (Pokemon, Habilidade)
    );
    create table Evolui (
        Pokemon int references Pokemon(Num),
        Evolui_Para int references Pokemon(Num),
        primary key (Pokemon, Evolui_Para)
    );


-- Inserir dados
    insert into Geracao(Num) values
        ('I'),
        ('II'),
        ('III'),
        ('IV'),
        ('V'),
        ('VI'),
        ('VII'),
        ('VIII');
    --
    insert into Categoria(Nome, Icon) values
        ('Especial','https://img.pokemondb.net/images/icons/move-special.png'),
        ('Fisico','https://img.pokemondb.net/images/icons/move-physical.png'),
        ('Efeitos','https://img.pokemondb.net/images/icons/move-status.png');
    --    
    insert into Variante(Nome) values
        ('Alolan'),
        ('Mega'),
        ('Galarian');
    --
    insert into Elemento(Nome, Icon) values
        ('Normal','https://archives.bulbagarden.net/media/upload/thumb/9/95/Normal_icon_SwSh.png/64px-Normal_icon_SwSh.png'),
        ('Fogo','https://archives.bulbagarden.net/media/upload/thumb/a/ab/Fire_icon_SwSh.png/64px-Fire_icon_SwSh.png'),
        ('Agua','https://archives.bulbagarden.net/media/upload/thumb/8/80/Water_icon_SwSh.png/64px-Water_icon_SwSh.png'),
        ('Eletrico','https://archives.bulbagarden.net/media/upload/thumb/7/7b/Electric_icon_SwSh.png/64px-Electric_icon_SwSh.png'),
        ('Erva','https://archives.bulbagarden.net/media/upload/thumb/a/a8/Grass_icon_SwSh.png/64px-Grass_icon_SwSh.png'),
        ('Gelo','https://archives.bulbagarden.net/media/upload/thumb/1/15/Ice_icon_SwSh.png/64px-Ice_icon_SwSh.png'),
        ('Luta','https://archives.bulbagarden.net/media/upload/thumb/3/3b/Fighting_icon_SwSh.png/64px-Fighting_icon_SwSh.png'),
        ('Veneno','https://archives.bulbagarden.net/media/upload/thumb/8/8d/Poison_icon_SwSh.png/64px-Poison_icon_SwSh.png'),
        ('Terra','https://archives.bulbagarden.net/media/upload/thumb/2/27/Ground_icon_SwSh.png/64px-Ground_icon_SwSh.png'),
        ('Voador','https://archives.bulbagarden.net/media/upload/thumb/b/b5/Flying_icon_SwSh.png/64px-Flying_icon_SwSh.png'),
        ('Psiquico','https://archives.bulbagarden.net/media/upload/thumb/7/73/Psychic_icon_SwSh.png/64px-Psychic_icon_SwSh.png'),
        ('Inseto','https://archives.bulbagarden.net/media/upload/thumb/9/9c/Bug_icon_SwSh.png/64px-Bug_icon_SwSh.png'),
        ('Pedra','https://archives.bulbagarden.net/media/upload/thumb/1/11/Pedra_icon_SwSh.png/64px-Pedra_icon_SwSh.png'),
        ('Fantasma','https://archives.bulbagarden.net/media/upload/thumb/0/01/Ghost_icon_SwSh.png/64px-Ghost_icon_SwSh.png'),
        ('Dragao','https://archives.bulbagarden.net/media/upload/thumb/7/70/Dragon_icon_SwSh.png/64px-Dragon_icon_SwSh.png'),
        ('Escuridao','https://archives.bulbagarden.net/media/upload/thumb/d/d5/Dark_icon_SwSh.png/64px-Dark_icon_SwSh.png'),
        ('Ferro','https://archives.bulbagarden.net/media/upload/thumb/0/09/Steel_icon_SwSh.png/64px-Steel_icon_SwSh.png'),
        ('Fada','https://archives.bulbagarden.net/media/upload/thumb/c/c6/Fairy_icon_SwSh.png/64px-Fairy_icon_SwSh.png');
    --
    insert into Atributo (Nome) values
        ('Vida'),
        ('Ataque Fisico'),
        ('Defesa Fisica'),
        ('Ataque Especial'),
        ('Defesa Especial'),
        ('Velocidade');
    --
    insert into Natureza (Nome, Aumenta, AumValor, Diminui, DimValor) values
        ('Esforçada', null, null, null, null),
        ('Carente', 'Ataque Fisico', 1.1, 'Defesa Fisica', 1.1),
        ('Valente', 'Ataque Fisico', 1.1, 'Velocidade', 1.1),
        ('Firme', 'Ataque Fisico', 1.1, 'Ataque Especial', 1.1),
        ('Malandro', 'Ataque Fisico', 1.1, 'Defesa Especial', 1.1),
        ('Audaciosa', 'Defesa Fisica', 1.1, 'Ataque Fisico', 1.1),
        ('Docil', null, null, null, null),
        ('Relaxada', 'Defesa Fisica', 1.1, 'Velocidade',1.1),
        ('Rebelde', 'Defesa Fisica', 1.1, 'Ataque Especial',1.1),
        ('Negligente', 'Defesa Fisica', 1.1, 'Defesa Especial',1.1),
        ('Timida', 'Velocidade', 1.1, 'Ataque Fisico',1.1),
        ('Agitada', 'Velocidade', 1.1, 'Defesa Fisica',1.1),
        ('Seria', null, null, null, null),
        ('Alegre', 'Velocidade', 1.1, 'Ataque Especial',1.1),
        ('Ingenua', 'Velocidade', 1.1, 'Defesa Especial',1.1),
        ('Modesta', 'Ataque Especial', 1.1, 'Ataque Fisico',1.1),
        ('Tranquila', 'Ataque Especial', 1.1, 'Defesa Fisica',1.1),
        ('Quieta', 'Ataque Especial', 1.1, 'Velocidade',1.1),
        ('Acanhado', null,  null, null, null),
        ('Rabugenta', 'Ataque Especial', 1.1,'Defesa Especial', 1.1),
        ('Calma', 'Defesa Especial', 1.1, 'Ataque Fisico',1.1),
        ('Gentil', 'Defesa Especial', 1.1, 'Defesa Fisica',1.1),
        ('Atrevida', 'Defesa Especial', 1.1, 'Velocidade',1.1),
        ('Cuidadosa', 'Defesa Especial', 1.1, 'Ataque Especial',1.1),
        ('Peculiar', null, null, null, null);

    --
    insert into Efetividade(ElementoAtaque, ElementoDefesa, Valor) values

            ('Normal','Normal',1),
            ('Normal','Luta',1),
            ('Normal','Voador',1),
            ('Normal','Veneno',1),
            ('Normal','Terra',1),
            ('Normal','Pedra',0.5),
            ('Normal','Inseto',1),
            ('Normal','Fantasma',0),
            ('Normal','Ferro',0.5),
            ('Normal','Fogo',1),
            ('Normal','Agua',1),
            ('Normal','Erva',1),
            ('Normal','Eletrico',1),
            ('Normal','Psiquico',1),
            ('Normal','Gelo',1),
            ('Normal','Dragao',1),
            ('Normal','Escuridao',1),
            ('Normal','Fada',1),

            ('Luta','Normal',2),
            ('Luta','Luta',1),
            ('Luta','Voador',0.5),
            ('Luta','Veneno',0.5),
            ('Luta','Terra',1),
            ('Luta','Pedra',2),
            ('Luta','Inseto',0.5),
            ('Luta','Fantasma',0),
            ('Luta','Ferro',2),
            ('Luta','Fogo',1),
            ('Luta','Agua',1),
            ('Luta','Erva',1),
            ('Luta','Eletrico',1),
            ('Luta','Psiquico',0.5),
            ('Luta','Gelo',2),
            ('Luta','Dragao',1),
            ('Luta','Escuridao',2),
            ('Luta','Fada',0.5),
 
            ('Voador','Normal',1),
            ('Voador','Luta',2),
            ('Voador','Voador',1),
            ('Voador','Veneno',1),
            ('Voador','Terra',1),
            ('Voador','Pedra',0.5),
            ('Voador','Inseto',2),
            ('Voador','Fantasma',1),
            ('Voador','Ferro',0.5),
            ('Voador','Fogo',1),
            ('Voador','Agua',1),
            ('Voador','Erva',2),
            ('Voador','Eletrico',0.5),
            ('Voador','Psiquico',1),
            ('Voador','Gelo',1),
            ('Voador','Dragao',1),
            ('Voador','Escuridao',1),
  
            ('Veneno','Normal',1),
            ('Veneno','Luta',1),
            ('Veneno','Voador',1),
            ('Veneno','Veneno',0.5),
            ('Veneno','Terra',0.5),
            ('Veneno','Pedra',0.5),
            ('Veneno','Inseto',1),
            ('Veneno','Fantasma',0.5),
            ('Veneno','Ferro',0),
            ('Veneno','Fogo',1),
            ('Veneno','Agua',1),
            ('Veneno','Erva',2),
            ('Veneno','Eletrico',1),
            ('Veneno','Psiquico',1),
            ('Veneno','Gelo',1),
            ('Veneno','Dragao',1),
            ('Veneno','Escuridao',1),
            ('Veneno','Fada',2),

            ('Terra','Normal',1),
            ('Terra','Luta',1),
            ('Terra','Voador',0),
            ('Terra','Veneno',2),
            ('Terra','Terra',1),
            ('Terra','Pedra',2),
            ('Terra','Inseto',2),
            ('Terra','Fantasma',1),
            ('Terra','Ferro',2),
            ('Terra','Fogo',2),
            ('Terra','Agua',1),
            ('Terra','Erva',0.5),
            ('Terra','Eletrico',2),
            ('Terra','Psiquico',1),
            ('Terra','Gelo',1),
            ('Terra','Dragao',1),
            ('Terra','Escuridao',1),

            ('Pedra','Normal',1),
            ('Pedra','Luta',0.5),
            ('Pedra','Voador',2),
            ('Pedra','Veneno',1),
            ('Pedra','Terra',0.5),
            ('Pedra','Pedra',1),
            ('Pedra','Inseto',2),
            ('Pedra','Fantasma',1),
            ('Pedra','Ferro',0.5),
            ('Pedra','Fogo',2),
            ('Pedra','Agua',1),
            ('Pedra','Erva',1),
            ('Pedra','Eletrico',1),
            ('Pedra','Psiquico',1),
            ('Pedra','Gelo',2),
            ('Pedra','Dragao',1),
            ('Pedra','Escuridao',1),
            ('Pedra','Fada',1),

            ('Inseto','Normal',1),
            ('Inseto','Luta',0.5),
            ('Inseto','Voador',0.5),
            ('Inseto','Veneno',0.5),
            ('Inseto','Terra',1),
            ('Inseto','Pedra',1),
            ('Inseto','Inseto',1),
            ('Inseto','Fantasma',0.5),
            ('Inseto','Ferro',0.5),
            ('Inseto','Fogo',0.5),
            ('Inseto','Agua',1),
            ('Inseto','Erva',2),
            ('Inseto','Eletrico',1),
            ('Inseto','Psiquico',2),
            ('Inseto','Gelo',1),
            ('Inseto','Dragao',1),
            ('Inseto','Escuridao',2),
            ('Inseto','Fada',0.5),

            ('Fantasma','Normal',0),
            ('Fantasma','Luta',1),
            ('Fantasma','Voador',1),
            ('Fantasma','Veneno',1),
            ('Fantasma','Terra',1),
            ('Fantasma','Pedra',1),
            ('Fantasma','Inseto',1),
            ('Fantasma','Fantasma',2),
            ('Fantasma','Ferro',1),
            ('Fantasma','Fogo',1),
            ('Fantasma','Agua',1),
            ('Fantasma','Erva',1),
            ('Fantasma','Eletrico',1),
            ('Fantasma','Psiquico',2),
            ('Fantasma','Gelo',1),
            ('Fantasma','Dragao',1),
            ('Fantasma','Escuridao',0.5),
            ('Fantasma','Fada',1),

            ('Ferro','Normal',1),
            ('Ferro','Luta',1),
            ('Ferro','Voador',1),
            ('Ferro','Veneno',1),
            ('Ferro','Terra',1),
            ('Ferro','Pedra',2),
            ('Ferro','Inseto',1),
            ('Ferro','Fantasma',1),
            ('Ferro','Ferro',0.5),
            ('Ferro','Fogo',0.5),
            ('Ferro','Agua',0.5),
            ('Ferro','Erva',1),
            ('Ferro','Eletrico',0.5),
            ('Ferro','Psiquico',1),
            ('Ferro','Gelo',2),
            ('Ferro','Dragao',1),
            ('Ferro','Escuridao',1),
            ('Ferro','Fada',2),

            ('Fogo','Normal',1),
            ('Fogo','Luta',1),
            ('Fogo','Voador',1),
            ('Fogo','Veneno',1),
            ('Fogo','Terra',1),
            ('Fogo','Pedra',0.5),
            ('Fogo','Inseto',2),
            ('Fogo','Fantasma',1),
            ('Fogo','Ferro',2),
            ('Fogo','Fogo',0.5),
            ('Fogo','Agua',0.5),
            ('Fogo','Erva',2),
            ('Fogo','Eletrico',1),
            ('Fogo','Psiquico',1),
            ('Fogo','Gelo',2),
            ('Fogo','Dragao',0.5),
            ('Fogo','Escuridao',1),
            ('Fogo','Fada',1),

            ('Agua','Normal',1),
            ('Agua','Luta',1),
            ('Agua','Voador',1),
            ('Agua','Veneno',1),
            ('Agua','Terra',2),
            ('Agua','Pedra',2),
            ('Agua','Inseto',1),
            ('Agua','Fantasma',1),
            ('Agua','Ferro',1),
            ('Agua','Fogo',2),
            ('Agua','Agua',0.5),
            ('Agua','Erva',0.5),
            ('Agua','Eletrico',1),
            ('Agua','Psiquico',1),
            ('Agua','Gelo',1),
            ('Agua','Dragao',0.5),
            ('Agua','Escuridao',1),
            ('Agua','Fada',1),

            ('Erva','Normal',1),
            ('Erva','Luta',1),
            ('Erva','Voador',0.5),
            ('Erva','Veneno',0.5),
            ('Erva','Terra',2),
            ('Erva','Pedra',2),
            ('Erva','Inseto',0.5),
            ('Erva','Fantasma',1),
            ('Erva','Ferro',0.5),
            ('Erva','Fogo',0.5),
            ('Erva','Agua',2),
            ('Erva','Erva',0.5),
            ('Erva','Eletrico',1),
            ('Erva','Psiquico',1),
            ('Erva','Gelo',1),
            ('Erva','Dragao',0.5),
            ('Erva','Escuridao',1),
            ('Erva','Fada',1),

            ('Eletrico','Normal',1),
            ('Eletrico','Luta',1),
            ('Eletrico','Voador',2),
            ('Eletrico','Veneno',1),
            ('Eletrico','Terra',0),
            ('Eletrico','Pedra',1),
            ('Eletrico','Inseto',1),
            ('Eletrico','Fantasma',1),
            ('Eletrico','Ferro',1),
            ('Eletrico','Fogo',1),
            ('Eletrico','Agua',2),
            ('Eletrico','Erva',0.5),
            ('Eletrico','Eletrico',0.5),
            ('Eletrico','Psiquico',1),
            ('Eletrico','Gelo',1),
            ('Eletrico','Dragao',0.5),
            ('Eletrico','Escuridao',1),
            ('Eletrico','Fada',1),
 
            ('Psiquico','Normal',1),
            ('Psiquico','Luta',2),
            ('Psiquico','Voador',1),
            ('Psiquico','Veneno',2),
            ('Psiquico','Terra',1),
            ('Psiquico','Pedra',1),
            ('Psiquico','Inseto',1),
            ('Psiquico','Fantasma',1),
            ('Psiquico','Ferro',0.5),
            ('Psiquico','Fogo',1),
            ('Psiquico','Agua',1),
            ('Psiquico','Erva',1),
            ('Psiquico','Eletrico',1),
            ('Psiquico','Psiquico',0.5),
            ('Psiquico','Gelo',1),
            ('Psiquico','Dragao',1),
            ('Psiquico','Escuridao',0),
            ('Psiquico','Fada',1),

            ('Gelo','Normal',1),
            ('Gelo','Luta',1),
            ('Gelo','Voador',2),
            ('Gelo','Veneno',1),
            ('Gelo','Terra',2),
            ('Gelo','Pedra',1),
            ('Gelo','Inseto',1),
            ('Gelo','Fantasma',1),
            ('Gelo','Ferro',0.5),
            ('Gelo','Fogo',0.5),
            ('Gelo','Agua',0.5),
            ('Gelo','Erva',2),
            ('Gelo','Eletrico',1),
            ('Gelo','Psiquico',1),
            ('Gelo','Gelo',0.5),
            ('Gelo','Dragao',2),
            ('Gelo','Escuridao',1),
            ('Gelo','Fada',1),

            ('Dragao','Normal',1),
            ('Dragao','Luta',1),
            ('Dragao','Voador',1),
            ('Dragao','Veneno',1),
            ('Dragao','Terra',1),
            ('Dragao','Pedra',1),
            ('Dragao','Inseto',1),
            ('Dragao','Fantasma',1),
            ('Dragao','Ferro',0.5),
            ('Dragao','Fogo',1),
            ('Dragao','Agua',1),
            ('Dragao','Erva',1),
            ('Dragao','Eletrico',1),
            ('Dragao','Psiquico',1),
            ('Dragao','Gelo',1),
            ('Dragao','Dragao',2),
            ('Dragao','Escuridao',1),
            ('Dragao','Fada',0),

            ('Escuridao','Normal',1),
            ('Escuridao','Luta',0.5),
            ('Escuridao','Voador',1),
            ('Escuridao','Veneno',1),
            ('Escuridao','Terra',1),
            ('Escuridao','Pedra',1),
            ('Escuridao','Inseto',1),
            ('Escuridao','Fantasma',2),
            ('Escuridao','Ferro',1),
            ('Escuridao','Fogo',1),
            ('Escuridao','Agua',1),
            ('Escuridao','Erva',1),
            ('Escuridao','Eletrico',1),
            ('Escuridao','Psiquico',2),
            ('Escuridao','Gelo',1),
            ('Escuridao','Dragao',1),
            ('Escuridao','Escuridao',0.5),
            ('Escuridao','Fada',0.5),

            ('Fada','Normal',1),
            ('Fada','Luta',2),
            ('Fada','Voador',1),
            ('Fada','Veneno',0.5),
            ('Fada','Terra',1),
            ('Fada','Pedra',1),
            ('Fada','Inseto',1),
            ('Fada','Fantasma',1),
            ('Fada','Ferro',0.5),
            ('Fada','Fogo',0.5),
            ('Fada','Agua',1),
            ('Fada','Erva',1),
            ('Fada','Eletrico',1),
            ('Fada','Psiquico',1),
            ('Fada','Gelo',1),
            ('Fada','Dragao',2),
            ('Fada','Escuridao',2),
            ('Fada','Fada',1);
    --
    insert into Habilidade(Num, Nome, Pontaria, Poder, PP, Elemento, Categoria, Geracao) values
        (10, 'Scratch', 100, 40, 35, 'Normal', 'Fisico', 'I'),
        (22, 'Vine Whip', 100, 45, 25, 'Erva', 'Fisico', 'I'),
        (33, 'Tackle', 100, 40, 35, 'Normal', 'Fisico', 'I'),
        (52, 'Ember', 100, 40, 25, 'Fogo', 'Especial', 'I'),
        (55, 'Water Gun', 100, 40, 25, 'Agua', 'Especial', 'I'),
        (84, 'Thunder Shock', 100, 40, 30, 'Eletrico', 'Especial', 'I'),
        (98, 'Quick Attack', 100, 40, 30, 'Normal', 'Fisico', 'I');
    --
    insert into Pokemon(Num, Nome, Forma, Geracao) values
        (001,'Bulbasaur',null,'I'),
        (002,'Ivysaur',null,'I'),
        (003,'Venusaur',null,'I'),
        (004,'Charmander',null,'I'),
        (005,'Charmeleon',null,'I'),
        (006,'Charizard',null,'I'),
        (007,'Squirtle',null,'I'),
        (008,'Wartortle',null,'I'),
        (009,'Blastoise',null,'I'),
        (025,'Pikachu',null,'I'),
        (026,'Raichu',null,'I');
    --
    insert into Tem(Pokemon, Atributo, Valor) values

            (001, 'Vida', 45),
            (001, 'Ataque Fisico', 49),
            (001, 'Defesa Fisica', 49),
            (001, 'Ataque Especial',65),
            (001, 'Defesa Especial',65),
            (001, 'Velocidade',45),
      
            (002, 'Vida',60),
            (002, 'Ataque Fisico',62),
            (002, 'Defesa Fisica',63),
            (002, 'Ataque Especial',80),
            (002, 'Defesa Especial',80),
            (002, 'Velocidade',60),

            (003, 'Vida',80),
            (003, 'Ataque Fisico',82),
            (003, 'Defesa Fisica',83),
            (003, 'Ataque Especial',100),
            (003, 'Defesa Especial',100),
            (003, 'Velocidade',80),

            (004, 'Vida',39),
            (004, 'Ataque Fisico',52),
            (004, 'Defesa Fisica',43),
            (004, 'Ataque Especial',60),
            (004, 'Defesa Especial',50),
            (004, 'Velocidade',65),

            (005, 'Vida',58),
            (005, 'Ataque Fisico',64),
            (005, 'Defesa Fisica',58),
            (005, 'Ataque Especial',80),
            (005, 'Defesa Especial',65),
            (005, 'Velocidade',80),

            (006, 'Vida',78),
            (006, 'Ataque Fisico',84),
            (006, 'Defesa Fisica',78),
            (006, 'Ataque Especial',109),
            (006, 'Defesa Especial',85),
            (006, 'Velocidade',100),

            (007, 'Vida',44),
            (007, 'Ataque Fisico',48),
            (007, 'Defesa Fisica',65),
            (007, 'Ataque Especial',50),
            (007, 'Defesa Especial',64),
            (007, 'Velocidade',43),

            (008, 'Vida',59),
            (008, 'Ataque Fisico',63),
            (008, 'Defesa Fisica',80),
            (008, 'Ataque Especial',65),
            (008, 'Defesa Especial',80),
            (008, 'Velocidade',58),

            (009, 'Vida',79),
            (009, 'Ataque Fisico',83),
            (009, 'Defesa Fisica',100),
            (009, 'Ataque Especial',85),
            (009, 'Defesa Especial',105),
            (009, 'Velocidade',78),

            (025, 'Vida',35),
            (025, 'Ataque Fisico',55),
            (025, 'Defesa Fisica',40),
            (025, 'Ataque Especial',50),
            (025, 'Defesa Especial',50),
            (025, 'Velocidade',90),

            (026, 'Vida',60),
            (026, 'Ataque Fisico',90),
            (026, 'Defesa Fisica',55),
            (026, 'Ataque Especial',90),
            (026, 'Defesa Especial',80),
            (026, 'Velocidade',110);
    --
    insert into Elemento1(Pokemon, Elemento) values
            (001, 'Erva'),
            (001, 'Veneno'),
            (002, 'Erva'),
            (002, 'Veneno'),
            (003, 'Erva'),
            (003, 'Veneno'),
            (004, 'Fogo'),
            (005, 'Fogo'),
            (006, 'Fogo'),
            (006, 'Voador'),
            (007, 'Agua'),
            (008, 'Agua'),
            (009, 'Agua'),
            (025, 'Eletrico'),
            (026, 'Eletrico');
    --
    insert into Usa (Pokemon, Habilidade) values
        (001,33),
        (001,22),
        (002,33),
        (002,22),
        (003,33),
        (003,22),
        --
        (004,10),
        (004,52),
        (005,10),
        (005,52),
        (006,10),
        (006,52),
        --
        (007,33),
        (007,55),
        (008,33),
        (008,55),
        (009,33),
        (009,55),
        --
        (025,98),
        (025,84),
        (026,98),
        (026,84);
    --
    insert into Evolui(Pokemon,Evolui_Para) values

        (001,002),
        (002,003),
        
        (004,005),
        (005,006),
        
        (007,008),
        (008,009),
        
        (025,026);
    --
-- Perguntas
    -- Faceis
        -- Qual é o nome do Pokemon nº 1 ?
            select Nome
            from Pokemon
            where pokemon.num = 001;

        -- Quais são os elementos dos pokemons ?
            select Nome
            from Elemento;

        -- Qual é a categoria da habilidade 'Ember' ?
            select Categoria
            from Habilidade
            where Nome like 'Ember';

        -- Quantas vezes (PP) se pode utilizar a habilidade 'Tackle' e qual a sua probabilidade de acertar (Pontaria) ?
            select PP, Pontaria ChanceDeAcertar
            from Habilidade
            where Nome like 'Tackle';

        -- Quais são os nomes e as gerações dos pokemons: 001, 004 e 007 ?
            select Nome, Geracao
            from Pokemon
            where Num = 001 or Num = 004 or Num = 007;


    -- Intremédias
        -- Qual ou quais o nome dos elementos do pokemon 'Bulbasaur'?
            select Elemento1.Elemento Elementos_do_Bulbasaur
            from Elemento1, Pokemon
            where Pokemon.Nome Like 'Bulbasaur'
                and Pokemon.Num = Elemento1.Pokemon;
        
        -- Qual é a o nome da Habilidade com maior poder que seja da categoria 'Fisico' ?
            select Nome
            from Habilidade
            where poder = (  select max(poder) 
                            from habilidade) 
                and Categoria like 'Fisico';

        -- Quantos Elementos existem ?
            select count(*)
            from Elemento;
    
        -- Qual o nome da evolução do 'Pikachu' ?
            select Nome
            from Evolui, pokemon
            where ( Select Num
                    from pokemon
                    where nome like 'Pikachu') = Evolui.pokemon
                and Pokemon.num = Evolui.Evolui_Para;

        -- Que elemento tem menos pokemons?
            select Elemento, count(*) Num_De_Pokemon
            from Elemento1
            group by Elemento
            order by Num_De_Pokemon limit 1;
        

    -- Dificil
        -- Quantas habilidades do Elemento de Água podem ser utilizadas pelo pokemon nº 008 ?
            select count(*)
            from Usa, Habilidade
            where pokemon = 008 
                and Habilidade.num = Usa.Habilidade
                and Elemento like 'Agua';
        
        -- Qual é a média de poder das habilidades do 'Raichu' ?
            select  avg(poder)
            from habilidade
            where habilidade.num in (select Usa.habilidade
                                    from Usa, pokemon
                                    where Usa.pokemon = pokemon.num
                                    and pokemon.num = (select num
                                                       from pokemon
                                                       where nome like 'Raichu'));

        -- Quais são as habilidades Normais que têm os PP abaixo da média de habilidades normais ? 
            select nome
            from habilidade
            where pp < (select avg(PP)
                        from habilidade
                        where elemento like 'normal')
                and Elemento like 'normal';

        -- Quais pokemons têm a Velocidade acima da média ?
            Select nome, valor
            from pokemon, tem
            where pokemon.num = tem.pokemon
            and tem.atributo like 'Velocidade' 
            and valor > (select avg(valor)
                         from tem
                         where atributo like 'Velocidade');

        -- Qual o pokemon que dá mais dano com a habilidade 'Ember' sabendo que este é um 'ataque especial' ?
            select pokemon.nome
            from tem, pokemon
            where atributo like 'Ataque Especial' 
                and tem.pokemon in (select pokemon 
                                    from usa 
                                    where habilidade = (select num 
                                                        from habilidade 
                                                        where nome like 'Ember'))
                and pokemon.num = tem.pokemon
                order by valor desc limit 1;