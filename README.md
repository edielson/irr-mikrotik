
# irr-mikrotik

Atualizar os filtros de roteamento IRR em um roteador Mikrotik rodando ROS7+

#### Prerequisits

- Roteador(es) Mikrotik rodando ROS 7+ (Testamos entre as versões 7.7 até as mais atuais)  
- API configurada e acessível no(s) seu(s) roteador(es)  
- [Pacote Python da API do Mikrotik RouterOS](https://pypi.org/project/RouterOS-api/) e um roteador Mikrotik rodando BGP  
- BGPQ4 instalado no host onde você planeja executar esses scripts (Em Debian/Ubuntu: `apt-get install bgpq4`)

#### Para que serve isso?

Você deseja executar filtros IRR rigorosos em suas sessões BGP com clientes/peers e possui um roteador Mikrotik.  

Esta coleção de scripts basicamente envolve o **BGPQ4** para gerar listas de prefixos e, em seguida, constrói a configuração de filtros que pode ser lida pelo nosso script Python para enviá-los ao roteador real usando a **API do Mikrotik**.  

Se você quiser executar o script Python por conta própria, ele aceita um formato como o abaixo:

```
{'chain': 'as23456-operadora-import-ipv4', 'rule': 'if (dst==10.10.0.0/24) { accept }'}
{'chain': 'as23456-operadora-import-ipv4', 'rule': 'if (dst==192.168.0.0/22) { accept }'}
{'chain': 'as23456-operadora-import-ipv4', 'rule': 'reject'}
````

No entanto, incluímos tudo o que você precisa para tornar este processo autônomo. Os scripts aqui fazem todo o necessário para gerar esse formato a partir de uma lista de prefixos criada pelo **BGPQ4**.

#### Como Configurar?

- ```config/routers.conf``` Especifique aqui o nome de usuário e senha necessários para interagir com a API do seu roteador.
- ```config/peers.conf``` Especifique aqui, em linhas separadas por vírgula, o ASN e AS-SET dos seus peers. Você precisará atualizar este arquivo sempre que adicionar um novo peer que necessite de filtros.
- ```config/sessions.conf```Este arquivo contém a combinação do ASN, identificador (slug, como o nome do IXP ou um nome personalizado para o filtro) e o hostname/IP do roteador. Você precisará atualizá-lo sempre que configurar um novo peer em um IX, PNI ou novo roteador.
Também é possível especificar um parâmetro opcional (ipv4 ou ipv6) caso queira aplicar a configuração apenas para um tipo específico de tráfego.


Esperamos que você instale isso em: ```/usr/share/irr-mikrotik/``` em seu linux


