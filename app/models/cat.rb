class Cat < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :favorites
  
  #TODO if no overlapping interests, no best friends
  def best_friend
    cat_favorites = self.favorite_things_as_an_array
    other_cats = self.other_cats_and_their_favorites

    totals = {}
    
    other_cats.each do |cat, array_of_favorites|
      totals[cat]= 0
      cat_favorites.each do |fav|
        if (array_of_favorites.include? fav) ==true
          totals[cat]= totals[cat]+1
        end
      end
    end

    best_friend = totals.max_by {|k,v| v}
    best_friend[0] unless best_friend.nil?
  end
  
  def favorite_things_as_an_array
    things_collection = []
    
    self.favorites.each do |f|
      things_collection.push(f.thing)
    end
    
    return things_collection
  end
  
  def other_cats_and_their_favorites
    others = {}
    
    other_cats = Cat.where.not(id: self.id)
    
    other_cats.each do |cat|
      others[cat]= []
      cat.favorites.each do |f|
        others[cat].push(f.thing)
      end
      # 1. Add this cat's name to the `others` hash as a new key, and set its value to `[]`.
      # 2. Loop through all of this cat's favorites.
      # 3. For each favorite, add `favorite.thing` to this cat's array of favorites in the `others` hash.
    end
    return others

  end
end
