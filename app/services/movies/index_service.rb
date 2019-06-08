module Movies
  class IndexService < Movies::BaseService

    concerning :MovieBuilder do
      def movies
        @movies ||= Movie.all
      end
    end

    def run
      build_associate
      return false unless validate

      build_associate

      return movies
    end

    private

    def build_associate; end

    def validate
      @errors = []
      @errors.push('please check database') if movies.blank?
      return @errors.empty?
    end
  end
end
