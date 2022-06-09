class Masterplan2dsController < ApplicationController
     
  def get
    @compoundmasterdetails=Masterplan2d.find_by_name(params[:compoundmasterplan])
    @name=@compoundmasterdetails.name
    @imageurl=@compoundmasterdetails.imageurl
    @imageorignalwidth=@compoundmasterdetails.orginalwidth
    @phases= @compoundmasterdetails.phases
    @areas=[]
    @phases.each do |phase|
       @name=phase.name
       @phasedetails=phase.phasedetails
       @phasedetails.merge!(name:@name)
       @areas.push(@phasedetails)
    end
    @map={
      name:@name,
      areas:@areas
    }
    render json:{
      name:@name,
      imageurl:@imageurl,
      imageorignalwidth:@imageorignalwidth,
      map:@map

    }
     
    
  end
  
end
