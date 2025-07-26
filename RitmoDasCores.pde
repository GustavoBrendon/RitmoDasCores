import ddf.minim.*;

int cena = 0; 
BotaoColorido[] botoes = new BotaoColorido[4];
ArrayList<Integer> sequenciaComputador;
ArrayList<Integer> sequenciaJogador;
int pontuacao;
int indiceSequenciaAtual;
long tempoUltimaAcao;
final int INTERVALO_ENTRE_CORES = 700; 
PImage fundoInicio, fundoJogo;
PFont fonte;

Minim minim;
AudioPlayer[] sonsBotoes = new AudioPlayer[4];
AudioPlayer somAcerto, somErro;

void settings() {
  fullScreen();
}

void setup() {
  fonte = createFont("Consolas", 32, true);
  textFont(fonte);
  textAlign(CENTER, CENTER);
  
  try {
    fundoInicio = loadImage("fundo_inicio.png");
    fundoJogo = loadImage("fundo_jogo.png");
  } catch (Exception e) {
    println("Erro ao carregar imagens. Usando cores sólidas como substitutas.");
    fundoInicio = createImage(width, height, RGB);
    fundoJogo = createImage(width, height, RGB);
    fundoInicio.loadPixels();
    fundoJogo.loadPixels();
    for (int i = 0; i < fundoInicio.pixels.length; i++) {
        fundoInicio.pixels[i] = color(20, 20, 30);
        fundoJogo.pixels[i] = color(30, 40, 50);
    }
    fundoInicio.updatePixels();
    fundoJogo.updatePixels();
  }

  minim = new Minim(this);
  try {
    sonsBotoes[0] = minim.loadFile("som_1.wav");
    sonsBotoes[1] = minim.loadFile("som_2.wav");
    sonsBotoes[2] = minim.loadFile("som_3.wav");
    sonsBotoes[3] = minim.loadFile("som_4.wav");
    somAcerto = minim.loadFile("som_acerto.wav");
    somErro = minim.loadFile("som_erro.wav");
  } catch (Exception e) {
    println("Erro ao carregar arquivos de som! Verifique a biblioteca Minim e os arquivos.");
    println("Lembre-se de converter os sons para o formato WAV 16-bit PCM.");
  }

  color[] cores = {
    color(255, 80, 80),  
    color(80, 255, 80),  
    color(80, 80, 255),  
    color(255, 255, 80)  
  };

  float tamanhoBotao = width / 6;
  float margem = width / 12;
  botoes[0] = new BotaoColorido(width/2 - tamanhoBotao/2 - margem, height/2 - tamanhoBotao/2 - margem, tamanhoBotao, cores[3], sonsBotoes[3]);
  botoes[1] = new BotaoColorido(width/2 + tamanhoBotao/2 + margem, height/2 - tamanhoBotao/2 - margem, tamanhoBotao, cores[1], sonsBotoes[1]);
  botoes[2] = new BotaoColorido(width/2 - tamanhoBotao/2 - margem, height/2 + tamanhoBotao/2 + margem, tamanhoBotao, cores[2], sonsBotoes[2]);
  botoes[3] = new BotaoColorido(width/2 + tamanhoBotao/2 + margem, height/2 + tamanhoBotao/2 + margem, tamanhoBotao, cores[0], sonsBotoes[0]); 

  iniciarJogo();
}

void draw() {
  switch (cena) {
    case 0:
      desenharCenaInicial();
      break;
    case 1:
      desenharCenaJogo();
      tocarSequenciaComputador();
      break;
    case 2:
      desenharCenaJogo();
      break;
    case 3: 
      desenharCenaJogo();
      fill(150, 255, 150, 200);
      textSize(64);
      text("CORRETO!", width/2, height/2);
      break;
    case 4:
      desenharCenaFimDeJogo();
      break;
  }
  
  for (BotaoColorido b : botoes) {
    b.atualizar();
  }
}
