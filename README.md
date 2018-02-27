# PostgreSQL docker

Abstração de postgreSQL em docker.   
Feito para rodar um psql sem necessariamente instalá-lo na sua máquina nem
deixá-lo aberto o tempo todo, exposto a _hackers_ e sei lá mais o que.

### Setup

Caso você não tenha docker, [siga os passos de instalação](https://www.docker.com/community-edition#/download).
Se você está em linux, lembre-se que provavelmente a solução é um
`$ apt install` (debian-like), um `$ dnf install` (redhat-like)
ou um `$ pacman -S` (arch-like).

Para iniciar o banco de dados:

```bash
$ chmod +x ./run.sh # para poder executá-lo
$ sudo dockerd & # se o daemon do docker não está rodando
$ sudo ./run.sh
```

Pronto! POR PADRÃO, o PSQL estará rodando na **porta 5000.**

### Customização (importante)

Para customizar **o usuário** criado na execução do docker:
edite o arquivo `init_postgres.sh` e troque

+ todas as instâncias de `myuser` para o usuário que você quiser
+ todas as instâncias de `password` para uma senha que você **não usa
em nenhum outro lugar**
+ (opcional) todas as instâncias de `public` pra o nome do schema que você
quiser. (Saiba o que é um schema antes, senão vai dar mais dor de cabeça do
que organização)

além disso, troque no `run.sh` a senha dentro de `POSTGRES_PASSWORD` para a
mesma do usuário do banco de dados.

Para customizar **o script de inicialização do SQL**, edite o arquivo
`create_tables.sql` e insira todo o sql que você quer rodar na inicialização
da database. Geralmente se colocaria, por exemplo, todas as criações de
TABLES, SCHEMAS e até alguns INSERTS para que as tables não começem vazias.

Para customizar **a porta em que o postgres roda**, edite o arquivo
`run.sh` e edite o número que vem **antes** do `:` e depois do `-p`.  
Por exemplo:
`docker run -p 9999:5432 -e ...`

### Conectando pela primeira vez

Para aprender um pouco de psql na prática e testar se sua DB está
funcionando, você pode conectar manualmente no banco de dados utilizando
o seu terminal:  
**(atenção: requer postgresql instalado na sua máquina.
Novamente, um apt, dnf ou pacman provavelmente resolve isso.)**

```bash
$ psql -h localhost -p <porta, padrão 5000> -U <usuário, padrão myuser>
```

Se você conseguiu se connectar, *Hurray!*. Seu banco de dados está
funcionando. Agora, teste criar uma TABLE:

```sql
CREATE TABLE hello (
  id BIGSERIAL NOT NULL,
  some_int INT NOT NULL,
  some_word VARCHAR
);

INSERT INTO hello (some_int, some_word) VALUES (4, 'hi there');
INSERT INTO hello (some_int, some_word) VALUES (8, 'oh hello');

SELECT * FROM hello;

\q
```

### Deletar o postgres

Para deletar todas as imagens de psql, rode
```bash
$ chmod +x ./delete.sh # para poder executá-lo
$ sudo ./delete.sh
```
