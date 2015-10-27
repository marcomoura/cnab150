module Cnab150
  module Layout
    class Detail
      def layout
        'A' + [1, 20, 8, 8, 44, 10, 5, 8, 8, 1, 26, 6, 1].join('A')
      end

      def keys
        [:registry_code , :account , :payment_date   , :credit_date  ,
         :barcode       , :value   , :service_value  , :registry_number,
         :agency        , :channel , :authentication , :payment_type ,
         :filler]
      end
    end
  end
end