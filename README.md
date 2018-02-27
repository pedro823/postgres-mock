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
$ sudo dockerd & # se o daemon do docker não está rodando
$ sudo ./run.sh
```
Para, no final, deletar a imagem do docker junto:

```bash
$ sudo ./run.sh clean
```

### Customização (importante)

Para customizar **o usuário** criado na execução do docker:
edite o arquivo `init_postgres.sh` e troque

+ todas as instâncias de `user` para o usuário que você quiser
+ todas as instâncias de `password` para uma senha que você **não usa
em nenhum outro lugar**
+ (opcional) todas as instâncias de `public` pra o nome do schema que você
quiser. (Saiba o que é um schema antes, senão vai dar mais dor de cabeça do
que organização)

Para customizar **o script de inicialização do SQL**, edite o arquivo
`create_tables.sql` e insira todo o sql que você quer rodar na inicialização
da database. Geralmente se colocaria, por exemplo, todas as criações de
TABLES, SCHEMAS e até alguns INSERTS para que as tables não começem vazias.
