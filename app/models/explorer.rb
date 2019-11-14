class Explorer < ApplicationRecord
    belongs_to :user
    has_many :trophies
    has_many :expeditions
    has_many :places, through: :expeditions


    def self.wealthiest
        sortByMoney(all)
    end


    def self.search(search)
        if search 
            sortByMoney( all.select { |explorer|  explorer.user.name == search } )
        else
            sortByMoney(all)
        end
    end


    private
    def self.sortByMoney(array)
        array.sort_by { |explorer| -(explorer.money)}
    end


end
