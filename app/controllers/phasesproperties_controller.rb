class PhasespropertiesController < ApplicationController
   
   def get
     @property=Phasesproperty.find_by_property_id(params[:propertyid])
     render json:{
        property:@property
     }
   end
end
