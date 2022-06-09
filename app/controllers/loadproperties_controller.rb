class LoadpropertiesController < ActionController::Base
    #project:4,propertytype:6,unit price:9,build up area:10,garden area:11,number of beedromms:17,penthhouse area:20
   def load
        require 'creek'
        workbook = Creek::Book.new 'phasesproperties.xlsx'
        worksheet = workbook.sheets[0]
        worksheet.rows.each_with_index do |row,idx|
           if(idx>8)
            row_cells = row.values
            @phasename=row_cells[4].downcase
            @propertytype=row_cells[6].downcase
            @price=row_cells[9]
            @area=row_cells[10]
            @nofbedrooms=row_cells[17]
            @hasgarden=row_cells[11].to_s!=""?true:false
            @hasroof=row_cells[20].to_s!=""?true:false
            Phasesproperty.create(phasename:@phasename,propertytype:@propertytype,price:@price,area:@area,hasgarden:@hasgarden,nofbedrooms:@nofbedrooms,hasroof:@hasroof)
         end 
       end
    end
       
 

    
end