module Movies
  class DestroyService < Movies::BaseService

    concerning :MovieBuilder do
      attr_reader :id
      def movie
        @movie ||= Movie.find(id)
      end
    end

    def run
      build_associate
      return false unless validate

      build_associate

      if movie.destroy
        true
      else
        false
      end
    end

    private

    def build_associate; end

    def validate
      @errors = []
      @errors.push('id is required') if movie.blank?
      return @errors.empty?
    end
  end
end
