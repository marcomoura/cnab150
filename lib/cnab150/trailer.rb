module Cnab150
  class Trailer
    def keys
      [:registry_code, :rows, :total, :filler]
    end

    def layout
      "Z" + [1, 6, 17, 126].join("Z")
    end
  end
end