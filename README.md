# fire-alarm-system
IF 721 - Critical Systems: Project 1

Sistema de combate a incêndio
Equipe: Álvaro Costa, Carlos Freitas, Paulo Silva.

Iremos modelar um sistema de combate a incêndio para edificações. O prédio em questão será o Museu da Cidade do Recife (Forte das Cinco Pontas).

O sistema possui 4 estados principais. Normal, Falha, Alerta e Perigo. No estado Normal, todos os sensores estão funcionando corretamente e não existe sinais de incêndio.
Caso algum sensor/atuador falhe, o sistema entra em estado de Falha. Estando no estado Normal ou de Falha e ao detectar alteração em um conjuntos de sensores próximos, o sistema entra no estado de Alerta, que indica que pode acontecer um incêndio naquele local. Caso o estado de Alerta perdure por um tempo determinado, o sistema entra em estado de Perigo, constatando a ocorrência do incêndio.

O sistema conta com as seguintes funcionalidades:
Existe um quadro de controle no sistema que possui uma chave on/off que se aplica ao sistema com um todo. Também é possível ativar/desativar cada uma de seus componentes individualmente ou todos de uma vez. O acesso a esse quadro será por meio de uma cartão identificador e as informações desse acesso (operador, data e hora) serão registradas.

No estado Normal:
Todos os sensores devem estar com LEDs acesos, indicando que os componentes estão funcionando corretamente.

No estado de Falha:
Mostra no quadro de controle o(s) componente(s) que apresenta(m) falha.

No estado de Alerta:
O alarme sonoro será ativado na sala sinalizando que foi detectado fumaça.

No estado de Perigo:
O sistema deve criar uma rota de saída de emergência e indicar por luzes nas portas o caminho ótimo para a saída;
As portas de todas as salas serão destravadas automaticamente para evacuação do local;
Sprinklers serão automaticamente ativados na(s) sala(s) em chamas e devem ser ativados nas salas próximas caso o fogo alastre;
Indicadores luminosos irão sinalizar os dois extintores/caixas de incêndio mais próximos às chamas;
Após um determinado período de tempo, se o fogo ainda não tiver sido controlado, os bombeiros serão acionados.
