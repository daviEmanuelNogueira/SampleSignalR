# MVC SignalR Example

Este é um exemplo simples de integração do SignalR com um projeto MVC. O objetivo é demonstrar como utilizar o SignalR para comunicação em tempo real entre o cliente e o servidor. A aplicação utiliza WebSockets para enviar e receber mensagens entre os clientes conectados ao servidor.

## Funcionalidade

O sistema possui um campo de entrada de texto (`<input>`) onde:

1. **OnFocus**: Quando o usuário clica ou foca no campo de entrada, o campo de texto é desabilitado para os outros clientes conectados. Isso é feito através de uma notificação enviada a todos os outros clientes conectados, que são impedidos de interagir com o campo.
   
2. **OnBlur**: Quando o usuário sai do campo de entrada (perde o foco), o campo é liberado para todos os clientes novamente.
   
3. **OnInput**: Enquanto o usuário digita no campo, o texto digitado é transmitido para todos os outros clientes conectados em tempo real.

### Como funciona:

- **SignalR Hub**: No servidor, há um Hub que gerencia a comunicação entre os clientes. Quando um cliente interage com o campo de entrada, ele envia sinais para o servidor, que repassa esses sinais para os outros clientes conectados.
  
- **Métodos do Hub**:
  - `BlockInput`: Este método bloqueia o campo de entrada para os outros clientes.
  - `UnblockInput`: Este método desbloqueia o campo de entrada para todos.
  - `OnWriting`: Este método envia o texto digitado para os outros clientes.

### Fluxo de comunicação:

1. O cliente se conecta ao SignalR Hub ao carregar a página.
2. Quando o campo de entrada recebe o foco (evento `onfocus`), o cliente chama o método `BlockInput` no Hub, notificando os outros clientes a desabilitarem o campo.
3. Quando o campo de entrada perde o foco (evento `onblur`), o cliente chama o método `UnblockInput` no Hub, liberando o campo para os outros clientes.
4. Cada vez que o usuário digita no campo (evento `oninput`), o cliente envia o texto para o servidor, que o repassa para todos os outros clientes conectados via `OnWriting`.

## Como rodar

1. Clone o repositório:
    ```bash
    git clone <URL do repositório>
    ```

2. **Opção 1: Rodar com .NET**:

    - Instale as dependências do projeto:
        ```bash
        dotnet restore
        ```

    - Execute o projeto:
        ```bash
        dotnet run
        ```

    - Abra o navegador e acesse `http://localhost:<porta>` para testar a funcionalidade.
    - Para uma melhor experiência no teste, duplique a aba do navegador para simular dois clientes conectados.

3. **Opção 2: Rodar com Docker** (caso não tenha ou não queira instalar o .NET):

    - Certifique-se de que o Docker está instalado e em funcionamento.
    - Navegue até a pasta do projeto e crie a imagem Docker:
        ```bash
        docker build -t mvc-signalr-example .
        ```

    - Execute o container Docker:
        ```bash
        docker run -d -p 5000:80 mvc-signalr-example
        ```

    - Abra o navegador e acesse `http://localhost:5000` para testar a funcionalidade.
    - Para uma melhor experiência no teste, duplique a aba do navegador para simular dois clientes conectados.

## Tecnologias usadas

- **SignalR**: Para comunicação em tempo real entre o servidor e os clientes.
- **MVC**: Arquitetura Model-View-Controller para o front-end e back-end.
- **JavaScript**: Para manipulação do DOM e invocação dos métodos do SignalR.
- **.NET 8**: A versão mais recente do framework .NET usada para o desenvolvimento da aplicação.
- **Docker**: Para rodar a aplicação em um ambiente isolado, sem a necessidade de instalar o .NET localmente.

## Conclusão

Este exemplo demonstra a facilidade de integrar SignalR em um projeto MVC para comunicação em tempo real. O SignalR lida com a complexidade da comunicação WebSocket e permite que o servidor envie dados para os clientes de maneira eficiente e sem necessidade de recarregar a página.
