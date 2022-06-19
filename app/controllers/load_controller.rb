class LoadController < ActionController::Base
    #project:4,propertytype:6,unit price:9,build up area:10,garden area:11,number of beedromms:17,penthhouse area:20
   
    def loadproperties
        require 'creek'
        workbook = Creek::Book.new 'phasesproperties.xlsx'
        worksheet = workbook.sheets[0]
        worksheet.rows.each_with_index do |row,idx|
           if(idx>8)
            row_cells = row.values
            @unitid=row_cells[3]
            @phasename=row_cells[4].downcase
            @propertytype=row_cells[6].downcase
            @price=row_cells[9]
            @area=row_cells[10]
            @nofbedrooms=row_cells[17]
            @hasgarden=row_cells[11].to_s!=""?true:false
            @hasroof=row_cells[20].to_s!=""?true:false
            Phasesproperty.create(property_id:@unitid,phasename:@phasename,propertytype:@propertytype,price:@price,area:@area,hasgarden:@hasgarden,nofbedrooms:@nofbedrooms,hasroof:@hasroof)
         end 
       end
    end

    def loadphases 
      file = File.read('phases.json')
      data_hash = JSON.parse(file)
      
      data_hash.each do |data|
         data['map']['lineWidth']=3
         if data['map']['statues']=="available"
            data['map']['fillColor']="rgb(0,189,207,0.2)"
            data['map']['preFillColor']="rgb(0,189,207,0)"
            data['map']['strokeColor']="rgb(0,189,207,1)"
       
         end
         if data['map']['statues']=="sold"
            data['map']['fillColor']="rgb(255,58,0,0.2)"
            data['map']['preFillColor']="rgb(255,58,0,0.1)"
            data['map']['strokeColor']="rgb(255,58,0,1)"
         
         end
         if data['map']['statues']=="under construction"
            data['map']['preFillColor']="rgb(256,256,256,0.3)"
            data['map']['fillColor']="rgb(256,256,256,0)"
            data['map']['strokeColor']="rgb(256,256,256,0)"
         end

          Phase.create(name:data['name'],phasedetails:data['map'],masterplan2d_id:1)
      end
      
      

    end

    
       
 

    
end