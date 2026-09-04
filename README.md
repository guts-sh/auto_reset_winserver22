## Script auto reset para licença Windows Server 22
Script para resetar o tempo de utilização da licença gratuita do windows server 22

### Crie a Tarefa Agendada via Linha de Comando

Abra o Prompt de Comando ou PowerShell como Administrador e execute um destes comandos:

#### Para rodar apontando para o script .ps1 criado:
schtasks /create /tn "AutoRearmWindowsServer" /tr "powershell.exe -ExecutionPolicy Bypass -File C:\Scripts\AutoRearm.ps1" /sc daily /mo 160 /ru "SYSTEM" /rl HIGHEST /f

#### Para rodar diretamente sem precisar criar arquivo de script:
schtasks /create /tn "AutoRearmWindowsServer" /tr "cscript.exe //nologo C:\Windows\System32\slmgr.vbs /rearm" /sc daily /mo 160 /ru "SYSTEM" /rl HIGHEST /f

### Configuração Manual no Agendador de Tarefas

Caso prefira configurar pela interface gráfica (taskschd.msc):

Aba Geral:

- Nome: Auto-Rearm Windows Server

- Conta de Usuário: Alterar para SYSTEM (ou Executar estando o usuário conectado ou não).

- Opção: Marcar Executar com privilégios mais altos (Run with highest privileges).

#### Aba Disparadores (Triggers):

- Iniciar a tarefa: Em um agendamento (On a schedule).

- Configuração: Diariamente (Daily).

- Recorrer a cada: 160 dias.

#### Aba Ações (Actions):

- Ação: Iniciar um programa.

- Programa/script: cscript.exe

- Adicionar argumentos: //nologo C:\Windows\System32\slmgr.vbs /rearm

## Faça um bom uso ;)
