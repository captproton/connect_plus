class Photo
    def self.search(searchterm)
        search_results = Unsplash::Photo.search("#{searchterm}")
    end
end
