class Expedition < ApplicationRecord
    belongs_to :place
    belongs_to :explorer
end
