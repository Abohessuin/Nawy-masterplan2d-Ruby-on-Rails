class Masterplan2dsController < ApplicationController
     
  def get
    @compoundmasterdetails=Masterplan2d.find_by_name(params[:compoundmasterplan])
    @Compoundname=@compoundmasterdetails.name
    @imageurl=@compoundmasterdetails.imageurl
    @imageorignalwidth=@compoundmasterdetails.orginalwidth
    @phases= @compoundmasterdetails.phases
    @areas=[]
    @phases.each do |phase|
       @name=phase.name
       @phasedetails=phase.phasedetails
       @phaseimageurl=phase.imageurl
       @phasedetails.merge!(name:@name)
       @phasedetails.merge!(phaseimageurl:@phaseimageurl)
       @areas.push(@phasedetails)
    end
    @map={
      name:@Compoundname,
      areas:@areas,

    }
    render json:{
      name:@Compoundname,
      imageurl:@imageurl,
      imageorignalwidth:@imageorignalwidth,
      map:@map

    }
     
    
  end
  
end
