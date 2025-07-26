void iniciarJogo() {
  pontuacao = 0;
  sequenciaComputador = new ArrayList<Integer>();
  sequenciaJogador = new ArrayList<Integer>();
  adicionarCorNaSequencia();
  prepararVezDoComputador();
}

void prepararVezDoComputador() {
  sequenciaJogador.clear();
  indiceSequenciaAtual = 0;
  tempoUltimaAcao = millis(); 
  cena = 1; 
}

void tocarSequenciaComputador() {
  if (millis() - tempoUltimaAcao > INTERVALO_ENTRE_CORES) {
    for (BotaoColorido b : botoes) b.desativar();

    if (indiceSequenciaAtual < sequenciaComputador.size()) {
      int idBotao = sequenciaComputador.get(indiceSequenciaAtual);
      botoes[idBotao].ativar();

      indiceSequenciaAtual++;
      tempoUltimaAcao = millis(); 
    } else {
      cena = 2; 
    }
  }
}

void adicionarCorNaSequencia() {
  sequenciaComputador.add(floor(random(4)));
}

void verificarJogada() {
  int indiceAtual = sequenciaJogador.size() - 1;

  if (sequenciaJogador.get(indiceAtual) != sequenciaComputador.get(indiceAtual)) {
    if (somErro != null) {
      somErro.rewind();
      somErro.play();
    }
    cena = 4;
    return;
  }

  if (sequenciaJogador.size() == sequenciaComputador.size()) {
    if (somAcerto != null) {
      somAcerto.rewind();
      somAcerto.play();
    }
    pontuacao++;
    adicionarCorNaSequencia();

    cena = 3;
    new java.util.Timer().schedule(
      new java.util.TimerTask() {
      @Override
        public void run() {
        prepararVezDoComputador();
      }
    }
    ,
      1000 
      );
  }
}
