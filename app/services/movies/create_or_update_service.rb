module Movies
  class CreateOrUpdateService < Movies::BaseService

    concerning :MovieBuilder do
      attr_reader :id
      def movie
        @movie ||= id.nil? ?
          Movie.new(@attr) :
          Movie.find(id)
      end
    end

    def run
      return false unless validate

      build_associate

      if id.nil?
        save
      else
        update(@attr)
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

    def build_associate; end

    def validate
      @errors = []
      @errors.push('please params') if movie.blank?
      return @errors.empty?
    end
  end
end
