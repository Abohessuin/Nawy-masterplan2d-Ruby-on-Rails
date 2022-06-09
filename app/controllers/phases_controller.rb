class PhasesController < ApplicationController
   
    def phase_params
      params.fetch(:phase, {})
    end
end
