module Movies
  class MovieIndexService < Movies::BaseService

    include BaseServiceImpl

    concerning :MovieBuilder do
      def movies
        @movies ||= Movie.all
      end
    end

    def run
      build_associate
      return false if !validate

      build_associate

      if agenda.save
        @errors.push('team is not valid') unless User.current_user&.change_keep_team(team)
        true
      else
        @errors.push(agenda.errors&.full_messages&.first)
        false
      end
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
