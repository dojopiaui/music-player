require 'lib/player'
require 'lib/musica'

describe Player do
  
  before(:each) do
    @player = Player.new
  end
  
  it "deve ter uma playlist" do
    @player.respond_to?(:list).should be_true
  end

  it "deve ter um mostrador" do
    @player.respond_to?(:mostrador).should be_true
  end

  it "deve retornar as musicas da playlist" do
    musica = Musica.new("Asa Branca",200)
    player = Player.new([musica])
    player.list.should == [musica]
    @player.list << musica
    @player.list.should == [musica]
  end
  
  it "deve tocar uma música" do
    musica = Musica.new("Asa Branca",200)
    player = Player.new([musica])
    player.tocar
    player.tocando?.should be_true
  end
  
  it "o mostrador deve exibir a musica que esta tocando" do
    musica1 = Musica.new("Asa Branca",200)
    musica2 = Musica.new("Assum Preto",190)
    player = Player.new([musica1, musica2])
    player.tocar
    player.mostrador.should == musica1.titulo
    player.proxima
    player.mostrador.should == musica2.titulo
  end
  
  it "deve guardar a posição atual do playlist" do
    musica1 = Musica.new("Asa Branca",200)
    musica2 = Musica.new("Assum Preto",190)
    player = Player.new([musica1, musica2])
    player.tocar
    player.posicao.should == 0
    player.proxima
    player.posicao.should == 1
    player.anterior
    player.posicao.should == 0
  end
  
  it "player deve reiniciar a posicão" do
    musica1 = Musica.new("Asa Branca",200)
    musica2 = Musica.new("Assum Preto",190)
    player = Player.new([musica1, musica2])
    player.tocar
    player.proxima
    player.proxima
    player.posicao.should == nil
    player.tocando?.should be_false
    player.tocar
    player.anterior
    player.posicao.should == nil
    player.tocando?.should be_false
  end

  it "deve guardar a posição inicial da playlist" do
    musica1 = Musica.new("Asa Branca",200)
    musica2 = Musica.new("Assum Preto",190)
    player = Player.new([musica1, musica2])
    player.posicao.should == nil
  end

  it "mostrador deve retornar vazio quando não estiver tocando" do
    @player.tocando?.should be_false
    @player.mostrador.should == ""
  end
  
end