Rails.application.routes.draw do

  get "loadphasesproperties" ,to:"load#loadproperties"
  get "loadphases",to:"load#loadphases"
  get "/masterplan2d/:compoundmasterplan",to:"masterplan2ds#get"
  get "/masterplan2dfilterpropertytype/:propertytype",to:"filters#filterpropertytype"
  post "/masterplan2d_filter_phase",to:"filters#filter_phase"
  
end
