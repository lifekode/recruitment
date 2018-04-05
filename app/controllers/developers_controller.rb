class DevelopersController < ApplicationController
  def index
    @skills = ProgrammingLanguage.all
    @languages = Language.all

    @skill_selected = nil
    @language_selected = nil

    @developers = params['email'].present? ? Developer.includes(:skills, :languages).quick_search(params['email']) : Developer.includes(:skills, :languages)

    if params['skill'].present?
      @skill_selected = ProgrammingLanguage.includes(:developers).find(params['skill'])
      @developers &= @skill_selected.developers
    end

    if params['language'].present?
      @language_selected = Language.includes(:developers).find(params['language'])
      @developers &= @language_selected.developers
    end
  end
end
