require 'lib/musica'

describe Musica do
  before do
    @music = Musica.new('Asa Branca', 200)
  end

  it "deve ter titulo" do
    @music.titulo.should == 'Asa Branca'
  end

  it "deve ter duração" do
    @music.duracao.should == 200
  end
end