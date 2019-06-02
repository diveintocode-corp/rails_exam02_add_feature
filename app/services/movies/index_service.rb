module Movies
  class IndexService < Movies::BaseService

    concerning :MovieBuilder do
      def movies
        @movies ||= Movie.all
      end
    end

    def run
      build_associate
      return false if !validate

      build_associate

      return movies
    end

    private

    def build_associate
    end

    def validate
      @errors = []
      @errors.push('please check database') unless movies.present?
      return @errors.length == 0
    end
  end
end
