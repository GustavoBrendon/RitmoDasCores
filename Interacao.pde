void mousePressed() {
  if (cena == 0 || cena == 4) {
    iniciarJogo();
    cena = 1;
  } else if (cena == 2) {
    for (int i = 0; i < botoes.length; i++) {
      if (botoes[i].foiClicado(mouseX, mouseY)) {
        botoes[i].ativar();
        sequenciaJogador.add(i);
        verificarJogada();
        break;
      }
    }
  }
}

void stop() {
  for (AudioPlayer ap : sonsBotoes) {
    if (ap != null) ap.close();
  }
  if (somAcerto != null) somAcerto.close();
  if (somErro != null) somErro.close();
  minim.stop();
  super.stop();
}
