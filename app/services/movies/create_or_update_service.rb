
module Movies
  class MovieCreateOrUpdateService < Movies::BaseService

    include BaseServiceImpl

    concerning :NewMovieBuilder do
      attr_reader :id
      def movie
        @movie ||= id.nil? ?
          Movie.new(@attr) :
          Movie.find(id)
      end
    end

    def run
      build_associate
      return false if !validate

      build_associate

      if movie.id.nil?
        movie.save
      else
        movie.update(@attr)
      end
    end

    private

    def save
      if movie.save
        return true
      else
        @errors.push(movie.errors.full_messages.first)
        return false
      end
    end

    def update(params)
      if movie.update(params)
        return true
      else
        @errors.push(movie.errors.full_messages.first)
        return false
      end
    end

    def build_associate
    end

    def validate
      @errors = []
      @errors.push('please params') unless movie.present?
      return @errors.length == 0
    end
  end
end
