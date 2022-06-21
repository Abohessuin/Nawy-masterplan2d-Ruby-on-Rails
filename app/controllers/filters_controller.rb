class FiltersController < ActionController::Base
    protect_from_forgery with: :null_session
    # def filterpropertytype
    #    @filterres=Set[]
    #    @filteredvalues=params[:propertytype].split('&')
    #    @filteredproperties=Phasesproperty.where(propertytype:@filteredvalues)
    #    @filteredproperties.each do |property|
    #        @filterres.add(property.phasename)
    #    end
    #    puts("filteredres",@filterres)
    #    @phases=Masterplan2d.find_by_name("owest").phases
    #    @areas=[]
    #    @phases.each_with_index do |phase,index|
    #     @phasestatues=phase.phasedetails['statues']
    #     if @phasestatues=="available" && !(@filterres.include? phase.name) && @filterres.length()!=0
    #         phase.phasedetails['preFillColor']="rgb(255,58,0,0.1)"
    #         phase.phasedetails['fillColor']="rgb(255,58,0,0.4)"
    #         phase.phasedetails["strokeColor"]="rgb(255,58,0,1)"
    #     end
        
    #     phase.phasedetails.merge!(name:phase.name)
    #     phase.phasedetails.merge!(phaseimageurl:phase.imageurl)
    #     phase.phasedetails.merge!(number:(index+1))
    #     @areas.push(phase.phasedetails)
    #    end
    #    render json:{
    #     map:{
    #         :name => "owest",
    #         :areas =>@areas
    #     }
    #    }
  
    # end


    def filteredproperties
       
        @filterres
        @check=false
         if params[:filter_phase][:phasename]
            if @check
               @filterres=@filterres.where(phasename:params[:filter_phase][:phasename])
            else
            end
           @filterres=Phasesproperty.where(phasename:params[:filter_phase][:phasename])
           @check=true
         end
        if params[:filter_phase][:propertytype]
            if @check
                @filterres=@filterres.where(propertytype: params[:filter_phase][:propertytype])
            else
                @filterres=Phasesproperty.where(propertytype: params[:filter_phase][:propertytype])
                @check=true
            end 
        end

        if params[:filter_phase][:min_price] && params[:filter_phase][:max_price]
            if @check
              @filterres=@filterres.where("price >= #{params[:filter_phase][:min_price]} and price <= #{params[:filter_phase][:max_price]}")
            else
              @filterres=Phasesproperty.where("price >= #{params[:filter_phase][:min_price]} and price <= #{params[:filter_phase][:max_price]}")
              @check=true
            end
        end

        if params[:filter_phase][:min_area] && params[:filter_phase][:max_area]
            if @check
                @filterres=@filterres.where("area >= #{params[:filter_phase][:min_area]} and area <= #{params[:filter_phase][:max_area]}")
            else
                @filterres=Phasesproperty.where("area >= #{params[:filter_phase][:min_area]} and area <= #{params[:filter_phase][:max_area]}")
                @check=true
            end

        end

        if params[:filter_phase][:min_nofbedrooms] &&params[:filter_phase][:max_nofbedrooms]
            if @check
               @filterres=@filterres.where("nofbedrooms>= #{params[:filter_phase][:min_nofbedrooms]} and nofbedrooms <= #{params[:filter_phase][:max_nofbedrooms]}")
            else
               @filterres=Phasesproperty.where("nofbedrooms>= #{params[:filter_phase][:min_nofbedrooms]} and nofbedrooms <= #{params[:filter_phase][:max_nofbedrooms]}")
               @check=true
            end
        
        end

        # if params[:filter_phase][:hasgarden]
        #     @filterres=@filterres.where(hasgarden:params[:filter_phase][:hasgarden])
        # end

        # if params[:filter_phase][:hasroof]
        #     @filterres=@filterres.where(hasroof:params[:filter_phase][:hasroof])
        # end
        return @filterres
    end

    def filter_phase_3d
        @filterres=filteredproperties()
        render json: @filterres
    end

    def filter_phase_2d
        @filterres=filteredproperties()
        @filteproperties=Set[]
        @phasescounts=Hash[]
        
        @filterres.each do |property|
            @filteproperties.add(property.phasename)
            if @phasescounts[property.phasename]
                @phasescounts[property.phasename]=@phasescounts[property.phasename]+1
            else
                @phasescounts[property.phasename]=1
            end
        
        end
      
        @phases=Masterplan2d.find_by_name("owest").phases
        @areas=[]
        @phases.each_with_index do |phase,index|
         @phasestatues=phase.phasedetails['statues']
         if @phasestatues=="available" && !(@filteproperties.include? phase.name) && @filteproperties.length()!=0
             phase.phasedetails['preFillColor']="rgb(255,58,0,0.1)"
             phase.phasedetails['fillColor']="rgb(255,58,0,0.4)"
             phase.phasedetails["strokeColor"]="rgb(255,58,0,1)"
         end
         phase.phasedetails.merge!(name:phase.name)
         phase.phasedetails.merge!(phaseimageurl:phase.imageurl)
         phase.phasedetails.merge!(number:(index+1))
         if @phasescounts[phase.name]
         phase.phasedetails.merge!(avaiableproperties:@phasescounts[phase.name])
         else
            phase.phasedetails.merge!(avaiableproperties:0)
         end
         @areas.push(phase.phasedetails)
        end

      
        render json:{
         map:{
             :name => "owest",
             :areas =>@areas
         },
        
        }

    end
 
end