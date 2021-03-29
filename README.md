# app-pesquisa-PDM
Aplicativo para avaliação na matéria de Programação para Dispositivos Móveis

### Integrantes:
- Jhenyfer Francielle
- Rafael Emídio
- Thiago Henrique

### Descrição:
O aplicativo apresenta uma lista de empresas do ramo alimentício, o usuário pode selecionar a empresa que deseja avaliar, ao selecionar a empresa o aplicativo leva a um formulário de avaliação da experiência que o cliente teve com o estabelecimento, ao concluir a resposta o usuário ganha pontos acumulativos que podem ser convertidos em descontos. O aplicativo será dividido na página principal, que mostra a lista de empresas, página do perfil do usuário com a possibilidade de atualizar os dados pessoais, e a página de pontuação em que o usuário pode acompanhar seu progresso de pontos e resgatar cupons de descontos nas empresas.

### Funcionalidades faltantes:
- Adição de localização: Para que o usuário ligue o gps e apareça os formulários que correspondam a um determinado raio de localização
- Login de usuário
- Registro de formulários respondidos 
- Registro de pontuação para conversão em descontos/brindes
- Aba de configurações: Onde o usuário poderá cadastrar outros dados pessoais

### Bugs:
- não foram identificados

### Instalação:
- Download do código fonte através do link https://github.com/rafael-emidio/app-pesquisa-PDM
- Descompactar arquivo baixado
- Abrir CMD (Windows) ou Terminal (Linux), entrar na pasta descompactada do projeto e executar o comando `flutter pub get`
- Executar aplicativo pelo Android Studio:
	- Abrir pasta descompactada
	- Iniciar emulador de dispositivo móvel já configurado
	- Selecionar o dispositivo iniciado
	- Selecionar o arquivo `main.dart`
	- Pressionar a opção `Run`
- Executar aplicativo pelo Visual Code Studio:
	- Abrir pasta descompactada
	- No canto inferior direito pressionar o dispositivo selecionado
	- Escolher a opção `Start mobile emulator` já configurado
	- Selecionar o dispositivo iniciado
	- Selecionar o arquivo `main.dart`
	- Na barra de opções no canto superior direito selecionar `Run` e escolher a opção `Start debugging`

### Atividades desenvolvidas:
- Jhenyfer:
  - Caixas de resposta do formulário utilizando escala de avaliação
  - validação dos dados do formulário
- Rafael
  - Construção da página incial
  - Construção da página de formulário
  - Estruturação do projeto
- Thiago
  - Construção da página de pontuação do usuário
  - Assets
  - Navegação para página de pontos
