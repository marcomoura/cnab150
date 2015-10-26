# Z.01 - Código do registro = “Z” Registro Trailler. Obrigatório em todos os arquivos
# Z.02 - Total de registros no arquivo Total de registros no arquivo, inclusive com header e trailler
# Z.03 - Valor total dos registros do arquivo
# Z.04 - Reservado para o futuro (filler)

module Cnab150
  class Trailer
    def initialize(line, parse=Parser)
      @line, @parse = line, parse
    end

    def to_hash
      {
        registry_code: column[0],
        rows:          column[1],
        total:         column[2],
        filler:        column[3]
      }
    end

    private

    def column
      @_ ||= @parse.to_a(@line, layout)
    end

    def layout
      "Z" + [1, 6, 17, 126].join("Z")
    end
  end
end