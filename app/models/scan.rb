class Scan < ApplicationRecord
    belongs_to :user

    def self.search(id)
        @scan = Scan.where(id: id).first
        @scan.title
    end
end
