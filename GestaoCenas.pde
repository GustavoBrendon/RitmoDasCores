void desenharCenaInicial() {
  if (fundoInicio != null) {
    image(fundoInicio, 0, 0, width, height);
  } else {
    background(20, 20, 30); // Cor de substituição
  }

  fill(255);
  textSize(80);
  text("Ritmo das Cores", width / 2, height / 3);
  textSize(32);
  text("Memorize a sequência de cores e sons.", width / 2, height / 2);
  textSize(40);
  fill(200, 200, 255);
  text("Clique para começar", width / 2, height * 2 / 3);
}

void desenharCenaJogo() {
  if (fundoJogo != null) {
    image(fundoJogo, 0, 0, width, height);
  } else {
    background(30, 40, 50);
  }

  for (BotaoColorido b : botoes) {
    b.exibir();
  }
  fill(255);
  textSize(40);
  textAlign(LEFT, TOP);
  text("Pontuação: " + pontuacao, 20, 20);
  textAlign(CENTER, CENTER);
}

void desenharCenaFimDeJogo() {
  if (fundoJogo != null) {
    image(fundoJogo, 0, 0, width, height);
  } else {
    background(30, 40, 50);
  }

  fill(0, 150);
  rect(0, 0, width, height); // Escurece o fundo

  fill(255, 100, 100);
  textSize(80);
  text("FIM DE JOGO", width / 2, height / 3);
  textSize(48);
  text("Sua pontuação final: " + pontuacao, width / 2, height / 2);

  fill(200);
  textSize(32);
  text("Clique para jogar novamente", width / 2, height * 2 / 3);
}
