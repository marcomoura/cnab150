module Cnab150
  module Layout
    # Layout of Register G
    # Return of collections identified by barcode
    class G
      def keys
        [:registry_code, :account, :payment_date,   :credit_date,
         :barcode,       :value,   :service_value,  :registry_number,
         :agency,        :channel, :authentication, :payment_type,
         :filler]
      end

      def layout
        'A' + [1, 20, 8, 8, 44, 12, 7, 8, 4, 1, 26, 5, 1].join('A')
      end
    end
  end
end
