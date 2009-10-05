class Player
  attr_accessor :list
  attr_accessor :mostrador
  attr_reader :posicao
  
  def initialize(musicas = [])
    @list = musicas
    @mostrador = ""
    #@tocando = false
    @posicao = nil
  end
  
  def tocando?
    !@posicao.nil?
  end
  
  def tocar
    @posicao ||= 0
    @mostrador = @list[@posicao].titulo
  end
  
  def proxima
    if @posicao < @list.size - 1
      @posicao += 1
      tocar
    else
      @posicao = nil
    end
  end
  
  def anterior
    if @posicao > 0
      @posicao -= 1
      tocar
    else
      @posicao = nil
    end
  end
end