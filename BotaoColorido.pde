class BotaoColorido {
  PVector posicao;
  float tamanho;
  color corNormal;
  color corBrilhante;
  boolean estaAtivo;
  
  AudioPlayer som;
  
  long tempoAtivacao;
  final int DURACAO_BRILHO = 300; 

  BotaoColorido(float x, float y, float tam, color c, AudioPlayer s) {
    posicao = new PVector(x, y);
    tamanho = tam;
    corNormal = c;
    corBrilhante = color(min(blue(c) + 80, 255), min(green(c) + 80, 255), min(red(c) + 80, 255));
    som = s;
    estaAtivo = false;
  }

  void atualizar() {
    if (estaAtivo && millis() - tempoAtivacao > DURACAO_BRILHO) {
      estaAtivo = false;
    }
  }

  void exibir() {
    if (estaAtivo) {
      fill(corBrilhante);
    } else {
      fill(corNormal);
    }
    noStroke();
    rectMode(CENTER);
    rect(posicao.x, posicao.y, tamanho, tamanho, 20); 
  }
  
  void ativar() {
    estaAtivo = true;
    tempoAtivacao = millis();
    if (som != null) {
      som.rewind();
      som.play();
    }
  }
  
  void desativar() {
      estaAtivo = false;
  }

  boolean foiClicado(int mx, int my) {
    return (mx > posicao.x - tamanho/2 && mx < posicao.x + tamanho/2 &&
            my > posicao.y - tamanho/2 && my < posicao.y + tamanho/2);
  }
}
