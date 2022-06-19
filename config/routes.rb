Rails.application.routes.draw do

  get "loadphasesproperties" ,to:"load#loadproperties"
  get "loadphases",to:"load#loadphases"
  get "/masterplan2d/:compoundmasterplan",to:"masterplan2ds#get"
  get "/getpropertydetails/:propertyid",to:"phasesproperties#get"
  # get "/masterplan2dfilterpropertytype/:propertytype",to:"filters#filterpropertytype"
  post "/filter/3dmodeling",to:"filters#filter_phase_3d"
  post "/filter/2dmodeling",to:"filters#filter_phase_2d"
  
end
