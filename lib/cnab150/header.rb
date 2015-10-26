# A.01 -  1 - Código do registro = “A”
# A.02 -  1 - Código de Remessa 2 - RETORNO - Enviado pelo Banco para a Empresa/Orgao
# A.03 - 20 - Cdigo do Convênio Definido pelo banco
# A.04 - 20 - Nome da Empresa/Orgão
# A.05 -  3 - Codigo do Banco Codigo do Banco na camara de compensacao
# A.06 - 20 - Nome do Banco
# A.07 -  8 - Data da geração do arquivo (AAAAMMDD )
# A.08 -  6 - Numero sequencial do arquivo ( NSA ) Este numero deverá evoluir de 1 em 1 para cada arquivo gerado
# A.09 -  2 - Versao do layout. atual = versão 03 nova = versao 04 - disponível a partir de 01.04.2005.
# A.10 – 17 - Identificacao do servico
# A.11 – 52 - Reservado para o futuro (filler)

module Cnab150
  class Header
    def self.parse(line)
      h = new(line)
      fail ArgumentError, 'Line size is lesser than 150 chars' unless h.valid?
      h.to_hash
    end

    def initialize(line)
      @line = line
    end

    def valid?
      @line.size.eql?(150)
    end

    def to_hash
      {
        registry_code: column[0],
        registry_type: column[1],
        agreement:     column[2],
        organization:  column[3],
        bank_code:     column[4],
        bank_name:     column[5],
        file_date:     column[6],
        file_number:   column[7],
        version:       column[8],
        service:       column[9]
      }
    end

    private

    def column
      @_process ||= @line.unpack(layout)
    end

    def layout
      "A" + [1, 1, 20, 20, 3, 20, 8, 6, 2, 17].join("A")
    end
  end
end