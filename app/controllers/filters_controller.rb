class FiltersController < ActionController::Base
    protect_from_forgery with: :null_session
    def filterpropertytype
       @filterres=Set[]
       @filteredvalues=params[:propertytype].split('&')
       @filteredproperties=Phasesproperty.where(propertytype:@filteredvalues)
       puts(@filterpropertytypex)
       
       @filteredproperties.each do |property|
           @filterres.add(property.phasename)
       end
       render json:{
           phasesnames:@filterres
       }
       
  
    end

    def filter_phase
        @filterres
        if params[:filter_phase][:phasename]
          @filterres=Phasesproperty.where(phasename:params[:filter_phase][:phasename])
        end

        if params[:filter_phase][:propertytype]
            @filterres=@filterres.where(propertytype: params[:filter_phase][:propertytype])
        end

        if params[:filter_phase][:min_price] && params[:filter_phase][:max_price]
            @filterres=@filterres.where("price >= #{params[:filter_phase][:min_price]} and price <= #{params[:filter_phase][:max_price]}")
        end

        if params[:filter_phase][:min_area] && params[:filter_phase][:max_area]
            @filterres=@filterres.where("area >= #{params[:filter_phase][:min_area]} and area <= #{params[:filter_phase][:max_area]}")
        end

        if params[:filter_phase][:nofbedrooms]
            @filterres=@filterres.where(nofbedrooms:params[:filter_phase][:nofbedrooms])
        end

        if params[:filter_phase][:hasgarden]
            @filterres=@filterres.where(hasgarden:params[:filter_phase][:hasgarden])
        end

        if params[:filter_phase][:hasroof]
            @filterres=@filterres.where(hasroof:params[:filter_phase][:hasroof])
        end

        render json: @filterres
    

    end
 
end