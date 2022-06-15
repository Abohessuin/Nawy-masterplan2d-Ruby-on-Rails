class Masterplan2dsController < ApplicationController
  protect_from_forgery with: :null_session
  def get
    
    @compoundmasterdetails=Masterplan2d.find_by_name(params[:compoundmasterplan])
    @Compoundname=@compoundmasterdetails.name
    @imageurl=@compoundmasterdetails.imageurl
    @imageorignalwidth=@compoundmasterdetails.orginalwidth
    @phases= @compoundmasterdetails.phases
    @areas=[]
    @phases.each_with_index do |phase,index|
       @name=phase.name
       @phasedetails=phase.phasedetails
       @phaseimageurl=phase.imageurl
       @phasedetails.merge!(name:@name)
       @phasedetails.merge!(phaseimageurl:@phaseimageurl)
  
       phase.phasedetails.merge!(number:(index+1))
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
